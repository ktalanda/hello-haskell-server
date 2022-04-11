{-# LANGUAGE OverloadedStrings #-}
module Double ( run ) where

import Web.Scotty
import Data.Text.Lazy             as TL
import Data.Text                  as T

run = get "/double/:value" $ do
    value <- param "value"
    text ("Answer: " <> (stringToLazyText $ doubleString value))

doubleString :: String -> String
doubleString rawValue = show $ doubleInt $ read rawValue

doubleInt :: Int -> Int
doubleInt value = value * 2

stringToLazyText :: String -> TL.Text
stringToLazyText value = TL.fromStrict $ T.pack $ value
