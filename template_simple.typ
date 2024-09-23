#import "lib/blocks.typ": *

#let init(type : [], title : [], authors:[], info : [], decoration: [],desc : [], allowance : 175pt, outline_depth : 3, preamble : [], doc) = {
  set text(size:10pt, font:"Montserrat", weight: 500, lang:"fr",hyphenate: false)
  show raw: set text(font: "Fira Code",size: 9pt,ligatures: true)
  set heading(numbering: "I.A.1.")
  set page(paper: "a4", margin: (x : 1cm, top: 1cm)) 

  set figure(kind: "figure", supplement: "Figure")
  let date_str = datetime.today().display("[month repr:long] [day], [year]")
  show heading: it => block(width: 100%)[
    #text(it, font : "Montserrat", weight: 400)
  ]
  [
    #grid(columns: (20%,60%,20%), rows: (70pt))[
      #rect( width: 100%, height: 100%,
        align(center,image("assets/insa_uphf_vertical.png",height: 100%))
      )
    ][
      #rect( width: 100%, height: 100%,fill: color.gray.lighten(70%),stroke: color.black,
        align(center + horizon)[
          #show par: set block(spacing: 0.5em)
          
          #text(info, size: 16pt, weight: 600)

          #text(type, size: 14pt, weight: 400)

          #text(date_str,weight: 500, size: 12pt)
        ]
      )

    ][
      #rect(width: 100%, height: 100%,)[
        #align(center + horizon,desc)
      ]
    ]

    #block(spacing: 2em)[
      #show par: set block(spacing: 1em)

      #text(title, size : 20pt, weight: 700, fill : color.blue.darken(40%))

      #text(authors, size: 16pt, weight: 600)
    ]
    
  ]

  pad(left : 5%,line(length: 40%))

  [
    #set text(size: 14pt)
    #block(
      decoration,
      height: 100% - allowance,
      width: 100%,
    )
  ]

  pagebreak(weak: true)

  set par(justify: true)

  set page(
    margin: (x : 1cm, y: 2cm),
    header: normalheader(authors,info,title,font_ : "Montserrat"),
    footer: context [
      #text(authors+" - INSA Hauts-de-France", size:9pt, font: "Montserrat", weight: 400)
      #h(1fr)
      #text(counter(page).display("1 / 1", both: true),size:11pt,font: "Montserrat", weight: 400)
    ],
  )

  [
    #outline(indent: true, depth: outline_depth)
  ]

  table_figure()

  set page(
    header:{
      text("Préambule", size: 10pt, weight: 500)
      h(1fr)
      text(title,size : 9pt, weight: 600,font: "Stretch Pro")

      line(length: 100%)
      
    }
  ) 



  if preamble != [] {
    pagebreak(weak: true)
    align(smallcaps(text("Préambule",size : 12pt, weight : 650)),center)
    pad(align(text(preamble),center),x : 10%)
  }

  pagebreak(weak : true)

  set page(
    header: normalheader(authors,info,title)
  )
  doc
}

