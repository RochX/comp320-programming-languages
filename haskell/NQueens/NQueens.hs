-- This module solves the NQueens problem
-- Uses the BoardInterface

-- Authored by Xavier Silva, Feburary 2024

module NQueens where

import BoardInterface
import TestSuiteSupportModule

-- cellIsAttacked board row col
--    Returns true if the cell at location (row, col) is attacked by another queen on the board
cellIsAttacked :: Board -> Int -> Int -> Bool

-- validBoard board
--    Returns true if board has no queens attacking each other.
--    Any non-zero value on the board is considered to be a queen.
validBoard :: Board -> Bool

-- generateNextValidBoards r Boards
--    Precondition: r is nonnegative and r < length Board
--                  All boards in Boards are the same size
--    Returns a list of all valid boards that can be made by adding a queen in row r
generateNextValidBoards :: Int -> [Board] -> [Board]

-- nQueens N
--    Returns either empty list or a list of N x N board(s) with solutions to N queens problem.
--    Empty list indicates that no solution exists.
nQueens :: Int -> [Board]

-- ************************************
-- *           IMPLEMENTATION 
-- ************************************

cellIsAttacked board row col =
  let attackingCells = getRow board row ++ getCol board col ++ getMajorDiagonal board row col ++ getMinorDiagonal board row col
      sumOffset = getCell board row col * 4 -- we use this offset in order to not count the cell at location (row, col)
    in (sum . map abs) attackingCells - sumOffset > 0


validBoard board = validBoardHelper board 0 0
  where
    validBoardHelper :: Board -> Int -> Int -> Bool
    validBoardHelper board row col
      -- move on to next row if col index too large
      | not (validIndex board col) = validBoardHelper board (row+1) 0
      -- row too large means we're done; use True because we AND with Bools in previous calls
      | not (validIndex board row) = True
      -- no queen in cell: don't need to check
      | getCell board row col == 0 = validBoardHelper board row (col+1)
      -- queen in cell: check if it's not attacked and if its not attacked move on
      | getCell board row col /= 0 = not (cellIsAttacked board row col) && validBoardHelper board row (col+1)


generateNextValidBoards row prevBoards =
  filter validBoard (generateNextBoards row prevBoards)
  where
    n = length $ head prevBoards
    -- this function places a queen in every possible position in the row given by argument row
    generateNextBoards :: Int -> [Board] -> [Board]
    generateNextBoards row prevBoards = concatMap (\board -> map (\col -> setVal board row col 1) [0..n-1]) prevBoards


nQueens n = nQueensSolver 0 [mkBoard n]
  where
    nQueensSolver :: Int -> [Board] -> [Board]
    nQueensSolver row prevBoards
      | null prevBoards = []
      | row >= length (head prevBoards) = prevBoards
      | otherwise = nQueensSolver (row+1) (generateNextValidBoards row prevBoards)

------------------------------------------------------
-- TEST SUITE
------------------------------------------------------

oneQueenMiddleOfBoard = setVal (mkBoard 4) 1 1 1
oneQueenTopLeftOfBoard = setVal (mkBoard 4) 0 0 1
exampleInvalidBoard = setVal oneQueenTopLeftOfBoard 1 1 1
exampleValidBoard = setVal oneQueenTopLeftOfBoard 1 2 1
nQueensTestSuite =
  TestSuite
  "Test NQueens"
  [
    TestSuite "Test cellIsAttacked function"
    [
      Test "Cell queen is in" (not $ cellIsAttacked oneQueenMiddleOfBoard 1 1),
      Test "Same row" (cellIsAttacked oneQueenMiddleOfBoard 1 0),
      Test "Same column" (cellIsAttacked oneQueenMiddleOfBoard 0 1),
      Test "Same major diagonal" (cellIsAttacked oneQueenMiddleOfBoard 0 0),
      Test "Same minor diagonal" (cellIsAttacked oneQueenMiddleOfBoard 0 2),
      Test "Cell not attacked" (not $ cellIsAttacked oneQueenMiddleOfBoard 2 3)
    ],
    TestSuite "Test validBoard function"
    [
      Test "Empty board" (validBoard $ mkBoard 4),
      Test "One queen on board" (validBoard oneQueenTopLeftOfBoard),
      Test "Two queens attacking each other" (not $ validBoard exampleInvalidBoard),
      Test "Two queens not attacking each other" (validBoard exampleValidBoard)
    ],
    TestSuite "Test generateNextValidBoards function"
    [
      Test "Generating first row from empty board" (generateNextValidBoards 0 [mkBoard 4] == [[[1,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]],[[0,1,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]],[[0,0,1,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]],[[0,0,0,1],[0,0,0,0],[0,0,0,0],[0,0,0,0]]]),
      Test "Generating valid boards with top left corner and second row" (generateNextValidBoards 1 [oneQueenTopLeftOfBoard] == [[[1,0,0,0],[0,0,1,0],[0,0,0,0],[0,0,0,0]],[[1,0,0,0],[0,0,0,1],[0,0,0,0],[0,0,0,0]]])
    ],
    TestSuite "Test nQueens function"
    [
      Test "nQueens 1" (head (nQueens 1) == [[1]]),
      Test "nQueens 2" (null (nQueens 2)),
      Test "nQueens 3" (null (nQueens 3)),
      Test "nQueens 4" (head (nQueens 4) == [[0,1,0,0],[0,0,0,1],[1,0,0,0],[0,0,1,0]]),
      Test "nQueens 5" (head (nQueens 5) == [[1,0,0,0,0],[0,0,1,0,0],[0,0,0,0,1],[0,1,0,0,0],[0,0,0,1,0]])
    ]
  ]
