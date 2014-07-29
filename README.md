# FastGaussTransforms

[![Build Status](https://travis-ci.org/jwmerrill/FastGaussTransforms.jl.svg?branch=master)](https://travis-ci.org/jwmerrill/FastGaussTransforms.jl)

## Usage

```julia
points = rand(10)
values = rand(10)
bandwidth = 0.04
t = fastgausstransform(points, values, bandwidth)
evaluate(t, 0.5)
```

Based on [Improved Fast Gauss Transform and Efficient Kernel Density Estimation](http://www.umiacs.umd.edu/~ramani/pubs/0464_yang.pdf)



