# FastGaussTransforms

[![Build Status](https://travis-ci.org/jwmerrill/FastGaussTransforms.jl.svg?branch=master)](https://travis-ci.org/jwmerrill/FastGaussTransforms.jl)

Fast algorithm for repeated evaluation of the convolution of a point set with a gaussian kernel. Useful for, e.g. Kernel Density Estimation, or solving heat flow problems.

## Usage
The calculation proceeds in two steps. First, a pointset is summarized into a FastGaussTransform datastructure using `fastgausstransform`.

```julia
points = rand(10)
values = rand(10)
bandwidth = 0.04
t = fastgausstransform(points, values, bandwidth)
```

The transform may then be evaluated at a point using `evaluate`.
```julia
evaluate(t, 0.5)
```

`faustgausstransform` takes an optional keyword argument specifying the relative precision tolerance:

```julia
fastgausstransform(points, values, bandwidth; rtol=1e-3)
```

`rtol` defaults to `eps(1.0) ≈ 2e-16`. Decreased precision speeds evaluation. This setting should be especially useful for plotting.

Based on "Improved Fast Gauss Transform," Proceedings International Conference on Computer Vision, 464 -471, C. Yang, R. Duraiswami, N.A. Gumerov, L. Davis. [pdf](http://www.umiacs.umd.edu/~ramani/pubs/0464_yang.pdf)
