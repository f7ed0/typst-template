#let init(type : [CCOMPTE RENDU], title : [Lorem Ipsum], authors:[SAUSSE Sylvain], info : [4A ICy], decoration: "assets/uphf.png", doc) = {
  set text(size:11pt, font:"Montserrat", weight: 500)
  set heading(numbering: "I.1.a.")
  show heading: it => block(width: 100%)[
    #text(it, font : "Montserrat")
    
  ]

  [
    #text(type, size: 22pt, font:"Stretch Pro")

    #text(title, size: 20pt, font:"Montserrat", weight: 700)
    #line(length: 50%)
    #text(authors+" - "+info, size: 17pt, weight: 600, fill: rgb(100, 100, 100, 255))

    #block(
      align(horizon,
        image(decoration)
      ),
      height: 100% - 226pt,
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
      #text(authors+" - "+info, 11pt, font: "Montserrat", weight: 500)
      #h(1fr)
      #text([#counter(page).display("1 / 1", both: true)],size:11pt,font: "Montserrat", weight: 500)
    ]
  )

  doc
}