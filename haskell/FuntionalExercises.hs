module FunctionalExercises where
import TestSuiteSupportModule


-- Exercise 1: `contains` function f(x, y) == True if x in list y
contains :: Int -> [Int] -> Bool
contains _ [] = False
contains x lst
  | x == head lst = True
  | otherwise = contains x (tail lst)

containsTestSuite =
  TestSuite "Test contains function"
  [
    Test "contains 1 []" (contains 1 [] == False),
    Test "contains 1 [1]" (contains 1 [1] == True),
    Test "contains 2 [1]" (contains 2 [1] == False),
    Test "contains 2 [1, 2, 3, 2]" (contains 2 [1, 2, 3, 2] == True)
  ]

-- Exercise 2: `removeAll` function f(l, x) returns list with all instances of x removed
removeAll :: [Int] -> Int -> [Int]
removeAll [] _ = []
removeAll lst x
  | (head lst) == x = removeAll (tail lst) x
  | (head lst) /= x = (head lst) : removeAll (tail lst) x

removeAllTestSuite =
  TestSuite "Test removeAll function"
  [
    Test "removeAll [] 1" (removeAll [] 1 == []),
    Test "removeAll [1] 1" (removeAll [1] 1 == []),
    Test "removeAll [2] 1" (removeAll [2] 1 == [2]),
    Test "removeAll [2, 1, 3, 1] 1" (removeAll [2, 1, 3, 1] 1 == [2, 3])
  ]

-- Exercise 3: `deleteList` function f(l1, l2) returns list with all instances of l2
deleteList :: [[Int]] -> [Int] -> [[Int]]
deleteList [] _ = []
deleteList lst x
  | (head lst) == x = deleteList (tail lst) x
  | (head lst) /= x = (head lst) : deleteList (tail lst) x

deleteListTestSuite =
  TestSuite "Test deleteList function"
  [
    Test "deleteList [[1,2],[1,3],[1,2]] [1,2]" (deleteList[[1,2],[1,3],[1,2]] [1,2] == [[1,3]])
  ]

-- Exercise 4: `removeAllFromList` function f(l1, l2) returns list with all elements of l2 removed
removeAllFromList :: [Int] -> [Int] -> [Int]
removeAllFromList [] _ = []
removeAllFromList lst x
  | (head lst) `contains` x = removeAllFromList (tail lst) x
  | otherwise = (head lst) : removeAllFromList (tail lst) x

removeAllFromListTestSuite =
  TestSuite "Test removeAllFromList"
  [
    Test "removeAllFromList [] []" (removeAllFromList [] [] == []),
    Test "removeAllFromList [1,2] [1,2]" (removeAllFromList [1,2] [1,2] == []),
    Test "removeAllFromList [1,2] [1,2,3]" (removeAllFromList [1,2] [1,2,3] == []),
    Test "removeAllFromList [1,4,2,3,2,1,4] [1,2]" (removeAllFromList [1,4,2,3,2,1,4] [1,2] == [4,3,4])
  ]

-- Exercise 5: `deleteLast` function f(l) returns list with last element of l removed
deleteLast :: [Int] -> [Int]
deleteLast [] = []
deleteLast [x] = []
deleteLast lst = head lst : deleteLast (tail lst)

deleteLastTestSuite =
  TestSuite "Test deleteLast"
  [
    Test "deleteLast []" (deleteLast [] == []),
    Test "deleteLast [1]" (deleteLast [1] == []),
    Test "deleteLast [1, 2]" (deleteLast [1, 2] == [1]),
    Test "deleteLast [1, 2, 1]" (deleteLast [1, 2, 1] == [1, 2])
  ]

-- Exercise 6: reverse list
reverseList :: [Int] -> [Int]
reverseList [] = []
reverseList lst = reverseList (tail lst) ++ [head lst]

reverseListTestSuite =
  TestSuite "Test reverseList function"
  [
    Test "reverseList []" (reverseList [] == []),
    Test "reverseList [1]" (reverseList [1] == [1]),
    Test "reverseList [1, 2]" (reverseList [1, 2] == [2, 1]),
    Test "reverseList [1,2,3,4,5]" (reverseList [1,2,3,4,5] == [5,4,3,2,1])
  ]

-- Exercise 7: list min and max
lstMin :: [Int] -> Int
lstMin [x] = x
lstMin [x, y]
  | x <= y = x
  | x > y = y
lstMin lst
  | lst !! 0 > lst !! 1 = lstMin (tail lst)
  | lst !! 0 <= lst !! 1 = lstMin (lst !! 0 : tail (tail lst))

lstMax :: [Int] -> Int
lstMax [x] = x
lstMax [x, y]
  | x > y = x
  | x <= y = y
lstMax lst
  | lst !! 0 <= lst !! 1 = lstMax (tail lst) -- remove first element
  | lst !! 0 > lst !! 1 = lstMax (lst !! 0 : tail (tail lst)) -- remove second element

lstMinMax :: [Int] -> (Int, Int)
lstMinMax lst = (lstMin lst, lstMax lst)

lstMinMaxTestSuite =
  TestSuite "Test lstMinMax function"
  [
    Test "lstMinMax [1]" (lstMinMax [1] == (1,1)),
    Test "lstMinMax [1,2,3]" (lstMinMax [1,2,3] == (1,3)),
    Test "lstMinMax [1,2,3,0,4]" (lstMinMax [1,2,3,0,4] == (0,4))
  ]
