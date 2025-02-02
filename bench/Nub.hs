module Main where

import Criterion.Main
import Data.Vector.Algorithms qualified as Algo
import Data.Vector.Unboxed qualified as VU
import Nub.Inline qualified as Inline
import Nub.Inlineable qualified as Inlineable
import System.Random

originalNub :: VU.Vector Int -> VU.Vector Int
originalNub = Algo.nub

originalNubBy :: VU.Vector Int -> VU.Vector Int
originalNubBy = Algo.nubBy compare

inlineNub :: VU.Vector Int -> VU.Vector Int
inlineNub = Inline.nub

inlineNubBy :: VU.Vector Int -> VU.Vector Int
inlineNubBy = Inline.nubBy compare

inlineableNub :: VU.Vector Int -> VU.Vector Int
inlineableNub = Inlineable.nub

inlineableNubBy :: VU.Vector Int -> VU.Vector Int
inlineableNubBy = Inlineable.nubBy compare

main :: IO ()
main = do
  let gen = mkStdGen 123456789
  defaultMain
    [ bench "original nub" $ whnf originalNub (genRandomVec gen),
      bench "original wnubBy" $ whnf originalNubBy (genRandomVec gen),
      bench "INLINE nub" $ whnf inlineNub (genRandomVec gen),
      bench "INLINE nubBy" $ whnf inlineNubBy (genRandomVec gen),
      bench "INLINEABLE nub" $ whnf inlineNub (genRandomVec gen),
      bench "INLINEABLE nubBy" $ whnf inlineNubBy (genRandomVec gen)
    ]
  where
    inputSize :: Int
    inputSize = 1000

    genRandomVec :: StdGen -> VU.Vector Int
    genRandomVec =
      VU.map fromIntegral
        . VU.unfoldrExactN
          inputSize
          (genWord64R 100)

