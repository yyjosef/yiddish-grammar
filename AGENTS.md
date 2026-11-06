# yiddish-grammar

A Yiddish grammar and spelling handbook for writers and proofreaders (מגיהים) in the Hasidic/Haredi community. Written entirely in Yiddish. Built with Material for MkDocs and published to GitHub Pages at <https://yyjosef.github.io/yiddish-grammar>.

## Commands

- Install: `uv sync`
- Dev server: `uv run mkdocs serve` (<http://127.0.0.1:8000>, reloads on save)
- Build check: `uv run mkdocs build -q` (no output means OK)
- Lint: `rumdl check docs/<file>.md` (config in `.markdownlint.jsonc`, which turns off MD013 line length and MD033 inline HTML)

## Layout

- `docs/*.md`: one chapter per file. The order is set by `nav` in `mkdocs.yml`, so a new chapter needs a nav entry.
- `docs/overrides/`: theme overrides (404 page, language partial). The site is RTL (`direction: rtl` in `mkdocs.yml`).
- `scripts/convert.sh`: one-time pandoc script that split the original book into chapters. Not part of the normal workflow.
- `site/`: build output, ignored by git.
- `.obsidian/`: the author also edits in Obsidian. Commits titled "vault backup: ..." come from it.

## Deploy

GitHub Actions (`.github/workflows/ci.yml`) runs `mkdocs gh-deploy` on every push to `main`. Pushing to `main` publishes the site. Work happens on the `editing` branch and gets merged into `main`.

## Writing the chapters

All content is Yiddish. Match the existing chapters (`verbs.md`, `parts-of-speech.md`, `fixes.md` and `sentences.md` are the most complete).

Spelling (היימישער אויסלייג):

- No vowel points in general: נישט, אסאך, זענען, וואס, פאר. Use אָ/אַ only where a word is otherwise ambiguous (פאָר, אָן).
- Use "אסאך", not "א סך".
- Maqaf ־ for compounds and suffix labels: לשון־רבים, ־קייט, גע־־ט.
- Geresh ׳ (U+05F3) for contractions and suffixes on Hebrew words: מיט׳ן, פאר׳ן, משה׳לע, לשה"ק׳ע. The older chapters mix in ASCII `'`. Keep to ׳ in new text.
- Abbreviations in use: אא"וו, אד"ג, ד"ה, לשה"ק, בעז"ה, אי"ה.

Terms the book uses:

- Genders: לשון־זכר, לשון־נקיבה, לשון־סתמי.
- Cases: נאמינאטיוו, אקוזאטיוו, דאטיוו (explained in `sentences.md`).
- Word classes: זאכווארט/זאכווערטער, ווערב, אדיעקטיוו, אדווערב, פראנאם, פרעפאזיציע, קאניונקציע, אינוואריאנטן, קאנווערב.
- Tenses: לשון־עבר, לשון־הוה, לשון־עתיד, לשון־ציווי. Number: לשון־יחיד, לשון־רבים.

Style and structure:

- Example lists go in a blockquote: `> word, word, word`. Two blockquotes in a row need a line of text between them (rumdl MD028).
- Bold the Yiddish words being discussed.
- Common phrases: ווי דערמאנט, פאלגנד איז, ווי למשל, צום באמערקן, ווי שפעטער ערקלערט.
- Unfinished parts and TODO notes go in HTML comments `<!-- ... -->`, which the site doesn't render. `points.md` and `invariants.md` hold many of these TODOs.
- Don't use italics. They don't look right in Yiddish. Use bold for emphasis.
- Grammar stance: teach the standard rule (e.g., feminine dative דער: מיט דער מאמע) and add a short note where common היימישער usage differs (מיט די מאמע). Stress consistency, as the intro (`intro.md`) does.
- Write word pairs as "טיש, טישן" with a comma, not with a dash. Older chapters use " – " between pairs.

## Reviewing content

The author is the authority on Yiddish usage. When unsure of a form, gender or spelling, flag it for review in your reply instead of guessing silently. Don't fix grammar in other chapters without asking. Point out the problem instead.
