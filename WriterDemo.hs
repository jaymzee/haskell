module WriterDemo where

import Control.Monad.Writer

logNumber :: Int -> Writer [String] Int
logNumber x = writer (x, ["logNumber: " ++ show x])

squareNumber :: Int -> Writer [String] Int
squareNumber x = let result = x * x
                     msg = "squareNumber: " ++ show x ++
                           "^2 = " ++ show result
                 in  writer (result, [msg])

multiply :: Writer [String] Int
multiply = do
    a <- logNumber 3
    b <- squareNumber 5
    let c = a * b
    tell $ [concat ["multiply: ",show a," * ",show b," = ",show c]]
    return c

main = do
    print $ runWriter (logNumber 42)
    print $ runWriter (squareNumber 3)
    print $ runWriter multiply
