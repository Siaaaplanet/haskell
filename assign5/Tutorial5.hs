module Tutorial5 where

import Data.Char
import Data.List
import Test.QuickCheck


-- 1. Map
-- a.
doubles :: [Int] -> [Int]
doubles = undefined

-- b.        
penceToPounds :: [Int] -> [Float]
penceToPounds = undefined

-- c.
uppers :: String -> String
uppers = undefined

-- d.
uppersComp :: String -> String
uppersComp = undefined

prop_uppers :: String -> Bool
prop_uppers s = uppers s == uppersComp s


-- 2. Filter
-- a.
alphas :: String -> String
alphas = undefined

-- b.
above :: Int -> [Int] -> [Int]
above = undefined

-- c.
unequals :: [(Int,Int)] -> [(Int,Int)]
unequals = undefined

-- d.
rmChar :: Char -> String -> String
rmChar = undefined

-- e.
rmCharComp :: Char -> String -> String
rmCharComp = undefined

prop_rmChar :: Char -> String -> Bool
prop_rmChar c s = rmChar c s == rmCharComp c s


-- 3. Comprehensions vs. map & filter
-- a.
largeDoubles :: [Int] -> [Int]
largeDoubles xs = [2 * x | x <- xs, x > 3]

largeDoubles' :: [Int] -> [Int]
largeDoubles' = undefined

prop_largeDoubles :: [Int] -> Bool
prop_largeDoubles xs = largeDoubles xs == largeDoubles' xs 

-- b.
reverseEven :: [String] -> [String]
reverseEven strs = [reverse s | s <- strs, even (length s)]

reverseEven' :: [String] -> [String]
reverseEven' = undefined


-- 4. Foldr
-- a.
andRec :: [Bool] -> Bool
andRec = undefined

andFold :: [Bool] -> Bool
andFold = undefined

-- b.
concatRec :: [[a]] -> [a]
concatRec = undefined

concatFold :: [[a]] -> [a]
concatFold = undefined

-- c.
rmCharsRec :: String -> String -> String
rmCharsRec = undefined

rmCharsFold :: String -> String -> String
rmCharsFold = undefined


-- Matrix multiplication

type Matrix = [[Rational]]

-- 5
-- a.
uniform :: [Int] -> Bool
uniform = undefined

-- b.
valid :: Matrix -> Bool
valid = undefined


-- 6.
matrixWidth :: Matrix -> Int
matrixWidth m = undefined

matrixHeight :: Matrix -> Int
matrixHeight m = undefined

plusM :: Matrix -> Matrix -> Matrix
plusM = undefined

-- 7.
timesM :: Matrix -> Matrix -> Matrix
timesM = undefined

-- 8.
-- b.
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' f xs ys = undefined

-- c.
zipWith'' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith'' f xs ys = undefined

-- ** Optional material

-- 9.

-- Mapping functions
mapMatrix :: (a -> b) -> [[a]] -> [[b]]
mapMatrix f = undefined

zipMatrix :: (a -> b -> c) -> [[a]] -> [[b]] -> [[c]]
zipMatrix f = undefined

-- All ways of deleting a single element from a list
removes :: [a] -> [[a]]     
removes = undefined

-- Produce a matrix of minors from a given matrix
minors :: Matrix -> [[Matrix]]
minors m = undefined

-- A matrix where element a_ij = (-1)^(i + j)
signMatrix :: Int -> Int -> Matrix
signMatrix w h = undefined
        
determinant :: Matrix -> Rational
determinant = undefined

cofactors :: Matrix -> Matrix
cofactors m = undefined        
                
scaleMatrix :: Rational -> Matrix -> Matrix
scaleMatrix k = undefined

inverse :: Matrix -> Matrix
inverse m = undefined

-- Tests
identity :: Int -> Matrix
identity n = undefined

prop_inverse2 :: Rational -> Rational -> Rational 
                -> Rational -> Property
prop_inverse2 a b c d = undefined

type Triple a = (a,a,a)
        
prop_inverse3 :: Triple Rational -> 
                 Triple Rational -> 
                 Triple Rational ->
                 Property
prop_inverse3 r1 r2 r3 = undefined
