module Sine where

cube :: Double -> Double
cube x = x * x * x

p :: Double -> Double
p x = 3 * x - 4 * cube x

sine :: Double -> Double
sine angle =
  if abs angle <= 0.1 then angle
                      else p $ sine (angle / 3.0)
