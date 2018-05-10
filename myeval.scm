;; File: myeval.scm

(define myeval
    (lambda (expr env)
        (cond
            ((null? expr)
                '())
            ((number? expr)
                expr)
            ((and (list? expr) (equal? (car expr) 'dec))
                (- (myeval (last expr) env) 1))
            ((and (list? expr) (equal? (car expr) 'inc))
                (+ (myeval (last expr) env) 1))
            ((symbol? expr)
                (apply-env env expr))
            (else
                (let ((left (myeval (car expr) env))
                      (op (car (cdr expr)))
                      (right (myeval (last expr) env)))
                    (cond
                        ((equal? op '+)
                            (+ left right))
                        ((equal? op '-)
                            (- left right))
                        ((equal? op '*)
                            (* left right))
                        ((equal? op '**)
                            (expt left right))
                        ((and (equal? op '/) (not (equal? right 0)))
                            (/ left right))
                        ((and (equal? op '/) (equal? right 0))
                            (error "myeval error: cannot divide by zero"))
                        (else
                            (myeval expr env))))))))