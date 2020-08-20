foldl' :: (b -> a -> b) -> b -> [a] -> b
foldl' f i [] = i
foldl' f i (x:xs) = foldl' f (i `f` x) xs

foldr' :: (a -> b -> b) -> b -> [a] -> b
foldr' f i [] = i
foldr' f i (x:xs) = x `f` (foldr' f i xs)

f s a b = concat ["(",a,s,b,")"]
main = do
    print $ foldl' (*) 1 [1..5]
    putStrLn $ foldl' (f "*") "1" $ map show [1..5]
    putStrLn $ foldr' (f "*") "1" $ map show [1..5]
