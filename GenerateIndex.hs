module GenerateIndex where
import Templates
import Types
import Data.Monoid
import Data.List

import qualified Data.Text.Lazy as T

generateIndex :: [Publish] -> IO T.Text
generateIndex publishData = do
  htmlHead <- headerRaw
  htmlFoot <- footerRaw
  return $ mconcat [htmlHead, content, htmlFoot]
 where
  content :: T.Text
  content = mconcat $ map _content . take 10 . reverse . sort $ publishData
  



