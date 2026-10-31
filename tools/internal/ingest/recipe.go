// Package ingest stahuje surová DATA receptů (plán §5). Texty kroků jsou jen
// vstup pro LLM přepis; do appky se nikdy nedostanou doslova. Fotky se neberou vůbec.
package ingest

import (
	"context"
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"net/url"
	"strings"
	"sync"
	"time"
)

// RawRecipe je jeden řádek data/raw/*.jsonl a tabulky raw_recipes.
type RawRecipe struct {
	Source        string   `json:"source"`
	SourceURL     string   `json:"source_url"`
	SourceLicense string   `json:"source_license"`
	Title         string   `json:"title"`
	Lang          string   `json:"lang"`
	Cuisine       string   `json:"cuisine,omitempty"`
	PrepMin       int      `json:"prep_min,omitempty"`
	CookMin       int      `json:"cook_min,omitempty"`
	Servings      int      `json:"servings,omitempty"`
	Ingredients   []string `json:"ingredients"`
	Steps         []string `json:"steps"`
}

// Usable říká, jestli má recept dost dat na další zpracování.
func (r RawRecipe) Usable() bool { return len(r.Ingredients) >= 2 && len(r.Steps) >= 1 }

// UserAgent nese kontakt přes repo, ne osobní údaje.
const UserAgent = "PapanekBot/0.1 (+https://github.com/lioilsources/Papanek)"

// Client je slušný HTTP klient: rate-limit per host a robots.txt.
type Client struct {
	HTTP  *http.Client
	Delay time.Duration

	mu     sync.Mutex
	last   map[string]time.Time
	robots map[string][]string
}

// NewClient vytvoří klienta s rozestupem delay mezi dotazy na jeden host.
func NewClient(delay time.Duration) *Client {
	return &Client{
		HTTP:   &http.Client{Timeout: 30 * time.Second},
		Delay:  delay,
		last:   map[string]time.Time{},
		robots: map[string][]string{},
	}
}

// ErrRobots znamená, že robots.txt cestu zakazuje.
var ErrRobots = fmt.Errorf("zakázáno v robots.txt")

// Get stáhne URL, pokud to robots.txt dovolí.
func (c *Client) Get(ctx context.Context, raw string) ([]byte, error) {
	u, err := url.Parse(raw)
	if err != nil {
		return nil, err
	}
	dis, err := c.disallowed(ctx, u)
	if err != nil {
		return nil, err
	}
	for _, d := range dis {
		if strings.HasPrefix(u.Path, d) {
			return nil, fmt.Errorf("%s: %w", raw, ErrRobots)
		}
	}
	return c.fetch(ctx, u)
}

func (c *Client) fetch(ctx context.Context, u *url.URL) ([]byte, error) {
	if err := c.wait(ctx, u.Host); err != nil {
		return nil, err
	}
	req, err := http.NewRequestWithContext(ctx, http.MethodGet, u.String(), nil)
	if err != nil {
		return nil, err
	}
	req.Header.Set("User-Agent", UserAgent)
	resp, err := c.HTTP.Do(req)
	if err != nil {
		return nil, err
	}
	defer resp.Body.Close()
	if resp.StatusCode != http.StatusOK {
		return nil, fmt.Errorf("%s: HTTP %d", u, resp.StatusCode)
	}
	return io.ReadAll(io.LimitReader(resp.Body, 32<<20))
}

func (c *Client) wait(ctx context.Context, host string) error {
	c.mu.Lock()
	next := c.last[host].Add(c.Delay)
	now := time.Now()
	if next.Before(now) {
		next = now
	}
	c.last[host] = next
	c.mu.Unlock()
	select {
	case <-ctx.Done():
		return ctx.Err()
	case <-time.After(time.Until(next)):
		return nil
	}
}

func (c *Client) disallowed(ctx context.Context, u *url.URL) ([]string, error) {
	c.mu.Lock()
	rules, ok := c.robots[u.Host]
	c.mu.Unlock()
	if ok {
		return rules, nil
	}
	body, err := c.fetch(ctx, &url.URL{Scheme: u.Scheme, Host: u.Host, Path: "/robots.txt"})
	if err != nil {
		// Chybějící robots.txt = bez omezení; výpadek sítě se projeví u vlastního dotazu.
		body = nil
	}
	rules = ParseRobots(string(body))
	c.mu.Lock()
	c.robots[u.Host] = rules
	c.mu.Unlock()
	return rules, nil
}

// ParseRobots vrátí Disallow prefixy pro sekci „User-agent: *“.
func ParseRobots(txt string) []string {
	var out []string
	active, inGroup := false, false
	for _, line := range strings.Split(txt, "\n") {
		line, _, _ = strings.Cut(line, "#")
		k, v, ok := strings.Cut(line, ":")
		if !ok {
			continue
		}
		k, v = strings.ToLower(strings.TrimSpace(k)), strings.TrimSpace(v)
		switch k {
		case "user-agent":
			if inGroup {
				active, inGroup = false, false
			}
			active = active || v == "*" || strings.EqualFold(v, "papanekbot")
		case "disallow":
			inGroup = true
			if active && v != "" {
				out = append(out, v)
			}
		case "allow":
			inGroup = true
		}
	}
	return out
}

// WriteJSONL zapíše recepty po řádcích.
func WriteJSONL(w io.Writer, rs []RawRecipe) error {
	enc := json.NewEncoder(w)
	enc.SetEscapeHTML(false)
	for _, r := range rs {
		if err := enc.Encode(r); err != nil {
			return err
		}
	}
	return nil
}
