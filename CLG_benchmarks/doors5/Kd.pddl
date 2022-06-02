(define (domain Kdoors)
(:requirements :strips :typing)
;;SingleStateK
(:types pos)
(:constants
 p1-1 - pos
 p1-2 - pos
 p1-3 - pos
 p1-4 - pos
 p1-5 - pos
 p2-1 - pos
 p2-2 - pos
 p2-3 - pos
 p2-4 - pos
 p2-5 - pos
 p3-1 - pos
 p3-2 - pos
 p3-3 - pos
 p3-4 - pos
 p3-5 - pos
 p4-1 - pos
 p4-2 - pos
 p4-3 - pos
 p4-4 - pos
 p4-5 - pos
 p5-1 - pos
 p5-2 - pos
 p5-3 - pos
 p5-4 - pos
 p5-5 - pos
)

(:predicates
(adj ?i - pos ?j - pos)
(at ?i - pos)
(opened ?i - pos)
(Kopened ?i - pos)
(KNopened ?i - pos)
)

(:action sense-doorT
 :parameters (?i - pos ?j - pos )
 :precondition 
(and (not (Kopened ?j)) (not (KNopened ?j)) (at ?i) (adj ?i ?j) (opened ?j))
 :effect 
(and (Kopened ?j))
)
(:action sense-doorF
 :parameters (?i - pos ?j - pos )
 :precondition 
(and (not (Kopened ?j)) (not (KNopened ?j)) (at ?i) (adj ?i ?j) (not (opened ?j)))
 :effect 
(and (KNopened ?j))
)
(:action move
 :parameters (?i - pos ?j - pos )
 :precondition 
(and (adj ?i ?j) (at ?i) (Kopened ?j))
 :effect 
(and (not (at ?i)) (at ?j))
)
(:action R0
:precondition (and(Kopened p2-1)(opened p2-1)(not (opened p2-2))(not (opened p2-3))(not (opened p2-4))(not (opened p2-5)))
:effect (and(KNopened p2-2)(KNopened p2-3)(KNopened p2-4)(KNopened p2-5))
)
(:action R1
:precondition (and(not (opened p2-2))(KNopened p2-2)(not (opened p2-3))(KNopened p2-3)(not (opened p2-4))(KNopened p2-4)(not (opened p2-5))(KNopened p2-5)(opened p2-1))
:effect (and(Kopened p2-1))
)
(:action R2
:precondition (and(Kopened p2-2)(opened p2-2)(not (opened p2-1))(not (opened p2-3))(not (opened p2-4))(not (opened p2-5)))
:effect (and(KNopened p2-1)(KNopened p2-3)(KNopened p2-4)(KNopened p2-5))
)
(:action R3
:precondition (and(not (opened p2-1))(KNopened p2-1)(not (opened p2-3))(KNopened p2-3)(not (opened p2-4))(KNopened p2-4)(not (opened p2-5))(KNopened p2-5)(opened p2-2))
:effect (and(Kopened p2-2))
)
(:action R4
:precondition (and(Kopened p2-3)(opened p2-3)(not (opened p2-1))(not (opened p2-2))(not (opened p2-4))(not (opened p2-5)))
:effect (and(KNopened p2-1)(KNopened p2-2)(KNopened p2-4)(KNopened p2-5))
)
(:action R5
:precondition (and(not (opened p2-1))(KNopened p2-1)(not (opened p2-2))(KNopened p2-2)(not (opened p2-4))(KNopened p2-4)(not (opened p2-5))(KNopened p2-5)(opened p2-3))
:effect (and(Kopened p2-3))
)
(:action R6
:precondition (and(Kopened p2-4)(opened p2-4)(not (opened p2-1))(not (opened p2-2))(not (opened p2-3))(not (opened p2-5)))
:effect (and(KNopened p2-1)(KNopened p2-2)(KNopened p2-3)(KNopened p2-5))
)
(:action R7
:precondition (and(not (opened p2-1))(KNopened p2-1)(not (opened p2-2))(KNopened p2-2)(not (opened p2-3))(KNopened p2-3)(not (opened p2-5))(KNopened p2-5)(opened p2-4))
:effect (and(Kopened p2-4))
)
(:action R8
:precondition (and(Kopened p2-5)(opened p2-5)(not (opened p2-1))(not (opened p2-2))(not (opened p2-3))(not (opened p2-4)))
:effect (and(KNopened p2-1)(KNopened p2-2)(KNopened p2-3)(KNopened p2-4))
)
(:action R9
:precondition (and(not (opened p2-1))(KNopened p2-1)(not (opened p2-2))(KNopened p2-2)(not (opened p2-3))(KNopened p2-3)(not (opened p2-4))(KNopened p2-4)(opened p2-5))
:effect (and(Kopened p2-5))
)
(:action R10
:precondition (and(Kopened p4-1)(opened p4-1)(not (opened p4-2))(not (opened p4-3))(not (opened p4-4))(not (opened p4-5)))
:effect (and(KNopened p4-2)(KNopened p4-3)(KNopened p4-4)(KNopened p4-5))
)
(:action R11
:precondition (and(not (opened p4-2))(KNopened p4-2)(not (opened p4-3))(KNopened p4-3)(not (opened p4-4))(KNopened p4-4)(not (opened p4-5))(KNopened p4-5)(opened p4-1))
:effect (and(Kopened p4-1))
)
(:action R12
:precondition (and(Kopened p4-2)(opened p4-2)(not (opened p4-1))(not (opened p4-3))(not (opened p4-4))(not (opened p4-5)))
:effect (and(KNopened p4-1)(KNopened p4-3)(KNopened p4-4)(KNopened p4-5))
)
(:action R13
:precondition (and(not (opened p4-1))(KNopened p4-1)(not (opened p4-3))(KNopened p4-3)(not (opened p4-4))(KNopened p4-4)(not (opened p4-5))(KNopened p4-5)(opened p4-2))
:effect (and(Kopened p4-2))
)
(:action R14
:precondition (and(Kopened p4-3)(opened p4-3)(not (opened p4-1))(not (opened p4-2))(not (opened p4-4))(not (opened p4-5)))
:effect (and(KNopened p4-1)(KNopened p4-2)(KNopened p4-4)(KNopened p4-5))
)
(:action R15
:precondition (and(not (opened p4-1))(KNopened p4-1)(not (opened p4-2))(KNopened p4-2)(not (opened p4-4))(KNopened p4-4)(not (opened p4-5))(KNopened p4-5)(opened p4-3))
:effect (and(Kopened p4-3))
)
(:action R16
:precondition (and(Kopened p4-4)(opened p4-4)(not (opened p4-1))(not (opened p4-2))(not (opened p4-3))(not (opened p4-5)))
:effect (and(KNopened p4-1)(KNopened p4-2)(KNopened p4-3)(KNopened p4-5))
)
(:action R17
:precondition (and(not (opened p4-1))(KNopened p4-1)(not (opened p4-2))(KNopened p4-2)(not (opened p4-3))(KNopened p4-3)(not (opened p4-5))(KNopened p4-5)(opened p4-4))
:effect (and(Kopened p4-4))
)
(:action R18
:precondition (and(Kopened p4-5)(opened p4-5)(not (opened p4-1))(not (opened p4-2))(not (opened p4-3))(not (opened p4-4)))
:effect (and(KNopened p4-1)(KNopened p4-2)(KNopened p4-3)(KNopened p4-4))
)
(:action R19
:precondition (and(not (opened p4-1))(KNopened p4-1)(not (opened p4-2))(KNopened p4-2)(not (opened p4-3))(KNopened p4-3)(not (opened p4-4))(KNopened p4-4)(opened p4-5))
:effect (and(Kopened p4-5))
)
)
