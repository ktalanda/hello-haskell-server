import System.Environment
import qualified Data.ByteString.Lazy as B

main = do
    (filename1:filename2:_) <- getArgs
    copyfile filename1 filename2

copyfile :: FilePath -> FilePath -> IO ()
copyfile source dest = do
    contents <- B.readFile source
    B.writeFile dest contents