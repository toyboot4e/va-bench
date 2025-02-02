module Main where

import Criterion.Main
import Data.Vector.Algorithms.Intro qualified as Intro
import Data.Vector.Unboxed qualified as VU
import Intro.Inline qualified as Inline
import Intro.StToPrim qualified as StToPrim
import System.Random

originalIntroSort :: VU.Vector Int -> VU.Vector Int
originalIntroSort = VU.modify Intro.sort

originalIntroSortBy :: VU.Vector Int -> VU.Vector Int
originalIntroSortBy = VU.modify (Intro.sortBy compare)

inlineIntroSort :: VU.Vector Int -> VU.Vector Int
inlineIntroSort = VU.modify Inline.sort

stToPrimIntroSort :: VU.Vector Int -> VU.Vector Int
stToPrimIntroSort = VU.modify StToPrim.sort

main :: IO ()
main = do
  let gen = mkStdGen 123456789
  defaultMain
    [ -- original functions
      bench "original intro sort" $ whnf originalIntroSort (genRandomVec gen),
      bench "original intro sortBy" $ whnf originalIntroSortBy (genRandomVec gen),
      -- `{-# INLINE #-}` variant of `sort`
      bench "INLINE intro sort" $ whnf inlineIntroSort (genRandomVec gen),
      -- `{-# INLINEABLE #-}` + `stToPrim` variant of `sort`
      bench "stToPrim intro sort" $ whnf stToPrimIntroSort (genRandomVec gen)
    ]
  where
    inputSize :: Int
    inputSize = 1000

    genRandomVec :: StdGen -> VU.Vector Int
    genRandomVec =
      VU.map fromIntegral
        . VU.unfoldrExactN
          inputSize
          (genWord64R 998244353)
