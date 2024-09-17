#import "lib/blocks.typ": *

#let init(type : [], title : [], authors:[], info : [], decoration: "assets/uphf.png",desc : [], allowance : 255pt, outline_depth : 3, preamble : [], doc) = {
  set text(size:10pt, font:"Montserrat", weight: 500, lang:"fr",hyphenate: false)
  show raw: set text(font: "Fira Code",size: 9pt,ligatures: true)
  set heading(numbering: "I.A.1.")


  set figure(kind: "figure", supplement: "Figure")
  let date_str = datetime.today().display("[month repr:long] [day], [year]")
  show heading: it => block(width: 100%)[
    #text(it, font : "Montserrat", weight: 620)
  ]
  [
    #set page(background: image("./assets/bg.png", height: 100%, width: 100%))
    #text(title, size: 22pt, font:"Stretch Pro", weight: 700)

    #text(type, size: 20pt, font:"Montserrat")

    #line(length: 50%)
    #text(authors, size: 17pt, weight: 600, fill: rgb(100, 100, 100, 255))

    #text(date_str,weight: 500, size: 16pt, fill: rgb(100, 100, 100, 255))

    #block(
      align(center + horizon,
        image(decoration)
      ),
      height: 100% - allowance,
      width: 100%,
    )
    
    #line(length: 100%)
    #grid(
      columns : (3fr,4fr),
      desc,
      align(right,image("assets/uphf.png",height: 50pt)),
    )

    #pagebreak(weak: true)
  ]

  set par(justify: true)

  set page(
    header: normalheader(authors,info,title),
    footer: context [
      #text(authors+" - "+info, size:11pt, font: "Montserrat", weight: 500)
      #h(1fr)
      #text(counter(page).display("1 / 1", both: true),size:11pt,font: "Montserrat", weight: 500)
    ],
    background: image("assets/bg_all.png",width: 100%,height: 100%,fit: "stretch")
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

