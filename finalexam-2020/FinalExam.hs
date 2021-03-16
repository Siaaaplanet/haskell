module FinalExam where

import Test.QuickCheck
import Control.Monad
import Data.Char

-- Question 1

-- 1a

f :: [String] -> String
f = undefined

-- 1b

g :: [String] -> String
g = undefined

-- 1c

h :: [String] -> String
h = undefined

-- Question 2

-- 2a

i :: [a] -> [a] -> [a]
i = undefined

-- 2b

j :: [[a]] -> [[a]]
j = undefined

-- 2c

k :: [[a]] -> [[a]]
k = undefined

-- Question 3

data Wff = X
         | Y
         | Tr
         | Fa
         | Not Wff
         | Wff :&: Wff
         | Wff :|: Wff
         | Wff :->: Wff
  deriving (Eq, Show)

instance Arbitrary Wff where
  arbitrary = sized gen
    where
    gen 0 =
      oneof [ return X,
              return Y,
              return Tr,
              return Fa ]
    gen n | n>0 =
      oneof [ return X,
              return Y,
              return Tr,
              return Fa,
              liftM Not wff,
              liftM2 (:&:) wff wff,
              liftM2 (:|:) wff wff,
              liftM2 (:->:) wff wff]
      where
      wff = gen (n `div` 2)

-- 3a

eval :: Bool -> Bool -> Wff -> Bool
eval = undefined

-- 3b

simple :: Wff -> Bool
simple = undefined

-- 3c

simplify :: Wff -> Wff
simplify = undefined
