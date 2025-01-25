module Main where

import Criterion.Main
import Data.Vector.Algorithms.Intro qualified as VAI
import Data.Vector.Unboxed qualified as VU
import System.Random

{-# INLINE sortI #-}
sortI :: VU.Vector Int -> VU.Vector Int
sortI = VU.modify VAI.sort

{-# INLINE sortIBy #-}
sortIBy :: VU.Vector Int -> VU.Vector Int
sortIBy = VU.modify (VAI.sortBy compare)

main :: IO ()
main = do
  let gen = mkStdGen 123456789
  defaultMain
    [ bench "intro: sort" $ whnf sortI (genRandomVec gen),
      bench "intro: sortBy" $ whnf sortIBy (genRandomVec gen)
    ]
  where
    -- 10^6
    inputSize :: Int
    inputSize = 1_000_000

    genRandomVec :: StdGen -> VU.Vector Int
    genRandomVec =
      VU.map fromIntegral
        . VU.unfoldrExactN
          inputSize
          (genWord64R 998244353)
