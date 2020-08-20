module MyStack where

import Control.Monad.State

type Stack a = [a]

push :: a -> State (Stack a) ()
push a = state $ \s -> ((),a:s)

pop :: State (Stack a) a
pop = state $ \(x:xs) -> (x,xs)

incrementTop :: Num a => State (Stack a) ()
incrementTop = do
    x <- pop
    push (x + 1)

main = do
    let initialState = [0]
    print (runState incrementTop initialState)
