#let tableau(body, caption:"") = figure(body, kind: "tableau",supplement: "Tableau", caption: caption)

#let splitstretch() = str.from-unicode(0x200A)

#let table_figure() = context {
  if query(selector(figure)).len() > 0 [
    #outline(title: "Table des Tableaux et des Figures", target: figure)
    #pagebreak(weak : true)
  ] else [

  ]
}


#let init(type : [], title : [], authors:[], info : [], decoration: "assets/uphf.png",desc : [], allowance : 255pt, outline_depth : 3, doc) = {
  set text(size:10pt, font:"Montserrat", weight: 500, lang:"fr")
  show raw: set text(font: "Fira Code",size: 8pt)
  set heading(numbering: "I.A.1.")


  set figure(kind: "figure", supplement: "Figure")
  let date_str = datetime.today().display("[month repr:long] [day], [year]")
  show heading: it => block(width: 100%)[
    #text(it, font : "Montserrat", weight: 620)
  ]
  [
    #set page(background: image("assets/bg.png", fit : "stretch", width: 100%))
    #text(title, size: 22pt, font:"Stretch Pro", weight: 700)

    #text(type, size: 20pt, font:"Montserrat")

    #line(length: 50%)
    #text(authors, size: 17pt, weight: 600, fill: rgb(100, 100, 100, 255))

    #text(date_str,weight: 500, size: 16pt, fill: rgb(100, 100, 100, 255))

    #block(
      align(horizon,
        image(decoration)
      ),
      height: 100% - allowance,
      width: 100%
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
      header: context [
      #let headings = query(selector(heading.where(level: 1)).after(here()))
      #if headings.len() > 0 {
        let content = headings.first()
        if content.location().page() == here().page() {
          text(content.body, size: 10pt, weight: 500)
        } else {
          let headings = query(selector(heading.where(level: 1)).before(here()))
          if headings.len() > 0 {
            let content = headings.last().body
            text(content, size: 10pt, weight: 500)
          }
        } 
      } else {
        let headings = query(selector(heading.where(level: 1)).before(here()))
        if headings.len() > 0 {
          let content = headings.last().body
          text(content, size: 12pt, weight: 500)
        }
      }
      #h(1fr)
      #text(title,size : 9pt, weight: 600,font: "Stretch Pro")

      #line(length: 100%)
    ],
    footer: context [
      #text(authors+" - "+info, size:11pt, font: "Montserrat", weight: 500)
      #h(1fr)
      #text(counter(page).display("1 / 1", both: true),size:11pt,font: "Montserrat", weight: 500)
    ],
    background: image("assets/bg_all.png",width: 100%,fit: "stretch")
  )

  [
    #outline(indent: true, depth: outline_depth)
    #pagebreak(weak : true)
  ]

  table_figure()

  doc
}

#let codeblock(content,type : "",filename: "") = {
  pad(
    block(
      [
        #if type != "" or filename != "" {
          grid(columns: (1fr,1fr),
            pad(
              text(filename, 
                size: 9pt,
                font: "Fira Code",
              ),
              bottom:-6pt,
              left : 5pt,
              top : 5pt
            ),
            align(right,
              pad(
                text(type, 
                  size: 9pt, 
                  fill : rgb(123,104,238,255),
                  font: "Fira Code"
                ),
                bottom:-7pt,
                right : 5pt,
                top : 5pt,
              )
            )
          )
          pad(line(length: 100%, stroke : rgb(100,100,100,255)), bottom: -13pt)
        }
        #pad(align(left,content),x : 5pt, y: 5pt)
      ],
      width: 100%,
      fill : rgb(245,245,245),
      stroke : rgb(100,100,100,255),
      radius: 5pt
    ),
    x : 12pt
  )
}

#let levels = (
  info : (
    icon : "assets/info_icon.png",
    background : rgb(189,203,221,150)
  ),
  knowledge : (
    icon : "assets/book_icon.png",
    background : rgb(0,67,0,40)
  ),
  warning : (
    icon : "assets/error_icon.png",
    background : rgb(187,39,26,50)
  )
)

#let remark(content, level:levels.info) = {
  pad(
    block(
      pad(
        grid(
          columns: (30pt, 1fr),
          align(
            horizon,
            block(
              image(level.icon,width: 25pt, ),
              //fill : level.accent,
              radius: 10pt,
            )
          ),
          pad(content,
            left: 5pt,
            y :5pt
          )
        ),
        rest : 10pt
      ),
      fill : level.background,
      radius: 10pt,
    ),
    x : 15pt
  )
}

#let coloredLink(lnk,value) = link(lnk,text(value,fill:rgb(123,104,238,255)))
