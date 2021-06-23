#open "graphics";;
open_graph "800x800";;

type etat={mutable x : float; mutable y : float; mutable teta : float; mutable crayon : bool};;
type champ_tortue={haut:float;larg:float;x_depart:float;y_depart:float;teta_depart:float};;
let champ={haut=800.;larg=800.;x_depart=200.;y_depart=80.;teta_depart=90.};;
let pi_sur_180=let pi= 4.0 *. (atan 1.0) in pi /. 180.0 ;;
let tortue={x=champ.x_depart;y=champ.y_depart;teta=champ.teta_depart *. pi_sur_180;crayon=true};;
let round x=int_of_float(floor(x +. 0.5));;
let xe x=x *. ((float_of_int(size_x())) /. champ.larg);;
let ye y=y *. ((float_of_int(size_y())) /. champ.haut);;
let couleur_du_fond=white;;
let couleur_du_trace=black;;
let init_écran()=
(*set_color couleur_du_fond;fill_rect 0 0 (size_x()) (size_y());*)
clear_graph();
set_color couleur_du_trace;
moveto (round (xe tortue.x)) (round (ye tortue.y));;



let bc()=tortue.crayon <- true;;
let lc()=tortue.crayon <- false;;
let av d=let dx=(d *. cos(tortue.teta)) and dy=(d *. sin(tortue.teta)) in
	if tortue.crayon then lineto (round(xe (tortue.x +. dx))) (round(ye (tortue.y +. dy)))
		else 
		moveto (round(xe (tortue.x +. dx))) (round(ye (tortue.y +. dy)));
		tortue.x <- tortue.x +. dx;
		tortue.y <- tortue.y +. dy;;
let re d=av ((-.1.) *. d);;
let td a=let rad=a *. pi_sur_180 in tortue.teta <- (tortue.teta -. rad);;
let tg a=let rad=a *. pi_sur_180 in tortue.teta <- (tortue.teta +. rad);;



let rec koch n l=match n with
	0 -> av l
	|n -> koch (n-1) (l /. 3.);
			tg 60.;
			koch (n-1) (l /. 3.);
			td 120.;
			koch (n-1) (l /. 3.);
			tg 60.;
			koch (n-1) (l /. 3.);;
				
let flocon_koch n l=
	koch n l;
	td 120.;
	koch n l;
	td 120.;
	koch n l;;

(*Optional functions to calculate the length and the area of a Van Koch Snowflake*)
(*
let rec longkoch n l=match n with
	0 -> l
	|n -> 4. *. (longflocon (n-1) (l /. 3.)); and	
longflocon n l=3. *. (longkoch n l);;

let rec airkoch n l=match n with
	0 -> 0.
	|n -> let long=(l /. 3.) in ((airkoch (n-1) long) +. ((sqrt(3.) /. 4.) *. (long *. long)));;

let airflocon n l=3. *. (airkoch n l);;
longflocon 2 90.;;
airflocon 1 90.;;*)

	
let rec dragon n l=match n with
	0 -> av l
	|n -> dragon (n-1) (l /. 2.);
			tg 90.;
			sym_dragon (n-1) (l /. 2.); and
	sym_dragon n l=match n with
	0 -> av l
	|n -> dragon (n-1) (l /. 2.);
			td 90.;
			sym_dragon (n-1) (l /. 2.);;

init_ecran();;

flocon_koch 10 640.;;

init_ecran();;
lc();;
tortue.x <- 400.;;
tortue.y <- 620.;;
moveto (round (xe tortue.x)) (round (ye tortue.y));;
clear_graph();;
bc();;
dragon 20 480000.;;
