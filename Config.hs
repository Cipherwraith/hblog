module Config where
import System.FilePath

siteDomain = "http://www.asdf.com/"
siteDirectory = "/Users/asdf/Code/sandbox/haskellblog"
postsDirectory = siteDirectory </> "posts"
htmlDirectory = siteDirectory </> "html"
staticDirectory = siteDomain </> "static" 
localStaticDirectory = htmlDirectory </> "static"
rssDirectory = htmlDirectory </> "rss"
templatesDirectory = siteDirectory </> "templates"
indexLocation = htmlDirectory </> "index" <.> "html"
cssDirectory = siteDirectory </> "css"
