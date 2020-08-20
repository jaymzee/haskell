--module WriterAndStack where

import Control.Monad.Writer
import Control.Monad.State
import WriterDemo hiding (main)
import MyStack hiding (main)

pushPop :: State (Stack (Writer [String] Int)) ()
pushPop = do
    push $ writer $ (1, ["pushing 1"])
    push $ writer $ (2, ["pushing 2"])
    push $ writer $ (3, ["pushing 3"])
    --x <- fst $ runWriter pop
    --push writer $ (x, ["pushing x"])

main = do
    --print $ runWriter multiply
    let result = runState pushPop []
    print $ result
