{-# LANGUAGE OverloadedStrings #-}
module Ping ( run ) where

import Web.Scotty

run = get "/ping" $ do
  text "pong"
