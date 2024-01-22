-- Two functions from the class exercises in Haskell
-- provide examples of functions in Haskell, as well
-- as demonstrate how to use the TestSuiteSupportModule
--
-- Author: Pam Cutter
--
-- Created April 14, 2010

module ClassExercises where

import TestSuiteSupportModule

-- Computes the sum of the squares of the numbers from 1 to n
sumsq :: Int -> Int
sumsq 0 = 0
sumsq n = n * n + sumsq (n-1)

-- Computes the number of factors for a number, this is just
-- a wrapper for numFactorsGen
numFactors :: Int -> Int
numFactors n = numFactorsGen n n
   where
	numFactorsGen :: Int -> Int -> Int
	numFactorsGen n 1 = 1
	numFactorsGen n d
	   | mod n d == 0 = 1 + numFactorsGen n (d-1)
	   | otherwise = numFactorsGen n (d-1)

-- A test suite containing multiple tests for sumsq
sumsqTestSuite = TestSuite "Test good sumsq examples"
    [ Test "no elements in sum" (sumsq 0 == 0),
      Test "1 element in sum" (sumsq 1 == 1),
      Test "multiple elements in sum" (sumsq 5 == 55)
   ]

-- A test suite containing multiple tests for numFactors
numFactorsTestSuite = TestSuite "Test good numFactors examples"
    [  Test "number of factors of 1" (numFactors 1 == 1),
      Test "number of factors of a prime" (numFactors 5 == 2),
      Test "number of factors of a composite" (numFactors 12 == 6)
    ]

