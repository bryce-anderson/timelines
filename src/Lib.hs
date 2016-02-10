module Lib
    ( timeLines
    ) where

import qualified Data.Text.Lazy as T
import qualified Data.Text.Lazy.IO as T

import Control.Applicative
import Data.Foldable (mapM_)

import Data.Time.Format
import Data.Time.LocalTime (getZonedTime)

format = "%a %T| "
local = defaultTimeLocale

printLine :: T.Text -> IO ()
printLine l = do
  ct <- getZonedTime
  let tstr = formatTime local format ct
  putStr tstr
  T.putStrLn l

timeLines :: IO ()
timeLines = T.getContents >>= mapM_ printLine . T.lines

