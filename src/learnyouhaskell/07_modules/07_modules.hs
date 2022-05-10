import Data.List as L
import Data.Function
import Data.Char
import qualified Data.Map as Map
import Geometry.Cube

numUniques :: (Eq a) => [a] -> Int
numUniques = length . nub

showExpansiveStocks :: (Double, Integer, Integer, Integer)
showExpansiveStocks =
    let stock = [(994.4,2008,9,1),(995.2,2008,9,2),(999.2,2008,9,3),(1001.4,2008,9,4),(998.3,2008,9,5)]
    in L.head $ dropWhile (\(val, y, m, d) -> val < 1000) stock

countElements :: (Ord a) => [a] -> [(a, Int)]
countElements = map (\l@(x:xs) -> (x,length l)) . group . sort

eatList :: [a] -> [([a], [a])]
eatList x = zip (inits x) (tails x)

search :: (Eq a) => [a] -> [a] -> Bool
search needle haystack =
    let nlen = length needle
    in foldl (\acc x -> (take nlen x == needle) || acc) False (tails haystack)

sortByLength :: Foldable t => [t a] -> [t a]
sortByLength = sortBy (compare `on` length)

encode :: Int -> String -> String
encode shift msg =
    let ords = map ord msg
        shifted = map (+ shift) ords
    in map chr shifted

decode :: Int -> String -> String
decode shift = encode $ negate shift

phoneBook =

    [("betty","555-2938")
    ,("bonnie","452-1111")
    ,("bonnie","452-2928")
    ,("patsy","493-2928")
    ,("lucille","205-2928")
    ,("wendy","939-8282")
    ,("penny","853-2492")
    ]

findKey :: (Eq k) => k -> [(k,v)] -> v
findKey key = snd .head .filter (\(k,v) -> key == k)

findKey' :: (Eq k) => k -> [(k,v)] -> Maybe v
findKey' key [] = Nothing
findKey' key ((k,v):xs) = if key == k
                            then Just v
                            else findKey' key xs

fromList' :: (Ord k) => [(k,v)] -> Map.Map k v
fromList' = foldr (\(k,v) acc -> Map.insert k v acc) Map.empty

phoneBookToMap :: (Ord k) => [(k,String)] -> Map.Map k String
phoneBookToMap = Map.fromListWith (\n1 n2 -> n1 ++ ", " ++ n2)

phoneBookToMap' :: (Ord k) => [(k,a)] -> Map.Map k [a]
phoneBookToMap' xs = Map.fromListWith (++) $ map (\(k,v) -> (k,[v])) xs