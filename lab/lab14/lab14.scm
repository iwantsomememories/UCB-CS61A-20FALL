(define (split-at lst n)
  (define (first_n lst n)
    (if (or (eq? lst nil) (= n 0))
      nil
      (cons (car lst) (first_n (cdr lst) (- n 1)))))
  (define (remain lst n)
    (if (or (eq? lst nil) (= n 0))
      lst
      (remain (cdr lst) (- n 1))))
  (cons (first_n lst n) (remain lst n))
)


(define (compose-all funcs)
  (define (composed funcs x)
    (if (eq? funcs nil)
      x
      (composed (cdr funcs) ((car funcs) x))))
  (lambda (x) (composed funcs x))
)

