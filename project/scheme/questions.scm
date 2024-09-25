(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

; Some utility functions that you may find useful to implement

(define (zip pairs)
  (define (get lst index)
    (if (= index 0)
      (car lst)
      (get (cdr lst) (- index 1)))
    )
  (define (gen_i_item pairs index)
    (if (eq? pairs nil)
      nil
      (cons (get (car pairs) index) 
            (gen_i_item (cdr pairs) index))
      )
    )
  (define x (length (car pairs)))
  (define (func pairs len cur_len)
    (if (= len cur_len)
      (cons (gen_i_item pairs cur_len) 
            nil)
      (cons (gen_i_item pairs cur_len) 
            (func pairs len (+ cur_len 1)))
      )
    )
  (func pairs (- x 1) 0)
 )


;; Problem 15
;; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN PROBLEM 15
   (define (helper s index)
     (if (eq? s nil)
         nil
         (cons (cons index 
                     (cons (car s) 
                           nil)) 
               (helper (cdr s) 
                       (+ index 1)))))
   (helper s 0)
  )
  ; END PROBLEM 15

;; Problem 16

;; Merge two lists LIST1 and LIST2 according to COMP and return
;; the merged lists.
(define (merge comp list1 list2)
  ; BEGIN PROBLEM 16
  (cond
    ((eq? list1 nil) list2)
    ((eq? list2 nil) list1)
    ((comp (car list1) (car list2)) 
        (cons (car list1) (merge comp (cdr list1) list2)))
    (else
        (cons (car list2) (merge comp list1 (cdr list2)))))
  )
  ; END PROBLEM 16


(merge < '(1 5 7 9) '(4 8 10))
; expect (1 4 5 7 8 9 10)
(merge > '(9 7 5 1) '(10 8 4 3))
; expect (10 9 8 7 5 4 3 1)

;; Problem 17

(define (nondecreaselist s)
    ; BEGIN PROBLEM 17
    (define (helper s cur_list cur_item)
      (cond 
        ((eq? s nil)
            (cons cur_list nil))
        ((or (eq? cur_list nil) (<= cur_item (car s)))
            (helper (cdr s) (append cur_list (cons (car s) nil)) (car s)))
        (else (cons cur_list (helper s nil 0)))
        )
      )
    (helper s nil 0)
)
    ; END PROBLEM 17

;; Problem EC
;; Returns a function that checks if an expression is the special form FORM
(define (check-special form)
  (lambda (expr) (equal? form (car expr))))

(define lambda? (check-special 'lambda))
(define define? (check-special 'define))
(define quoted? (check-special 'quote))
(define let?    (check-special 'let))

;; Converts all let special forms in EXPR into equivalent forms using lambda
(define (let-to-lambda expr)
  (cond ((atom? expr)
         ; BEGIN PROBLEM EC
         expr
         ; END PROBLEM EC
         )
        ((quoted? expr)
         ; BEGIN PROBLEM EC
         expr
         ; END PROBLEM EC
         )
        ((or (lambda? expr)
             (define? expr))
         (let ((form   (car expr))
               (params (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM EC
           (cons form (cons params (map let-to-lambda body)))
           ; END PROBLEM EC
           ))
        ((let? expr)
         (let ((values (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM EC
           (append (cons (cons 'lambda 
                               (cons (car (zip values)) 
                                     (map let-to-lambda body))) 
                         nil) 
                   (map let-to-lambda (cadr (zip values))))
           ; END PROBLEM EC
           ))
        (else
         ; BEGIN PROBLEM EC
         (map let-to-lambda expr)
         ; END PROBLEM EC
         )))

