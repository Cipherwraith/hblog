module Utility where

import qualified Data.Text.Lazy as T
import Data.Char

removeWhitespace :: T.Text -> T.Text 
removeWhitespace = T.pack . filter (not . isSpace) . T.unpack

removeNonAlphaNum :: T.Text -> T.Text
removeNonAlphaNum = T.pack . filter (isAlphaNum) . T.unpack


