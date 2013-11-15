module Main where
import qualified Data.Text.Lazy as T
import qualified Data.Text.Lazy.IO as T
import Input
import Publish
import RSS
import Text.RSS
import Config
import System.FilePath
import GenerateIndex

main = do
  posts <- getPosts
  let publish = map preparePost posts
  let feed = (showXML . rssToXML . makeRSS) $ take 10 publish
  writeFile (rssDirectory </> "rss" <.> "xml") feed
  index <- generateIndex publish
  T.writeFile indexLocation index
  putStrLn "Finish"

