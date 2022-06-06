import Data.Char (toUpper)

main = do
    line <- getLine
    if null line
        then return ()
        else do
            putStrLn $ reverseWords line

reverseWords :: String -> String
reverseWords = unwords . map reverse . words

-- main = do
--     putStrLn "Hello, what's your first name?"
--     firstname <- getLine
--     putStrLn "Hello, what's your last name?"
--     lastname <- getLine
--     let bigFirstname = map toUpper firstname
--         bigLastname = map toUpper lastname
--     putStrLn $ "Hey " ++ bigFirstname ++ " " ++ bi ++ ", you rock!"
