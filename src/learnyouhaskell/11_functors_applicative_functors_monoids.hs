import Data.Char
import Data.List

data CMaybe a = CNothing | CJust Int a deriving (Show)

instance Functor CMaybe where
    fmap f CNothing = CNothing
    fmap f (CJust counter x) = CJust (counter+1) (f x)

main = do
    line <- fmap (intersperse '-' . reverse . map toUpper) getLine
    putStrLn line

-- main = do
--     line <- fmap reverse getLine
--     putStrLn $ "You said " ++ line ++ " backward!"

-- main = do 
--     line <- getLine
--     let line' = reverse line
--     putStrLn $ "You said " ++ line' ++ " backwards!"
