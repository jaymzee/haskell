data Shape  = Circle Float
            | Square Float
            | Rectangle Float Float
            | Triangle Float Float
            deriving (Show)

area :: Shape -> Float
area (Circle r) = 3.14159 * r * r
area (Square l) = l * l
area (Rectangle w h) = w * h
area (Triangle b h) = 0.5 * b * h

main = do
    print $ area (Circle 5)
    print $ area (Square 5)
    print $ area (Rectangle 4 3)
    print $ area (Triangle 4 3)
