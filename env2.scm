;; File: env2.scm

(define make-empty-env
	(lambda ()
		(lambda (x)
			(error "variable not found in environment"))))

(define apply-env
	(lambda (env v)
		(env v)))

(define extend-env
	(lambda (v val env)
		(lambda (x)
			(cond
				((equal? x v)
					val)
				(else
					(env x))))))