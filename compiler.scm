; load the library functions that I think make scheme useful.
(load "compiler-lib.scm")

; we use nil like in CL, for false and the empty list
(define (nil? x)
  (or (equal? x 'nil) (equal? x '(quote ()))))

(define immediate? (any? integer? boolean? char? null? nil?))

(define (primcall? x)
  (let ((fun (primcall-func x)))
    (ormap (lambda (x) (equal? fun x))
           '(add1 sub1 integer->char char->integer null? zero? not
                  integer? boolean? + - * / = < > <= >= char=? char<?
                  char>? char<=? char>=?))))

(define (variable? x)
  (symbol? x))

(define (let? x)
  (eq? (car x) 'let))

(define (if? x)
  (eq? (car x) 'if))