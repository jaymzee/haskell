import Data.Function -- for fix
import Debug.Trace

memoize :: (Int -> a) -> (Int -> a)
memoize f = (map f [0..] !!)

fib' :: (Int -> Integer) -> Int -> Integer
fib' _ n | trace ("fib' called with n = " ++ show(n)) False = undefined
fib' _ 0 = 0
fib' _ 1 = 1
fib' f n = f (n-2) + f (n-1)

slow_fib :: Int -> Integer
slow_fib = fix fib'

fib :: Int -> Integer
fib = fix (memoize . fib')

fibs = 0:1:[a + b | (a, b) <- zip fibs (tail fibs)]

main = do
    putStrLn "running slow fib..."
    putStrLn $ "fib 6 = " ++ show (slow_fib 6)
    putStrLn "running fast fib..."
    putStrLn $ "fib 28 = " ++ show (fib 28)
