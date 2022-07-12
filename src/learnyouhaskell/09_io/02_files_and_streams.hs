import System.IO
import System.Directory
import Data.List

main = do
    args <- getArgs
    progName <- getProgName
    putStrLn "The arguments are:"
    mapM putStrLn args
    putStrLn "The program name is:"
    putStrLn progName

-- main = do
--     handle <- openFile "todo.txt" ReadMode
--     (tempName, tempHandle) <- openTempFile "." "temp"
--     contents <- hGetContents handle
--     let todoTasks = lines contents
--         numberedTasks = zipWith (\n line -> show n ++ " - " ++ line) [0..] todoTasks
--     putStrLn "These are your TO-DO items:"
--     putStr $ unlines numberedTasks
--     putStrLn "Which one do you want to delete?"
--     numberString <- getLine
--     let number = read numberString
--         newTodoItems = delete (todoTasks !! number) todoTasks
--     hPutStr tempHandle $ unlines newTodoItems
--     hClose handle
--     hClose tempHandle
--     removeFile "todo.txt"
--     renameFile tempName "todo.txt"

-- main = do
--     withFile "haiku.txt" ReadMode (\handle -> do
--         hSetBuffering handle $ BlockBuffering (Just 2048)
--         contents <- hGetContents handle
--         putStr contents)

-- main = do
--     todoItem <- getLine
--     appendFile "todo.txt" (todoItem ++ "\n")

-- main = do
--     contents <- readFile "girlfriend.txt"
--     writeFile "girlfriendcaps.txt" (map toUpper contents)

-- main = do
--     contents <- readFile "girlfriend.txt"
--     putStr contents

-- main = do
--     withFile "girlfriend.txt" ReadMode (\handle -> do
--         contents <- hGetContents handle
--         putStr contents)

-- main = do
--     handle <- openFile "girlfriend.txt" ReadMode
--     contents <- hGetContents handle
--     putStr contents
--     hClose handle

-- main = interact respondPalindromes

-- respondPalindromes :: String -> String
-- respondPalindromes contents = unlines (map (\xs ->
--     if isPalindrome xs then "palindrome" else "not a palindrome") (lines contents))
--     where isPalindrome xs = xs == reverse xs

-- main = interact $ unlines . filter ((<10) . length) . lines

-- main = do
--     contents <- getContents
--     putStr (shortLinesOnly contents)

-- shortLinesOnly :: String -> String
-- shortLinesOnly input =
--     let allLines = lines input
--         shortLines = filter (\line -> length line < 10) allLines
--         result = unlines shortLines
--     in result

-- main = do
--     contents <- getContents
--     putStr (map toUpper contents)


