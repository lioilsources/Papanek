// Package content drží formát receptů v seed/recipes (zdroj pravdy pro content.db).
package content

// Recipe je obsah jednoho seed/recipes/<pack>/<slug>.yaml.
type Recipe struct {
	Slug        string       `yaml:"slug" json:"-"`
	Pack        string       `yaml:"pack" json:"-"`
	Cuisine     string       `yaml:"cuisine" json:"-"`
	Model       string       `yaml:"model" json:"-"`
	Difficulty  int          `yaml:"difficulty" json:"difficulty"`
	PrepMin     int          `yaml:"prep_min" json:"prep_min"`
	CookMin     int          `yaml:"cook_min" json:"cook_min"`
	Servings    int          `yaml:"servings" json:"servings"`
	Tags        []string     `yaml:"tags" json:"tags"`
	ImagePrompt string       `yaml:"image_prompt" json:"image_prompt"`
	Ingredients []RecipeLine `yaml:"ingredients" json:"ingredients"`
	CS          Text         `yaml:"cs" json:"cs"`
	EN          Text         `yaml:"en" json:"en"`
}

type RecipeLine struct {
	Ingredient string   `yaml:"ingredient" json:"ingredient"`
	Qty        *float64 `yaml:"qty,omitempty" json:"qty"`
	Unit       string   `yaml:"unit,omitempty" json:"unit"`
	Optional   bool     `yaml:"optional,omitempty" json:"optional"`
	NoteCS     string   `yaml:"note_cs,omitempty" json:"note_cs"`
	NoteEN     string   `yaml:"note_en,omitempty" json:"note_en"`
}

type Text struct {
	Title   string `yaml:"title" json:"title"`
	Summary string `yaml:"summary" json:"summary"`
	Steps   []Step `yaml:"steps" json:"steps"`
	Tips    string `yaml:"tips" json:"tips"`
}

type Step struct {
	Text     string `yaml:"text" json:"text"`
	TimerSec int    `yaml:"timer_sec,omitempty" json:"timer_sec"`
}
