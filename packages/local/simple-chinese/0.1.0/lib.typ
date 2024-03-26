

#let project(title: "", authors: (), date: none, body) = {
  set document(author: authors, title: title)
  set page(numbering: "1 / 1", number-align: end)
  set text(
    font: ("Inria Serif", "FZNewShuSong-Z10", "Source Han Serif SC"),
    weight: "medium",
    lang: "zh",
  )

  set heading(numbering: "1 ")
  show heading: it => {
    set text(font: ("Inria Serif", "Source Han Serif SC"))
    set par(justify: true, first-line-indent: 0em)
    if it.level == 1 [
      #v(1em)
      #align(center)[
        #counter(heading).display()
        #text(it.body)
        #v(1em, weak: true)
      ]
    ] else [
      #emph(it.body)
    ]
  }

  show emph: it => {
    set text(font: "AR PL UKai")
    it.body
  }

  show strong: it => {
    set text(font: "Source Han Sans SC", weight: "medium")
    it.body
  }

  show math.equation: set text(
    font: ("New Computer Modern Math", "FZNewShuSong-Z10", "Source Han Serif SC"),
  )

  set list(indent: 2em)
  set enum(indent: 2em)

  set par(justify: true, first-line-indent: 2em)

  // Title row.
  align(center)[
    #block(text(
      font: ("Inria Serif", "Source Han Serif SC"),
      weight: "bold",
      2em,
      title,
    ))
    #v(1.5em, weak: true)
    #text(weight: "semibold", date)
  ]

  // Author information.
  pad(bottom: 0.25em, x: 2em, grid(
    columns: (1fr,) * calc.min(3, authors.len()),
    gutter: 1em,
    ..authors.map(author => align(center, author)),
  ))

  // Main body.
  body
}

#let new-par = {
  $ $
  v(-1.65em)
}
