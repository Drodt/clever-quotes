#import "predefined.typ": default-quote-styles, default-quote-aliases, get-default-style

#let quote-style = state("quote-style", "en/US")
#let quote-max-level = state("quote-max-level", 2)
#let quote-level = state("quote-level", 1)

#let _get-style(s) = {
    let sty = s
    if type(s) == "string" {
        sty = get-default-style(s)
    }
    if sty == none {
        panic("Unknown quotation style: ", s)
    }
    sty
}

/// Sets up the parameters for the quotation functions.
/// 
/// Use this function like so:
///
/// ```typ
/// #show: clever-quotes.with(style: "de")
/// ```
///
/// - style (string, dictionary): The quotation style to use.
/// - max-level (integer, none): Maximal level of quote-nesting. `none` disables the limit.
/// - body (content): The content to render.
#let clever-quotes(
    style: "en/US",
    max-level: 2,
    body
) = {
    let sty = _get-style(style)

    quote-style.update(sty)
    quote-max-level.update(max-level)

    body
}

/// Put some text in context-sensitive quotes, using the currently active style.
/// If this is used in some other `quote` call and that is a outer quote, the
/// inner call will produce an inner quote. Analagously, if the outer call produced
/// inner quotes, we produce outer quotes.
/// 
/// - inner (boolean): Whether to start with an inner quote.
/// - style (string, dictionary, auto): The style to use for this quote. If `auto`, it will use the global style.
/// - cite (content, none): Optional citation content at the end of the quote.
/// - body (content): Content inside the quotation marks.
#let quote(inner: false, style: auto, cite: none, body) = {
    locate(loc => {
        let style = if style == auto {
            quote-style.at(loc)
        } else {
            _get-style(style)
        }
        let level = quote-level.at(loc)
        let max-level = quote-max-level.at(loc)

        if inner {
            level = level + 1
        }

        if level > max-level {
            panic("Quotes are nested too deeply. Limit is ", max-level)
        }

        let is-inner = calc.even(level)

        let (open, close) = if is-inner {
            (style.at("inner-open"), style.at("inner-close"))
        } else {
            (style.at("outer-open"), style.at("outer-close"))
        }

        let citation = if cite == none {
            none
        } else {
            [ #cite]
        }

        if inner {
            level = level - 1
        }
        
        quote-level.update(level + 1) + open + body + close + quote-level.update(level) + citation
    })
}

/// Cites a source and gives a quotation.
///
/// - inner (boolean): Whether to start with an inner quote.
/// - style (string, dictionary, auto): The style to use for this quote. If `auto`, it will use the global style.
/// - cite (content): The citation to be inserted after the quote.
/// - body (content): Content inside the quotation marks.
#let citequote(inner: false, style: auto, cite, body) = quote(inner: inner, style: style, cite: cite, body)

/// Produces a blockquote.
///
/// - cite (content, none): Optional citation content at the end of the quote.
/// - inset (length, dictionary): How much to pad the block. A passed length will be used as left-padding.
/// - font-size (length): Font size of the block content.
/// - body (content): Content for the blockquote.
#let blockquote(
    cite: none,
    inset: 2em,
    font-size: 1em,
    body
) = {
    let inset = if type(inset) == "dictionary" {
        inset
    } else {
        (left: inset)
    }
    let citation = if cite == none {
        none
    } else {
        [ #cite]
    }
    set text(size: font-size)
    block(width: 100%, inset: inset, body + citation)
}

/// Produces a blockquote with a citation.
///
/// - inset (length, dictionary): How much to pad the block. A passed length will be used as left-padding.
/// - font-size (length): Font size of the block content.
/// - cite (content): Optional citation content at the end of the quote.
/// - body (content): Content for the blockquote.
#let blockcitequote(
    inset: 2em,
    font-size: 1em,
    cite,
    body
) = blockquote(cite: cite, inset: inset, font-size: font-size, body)

/// Adds insertion marks (`[]`) around some text in the quote to denote
/// it was added.
///
/// - body (content): The added content in the quote.
#let text-ins(body) = [[#body]]

/// Adds inserted elipsis `[...]` and the inserted content in brackets.
///
/// If the body is `none`, only elipsis are added.
/// - inverted (boolean): If true, inserts the body first, then elipsis.
/// - body (content, none): The content added to the quote.
#let text-elp-ins(inverted: false, body) = if body == none {
    text-ins[...]
} else if inverted {
    text-ins(body) + text-ins[...]
} else {
    text-ins[...] + text-ins(body)
}

/// Adds `[...]` to the text.
#let text-elp = text-elp-ins(none)

/// Outputs `[...]`; the body is not displayed.
///
/// - body (content): The body which was deleted from the quote.
#let text-del(body) = text-elp
