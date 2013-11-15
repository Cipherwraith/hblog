module RSS where

import Data.Time.Clock.POSIX
import Data.Maybe
import Network.URI
import Types
import Text.RSS
import qualified Data.Text.Lazy as T


makeRSS :: [Publish] -> RSS
makeRSS x = RSS 
              "asdf.com"
              (fromJust $ parseURI "http://www.asdf.com")
              "Haskell blog"
              []
              (newestPosts x)


newestPosts :: [Publish] -> [Item]
newestPosts = map newPost 
  where
    newPost x =   [ (Title $ T.unpack . _title . _post $ x)
                  , Link (fromJust $ parseURI "http://www.asdf.com")
                  , Description (T.unpack . _description $ x)
                  , Author "Cipher Wraith"
                  , Category Nothing "Haskell"
                  , PubDate ( posixSecondsToUTCTime (fromInteger (_time x) :: POSIXTime))
                  , Source (fromJust (parseURI "http://www.asdf.com/")) "asdf!"]


