#let init(type : [CCOMPTE RENDU], title : [Lorem Ipsum], authors:[SAUSSE Sylvain], info : [4A ICy], decoration: "assets/uphf.png", doc) = {
  set text(size:11pt, font:"Montserrat", weight: 500, lang:"fr")
  set heading(numbering: "I.1.a.")
  let date_str = datetime.today().display("[month repr:long] [day], [year]")
  show heading: it => block(width: 100%)[
    #text(it, font : "Montserrat")
  ]

  [
    #text(type, size: 22pt, font:"Stretch Pro")

    #text(title, size: 20pt, font:"Montserrat", weight: 700)
    #line(length: 50%)
    #text(authors+" - "+info, size: 17pt, weight: 600, fill: rgb(100, 100, 100, 255))

    #text(date_str,weight: 500, size: 16pt, fill: rgb(100, 100, 100, 255))

    #block(
      align(horizon,
        image(decoration)
      ),
      height: 100% - 270pt,
      width: 100%
    )
    
    #line(length: 100%)
    #grid(
      columns : (1fr,1fr),
      [#image("assets/uphf_alt.png",height: 80pt)],
      [#align(right,image("assets/insa.png", height: 80pt))]
    )

    #pagebreak()
  ]

  set page(
    header: context [
      #text(type,font: "Stretch Pro", size: 9.5pt)
      #text(" - "+title,size : 12pt)
      #h(1fr)
      #text(date_str, size: 12pt, weight: 400)

      #line(length: 100%)
    ],
    footer: context [
      #text(authors+" - "+info, 11pt, font: "Montserrat", weight: 500)
      #h(1fr)
      #text([#counter(page).display("1 / 1", both: true)],size:11pt,font: "Montserrat", weight: 500)
    ]
  )

  doc
}