-- | Verification of elementaru functionality.
--
-- Opcodes are taken from the csound library.
-- Parameters are entered as you like for each opcode
-- in order to feel each of them and think about how
-- best to randomly combine.
module Song.Simple where

import Csound.Base
import Data.Vector

-- | Sine wave
--
-- For a smooth transition from zero to one.
--
-- Sounds steady, stable, calm.
osc_1 :: Sig
osc_1 = osc 100

-- | Sawtooth wave.
--
-- Linear rise to one and vertical descent to zero.
--
-- Sounds reggred, nervous.
saw_1 :: Sig
saw_1 = saw 100

-- | Triangle wave.
--
-- Linear increment and decrement.
--
-- sounds tense.
tri_1 :: Sig
tri_1 = tri 100

-- | Square wave
--
-- Amplitude change abruptly
--
-- sounds divided, paradoxical.
sqr_1 :: Sig
sqr_1 = sqr 100

-- | A vector with elements for a combination of signals similar
-- to normal forms.
type VSig = Vector Sig

-- | Operations for constructing similarites of normal form
data NFSigF = PolySigF
  { multPS :: Sig -> Sig -> Sig,
    sumPS :: Sig -> Sig -> Sig,
    neitralPS :: Sig
  }

-- | Calculus a normal form for signals.
--
-- Since addition and multiplication can be interchanged,
-- the normal form depends on the specified parameters.
--
-- For iterating combinations. Taking into account the fact that is still
-- possible to make generators from single parameters functions to double
-- ones, the potential for synthesizing sounds to strive for a extrimely large
-- number.
calculusNF :: NFSigF -> VSig -> Sig -> Sig
calculusNF nfs vs s = foldr (sumPS nfs) (neitral nfs) $ fmap (\x -> (sumPS nfs) s x) vs
