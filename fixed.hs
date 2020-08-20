import Data.Function (fix)

fixedPoint :: (Double -> Double) -> Double -> Double
fixedPoint g = fix (\f x -> let x' = g x in 
                            if x == x' 
                                then x 
                                else f x')

avgDamp f x = (x + f x) / 2

sqrt' n = fixedPoint (avgDamp (\x -> n / x)) 1.0

main = do
        print $ sqrt' 2.0
        print $ take 5 $ iterate (avgDamp (\x -> 2.0 / x)) 1.0
