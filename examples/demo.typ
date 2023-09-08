#import "../src/clever-quotes.typ": *

#show: clever-quotes.with(style: "de")

#set heading(numbering: "1.1.")

My first quote: #quote[Some text and even #quote[text inside that one!]], and an inner quote: #quote(inner: true)[other text]

Citation in text: #quote(cite: [@s])[My text] or #citequote[@s][My text]

Insertion: #quote[I wrote #text-ins[some of] the quote. This #text-ins[t]ime only one word.]

Deleted: #quote[I delete#text-del[d] some text]

Ellipsis: #quote[I #text-elp-ins[altered] the text. With an empty arg: #text-elp]

Block quote: #blockquote(cite: [@s], font-size: .9em)[#lorem(100)]

= Sec <s>
