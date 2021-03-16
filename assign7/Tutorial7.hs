module Tutorial7 where

import LSystem
import Test.QuickCheck
-- import Text.PrettyPrint.GenericPretty -- ** Uncomment for Generic Pretty Challenge

pathExample = Go 30 :#: Turn 120 :#: Go 30 :#: Turn 120 :#: Go 30

-- 1a. split
split :: Command -> [Command]
split = undefined

-- 1b. join
join :: [Command] -> Command
join = undefined

-- 1c. equivalent
-- equivalent :: ???
equivalent = undefined

-- 1d. testing join and split
prop_split_join :: Command -> Bool
prop_split_join = undefined

prop_split :: Command -> Bool
prop_split = undefined

-- 2a. copy
copy :: Int -> Command -> Command
copy = undefined

-- 2b. pentagon
pentagon :: Distance -> Command
pentagon = undefined

-- 2c. polygon
polygon :: Distance -> Int -> Command
polygon = undefined


-- 3. spiral
spiral :: Distance -> Int -> Distance -> Angle -> Command
spiral = undefined


-- 4. optimise
-- Remember that Go does not take negative arguments.

optimise :: Command -> Command
optimise = undefined


-- ** Optional Material

-- L-Systems

-- 5. arrowhead
arrowhead :: Int -> Command
arrowhead = undefined

-- 6. snowflake
snowflake :: Int -> Command
snowflake = undefined

-- 7. hilbert
hilbert :: Int -> Command
hilbert = undefined


-- ** Challenge

-- Bonus L-Systems

peanoGosper :: Int -> Command
peanoGosper = undefined

cross :: Int -> Command
cross = undefined

branch :: Int -> Command
branch = undefined

thirtytwo :: Int -> Command
thirtytwo = undefined
