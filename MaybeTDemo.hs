import Control.Monad.Trans.Maybe

login u e p = do
    putStrLn $ "login"
    putStrLn $ "  user: " ++ u
    putStrLn $ "  password: " ++ p
    putStrLn $ "  email: " ++ e

readUserName :: MaybeT IO String
readUserName = MaybeT $ do
    putStr "username: "
    str <- getLine
    if length str > 5
        then return $ Just str
        else return Nothing

readEmail :: MaybeT IO String
readEmail = MaybeT $ do
    putStr "email: "
    str <- getLine
    if elem '@' str
        then return $ Just str
        else return Nothing

readPassword :: MaybeT IO String
readPassword = MaybeT $ do
    putStr "password: "
    str <- getLine
    if length str > 5
        then return $ Just str
        else return Nothing

main :: IO ()
main = do
    maybeCreds <- runMaybeT $ do
        usr   <- readUserName
        pass  <- readPassword
        email <- readEmail
        return (usr,email,pass)
    case maybeCreds of
        Nothing      -> print "Couldn't login!"
        Just (u,e,p) -> login u e p
