-- Remember: there are many possible solutions, and if your solution produces
-- the right results, then it is (most likely) correct. However, if your code
-- looks far more complicated than these sample solutions, then you're probably
-- making things too difficult for yourself---try to keep it simple!
module Tutorial1Sol where

import PicturesSVG -- needed for the optional chess part
import Test.QuickCheck

-- Exercise 2:

double :: Int -> Int
double x = x + x

square :: Int -> Int
square x = x * x

-- Exercise 3:

isTriple :: Int -> Int -> Int -> Bool
isTriple a b c = square a + square b == square c

-- Exercise 4:

leg1 :: Int -> Int -> Int
leg1 x y = square x - square y

leg2 :: Int -> Int -> Int
leg2 x y = 2 * x * y

hyp :: Int -> Int -> Int
hyp x y = square x + square y

-- Exercise 5:

prop_triple :: Int -> Int -> Bool
prop_triple x y = isTriple (leg1 x y) (leg2 x y) (hyp x y)

-- Exercise 7:

pic1 :: Picture
pic1 = p `beside` invert p
  where p = knight `above` invert knight

pic2 :: Picture
pic2 = p `above` flipV p
  where p = knight `beside` invert knight

-- Functions --

twoBeside :: Picture -> Picture
twoBeside x = beside x (invert x)

-- Exercise 8:

twoAbove :: Picture -> Picture
twoAbove x = above x (invert x)

fourPictures :: Picture -> Picture
fourPictures x = twoAbove (twoBeside x)

-- Exercise 9:
-- a)

emptyRow :: Picture
emptyRow = repeatH 4 (whiteSquare `beside` blackSquare)

-- b)

otherEmptyRow :: Picture
otherEmptyRow = flipV emptyRow

-- c)

middleBoard :: Picture
middleBoard = repeatV 2 (emptyRow `above` otherEmptyRow)

-- d)

pieces :: Picture
pieces = rook 
         `beside` knight 
         `beside` bishop 
         `beside` queen 
         `beside` king 
         `beside` bishop 
         `beside` knight 
         `beside` rook

whiteRow :: Picture
whiteRow = pieces `over` otherEmptyRow

blackRow :: Picture
blackRow = invert pieces `over` emptyRow

-- e)

pawns :: Picture
pawns = repeatH 8 pawn

populatedBoard :: Picture
populatedBoard = blackPieces `above` middleBoard `above` whitePieces
  where blackPawns  = invert pawns `over` otherEmptyRow
        whitePawns  = pawns `over` emptyRow
        blackPieces = blackRow `above` blackPawns
        whitePieces = whitePawns `above` whiteRow

