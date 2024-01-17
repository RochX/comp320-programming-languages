(display "Running file `functions.scm`\n")
(define (contains aVal aList)
	(if (null? aList) #f ; base case
			(if (eq? aVal (car aList)) ; is 1st element it
					#t ; then true
					(contains aVal (cdr aList))) ; else check rest of list recursively
			))

(display (contains 2 '(1 2 3)))
(newline)
(display (contains 4 '(1 2 3)))
(newline)
(display (if (contains 2 '(1 2 3)) "yes" "no"))
(newline)
(display (if (contains 4 '(1 2 3)) "yes" "no"))