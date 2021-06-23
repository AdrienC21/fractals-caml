#open "graphics";;
open_graph "1920x1080";;
clear_graph ();;
 
let diverge_julia a b cr ci n =
let x = ref a in
let y = ref b in
let xtemp=ref 0. in
let ytemp=ref 0. in
let k = ref 0 in
while ((!x *. !x+. !y *. !y) < 4.)&&(!k<n) do
xtemp:=(!x)*. (!x)-. (!y)*. (!y)+. cr;
ytemp:=2. *. (!x) *.(!y)+. ci;
x:= !xtemp;
y:= !ytemp;
k:= !k+1;
done;
(!k);;
 
let julia cr ci n d =
clear_graph ();
let topx=size_x() and topy=size_y() and k = ref 0 in
for x=(-topx/2) to (topx/2) do
for y=(-topy/2) to (topy/2) do
k:=((diverge_julia ((float_of_int x) /. d) ((float_of_int y) /. d) cr ci n)*10);
set_color (rgb (255-(!k)/2) (255-(!k)/2) (255-(!k)));
plot (x+(topx/2)) (y+(topy/2));
done;
done;;

clear_graph ();;

julia (-0.181) (-0.667) 150 400.;;
julia (0.285) (0.01) 300 300.;;
(*julia (sqrt(2.)/.2.) (1.) 150 300.;;*)
(*julia (-0.7927) (0.1609) 500 300.;;*)
(*julia (0.32) (0.043) 150 300.;;*)
(*julia (-0.3380) (-0.6230) 150 300.;;*)
