import Data.Char

main = do
    putStrLn "Hello, what's your first name?"
    firstname <- getLine
    putStrLn "Hello, what's your last name?"
    lastname <- getLine
    let bigFirstname = map toUpper firstname
        bigLastname = map toUpper lastname
    putStrLn $ "Hey " ++ bigFirstname ++ " " ++ bigLastname ++ ", you rock!"

-- main = forever $ do
    -- putStr "Give me some input: "
    -- l <- getLine
    -- putStrLn $ map toUpper l

-- main = do
    -- rs <- sequence [getLine, getLine, getLine]
    -- print rs

-- main = do
--     a <- getLine
--     b <- getLine
--     c <- getLine
--     print [a,b,c]

-- main = do
--     c <- getChar
--     when (c /= ' ') $ do
--         putChar c
--         main

-- main = do
--     c <- getChar
--     if c /= ' '
--         then do
--             putChar c
--             main
--         else return ()

-- main = do
--     return ()
--     a <- return "HAHAHA"
--     line <- getLine
--     b <- return "BLAH BLAH BLAH"
--     return 4
--     putStr $ reverseWords line
--     putStrLn $ " " ++ a ++ " " ++ b


-- main = do
--     line <- getLine
--     if null line
--         then return ()
--         else do
--             putStrLn $ reverseWords line
--             main

-- reverseWords :: String -> String
-- reverseWords = unwords . map reverse . words
