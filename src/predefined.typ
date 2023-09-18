#import "util.typ": create-quote-style

#let default-quote-styles = (
    // English
    "en/US": create-quote-style("“", "”", "‘", "’", kern: 0.05em),
    "en/GB": create-quote-style("‘", "’", "“", "”", kern: 0.05em),
    // German
    "de/DE": create-quote-style("„", "“", "‚", "‘", kern: 0.05em),
    "de/DE|guillemets": create-quote-style("»", "«", "›", "‹", kern: 0.025em),
    "de/CH": create-quote-style("«", "»", "‹", "›", kern: 0.025em),
    "de/LI": create-quote-style("«", "»", "‹", "›", kern: 0.025em),
    "de/AT": create-quote-style("„", "“", "‚", "‘", kern: 0.05em),
    "de/AT|guillemets": create-quote-style("»", "«", "›", "‹", kern: 0.025em),

    // Bosnian
    "bs/BA": create-quote-style("”", "”", "’", "’"),
    // Croation
    "hr/HR": create-quote-style("„", "”", "‘", "’", kern: 0.05em),
    "hr/HR|guillemets": create-quote-style("»", "«", "›", "‹", kern: 0.025em),
    // Czech
    "cs/CZ": create-quote-style("„", "“", "‚", "‘", kern: 0.025em),
    "cs/CZ|guillemets": create-quote-style("»", "«", "›", "‹", kern: 0.025em),
    // Danish
    "da/DK": create-quote-style("„", "“", "’", "’", kern: 0.05em),
    "da/DK|guillemets": create-quote-style("»", "«", "‘", "’", kern: 0.025em),
    // Dutch
    "nl/NL": create-quote-style("„", "”", "‚", "’", kern: 0.05em),
    // Estionian
    "et/EE": create-quote-style("„", "“", "‚", "‘", kern: 0.05em),
    // Finnish
    "fi/FI": create-quote-style("”", "”", "’", "’", kern: 0.05em),
    // French
    "fr/FR": create-quote-style("«\u{00A0}", "\u{00A0}»", "“", "”"),
    "fr/FR|*": create-quote-style("«\u{00A0}", "\u{00A0}»", "“\u{00A0}", "\u{00A0}”"),
    "fr/FR|guillemets": create-quote-style("«\u{00A0}", "\u{00A0}»", "«\u{00A0}", "\u{00A0}»"),
    // Greek
    "el/GR": create-quote-style("«", "»", "“", "”"),
    // Hungarian
    "hu/HU": create-quote-style("„", "”", "»", "«"),
    // Icelandic
    "is/IS": create-quote-style("„", "“", "‚", "‘", kern: 0.05em),
    // Italian
    "it/IT": create-quote-style("«", "»", "“", "”", kern: 0.025em),
    "it/IT|quotes": create-quote-style("“", "”", "‘", "’", kern: 0.05em),
    // Lithuanian
    "lt/LT": create-quote-style("„", "“", "‚", "‘", kern: 0.05em),
    // Latvian
    "lv/LV": create-quote-style("„", "“", "‚", "‘", kern: 0.05em),
    // Norsk
    "no/NO": create-quote-style("«", "»", "‹", "›", kern: 0.05em),
    "nb/NO": create-quote-style("„", "“", "«", "»"),
    "nb/NO|quotes": create-quote-style("„", "“", "‚", "‘"),
    "nn/NO": create-quote-style("„", "“", "«", "»"),
    "nn/NO|quotes": create-quote-style("„", "“", "‚", "‘"),
    // Polish
    "pl/PL": create-quote-style("„", "”", "«", "»"),
    "pl/PL|guillemets*": create-quote-style("„", "”", "»", "«"),
    "pl/PL|quotes": create-quote-style("„", "”", "‚", "’"),
    // Portuguese
    "pt/PT": create-quote-style("«", "»", "“", "”", kern: 0.05em),
    "pt/BR": create-quote-style("“", "”", "‘", "’", kern: 0.05em),
    // Romanian
    "ro/RO": create-quote-style("„", "”", "«", "»"),
    // Russian
    "ru/RU": create-quote-style("«", "»", "„", "“"),
    // Serbian
    "sr/RS": create-quote-style("„", "”", "’", "’", kern: 0.05em),
    "sr/RS|guillemets": create-quote-style("»", "«", "’", "’", kern: 0.025em),
    "sr/RS|german": create-quote-style("„", "“", "’", "’", kern: 0.05em),
    // Slovak
    "sk/SK": create-quote-style("„", "“", "‚", "‘", kern: 0.025em),
    // Slovenian
    "sl/SI": create-quote-style("»", "«", "›", "‹", kern: 0.025em),
    "sl/SI|quotes": create-quote-style("„", "“", "‚", "‘", kern: 0.05em),
    // Spanish
    "es/ES": create-quote-style("«", "»", "“", "”", kern: 0.05em),
    "es/MX": create-quote-style("“", "”", "‘", "’", kern: 0.05em),
    // Swedish
    "sv/SE": create-quote-style("”", "”", "’", "’", kern: 0.05em),
    "sv/SE|guillemets": create-quote-style("»", "»", "›", "›", kern: 0.025em),
    "sv/SE|guillemets*": create-quote-style("»", "«", "›", "‹", kern: 0.025em),
)

#let default-quote-aliases = (
    // New aliases
    "en": "en/US",
    "de": "de/DE",
    "de|guillemets": "de/DE|guillemets",
    "bs": "bs/BA",
    "hr": "hr/HR",
    "hr|guillemets": "hr/HR|guillemets",
    "cs": "cs/CZ",
    "cs|guillemets": "cs/CZ|guillemets",
    "da": "da/DK",
    "da|guillemets": "da/DK|guillemets",
    "nl": "nl/NL",
    "et": "et/EE",
    "fi": "fi/FI",
    "fr": "fr/FR",
    "fr|*": "fr/FR|*",
    "fr|guillemets": "fr/FR|guillemets",
    "el": "el/GR",
    "hu": "hu/HU",
    "is": "is/IS",
    "it": "it/IT",
    "it|quotes": "it/IT|quotes",
    "lt": "lt/LT",
    "lv": "lv/LV",
    "no": "no/NO",
    "nb": "nb/NO",
    "nn": "nn/NO",
    "pl": "pl/PL",
    "pl|guillemets*": "pl/PL|guillemets*",
    "pl|quotes": "pl/PL|quotes",
    "pt": "pt/PT",
    "ro": "ro/RO",
    "ru": "ru/RU",
    "sr": "sr/RS",
    "sr|guillemets": "sr/RS|guillemets",
    "sr|german": "sr/RS|german",
    "sk": "sk/SK",
    "sl": "sl/SI",
    "sl|quotes": "sl/SI|quotes",
    "es": "es/ES",
    "sv": "sv/SE",
    "sv|guillemets": "sv/SE|guillemets",
    "sv|guillemets*": "sv/SE|guillemets*",

    // Latin
    "la": "it/IT",
    "la|italianguillemets": "it/IT",
    "la|germanquotes": "de/DE",
    "la|germanguillemets": "de/DE|guillemets",
    "la|britishquotes": "en/GB",
    "la|americanquotes": "en/US",
)

#let get-default-style(name) = {
    let style-alias = default-quote-aliases.at(name, default: none)
    if style-alias != none {
        name = style-alias
    }
    default-quote-styles.at(name, default: none)
}