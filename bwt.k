bwt:{[s],//1#'|:'{x@<x}(!#a)!: a:"\0",s} // the BWT
s:{x@<x}
twb:{[e]1_*s(-1+#e){[x]e,'s x}/e} // undo the BWT
twb bwt "dilute dilute ok!"