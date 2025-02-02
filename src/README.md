# Source

These source files are mostly copy of [erikd/vector-algorithms](https://github.com/erikd/vector-algorithms) and not by me.

The only differences are pragmas.

## Original (as of today)

```hs
-- | Sorts an entire array using the default ordering.
sort :: (PrimMonad m, MVector v e, Ord e) => v (PrimState m) e -> m ()
sort = sortBy compare
{-# INLINEABLE sort #-}
```

## `Intro.Inline`

```hs
-- | Sorts an entire array using the default ordering.
sort :: (PrimMonad m, MVector v e, Ord e) => v (PrimState m) e -> m ()
sort = sortBy compare
{-# INLINE sort #-}
```

## `Intro.StToPrim`

```hs
-- | Sorts an entire array using the default ordering.
sort :: (PrimMonad m, MVector v e, Ord e) => v (PrimState m) e -> m ()
sort = stToPrm . sortBy compare
{-# INLINEABLE sort #-}
```


