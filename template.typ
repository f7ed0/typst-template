#let init(title : [CCOMPTE RENDU], authors:[SAUSSE Sylvain], info : [4A ICy], decoration: "assets/uphf.png", doc) = {
  set text(size:11pt, font:"Montserrat")
  set heading(numbering: "I.1.a.")
  show heading: it => block(width: 100%)[
    #text(it, font : "Stretch Pro")
    
  ]

  [
    #text(title, size: 22pt, font:"Stretch Pro")
    #line(length: 50%)
    #text(authors+" - "+info, size: 17pt, weight: 600, fill: rgb(100, 100, 100, 255))

    #block(
      align(horizon,
        image(decoration)
      ),
      height: 100% - 189pt,
      width: 100%
    )

    #grid(
      columns : (1fr,1fr),
      [#image("assets/uphf_alt.png",height: 80pt)],
      [#align(right,image("assets/insa.png", height: 80pt))]
    )

    #pagebreak()
  ]

  set page(
    footer: context [
      #text(authors+" - "+info, 11pt)
      #h(1fr)
      #text([#counter(page).display("1 / 1", both: true)],size:11pt)
    ]
  )

  doc
}