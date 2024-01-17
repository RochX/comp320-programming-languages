(display "Running file `scheme-exericses.scm`\n")
; Exercise 1: Write a function that takes two parameters, an atom and a list, and returns true if the atom is an element in the list and false otherwise.
(define (contains atom lst) 
	(if (null? lst) #f ; base case
	(if (eq? atom (car lst)) ; is 1st element it
			#t ; then true
			(contains atom (cdr lst))) ; else check rest of list recursively
	))
(display "Exercise 1:\n")
(display "(contains 1 '(1 2)) = ")
(display (contains 1 '(1 2)))
(newline)
(display "(contains 3 '(1 2)) = ")
(display (contains 3 '(1 2)))
(newline)

; Exercise 2: Write a function that takes two parameters, a list and an atom, and returns a list identical to the first parameter except with all instances of the given atom deleted.
(display "Exercise 2:\n")
(define (removeAll lst atom)
	(removeAllHelper '() lst atom)
	)

(define (removeAllHelper acc lst atom)
	(if (null? lst)
		; list is empty
		acc
		; list is not empty
		(if (eq? atom (car lst))
				; true first element is atom
				(removeAllHelper acc (cdr lst) atom)
				; false first element is not atom
				(removeAllHelper (append acc (list (car lst))) (cdr lst) atom)
		)))

(display "(removeAll '() 1) = ")
(display (removeAll '() 1)) ; should give '()
(newline)
(display "(removeAll '(1) 1) = ")
(display (removeAll '(1) 1)) ; should give '()
(newline)
(display "(removeAll '(2) 1) = ")
(display (removeAll '(2) 1)) ; should give '(2)
(newline)
(display "(removeAll '(2 3) 1) = ")
(display (removeAll '(2 3) 1)) ; should give '(2 3)
(newline)
(display "(removeAll '(1 2 1 3 1) 1) = ")
(display (removeAll '(1 2 1 3 1) 1)) ; should give '(2 3)
(newline)

; Exercise 3: Write a function similar to the previous one, except that it deletes instances of a list (the second parameter) from a list of lists (the first parameter). For example, (deleteList '((1 2) (1 3) (1 2)) '(1 2)) would return '((1 3)).
(display "Exercise 3:\n")
(define (deleteList lst toDel)
	(removeAllHelper '() lst toDel)
	)
(display "(deleteList '((1 2) (1 3) (1 2)) '(1 2)) = ")
(display (deleteList '((1 2) (1 3) (1 2)) '(1 2))) ; should return '((1 3))
(newline)

; Exercise 4: Write a function that takes two parameters, each of which is a list of atoms, and returns a list similar to the first parameter except that all atoms in the first list that are elements in the second list have been removed from the first list. For example,        (removeAllFromList '(1 2 1 3 4 2) '(1 2)) would return '(3 4). 
(display "Exercise 4:\n")
(define (removeAllFromList lst toDel)
	(removeAllFromListHelper '() lst toDel)
	)

(define (removeAllFromListHelper acc lst toDel)
	(if (null? lst)
		; list is empty
		acc
		; list is not empty
		(if (contains (car lst) toDel)
				; true first element is contained within the list
				(removeAllFromListHelper acc (cdr lst) toDel)
				; false first element is not atom
				(removeAllFromListHelper (append acc (list (car lst))) (cdr lst) toDel)
		)))

(display "(removeAllFromList '(1 2 1 3 4 2) '(1 2)) = ")
(display (removeAllFromList '(1 2 1 3 4 2) '(1 2))) ; should return '(3 4)
(newline)

; Exercise 5: Write a function that takes a list as a parameter and returns a list identical to the parameter except the last element has been deleted.
(display "Exercise 5:\n")
(define (deleteLast lst)
	(if (null? lst)
		; list empty
		lst
		; list not empty
		(if (null? (cdr lst))
			; one element list
			(cdr lst)
			; more than one element list
			(append (list (car lst)) (deleteLast (cdr lst)))
			)
		)
	)

(display "(deleteLast '(1 2 3)) = ")
(display (deleteLast '(1 2 3)))
(newline)
(display "(deleteLast '(1 2 3 4 5)) = ")
(display (deleteLast '(1 2 3 4 5)))
(newline)

; Exercise 6: Write a function that returns the reverse of its simple list parameter.
(display "Exercise 6:\n")
(define (reverse-lst lst)
	(if (null? lst)
		'()
		(append (reverse-lst (cdr lst)) (list (car lst)))
	))

(display "(reverse-lst '(1 2 3 4)) = ")
(display (reverse-lst '(1 2 3 4))) ; should return '(4 3 2 1)
(newline)

; Exercise 7: Write a function that takes a list of numbers as a parameter and returns a list with the largest and smallest numbers in the input list.