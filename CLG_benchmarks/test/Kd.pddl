(define (domain Kunix)
(:requirements :strips :typing)
;;Conformant
(:types DOOR)
(:constants
 d1 - DOOR
 d2 - DOOR
 d3 - DOOR
 d4 - DOOR
 m0 m1 - mishaps
)

(:predicates
(at ?d - DOOR)
(Kopen ?door - DOOR)
(KNopen ?door - DOOR)
(NotKopen ?door - DOOR)
(at-home)
(near ?doo - DOOR ?dd - DOOR)
(MishapCount ?m - mishaps)
)

(:action gothrow
 :parameters (?curd - DOOR )
 :precondition 
(and (at ?curd) (Kopen ?curd))
 :effect (at-home )
)
(:action go-left
 :parameters (?curd - DOOR ?todoor - DOOR )
 :precondition 
(and (at ?curd) (near ?curd ?todoor))
 :effect 
(and (not (at ?curd)) (at ?todoor))
)
(:action R0
:precondition (and(KNopen d2)(KNopen d4))
:effect (and(Kopen d1)(not (NotKopen d1)))
)
(:action R1
:precondition (and(KNopen d1)(KNopen d4))
:effect (and(Kopen d2)(not (NotKopen d2)))
)
(:action R2
:precondition (and(KNopen d1)(KNopen d2))
:effect (and(Kopen d4)(not (NotKopen d4)))
)
)
