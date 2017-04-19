module RBPCP.Internal.Util
( cs
, (<>)
, hexEncode, hexDecode
, fmapL
)
where

import           Data.String.Conversions (cs)
import           Data.Monoid ((<>))

import qualified Data.ByteString as BS
import qualified Data.Serialize as Bin
import qualified Data.ByteString.Base16 as B16


hexEncode :: Bin.Serialize a => a -> BS.ByteString
hexEncode = B16.encode . Bin.encode

hexDecode :: Bin.Serialize a => BS.ByteString -> Either String a
hexDecode = Bin.decode . fst . B16.decode

fmapL :: (a -> b) -> Either a c -> Either b c
fmapL f (Left a) = Left $ f a
fmapL _ (Right a) = Right a
