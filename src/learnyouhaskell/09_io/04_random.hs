import System.Random
import Control.Monad(when)

main = do
    gen <- getStdGen
    askForNumber gen

askForNumber :: StdGen -> IO ()
askForNumber gen = do
    let (randNumber, newGen) = randomR (1,10) gen :: (Int, StdGen)
    putStr "Which number in the range from 1 to 10 am I thinking off? "
    numberString <- getLine
    when (not $ null numberString) $ do
        let number = read numberString
        if randNumber == number
            then putStrLn "You are correct!"
            else putStrLn $ "Sorry, it was " ++ show randNumber
        askForNumber newGen

-- main = do
--     gen <- getStdGen
--     putStrLn $ take 20 (randomRs ('a','z') gen)
--     gen' <- newStdGen
--     putStrLn $ take 20 (randomRs ('a','z') gen')
    

-- main = do
--     gen <- getStdGen
--     let randomChars = randomRs ('a', 'z') gen
--         (first20, rest) = splitAt 20 randomChars
--         (second20, _) = splitAt 20 rest
--     putStrLn first20
--     putStrLn second20

-- main = do
--     gen <- getStdGen
--     putStr $ take 20 (randomRs ('a','z') gen)

threeCoins :: StdGen -> (Bool, Bool, Bool)
threeCoins gen =
    let (firstCoin, newGen) = random gen
        (secondCoin, newGen') = random newGen
        (thirdCoin, newGen'') = random newGen'
    in (firstCoin, secondCoin, thirdCoin)

randoms' :: (RandomGen g, Random a) => g -> [a]
randoms' gen = let (value, newGen) = random gen in value:randoms' newGen

finiteRandoms :: (RandomGen g, Random a) => Int -> g -> ([a], g)
finiteRandoms 0 gen = ([], gen)
finiteRandoms n gen =
    let (value, newGen) = random gen
        (restOfList, finalGen) = finiteRandoms (n-1) newGen
    in (value:restOfList, finalGen)
