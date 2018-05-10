;; File: env1.scm

(define make-empty-env
    (lambda ()
        (list)))

(define apply-env
    (lambda (env v)
        (cond
            ((null? env) 
                (error "error: variable not found in environment"))
            (else
                (cond 
                    ((equal? v (car env))
                        (car (cdr env)))
                    (else
                        (apply-env (car (cdr (cdr env))) v)))))))

(define extend-env
    (lambda (v val env)
        (list v val env)))