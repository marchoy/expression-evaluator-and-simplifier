# An Expression Evaluator and Simplifier

The purpose of this class assignment was to implement a Scheme expression evaluator and simplifier. 
The project contains three parts: creating the environment data structure, an expression evaluator and an expression
simplifier.

### Part 1: Creating an Environment

The environment ADT was implemented in two diffent ways. The first file called `env1.scm` using lists and the second
file called `env2.scm` using closures.

Usage example:

Create an environment called `test-env`.
```
(define test-env
  (extend-env 'a 1
    (extend-env 'b 2
      (make-empty-env))))
```
Then, make a call to the environment with `apply-env`.
```
> (apply-env test-env 'a)
1

> (apply-env test-env 'b)
2

> (apply-env test-env 'z)
apply-env: variable not found in environment
```

### Part 2: An Expression Evaluator

In the file `myeval.scm`, the function called `(myeval expr env)` evaluates an infix expression `expr` in the environment
`env`.

Usage example:
```
(define env1
  (extend-env 'x 1
    (extend-env 'y 2
      (extend-env 'z 3
        (make-empty-env)))))
        
> (myeval '(x + (y * z)) env1)
7
```

The following EBNF grammar defines a valid explression for `expr`:
```
expr = "(" expr "+" expr ")"
     | "(" expr "-" expr ")"
     | "(" expr "*" expr ")"
     | "(" expr "/" expr ")"
     | "(" expr "**" expr ")"
     | "(" "inc" expr ")"
     | "(" "dec" expr ")"
     | var
     | number .
```

### Part 3: An Expression Simplifier

In the file `simplify.scm`, the function called `(simplify expr)` returns a simplified version of `expr`.

Usage example:
```
> (simplify '((1 * a) + (b * (1 * (1 + 0)))))
(a + b)
```
