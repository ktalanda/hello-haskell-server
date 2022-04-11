{-# LANGUAGE OverloadedStrings #-}
module Lib ( runApi ) where

import Web.Scotty
import Ping
import Double

runApi :: IO ()
runApi = scotty 3000 $ do
  Ping.run
  Double.run
