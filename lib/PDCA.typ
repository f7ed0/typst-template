#let states = (
  V : (color : color.green, text : "V", desc : "Resultat obtenu"),
  O : (color : color.yellow, text : "O", desc : "Resultat partiellement obtenu"),
  R : (color : color.red, text : "R", desc : "Resultat non obtenu")
) 

#let PDCA_el(col : color.white, desc : [], responsable : " ", date : "", state : states.R) = {
  table.cell( inset: 0pt,
    block(height: 44pt)[
      #set text(size: 8pt)
      #table(columns :  (4fr,1fr,1fr),
        table.cell(block(height: 38pt, align(left+top ,desc)),rowspan: 2, fill: col.lighten(30%), inset: 3pt),
        table.cell(inset : 8pt,align(center + horizon,responsable), colspan: 2, ),
        table.cell(inset : 8pt,align(center + horizon,date)),
        table.cell(inset : 8pt,align(center + horizon,state.text), fill: state.color)
      )
    ]
  )
}


#let blank(count) = {
  range(count).map(_ => table.cell(inset : 0pt, stroke: none,block(height: 44pt)));
}

#let PDCA(P : (), D : (), C : (), A : (),dx : 77% , dy : 0%) = {
  
  place(dx:dx, dy:dy, block(stroke: black, width: 175pt, height: 100pt, inset: 8pt)[
    #for state in states {
      grid( columns: (30pt,1fr) )[
      #block(align(center + horizon,state.at(1).text), fill : state.at(1).color, height: 20pt, width: 30pt)][#align(horizon,pad(left : 6pt,text(state.at(1).desc,size: 9pt)))]
    }
  ])

  let maxlen = calc.max(P.len(),C.len(),D.len(),A.len())
  table( columns:(1fr,1fr,1fr,1fr), stroke: none,
    table.cell(inset: 0pt, stroke:  none,rowspan: maxlen+1,
      table(columns: (100%),..blank(maxlen - P.len()), ..P,
        table.cell(align(center,"P (PRÉVOIR)"), fill : gray),
      )
    ),
    table.cell(inset: 0pt,stroke:  none, rowspan: maxlen+1,
      table(columns: (100%),..blank(maxlen - D.len()), ..D,
        table.cell(align(center,"D (PILOTER)"), fill : gray)
      )
    ),
    table.cell(inset: 0pt,stroke:  none, rowspan: maxlen+1,
      table(columns: (100%),..blank(maxlen - C.len()), ..C, 
        table.cell(align(center,"C (VERIFIER)"), fill : gray)
      )
    ),
    table.cell(inset: 0pt,stroke:  none, rowspan: maxlen+1,
      table(columns: (100%),..blank(maxlen - A.len()), ..A, 
        table.cell(align(center,"A (PÉRENISER)"), fill : gray)
      )
    )
  ) 

}



