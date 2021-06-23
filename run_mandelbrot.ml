(*Define complex operations*)
type complexe == float*float;;
let re ((x,y):complexe)=x;;
let im ((x,y):complexe)=y;;
let norm ((x,y):complexe)=sqrt(x *. x +. y *. y);;
let mult_complexe ((a,b):complexe) ((c,d):complexe)=((a *. c -. b *. d,a *. d +. b *. c):complexe);;
let add_complexe ((a,b):complexe) ((c,d):complexe)=((a +. c,b +. d):complexe);;
let sub_complexe ((a,b):complexe) ((c,d):complexe)=((a -. c,b -. d):complexe);;
let scal_complexe a ((c,d):complexe)=((a *. c,a *. d):complexe);;
let carre_complexe ((a,b):complexe)=mult_complexe (a,b) (a,b);;
let sqrt_complexe ((a,b):complexe)=let aux=sqrt(0.5 *. (a +. (norm (a,b)))) in
	((aux,b /. (2. *. aux)):complexe);;

let f z c=add_complexe (carre_complexe z) c;; (*recursive sequence*)

let maxiter=1600;; (*accuracy*)

(*sequence is bounded ?*)
let rec defn z n c=match n with
	n when n>maxiter -> maxiter
	|n when (norm z) > 2. -> n
	|n -> (defn (f z c) (n+1) c);;

let round x = if (x >= 0.) then int_of_float x
  else int_of_float ( x -. 1.0);;

# open "graphics";;
open_graph "1920x1080";;

(*attribute a color to a specific coordinates given by the complex c*)
let zone c= let n=(defn (0.,0.) 0 c) in match (n mod 8) with
	|0 -> black
	|1 -> red
	|2 -> green
	|3 -> blue
	|4 -> yellow
	|5 -> cyan
	|6 -> magenta
	|7 -> black;;

let abso=float_of_int(size_x()) and ord=float_of_int(size_y());;
let drawMandel (xmin,xmax,ymin,ymax)= let pasabs=((xmax -. xmin) /. abso) and pasord=((ymax -. ymin) /. ord) and c=ref ((xmin,ymin):complexe) in
	for i=1 to round(abso) do
		for j=1 to round(ord) do
			set_color (zone !c);
			plot i j;
			c:= add_complexe (!c) (pasabs,0.) 
		done;
	c:= sub_complexe (!c) ((float_of_int(round(ord)) *. pasabs),0.);
	c:= add_complexe (!c) (0.,pasord) done;;
drawMandel (-.2.,2.,-.2.,1.);;
