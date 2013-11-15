module Input where

import Config
import Types
import qualified Data.Text.Lazy as T
import qualified Data.Text.Lazy.IO as T
import System.Directory
import Data.List
import Control.Applicative
import System.FilePath
import Data.Char
import Text.Pandoc

getPostList :: IO [FilePath]
getPostList = map (postsDirectory </>) . delete "." . delete ".." <$> getDirectoryContents postsDirectory

getRawPost :: FilePath -> IO T.Text
getRawPost = T.readFile

parsePost :: T.Text -> Post
parsePost s = Post  getTitle
                    getDate
                    getAuthor
                    getContentRaw
                    prettifyContent
  where
    splitInput
      | length (T.lines s) < 4 = [e, e, e, e]
      | otherwise = T.lines s
    e = T.empty
    
    removeNonNumbers :: String -> String
    removeNonNumbers = filter isNumber

    convertToInteger :: T.Text -> Integer
    convertToInteger x = read . removeNonNumbers . T.unpack $ x :: Integer

    getTitle = head splitInput
    getDate = convertToInteger . head . drop 1 $ splitInput
    getAuthor = head . drop 2 $ splitInput
    getContentRaw = T.unlines . drop 3 $ splitInput
    prettifyContent = prettify getContentRaw
                        

prettify :: T.Text -> T.Text
prettify = T.pack . writeHtmlString def . readMarkdown def . T.unpack 

markdownText = T.pack "hello\n\n*#dog*\n\n1. Red\n\n2. Blue\n\n3. Green\n\n* hi\n\n* dog\n\n[example](www.dog.com)\n\n    this is code\n\n    more code"

getPosts :: IO [Post]
getPosts = do
  postList <- getPostList
  rawPosts <- mapM getRawPost postList
  let parsed = map parsePost rawPosts
  return . reverse . sort $ parsed

