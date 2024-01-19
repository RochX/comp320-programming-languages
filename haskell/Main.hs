findMax :: [Int] -> Int
findMax [] = 0
findMax [anInt] = anInt
findMax (anInt : restOfList) = if (anInt > findMax restOfList) then anInt else findMax restOfList

main :: IO()
main = print (findMax [1, 2, 3, 0, 26, 1, 3])