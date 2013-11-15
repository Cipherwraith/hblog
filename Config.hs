module Config where
import System.FilePath

siteDirectory = "/Users/asdf/Code/sandbox/haskellblog"
postsDirectory = siteDirectory </> "posts"
htmlDirectory = siteDirectory </> "html"
rssDirectory = htmlDirectory </> "rss"
templatesDirectory = siteDirectory </> "templates"
indexLocation = htmlDirectory </> "index" <.> "html"
cssDirectory = siteDirectory </> "css"
