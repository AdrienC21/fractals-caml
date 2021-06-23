# Fractals Caml

Scripts developed in Caml light to draw fractals such as the Mandelbrot set or Julia sets for a given parameter.

![alt text](https://github.com/AdrienC21/fractals-caml/blob/main/images/julia.png?raw=true)

_Here, a Julia set with c = -0.181 -0.667 i_

## Overview

Here is a list of the different algorithms implemented in this project

- Julia set
- Mandelbrot set
- Von Koch Snowflake
- Dragon curve

## Installation

Install CamlLight on your computer and clone this repository :

```bash
git clone https://github.com/AdrienC21/fractals-caml.git
```

## How to use

Please find below a short description on how to use each algorithms.

### Von Koch Snowflake & Dragon curve

Draw the [Von Koch Snowflake](https://en.wikipedia.org/wiki/Koch_snowflake)

![alt text](https://github.com/AdrienC21/fractals-caml/blob/main/images/vonkoch.png?raw=true)

and draw the [Dragon curve](https://en.wikipedia.org/wiki/Dragon_curve)

![alt text](https://github.com/AdrienC21/fractals-caml/blob/main/images/dragon.png?raw=true)

Run run_other_fractals.ml
### Julia set

Draw the [Julia set](https://en.wikipedia.org/wiki/Julia_set) for a given parameter c (and some extra hyperparameters).

![alt text](https://github.com/AdrienC21/fractals-caml/blob/main/images/julia2.png?raw=true)

_Here, c = 0.285 + 0.01 i_

Edit in run_julia.ml the following lines (at the bottom of the file) :

```console
julia (-0.181) (-0.667) 150 400.;;
```

The first two parameters are the real part and the imaginary part of the constant c.

The third parameter represents the resolution in terms of the number of different colors.

The last parameter is a scale factor. The larger it is, the more we zoom in on the image.

Run run_julia.ml

### Mandelbrot set

Draw the [Mandelbrot set](https://en.wikipedia.org/wiki/Mandelbrot_set)

![alt text](https://github.com/AdrienC21/fractals-caml/blob/main/images/mandelbrot.png?raw=true)

Run run_mandelbrot.ml

## License

[MIT](https://choosealicense.com/licenses/mit/)
