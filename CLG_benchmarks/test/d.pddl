;door domain 

(define (domain door)

(:types DOOR)
(:predicates (at ?d - DOOR)
    (open ?door - DOOR)
    	(at-home)
		(near ?d1 - DOOR ?d2 - DOOR)	
    ) 
(:action gothrow
 :parameters (?curd - DOOR)
 :precondition (and (at ?curd) (open ?curd))
 :effect (at-home)
)

(:action go-left
 :parameters (?curd - DOOR ?todoor - DOOR)
 :precondition (and (at ?curd) (near ?curd ?todoor))
 :effect (and (not (at ?curd)) (at ?todoor))
)
  
(:action sensedoor
 :parameters (?cur - DOOR)
 :precondition (and (at ?cur))
 :observe (open ?cur)
)
)
