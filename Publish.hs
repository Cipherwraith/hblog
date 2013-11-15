module Publish where
import Data.Monoid
import qualified Data.Text.Lazy as T
import System.FilePath
import Types
import Config
import Utility
import Data.Char

preparePost :: Post -> Publish
preparePost x = Publish x (_date x) (T.take 100 $ _contentRaw x) content publishUrl
  where
    publishUrl = staticDirectory </> 
      (map toLower 
      . T.unpack 
      . removeWhitespace 
      $ (mconcat [_author x, T.pack "-", (removeNonAlphaNum $ _title x)])) 
      <.> "html"
    content = wrapClass "post" $ 
                    mconcat [ wrapClass "title" $ wrapUrl publishUrl (_title x)
                            , wrapClass "date" $ T.pack . show $ (_date x)
                            , wrapClass "author" $ _author x
                            , wrapClass "content" $ _contentPretty x
                            ]

wrapUrl :: String -- Url
        -> T.Text -- Text
        -> T.Text -- Output
wrapUrl url x = mconcat [T.pack "<a href=\"", T.pack url, T.pack "\">", x, T.pack "</a>"]


wrapClass :: String  -- Class Name
          -> T.Text  -- Data to wrap
          -> T.Text  -- Output 
wrapClass s x = mconcat [T.pack "<div class=\"", T.pack s, T.pack "\">\n", x, T.pack "\n</div>\n"]


