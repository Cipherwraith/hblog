module Main where
import qualified Data.Text.Lazy as T
import qualified Data.Text.Lazy.IO as T
import Input
import Publish
import RSS
import Text.RSS
import Config
import System.FilePath
import GenerateArchives
import GenerateIndex
import GeneratePosts
import RecentPosts

main = do
  posts <- getPosts
  let publish = map preparePost posts
  let recent = recentPosts publish 5
  writeRSSFeed publish
  writeIndex publish recent
  writePosts publish recent
  writeArchives publish recent
  putStrLn "Finish"

