/// Creates a quotation style.
///
/// - outer-open (string): Opening outer quotation mark.
/// - outer-close (string): Closing outer quotation mark.
/// - inner-open (string): Opening inner quotation mark.
/// - inner-close (string): Closing inner quotation mark.
/// - middle-outer (string, none): Outer quotation mark inserted on the beginning of each opening paragraph in the quote. Currently unused.
/// - middle-inner (string, none): Inner quotation mark inserted on the beginning of each opening paragraph in the quote. Currently unused.
/// - kern: (length, none): Space between quotation marks. Currently unused.
#let create-quote-style(
    outer-open, 
    outer-close, 
    inner-open, 
    inner-close,
    middle-outer: none,
    middle-inner: none,
    kern: none,
) = (
    outer-open: outer-open, 
    outer-close: outer-close,
    inner-open: inner-open, 
    inner-close: inner-close,
    middle-outer: middle-outer,
    middle-inner: middle-inner,
    kern: kern,
)