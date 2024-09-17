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
              image(level.icon,width: 25pt,height: 25pt ),
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

#let pseudocode(content) = text(content,font: "DejaVu Math TeX Gyre", size: 10pt)

#let tableau(body, caption:"") = figure(body, kind: "tableau",supplement: "Tableau", caption: caption)

#let splitstretch() = str.from-unicode(0x200A)

#let table_figure() = context {
  if query(selector(figure)).len() > 0 [
    #pagebreak(weak : true)
    #outline(title: "Table des Tableaux et des Figures", target: figure)
  ] else [

  ]
}

#let normalheader(authors,info,title,font_: "Stretch Pro") = context [
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
  #text(title,size : 9pt, weight: 600,font: font_)

  #line(length: 100%)
]