module ArchivedPosts where
import Data.Monoid
import qualified Data.Text.Lazy as T
import Types

archivedPosts :: [Publish]
            -> T.Text
archivedPosts p = outputArchives . mconcat . map formatArchives $ p

  where

    outputArchives x = mconcat [ T.pack "<div class=\"archives\"><div class=\"archivesHeader\">Archived Posts:</div><div class=\"archivesContent\"><ul>"
                             , x
                             , T.pack "</ul></div></div>"
                             ]
                        
    formatArchives x = mconcat [ T.pack "<li>"
                             , T.pack "<a href=\""
                             , T.pack $ _publishedURL x
                             , T.pack "\">"
                             , title x
                             , T.pack "</a>"
                             , T.pack "</li>" ]
    title x = _title . _post $ x

