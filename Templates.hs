module Templates where
import Config
import System.FilePath
import qualified Data.Text.Lazy as T
import qualified Data.Text.Lazy.IO as T

headerRaw = T.readFile $ templatesDirectory </> "head.html"
footerRaw = T.readFile $ templatesDirectory </> "foot.html"
