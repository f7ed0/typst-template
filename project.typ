#import "lib/blocks.typ" : *
#import "lib/PDCA.typ" : *

#let init(
  doc,
  col : gray.lighten(85%),
  title : [TITLE],
  code : [CODE],
  logos : [LOGOS],
  clients : [CLIENTS],
  team : [TEAM],
  analyse : [ANALYSE],
  objectif : [OBJECTIF],
  PDCA : [#PDCA(dx : 86%)],
  cost : [COST],
  P : [PLAN],
  D : [DO],
  C : [CHECK],
  A : [A]
) = {
  let bl(content, height : 100% , width : 99%, inset : 30pt) = block(inset: inset, fill : col, width: width, height: height, radius: 10pt, content)
  set page(paper:"a0", margin: 40pt)
  set text(size : 25pt)
  grid(columns: (20%,60%,20%), rows: 5%,
    align(left + horizon, bl({
      align(center,code)
    })),
    align(center + horizon,bl({
      set text(size : 40pt)
      title
    })),
    align(right + horizon,bl({
      align(center,logos)
    })),
  )

  bl(width : 100%, height : 4%, {[= Equipe]
  team})

  bl(width: 100%, height: 4%, {[= Clients]
  clients})

  grid(columns: (4fr,5fr), rows : 20%, bl({[= Analyse]
  analyse}), align(right, bl(align(left,{[= Objectifs]
  objectif}))))

  grid(columns: (4fr,3fr), rows : 20%, bl(inset : 30pt,{ 
  [= PDCA]
  set text(size : 12pt)
  align(bottom,
  PDCA)}), bl({[= COUT]
  cost}))

  grid(columns: (1fr,1fr), rows : 20.5%, bl({[= Plan] 
  P}), align(right,bl(align(left,{[= DO]
  D}))))

  grid(columns: (1fr,1fr), rows : 20.5%, bl({[= CHECK]
  C}), align(right,bl(align(left,{[= ACT]
  A}))))
}
