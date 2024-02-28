-- Interface for a group of functions that implement a Board data structure.
--
-- Template by Alyce Brady
-- Modified and completed Xavier Silva, Winter 2024

module BoardInterface where

import TestSuiteSupportModule
import Data.List (sort)

type Row = [Integer]
type Column = [Integer]
type Diagonal = [Integer]
type Board = [Row]

-- *******************************
-- *           INTERFACE 
-- *******************************

------------------------------------------------------
-- FUNCTIONS TO CREATE A BOARD
------------------------------------------------------

-- mkRow N
--   Creates an "empty" row of length N (actually a row of 0's).
mkRow :: Int -> Row

-- mkBoard N
--   Creates an "empty" N x N board (actually filled with 0's).
mkBoard :: Int -> Board

------------------------------------------------------
-- FUNCTIONS TO ACCESS ELEMENTS OF A BOARD
------------------------------------------------------

-- getRow board rowIndex
--   Returns the row at index rowIndex.
getRow :: Board -> Int -> Row

-- getCol board colIndex
--   Returns the column at index colIndex.
getCol :: Board -> Int -> Column

-- getCell board rowIndex colIndex
--   Returns the contents of the cell at location (rowIndex, colIndex)
--   on the board.
getCell :: Board -> Int -> Int -> Integer

-- getMajorDiagonal board rowIndex colIndex
--    Returns diagonal of shape \ that includes location (rowIndex, colIndex)
getMajorDiagonal :: Board -> Int -> Int -> Diagonal

-- getMinorDiagonal board rowIndex colIndex
--    Returns diagonal of shape / that includes location (rowIndex, colIndex)
getMinorDiagonal :: Board -> Int -> Int -> Diagonal

-- validIndex board index
--   Returns True if the index (a row or column index) is in range.
validIndex :: Board -> Int -> Bool

-- validLoc board rowIndex colIndex
--   Returns True if location (rowIndex, colIndex) is in range (on the board).
validLoc :: Board -> Int -> Int -> Bool

-- setVal board rowIndex colIndex newValue
--   Returns a new board equivalent to board EXCEPT
--   that the value at location (rowIndex, colIndex) is newValue.
setVal :: Board -> Int -> Int -> Integer -> Board

-- setValInRow row colIndex newValue
--  Returns a new row equivalent to row EXCEPT
--   that the value at location (colIndex) is newValue.
setValInRow :: Row -> Int -> Integer -> Row

------------------------------------------------------
-- USEFUL FUNCTION FOR TESTING PURPOSES
------------------------------------------------------

-- mkTestBoard N
--   Creates an N x N board whose 2-digit values encode their location:
--   the first digit is the row number (starting at 0) and the second is
--   the column number (starting at 0).  For example,
--     mkTestBoard 3
--   creates the following board:
--     [[00,01,02],[10,11,12],[20,21,22]]
mkTestBoard :: Integer -> Board
mkTestBoard n = [ [ x * 10 + y | y <- [0 .. n-1]] | x <- [0 .. n-1]]

-- ************************************
-- *           IMPLEMENTATION 
-- ************************************

------------------------------------------------------
-- FUNCTIONS TO CREATE A BOARD
------------------------------------------------------

-- mkRow N
--   Creates an "empty" row of length N (actually a row of 0's).
mkRow n = replicate n 0

-- mkBoard N
mkBoard n = replicate n (mkRow n)

------------------------------------------------------
-- FUNCTIONS TO ACCESS ELEMENTS OF A BOARD
------------------------------------------------------

-- getRow B r
getRow board row = board !! row

-- getCell B r c
getCell board row col
  | row >= length board = error "Row index too large"
  | col >= length board = error "Col index too large"
  | otherwise = board !! row !! col

-- getCol B c
getCol board colNum = [ getCell board rowNum colNum | rowNum <- [ 0 .. length board - 1]]

-- getMajorDiagonal B r c
getMajorDiagonal board row col = 
  let n = length board
      baseMajorDiagonal = map (\x -> (x,x)) [-n..n]
      offsetMajorDiagonal = map (\(x,y) -> (x+row, y+col)) baseMajorDiagonal
    in [ getCell board (fst cell) (snd cell) | cell <- filter (\(x,y) -> validIndex board x && validIndex board y) offsetMajorDiagonal ]

-- getMinorDiagonal B r c
getMinorDiagonal board row col = 
  let n = length board
      baseMinorDiagonal = map (\x -> (-x,x)) [-n..n]
      offsetMinorDiagonal = map (\(x,y) -> (x+row, y+col)) baseMinorDiagonal
    in [ getCell board (fst cell) (snd cell) | cell <- filter (\(x,y) -> validIndex board x && validIndex board y) offsetMinorDiagonal ]


------------------------------------------------------
-- FUNCTIONS TO VALIDATE LOCATIONS
------------------------------------------------------
validIndex board index
  | index < 0 = False
  | index >= length board = False
  | otherwise = True

validLoc board row col
  | row < 0 = False
  | col < 0 = False
  | row >= length board = False
  | col >= length (head board) = False
  | otherwise = True

------------------------------------------------------
-- BOARD SETTER FUNCTIONS
------------------------------------------------------
setValInRow row c val = take c row ++ val : (drop (c+1)) row

setVal board row col val
  | validLoc board row col = take row board ++ [setValInRow (board !! row) col val] ++ drop (row+1) board
  | not $ validIndex board row = error "Row out of range"
  | not $ validIndex board col = error "Col out of range"
  | otherwise = error "Index out of range"

------------------------------------------------------
-- TEST SUITE
------------------------------------------------------

-- sameElems A B
--    Returns true if A and B have the same elements without caring about order
sameElems :: (Ord a) => [a] -> [a] -> Bool
sameElems a b = sort a == sort b

-- creates board [[00,01,02, 03],[10,11,12, 13],[20,21,22, 23], [30, 31, 32, 33]]
testBoard = mkTestBoard 4
testRow = head testBoard
boardInterfaceTestSuite =
  TestSuite
  "Test the BoardInterface functions on a 4 by 4 board"
  [
    TestSuite "Functions to access elements of a board"
    [
      Test "Get First Row" (getRow testBoard 0 == [00, 01, 02, 03]),
      Test "Get First Column" (getCol testBoard 0 == [00, 10, 20, 30]),
      Test "Get cell in the middle of the board" (getCell testBoard 1 1 == 11),
      TestSuite "Major Diagonal"
      [
        Test "Get major diagonal" (getMajorDiagonal testBoard 0 0 `sameElems` [00, 11, 22, 33]),
        Test "Get an offset major diagonal" (getMajorDiagonal testBoard 1 0 `sameElems` [10, 21, 32]),
        Test "Get another offset major diagonal" (getMajorDiagonal testBoard 0 3 `sameElems` [03])
      ],
      TestSuite "Minor Diagonal"
      [
        Test "Get minor diagonal" (getMinorDiagonal testBoard 0 3 `sameElems` [03, 12, 21, 30]),
        Test "Get offset minor diagonal" (getMinorDiagonal testBoard 1 1 `sameElems` [02, 11, 20]),
        Test "Get another offset minor diagonal" (getMinorDiagonal testBoard 0 0 `sameElems` [00])
      ]
    ],
    TestSuite "Functions to check if index out of range"
    [
      Test "Check negative index on row/col" (validIndex testBoard (-1) == False),
      Test "Check zero index on row/col" (validIndex testBoard 0),
      Test "Check index greater than board size on row/col" (validIndex testBoard 5 == False),
      Test "Check negative index on location" (validLoc testBoard (-1) (-1) == False),
      Test "Check zero index on location" (validLoc testBoard 0 1),
      Test "Check index greater than board size on location" (validLoc testBoard 0 5 == False)
    ],
    TestSuite "Functions the set the board"
    [
      Test "Set first element of first row" (setValInRow testRow 0 (-1) == [-1, 01, 02, 03]),
      Test "Set second element of first row" (setValInRow testRow 1 (-1) == [00, -1, 02, 03]),
      Test "Set last element of first row" (setValInRow testRow 3 (-1) == [00, 01, 02, -1]),
      Test "Getting a row and setting it" (setValInRow (testBoard !! 1) 0 (-1) == [-1, 11, 12, 13]),
      Test "Setting in upper left corner" (setVal testBoard 0 0 (-1) == [[-1,01,02, 03],[10,11,12, 13],[20,21,22, 23], [30, 31, 32, 33]]),
      Test "Setting in first row of board" (setVal testBoard 0 1 (-1) == [[00,-1,02, 03],[10,11,12, 13],[20,21,22, 23], [30, 31, 32, 33]]),
      Test "Setting in second row of board" (setVal testBoard 1 1 (-1) == [[00,01,02, 03],[10,-1,12, 13],[20,21,22, 23], [30, 31, 32, 33]]),
      Test "Setting in bottom right corner" (setVal testBoard 3 3 (-1) == [[00,01,02, 03],[10,11,12, 13],[20,21,22, 23], [30, 31, 32, -1]])
      -- For now testing an invalid index throws an error, so running this test will error
      -- Test "Trying to set an invalid index" (setVal testBoard 4 0 (-1) == [])
    ]
  ]
