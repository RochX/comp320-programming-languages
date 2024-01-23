module TestSuiteExample where
import TestSuiteSupportModule

bigger :: Int -> Int -> Int
bigger a b
  | a > b = a
  | otherwise = b

-- run `biggerTestSuite` to use this
biggerTestSuite = 
  TestSuite "Test bigger function"
  [
    Test "a > b" (bigger 4 3 == 4),
    Test "a < b" (bigger 2 3 == 3),
    Test "a == b" (bigger 3 3 == 3),
    Test "Placeholder" True
  ]