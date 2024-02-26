-- Interface for a group of functions that implement a Board data structure.
--
-- Template by Alyce Brady
-- Modified and completed Xavier Silva, Winter 2024

module Board where

import TestSuiteSupportModule

type Row = [Integer]
type Column = [Integer]
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

-- validIndex board index
--   Returns True if the index (a row or column index) is in range.
-- validIndex :: Board -> Int -> Bool

-- validLoc board rowIndex colIndex
--   Returns True if location (rowIndex, colIndex) is in range (on the board).
-- validLoc :: Board -> Int -> Int -> Bool

-- setVal board rowIndex colIndex newValue
--   Returns a new board equivalent to board EXCEPT
--   that the value at location (rowIndex, colIndex) is newValue.
-- setVal :: Board -> Int -> Int ->Integer -> Board
  -- USES
     -- setValInRow R colIndex newValue
     --   Returns a new row equivalent to R EXCEPT
     --   that the value in column colIndex is newValue.
     -- setValInRow :: Row -> Int ->Integer -> Row

------------------------------------------------------
-- USEFUL FUNCTION FOR TESTING PURPOSES
------------------------------------------------------

-- mkTestBoard N
--   Creates an N x N board whose 2-digit values encode their location:
--   the first digit is the row number (starting at 1) and the second is
--   the column number (starting at 1).  For example,
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
getCell board row col = board !! row !! col

-- getCol B c
getCol board colNum = [ getCell board rowNum colNum | rowNum <- [ 0 .. length board - 1]]


testBoard = mkTestBoard 4
boardInterfaceTestSuite = 
  TestSuite 
  "Test the BoardInterface functions on a 4 by 4 board"
  [
    TestSuite "Functions to access elements of a board"
    [
      Test "Get First Row" (getRow testBoard 0 == [00, 01, 02, 03]),
      Test "Get First Column" (getCol testBoard 0 == [00, 10, 20, 30]),
      Test "Get cell in the middle of the board" (getCell testBoard 1 1 == 11)
    ]
  ]
