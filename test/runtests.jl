using FastGaussTransforms
using Base.Test

# Evaluate the maximum error for the gauss transform of three sources
# as one of the sources is moved.
#
# Since the gauss transform is linear, this should be a sufficient test
# of the accuracy of the algorithm in general.
function maxerror(T)
  m = zero(T)
  for xp in linspace(convert(T, -10), convert(T, 10), 1000)
   points = [zero(T), convert(T, 2), xp]
   vals = ones(T, size(points))
   f = FastGaussTransform(points, vals, convert(T, 0.5))
   s = SlowGaussTransform(points, vals, convert(T, 0.5))
   for x in linspace(convert(T, -10), convert(T, 10), 10000)
     delta = abs(f(x) - s(x))
     m = max(m, delta)
   end
  end
  return m
end


# Factor of 4 is from 3 particles, rounded to nearest power of 2 for rounding error
@test maxerror(Float64) <= 4*eps(Float64)
@test maxerror(Float32) <= 4*eps(Float32)
@test maxerror(Float16) <= 4*eps(Float16)
