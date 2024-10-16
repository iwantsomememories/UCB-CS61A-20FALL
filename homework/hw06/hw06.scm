(define (cddr s)
  (cdr (cdr s)))

(define (cadr s)
  (car (cdr s))
)

(define (caddr s)
  (cadr (cdr s))
)


(define (sign num)
  (cond
    ((< num 0) -1)
    ((> num 0) 1)
    (else 0))
)


(define (square x) (* x x))

(define (pow x y)
  (if (= y 1) 
      x  
      (if (even? y)
            (square (pow x (/ y 2)))
            (* x (square (pow x (quotient y 2))))
      )
  )
)

