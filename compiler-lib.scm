; what I'd like to write
;(def any? ( . procs )
;   (lambda (x) (reduce or (map [_ x] procs))))
; this seems hard to write in factor.  

(define (any? . procs)
  (lambda (x)
    (cond ((null? procs) #f)
	  (((car procs) x) #t)
	  (else ((apply any? (cdr procs)) x)))))

; mzscheme and chez only.  ormap is pretty cool.  
(define (any? . procs)
  (lambda (x)
    (ormap (lambda (y) (y x)) procs)))
