module Main where

import Criterion.Main
import Data.Proxy (Proxy (..))
import Data.Vector.Algorithms.AmericanFlag qualified as AmericanFlag
import Data.Vector.Algorithms.Heap qualified as Heap
import Data.Vector.Algorithms.Insertion qualified as Insertion
import Data.Vector.Algorithms.Intro qualified as Intro
import Data.Vector.Algorithms.Merge qualified as Merge
import Data.Vector.Algorithms.Radix qualified as Radix
import Data.Vector.Algorithms.Tim qualified as Tim
import Data.Vector.Unboxed qualified as VU
import System.Random

americanFlagSort :: VU.Vector Int -> VU.Vector Int
americanFlagSort = VU.modify AmericanFlag.sort

americanFlagSortBy :: VU.Vector Int -> VU.Vector Int
americanFlagSortBy = VU.modify (AmericanFlag.sortBy compare AmericanFlag.terminate (AmericanFlag.size (Proxy :: Proxy Int)) AmericanFlag.index)

heapSort :: VU.Vector Int -> VU.Vector Int
heapSort = VU.modify Heap.sort

heapSortBy :: VU.Vector Int -> VU.Vector Int
heapSortBy = VU.modify (Heap.sortBy compare)

insertionSort :: VU.Vector Int -> VU.Vector Int
insertionSort = VU.modify Insertion.sort

insertionSortBy :: VU.Vector Int -> VU.Vector Int
insertionSortBy = VU.modify (Insertion.sortBy compare)

introSort :: VU.Vector Int -> VU.Vector Int
introSort = VU.modify Intro.sort

introSortBy :: VU.Vector Int -> VU.Vector Int
introSortBy = VU.modify (Intro.sortBy compare)

mergeSort :: VU.Vector Int -> VU.Vector Int
mergeSort = VU.modify Merge.sort

mergeSortBy :: VU.Vector Int -> VU.Vector Int
mergeSortBy = VU.modify (Merge.sortBy compare)

radixSort :: VU.Vector Int -> VU.Vector Int
radixSort = VU.modify Radix.sort

radixSortBy :: VU.Vector Int -> VU.Vector Int
radixSortBy = VU.modify (Radix.sortBy (Radix.passes e) (Radix.size e) Radix.radix)
  where
    e :: Int
    e = undefined

timSort :: VU.Vector Int -> VU.Vector Int
timSort = VU.modify Tim.sort

timSortBy :: VU.Vector Int -> VU.Vector Int
timSortBy = VU.modify (Tim.sortBy compare)

main :: IO ()
main = do
  let gen = mkStdGen 123456789
  defaultMain
    [ bench "american: sort" $ whnf americanFlagSort (genRandomVec gen),
      bench "american: sortBy" $ whnf americanFlagSortBy (genRandomVec gen),
      bench "insertion: sort" $ whnf insertionSort (genRandomVec gen),
      bench "insertion: sortBy" $ whnf insertionSortBy (genRandomVec gen),
      bench "intro: sort" $ whnf introSort (genRandomVec gen),
      bench "intro: sortBy" $ whnf introSortBy (genRandomVec gen),
      bench "merge: sort" $ whnf mergeSort (genRandomVec gen),
      bench "merge: sortBy" $ whnf mergeSortBy (genRandomVec gen),
      bench "radix: sort" $ whnf radixSort (genRandomVec gen),
      bench "radix: sortBy" $ whnf radixSortBy (genRandomVec gen),
      bench "tim: sort" $ whnf timSort (genRandomVec gen),
      bench "tim: sortBy" $ whnf timSortBy (genRandomVec gen)
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
