module Utility where

import Data.Time
import Data.Time.Clock.POSIX
import qualified Data.Text.Lazy as T
import Data.Char

removeWhitespace :: T.Text -> T.Text 
removeWhitespace = T.pack . filter (not . isSpace) . T.unpack

removeNonAlphaNum :: T.Text -> T.Text
removeNonAlphaNum = T.pack . filter (isAlphaNum) . T.unpack

convertTimeToString x = posixSecondsToUTCTime ((fromInteger x) :: POSIXTime)

