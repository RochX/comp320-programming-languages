-- This module solves the NQueens problem
-- Uses the BoardInterface

module NQueens where

import BoardInterface

-- nQueens N
--    Returns either empty list or N x N board with solution to N queens problem.
--    Empty list indicates that no solution exists.
nQueens :: Int -> Board
nQueens n = nQueensSolver 0 0 (mkBoard n)
  where
    nQueensSolver :: Int -> Int -> Board -> Board
    nQueensSolver row col board
      | row >= length board = board -- going too many rows means we found solution
      | col >= length board = [] -- going too many column means no solution exists
      | otherwise = let newBoard = setVal board row col 1
        in 
          if null (nQueensSolver (row+1) col newBoard) -- check if list empty
          then nQueensSolver (row+1) (col+1) newBoard -- if empty we need to try next solution
          else nQueensSolver (row+1) 0 newBoard -- if not empty then solution found