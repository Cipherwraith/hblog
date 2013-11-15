module RecentPosts where
import Data.Monoid
import qualified Data.Text.Lazy as T
import Types

recentPosts :: [Publish]
            -> Int -- Amount of recent posts to get
            -> T.Text
recentPosts p i = outputRecent . mconcat . map formatRecent $ recent
  where
    recent = take i p

    outputRecent x = mconcat [ T.pack "<div class=\"recent\"><div class=\"recentHeader\">Recent Posts:</div><div class=\"recentContent\"><ul>"
                             , x
                             , T.pack "</ul></div></div>"
                             ]
                        
    formatRecent x = mconcat [ T.pack "<li>"
                             , T.pack "<a href=\""
                             , T.pack $ _publishedURL x
                             , T.pack "\">"
                             , title x
                             , T.pack "</a>"
                             , T.pack "</li>" ]
    title x = _title . _post $ x

