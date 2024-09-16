; Question 3.1
;;; Test
(define a (+ 1 2))
; expects a 
a
; expects 3
(define b (- (+ (* 3 3) 2) 1))
; expects b
(= (modulo b a) (quotient 5 3))
; expects #t

; Question 4.1
;;; Test
(if (or #t (/ 1 0)) 1 (/ 1 0))
; expects 1
((if (< 4 3) + -) 4 100)
; expects -96

; Question 4.2
(define (factorial x) 
  (if (= x 1) 
        1 
        (* x (factorial (- x 1)))
    )
)

; Question 4.3
(define (fib n)
  (cond
    ((= n 0) 0)
    ((= n 1) 1)
    (else (+ (fib (- n 1)) (fib (- n 2))))
    )
)

; Question 5.1
(define (my-append a b)
   (if (eq? a nil) 
       b
       (cons (car a) (my-append (cdr a) b))
   )
)

; Question 5.2
;;; Test
(define s '(5 4 (1 2) 3 7))
; expects s
(car (cdr (cdr (cdr s))))
; expects 3

; Question 5.3
(define (duplicate lst)
    (if (eq? lst nil)
      lst
      (cons (car lst) (cons (car lst) (duplicate (cdr lst))))
    )

)

; Question 5.4
(define (insert element lst index)
    (if (eq? index 0)
      (cons element lst)
      ( if (eq? lst nil)
           (raise (make-error 'insert "index is out of bound"))
           (cons (car lst) (insert element (cdr lst) (- index 1)))
      )

    )
)
