data Expr = Val Double
          | Div Expr Expr
          | Mul Expr Expr
          | Add Expr Expr
          | Sub Expr Expr
          deriving (Show, Eq)

safediv :: Double -> Double -> Maybe Double
safediv n d = if d == 0
                then fail ""
                else return (n / d)

eval :: Expr -> Maybe Double
eval (Val x)    = return x
eval (Div x y)  = do m <- eval x
                     n <- eval y
                     m `safediv` n
eval (Mul x y)  = do m <- eval x
                     n <- eval y
                     return (m * n)
eval (Add x y)  = do m <- eval x
                     n <- eval y
                     return (m + n)
eval (Sub x y)  = do m <- eval x
                     n <- eval y
                     return (m - n)

main = do
    let x = Val 5
        y = Val 2
        z = (Val 5) `Div` ((Val 3) `Add` (Val (-1)))
    print z
    print (eval z)
