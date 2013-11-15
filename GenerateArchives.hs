module GenerateArchives where

import qualified Data.Text.Lazy as T
import qualified Data.Text.Lazy.IO as T
import System.FilePath
import Types
import Templates
import Data.Monoid
import Config
import ArchivedPosts

writeArchives :: [Publish] -> T.Text -> IO ()
writeArchives publish recent = do
  htmlHead <- headerRaw
  htmlFoot <- footerRaw
  let content = archivedPosts publish
  let writeOut = mconcat [htmlHead, recent, archivedPosts publish, htmlFoot]
  let writePath = localStaticDirectory </> "archives" <.> "html"
  T.writeFile writePath writeOut
