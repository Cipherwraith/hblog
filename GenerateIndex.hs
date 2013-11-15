module GenerateIndex where
import Config
import Templates
import Types
import Data.Monoid
import Data.List
import RecentPosts

import qualified Data.Text.Lazy as T
import qualified Data.Text.Lazy.IO as T

generateIndex :: [Publish] -> T.Text -> IO T.Text
generateIndex publishData recent = do
  htmlHead <- headerRaw
  htmlFoot <- footerRaw
  return $ mconcat [htmlHead, recent, content, htmlFoot]
 where
  content :: T.Text
  content = mconcat $ map _content . take 10 . reverse . sort $ publishData
  
writeIndex publish recent = do
  indexContent <- generateIndex publish recent
  T.writeFile indexLocation indexContent


