package main

import (
	"regexp"
	"strings"

	"github.com/lioilsources/papanek/tools/internal/ontology"
)

type tool struct {
	Slug  string   `yaml:"slug"`
	CS    string   `yaml:"cs"`
	EN    string   `yaml:"en"`
	Match []string `yaml:"match"`
	Photo string   `yaml:"photo"`
	re    *regexp.Regexp
}

func loadTools(path string) ([]tool, error) {
	ts, err := ontology.LoadYAML[[]tool](path)
	if err != nil {
		return nil, err
	}
	for i := range ts {
		var alt []string
		for _, m := range ts[i].Match {
			alt = append(alt, regexp.QuoteMeta(strings.ToLower(m)))
		}
		ts[i].re = regexp.MustCompile(`(^|[^\pL])(` + strings.Join(alt, "|") + `)($|[^\pL])`)
	}
	return ts, nil
}

// matchTools vrátí nástroje, jejichž slovo se v anglickém textu kroku objeví jako celé slovo,
// v pořadí katalogu.
func matchTools(text string, tools []tool) []string {
	low := strings.ToLower(text)
	var out []string
	for _, t := range tools {
		if t.re.MatchString(low) {
			out = append(out, t.Slug)
		}
	}
	return out
}
