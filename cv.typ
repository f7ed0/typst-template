
#import "lib/blocks.typ" : *

#let educationElement(dates : [FROM - TO], title : [TITLE], school : [school], location : [location], GPA : [GPA : 5.0], coursework : ()) = [
    
  #set block(spacing : 0.5em)
  
  #text(dates, weight : 500, fill : gray.darken(30%))

  #text(title, weight : 500) : #text(school)

  #text(location)

  #text(GPA, weight : 500)


  #text("Relevant Coursework :", weight : 600)

  #pad(left : 5pt,list(..coursework))
]

#let workElement(dates : [FROM - TO], title : [TITLE], enterprise : [enterprise], location : [location], tasks :  ()) = [
  #set block(spacing : 0.5em)

  #text(dates, weight : 500, fill : gray.darken(30%))
  
  #text(title, weight : 500) : #text(enterprise)

  #text(location)

  #pad(left : 5pt,list(..tasks))
]

#let ExCuElement(title : [TITLE], subtitle : [SUBTITLE], info : [INFO]) = [
  #set block(spacing : 0.5em)

  #text(title, weight : 500) : #text(subtitle)

  #pad(left : 5pt,info)

  #block(height : 5pt)
  
]

#let init(
  doc,
  name : [BASIC CV],
  title : [Student at university], 
  desc : lorem(50), 
  telephone : [tel], 
  email : [email], 
  linkedIn : [linkedIn],
  location : [location],
  website : [website],
  github : [github],
  cqual : ([a],[b]),
  educations : (educationElement(),),
  workexp : (),
  ExCu : (),
  col : blue
) = {
  set block(spacing : 1em)
  set page(paper: "a4", margin : 0pt)
  set text(size : 10pt, font : "Fira Sans") 
  block(inset : 20pt,width : 100%, fill : col, below: 0pt)[
    #align(center + horizon)[

      #text(name, size : 24pt, fill : white, weight : 800)

      #text(title, size : 13pt, fill : white, weight : 600)

      #line(length : 45%, stroke : white)

      #align(left, text(desc, size : 10pt, fill : white))
    ]
  ]

  block(width : 100%, inset : 7pt, fill : col.lighten(50%), below: 5pt)[
    #align(center, table(columns : (1fr,1fr,1fr), stroke : none, inset : 2pt,
      table.cell(align(horizon, grid( columns : (20pt, 1fr),image("assets/pin.png", height : 15pt),text(location)))),
      table.cell(align(horizon, grid( columns : (20pt, 1fr),image("assets/mail.png", height : 15pt),text(email)))),
      table.cell(align(horizon, grid( columns : (20pt, 1fr),image("assets/call.png", height : 15pt),text(telephone)))),
      table.cell(align(horizon, grid( columns : (20pt, 1fr),image("assets/in.png", height : 15pt),text(linkedIn)))),
      table.cell(align(horizon, grid( columns : (20pt, 1fr),image("assets/link.png", height : 15pt),text(website)))),
      table.cell(align(horizon, grid( columns : (20pt, 1fr),image("assets/gh.png", height : 15pt),text(github))))
    ))
  ]


  block(inset : 5pt)[
    #block(width : 100%, inset : 7pt, height : 14%, below : 0pt)[
      #text("CORE QUALIFICATION", size : 11pt, weight : 600)
      #pad(left : 20pt,columns(2, gutter : 5%,list(..cqual)))
    ]
      
    #block(width : 100%, inset : 7pt, below : 0pt)[
      #text("EDUCATION", size : 11pt, weight : 600)
      #pad(left : 20pt, grid(columns : (1fr), ..educations))
    ] 

    #block(width : 100%, inset : 7pt, below : 0pt)[
      #text("WORK EXPERIENCE", size : 11pt, weight : 600)
      #pad(left : 20pt, grid(columns : (1fr), ..workexp))
    ] 

    #block(width : 100%, inset : 7pt, below : 0pt)[
      #text("EXTRACURRICULAR EXPERIENCE", size : 11pt, weight : 600)
      #pad(left : 20pt, grid(columns : (1fr), ..ExCu))
    ]
  ]

  doc
}
