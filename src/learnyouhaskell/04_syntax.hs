lucky :: (Integral a) => a -> String
lucky 7 = "LUCKY NUMBER SEVEN!"
lucky x = "Sorry, you're out of lack, pal!"

sayMe :: (Integral a) => a -> String
sayMe 1 = "Un!"
sayMe 2 = "Deux!"
sayMe 3 = "Trois!"
sayMe 4 = "Quatre!"
sayMe 5 = "Cinq!"
sayMe x = "C'est pas en range"

factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n -1)

charName :: Char -> String
charName 'a' = "Albert"
charName 'b' = "Broseph"
charName 'c' = "Cecil"

addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors a b = (fst a + fst b, snd a + snd b)

addVectors' :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors' (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

first :: (a, b, c) -> a
first (x, _, _) = x

second :: (a, b, c) -> b
second (_, y, _) = y

third :: (a, b, c) -> c
third (_, _, z) = z

sumTuples :: (Integral a) => [(a, a)] -> [a]
sumTuples xs = [a + b | (a, b) <- xs]

head' :: [a] -> a
head' [] = error "Tu ne peux pas appel head avec la liste vide, connard"
head' (x:_) = x

tell :: (Show a) => [a] -> String
tell [] = "Cette liste est vide"
tell (x:[]) = "Cette liste a un element: " ++ show x
tell (x:y:[]) = "Cette liste a deux elements: " ++ show x ++ " and " ++ show y
tell (x:y:_) = "Cette liste est longe. Les deux premier elements sont: " ++ show x ++ " and " ++ show y

length' :: (Num b) => [a] -> b
length' [] = 0
length' (_:xs) = 1 + length' xs

sum' :: (Num a) => [a] -> a
sum' [] = 0
sum' (x:xs) = x + sum' xs

capital :: String -> String
capital "" = "Empty string, whoops!"
capital all@(x:xs) = "The first letter of " ++ all ++ " is "  ++ [x]

bmiTell :: (RealFloat a) => a -> a -> String
bmiTell weight height
    | bmi <= skinny = "Vous etes trop mince, vous emo, vous!"
    | bmi <= normal = "Vous etes normal. Pffft, je parie que vous etes laid!"
    | bmi <= fat = "Vous etes trop grand! Perdre du poids, gras!"
    | otherwise   = "Vous etes une baleine. Felicitations!"
    where bmi = weight / height ^2
          (skinny, normal, fat) = (18.5, 25.0, 30.0)

max' :: (Ord a) => a -> a -> a
max' a b
    | a > b      = a
    | otherwise  = b

myCompare :: (Ord a) => a -> a -> Ordering
a `myCompare` b
    | a > b      = GT
    | a == b     = EQ
    | otherwise  = LT

initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."
    where (f:_) = firstname
          (l:_) = lastname

calcBmis :: (RealFloat a) => [(a, a)] -> [a]
calcBmis xs = [bmi w h | (w, h) <- xs]
    where bmi w h = w / h ^2

cylinder :: (RealFloat a) => a -> a -> a
cylinder r h =
    let sideArea = 2 * pi * r * h
        topArea = pi * r ^2
    in sideArea + 2 * topArea

calcBmis' :: (RealFloat a) => [(a, a)] -> [a]
calcBmis' xs = [bmi | (w, h) <- xs, let bmi = w / h ^2, bmi >= 25.0]

describeList :: [a] -> String
describeList xs = "La lista est " ++ what xs
    where what [] = "vide."
          what [x] = "une singleton lista."
          what xs = "plus long."
