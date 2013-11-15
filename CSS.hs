module CSS where
import Data.List
import System.Directory
import System.FilePath
import Config

writeCSS :: IO ()
writeCSS = do
  cssFiles <- getCSSFiles
  let c = length cssFiles
  mapM_ writeCSS' cssFiles

writeCSS' (path, content) = writeFile outPath content
  where
    outPath = replaceDirectory path htmlDirectory

getCSSFiles :: IO [(String, String)]
getCSSFiles = do
  dirContents <- getDirectoryContents cssDirectory
  let files = map (cssDirectory </>) . delete "." . delete ".." $ dirContents
  fileContent <- mapM readFile files
  return $ zip files fileContent
