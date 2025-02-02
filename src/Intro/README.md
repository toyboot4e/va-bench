# Intro

## Original

```hs
sort :: (PrimMonad m, MVector v e, Ord e) => v (PrimState m) e -> m ()
sort = sortBy compare
{-# INLINEABLE sort #-}
```

## Inline module

```hs
sort :: (PrimMonad m, MVector v e, Ord e) => v (PrimState m) e -> m ()
sort = sortBy compare
{-# INLINE sort #-}
```

## StToPrim module

```hs
sort :: (PrimMonad m, MVector v e, Ord e) => v (PrimState m) e -> m ()
sort = stToPrim . sortBy compare
{-# INLINEABLE sort #-}
```

