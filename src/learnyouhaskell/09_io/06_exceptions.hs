import System.Environment
import System.IO
import System.Directory
import System.IO.Error
import Control.Exception

main = toTry `catch` handler

toTry :: IO ()
toTry = do (filename:_) <- getArgs
           contents <- readFile filename
           putStrLn $ "This file has " ++ show (length $ lines contents) ++ " lines!"

handler :: IOError -> IO ()
handler e 
    | isDoesNotExistError e = 
        case ioeGetFileName e of Just path -> putStrLn $ "Whoops! The file doesn't exist at: " ++ path
                                 Nothing -> putStrLn "Whoops! File does not exist at unknown location!"
    | otherwise = ioError e

-- main = do (filename:_) <- getArgs
--           fileExists <- doesFileExist filename
--           if fileExists
--             then do contents <- readFile filename
--                     putStrLn $ "This file has " ++ show (length (lines contents)) ++ " lines!"
--             else do putStrLn "The file doesn't exist!"