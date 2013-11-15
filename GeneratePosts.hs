module GeneratePosts where
import qualified Data.Text.Lazy as T
import qualified Data.Text.Lazy.IO as T
import System.FilePath
import Types
import Templates
import Data.Monoid
import Config
import RecentPosts

writePosts :: [Publish] -> T.Text -> IO ()
writePosts publish recent = mapM_ (writePost recent) publish
  where
    writePost :: T.Text -> Publish -> IO ()
    writePost recent publish = do
      htmlHead <- headerRaw
      htmlFoot <- footerRaw
      let content = _content publish
      let writeOut = mconcat [htmlHead, recent, content, htmlFoot]
      let writePath = replaceDirectory (_publishedURL publish) localStaticDirectory
      T.writeFile writePath writeOut


