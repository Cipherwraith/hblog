module Types where

import qualified Data.Text.Lazy as T

data Publish = Publish {
                _post :: Post,
                _time :: Integer,
                _description :: T.Text,
                _content :: T.Text,
                _publishedURL :: String
              } deriving (Show)

instance Eq Publish where
  (Publish w1 x1 y1 z1 a1) == (Publish w2 x2 y2 z2 a2) =
    w1 == w2 && x1 == x2 && y1 == y2 && z1 == z2 && a1 == a2

instance Ord Publish where
  (Publish _ x1 _ _ _ ) `compare` (Publish _ x2 _ _ _) = x1 `compare` x2

data Post = Post {
              _title :: T.Text,
              _date :: Integer,
              _author :: T.Text,
              _contentRaw :: T.Text,
              _contentPretty :: T.Text 
            } deriving (Show)

-- Compare posts based on raw content
instance Eq Post where
  (Post _ _ _ s1 _ ) == (Post _ _ _ s2 _ ) = s1 == s2

-- Sort posts based on date
instance Ord Post where
  (Post _ s1 _ _ _ ) `compare` (Post _ s2 _ _ _ ) = s1 `compare` s2


blankPost = Post t 0 t t t
t :: T.Text
t = T.pack ""

