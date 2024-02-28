-- This module solves the NQueens problem
-- Uses the BoardInterface

module NQueens where

import BoardInterface
import TestSuiteSupportModule

-- nQueens N
--    Returns either empty list or N x N board with solution to N queens problem.
--    Empty list indicates that no solution exists.
nQueens :: Int -> Board

-- cellIsAttacked board row col
--    Returns true if the cell at location (row, col) is attacked by a queen on the board
cellIsAttacked :: Board -> Int -> Int -> Bool
cellIsAttacked board row col =
  let attackingCells = getRow board row ++ getCol board col ++ getMajorDiagonal board row col ++ getMinorDiagonal board row col
    in (sum . map abs) attackingCells > 0


nQueens n = nQueensSolver 0 0 (mkBoard n)
  where
    nQueensSolver :: Int -> Int -> Board -> Board
    nQueensSolver row col board
      | row >= length board = board -- going too many rows means we found solution
      | col >= length board = [] -- going too many column means no solution exists
      -- TODO add condition something like `not $ validBoard board = []` to tell us whether a board is bad
      | otherwise = let newBoard = setVal board row col 1
        in 
          if null (nQueensSolver (row+1) col newBoard) -- check if list empty
          then nQueensSolver (row+1) (col+1) newBoard -- if empty we need to try next solution
          else nQueensSolver (row+1) 0 newBoard -- if not empty then solution found

oneQueenOnBoard = setVal (mkBoard 4) 1 1 1
nQueensTestSuite =
  TestSuite
  "Test NQueens"
  [
    TestSuite "Test cellIsAttacked function"
    [
      Test "Cell queen is in" (cellIsAttacked oneQueenOnBoard 1 1),
      Test "Same row" (cellIsAttacked oneQueenOnBoard 1 0),
      Test "Same column" (cellIsAttacked oneQueenOnBoard 0 1),
      Test "Same major diagonal" (cellIsAttacked oneQueenOnBoard 0 0),
      Test "Same minor diagonal" (cellIsAttacked oneQueenOnBoard 0 2),
      Test "Cell not attacked" (not $ cellIsAttacked oneQueenOnBoard 2 3)
    ]
  ]