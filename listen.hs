import Control.Monad.Writer

-- Monad stack for the application uses IO, wrapped in a logging WriterT
type App a = WriterT [String] IO a

-- utility to write to the log
logMsg :: String -> App ()
logMsg msg = tell [msg]

-- gets an Int from user input (and logs what it does)
getInt :: App Int
getInt = do
    logMsg "getting data"
    n <- liftIO getLine
    logMsg $ "got line: " ++ show n
    return . read $ n

-- application logic that uses getInt and increments the result by 1
app :: App Int
app = do
    (n, logs) <- listen getInt
    let numLogLines = length logs
    logMsg $ "getInt logged " ++ show numLogLines ++ " lines"
    return $ n + 1

-- main code runs the application and prints the log
main = do
    (res, logs) <- runWriterT app
    print $ "Result = " ++ show res
    putStrLn "Log: "
    mapM_ putStrLn logs
