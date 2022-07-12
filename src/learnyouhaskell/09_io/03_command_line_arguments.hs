import System.Environment
import System.Directory
import System.IO
import Data.List

main :: IO ()
main = do
    (command:args) <- getArgs
    let (Just action) = lookup command dispatch
    action args

dispatch :: [(String, [String] -> IO ())]
dispatch =  [ ("add", add)
            , ("view", view)
            , ("remove", remove)
            , ("bump", bump)]

add :: [String] -> IO ()
add [filename, todoItem] = appendFile filename (todoItem ++ "\n")

view :: [String] -> IO ()
view [filename] = do
    contents <- readFile filename
    let todoTasks = lines contents
        numberedTasks = zipWith (\n line -> show n ++ " - " ++ line) [0..] todoTasks
    putStr $ unlines numberedTasks

remove :: [String] -> IO ()
remove [filename, numberString] = do
    handle <- openFile filename ReadMode
    (tempName, tempHandle) <- openTempFile "." "temp"
    contents <- hGetContents handle
    let number = read numberString
        todoTasks = lines contents
        newTodoItems = delete (todoTasks !! number) todoTasks
    hPutStr tempHandle $ unlines newTodoItems
    hClose handle
    hClose tempHandle
    removeFile filename
    renameFile tempName filename

bump :: [String] -> IO ()
bump [filename, numberString] = do
    contents <- readFile filename
    let number = read numberString
        todoTasks = lines contents
        todoItem = todoTasks !! number
        newTodoItems = todoItem : (delete todoItem todoTasks)
    (tempName, tempHandle) <- openTempFile "." "temp"
    hPutStr tempHandle $ unlines newTodoItems
    hClose tempHandle
    removeFile filename
    renameFile tempName filename