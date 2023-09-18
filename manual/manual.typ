#import "@preview/tidy:0.1.0"
#import "@preview/tablex:0.0.5": tablex, rowspanx

#import "template.typ": *
#import "../src/clever-quotes.typ": *

#show: project.with(
    title: "Clever-Quotes",
    subtitle: "Smarter quotes and block quotes",
    abstract: [
        *clever-quotes* is a package improving on #link("https://typst.app/", [Typst])'s `smartquote` function. It adds block quotes and improves type setting. The API is somewhat based on LaTeX's `csquotes`.
    ],
    authors: ("Daniel Drodt",),
    url: "",
    date: "7 September 2023",
    version: "0.1.0"
)

#show: clever-quotes

= Introduction

The `clever-quotes` package provides utilities for inserting quotation marks and quoting sources in your Typst documents. It provides inline and block quotations. Any inline quotations are also _context-dependent_, i.e., inner quotes are automatically detected and displayed differently. Additionaly, this package provides a wide range of citation styles, based on `csquotes` for LaTeX.

= Package Setup <setup>

To use `clever-quotes` import the package:
```typ
#import "@preview/clever-quotes:0.1.0": *
```

Afterwards, you must set up the quotation utilities like so:
```typ
#show: clever-quotes
```
if you are fine with the default settings. If you require a different quotation style, write:
```typ
#show: clever-quotes.with(style: "de/DE|guillemets")
```

The maximal level of quote-nesting can be changed from the default (2) with the `max-level` option:
```typ
#show: clever-quotes.with(max-level: 4)
```
Setting it to `none` removes the limit entirely.

See @styles for an overview of all quotation styles.

= Basic Interface <ifc>

This section explains the basic usage of relevant funtions. See @doc for a more detailed reference.

== Inline Quotes: `quote` <quote>

The most important function exposed by `clever-quotes` is the `quote` function. It renders inline quotations according to the currently active style.

If we have Typst code like #raw(lang: "typ", "As the saying goes, #quote[Don't worry, be happy.]"), it will render as: As the saying goes, #quote[Don't worry, be happy.]

We can change the quotation style for each quote independently:
```typ
#quote(style: "de")[Das also war des Pudels Kern!]
```
#quote(style: "de")[Das also war des Pudels Kern!]

```typ
#quote(style: "fr")[Il faut imaginer Sisyphe heureux.]
```
#quote(style: "fr")[Il faut imaginer Sisyphe heureux.]

Naturally, if you have many different languages in your document, it might be helpful to define a quote function for each language, e.g., #raw(lang: "typ", "#let de-quote(inner: false, body) = quote(style: \"de\", inner: inner, body)").

In the future, it is planned to set the style (by default) to the style suitable to the current language and region. At the moment, this is not possible in Typst.

Quotes by `clever-quotes` are _context-sensitive_. We keep track of the current quotation level and display either outer or inner quotations, according to the level:
```typ
#quote[As the saying goes, #quote[Don't worry, be happy.]]
```
#quote[As the saying goes, #quote[Don't worry, be happy.]]

By default, only two levels are allowed. Any deeper nesting (a quote inside an inner quote) will result in an error. This can be changed by changing the `max-level` parameter. See @setup; #link(label("clever-quotes()"))[clever-quotes()].

Setting `inner` to true increases the level by one. A quote that should be outer will be an inner quote.
```typ
#quote(inner: true)[Inner quote.]
```
#quote(inner: true)[Inner quote.]

The `cite` parameter adds a citation after the quote:
```typ
#quote(style: "de", cite: [@tlp])[In der Logik ist nichts zufällig: Wenn das Ding im Sachverhalt vorkommen *kann*, so muss die Möglichkeit des Sachverhaltes im Ding bereits präjudiziert sein.]
```
#quote(style: "de", cite: [@tlp])[In der Logik ist nichts zufällig: Wenn das Ding im Sachverhalt vorkommen *kann*, so muss die Möglichkeit des Sachverhaltes im Ding bereits präjudiziert sein.]

== Citation Quotes: `citequote`

The `citequote` function is a helpful shortcut for adding citations. Instead of a named `cite` parameter, it accepts two bodies, one for the citation the second for the body:
```typ
#citequote[@matter[1]][Apart from pure mathematics, the most advanced of the sciences is physics.]
```
#citequote[@matter[1]][Apart from pure mathematics, the most advanced of the sciences is physics.]

All other parameters are the same as `quote`.

== Block Quotes: `blockquote`

```typ
Surrounding text

#blockquote[#lorem(50)]

Following text
```
Surrounding text

#blockquote[#lorem(50)]

Following text

The inset of the block can be changed with `indent`, the font-size of the text in the quote with `font-size`. Like for `quote` @quote, a `cite` argument can be added:
```typ
#blockquote(inset: 6em, font-size: .8em, cite: [@matter[8]])[A man who, without being a solipsist, believes that whatever is real is mental, need have no difficulty in declaring that physics is #quote[true] in the above sense, and may even go further, and allow truth of physics in a much wider sense.]
```
#blockquote(inset: 6em, font-size: .8em, cite: [@matter[8]])[A man who, without being a solipsist, believes that whatever is real is mental, need have no difficulty in declaring that physics is #quote[true] in the above sense, and may even go further, and allow truth of physics in a much wider sense.]

== Block Quotes and Citations: `blockcitequote`

Again, we have a shortcut for citations:
```typ
#blockcitequote(inset: 6em, font-size: .8em)[@matter[8]][A man who, without being a solipsist, believes that whatever is real is mental, need have no difficulty in declaring that physics is #quote[true] in the above sense, and may even go further, and allow truth of physics in a much wider sense.]
```
#blockcitequote(inset: 6em, font-size: .8em)[@matter[8]][A man who, without being a solipsist, believes that whatever is real is mental, need have no difficulty in declaring that physics is #quote[true] in the above sense, and may even go further, and allow truth of physics in a much wider sense.]

== Auxiliary Functions

When changing a quote to better fit your text or audience, you often need to indicate changes. For this we provide some utilitiy functions.

`text-elp` inserts bracketed elipsis to indicate removed text:
```typ
#quote[#lorem(10) #text-elp #lorem(5)]
```
#quote[#lorem(10) #text-elp #lorem(5)]

`text-ins` indicates added text by wrapping it in brackets:
```typ
#quote[#lorem(10) #text-ins[More information.] #lorem(5)]
```
#quote[#lorem(10) #text-ins[More information.] #lorem(5)]

`text-elp-ins` combines the two previous functions. It adds an elipsis in brackets and then the inserted text in brackets. The `inverted` parameter changes the order of the two:
```typ
#quote[#lorem(5) #text-elp-ins[More information.] #lorem(5)] \
#quote[#lorem(5) #text-elp-ins(inverted: true)[More information.] #lorem(5)]
```
#quote[#lorem(5) #text-elp-ins[More information.] #lorem(5)] \
#quote[#lorem(5) #text-elp-ins(inverted: true)[More information.] #lorem(5)]

`text-del` takes a body but does *not* display it, rendering instead bracketed elipsis:
```typ
#quote[#lorem(10) #text-del[More information.] #lorem(5)]
```
#quote[#lorem(10) #text-del[More information.] #lorem(5)]

= Quotation Styles <styles>

== Pre-Defined Styles

#figure(caption: [Pre-defined quotation styles. #quote[--] denotes that it is the default variant, not requiring any variant suffix.], kind: table,
tablex(
    columns: 6, 
    header-rows: 1,
    align: center + horizon,
    [*Language*], [*Region*], [*Variant*], [*Language*], [*Region*], [*Variant*],
    rowspanx(2)[en], [US], [--],                [lt], [LT], [--],
    (), [GB], [--],                             [lv], [LV], [--],
    rowspanx(6)[de], rowspanx(2)[DE], [--],     [no], rowspanx(5)[NO], [--],
    (), (), [guillemets],                       rowspanx(2)[nb], (), [--],
    (), [CH], [--],                             (), (), [quotes],
    (), [LI], [--],                             rowspanx(2)[nn], (), [--],
    (), rowspanx(2)[AT], [--],                  (), (), [quotes],
    (), (), [guillemets],                       rowspanx(3)[pl], rowspanx(3)[PL], [--],
    [bs], [BA], [--],                           (), (), [guillemets\*],
    rowspanx(2)[hr], rowspanx(2)[HR], [--],     (), (), [quotes],
    (), (), [guillemets],                       rowspanx(2)[pt], [PT], [--],
    rowspanx(2)[cs], rowspanx(2)[CZ], [--],     (), [BR], [--],
    (), (), [guillemets],                       [ro], [RO], [--],
    rowspanx(2)[da], rowspanx(2)[DK], [--],     [ru], [RU], [--],
    (), (), [guillemets],                       rowspanx(3)[sr], rowspanx(3)[RS], [--],
    [nl], [NL], [--],                           (), (), [guillemets],
    [et], [EE], [--],                           (), (), [german],
    [fi], [FI], [--],                           [sk], [SK], [--],
    rowspanx(3)[fr], rowspanx(3)[FR], [--],     rowspanx(2)[sl], rowspanx(2)[SI], [--],
    (), (), [\*],                               (), (), [quotes],
    (), (), [guillemets],                       rowspanx(2)[es], [ES], [--],
    [el], [GR], [--],                           (), [MX], [--],
    [hu], [HU], [--],                           rowspanx(3)[se], rowspanx(3)[SE], [--],
    [is], [IS], [--],                           (), (), [guillemets],
    rowspanx(2)[it], rowspanx(2)[IT], [--],     (), (), [guillemets\*],
    (), (), [quotes],                           
)
)

#figure(caption: [Pre-defined aliases.], kind: table,
    tablex(
        columns: 4,
        align: center + horizon,
        [*Alias*], [*Style*],                   [*Alias*], [*Style*],
        [en], [en/US],                          [pl], [pl/PL],
        [de], [de/DE],                          [pl|guillemets], [pl/PL|guillemets],
        [de|guillemets], [de/DE|guillemets],    [pl|quotes], [pl/PL|quotes],
        [bs], [bs/BA],                          [pt], [pt/PT],
        [hr], [hr/HR],                          [ro], [ro/RO],
        [hr|guillemets], [hr/HR|guillemets],    [ru], [ru/RU],
        [cs], [cs/CZ],                          [sr], [sr/RS],
        [cs|guillemets], [cs/CZ|guillemets],    [sr|guillemets], [sr/RS|guillemets],
        [da], [da/DK],                          [sr|german], [sr/RS|german],
        [da|guillemets], [da/DK|guillemets],    [sk], [sk/SK],
        [nl], [nl/NL],                          [sl], [sl/SI],
        [et], [et/EE],                          [sl|quotes], [sl/SI|quotes],
        [fi], [fi/FI],                          [es], [es/ES],
        [fr], [fr/FR],                          [sv], [sv/SE],
        [fr|\*], [fr/FR|\*],                    [sv|guillemets], [sv/SE|guillemets],
        [fr|guillemets], [fr/FR|guillemets],    [sv|guillemets\*], [sv/SE|guillemets\*],
        [el], [el/GR],                          [la], [it/IT],
        [hu], [hu/HU],                          [la|italianguillemets], [it/IT],
        [is], [is/IS],                          [la|germanquotes], [de/DE],
        [it], [it/IT],                          [la|germanguillemets], [de/DE|guillemets],
        [it|quotes], [it/IT|quotes],            [la|britishquotes], [en/GB],
        [lt], [lt/LT],                          [la|americanquotes], [en/US],
        [lv], [lv/LV],  [], [],
        [no], [no/NO],  [], [],
        [nb], [nb/NO],  [], [],
        [nn], [nn/NO],  [], [],
    )
)


= Function Documentation <doc>

#{
    let module = tidy.parse-module(read("../src/clever-quotes.typ"))
    tidy.show-module(module, style: tidy.styles.default)
}

#bibliography(style: "chicago-author-date", "manual.bib")