module Publish where
import qualified Data.Text.Lazy as T
import Data.Monoid
import Types

preparePost :: Post -> Publish
preparePost x = Publish x (_date x) (T.take 100 $ _contentRaw x) $ wrapClass "post" $ 
                    mconcat [ wrapClass "title" $ _title x
                            , wrapClass "date" $ T.pack . show $ (_date x)
                            , wrapClass "author" $ _author x
                            , wrapClass "content" $ _contentPretty x
                            ]

wrapClass :: String  -- Class Name
          -> T.Text  -- Data to wrap
          -> T.Text  -- Output 
wrapClass s x = mconcat [T.pack "<div class=\"", T.pack s, T.pack "\">\n", x, T.pack "\n</div>\n"]
