(define (domain Kgrid)
(:requirements :strips :typing)
;;Conformant
(:types)
(:constants
 f0-0f - OBJ
 f1-0f - OBJ
 f2-0f - OBJ
 f0-1f - OBJ
 f1-1f - OBJ
 f2-1f - OBJ
 f0-2f - OBJ
 f1-2f - OBJ
 f2-2f - OBJ
 shape0 - OBJ
 shape1 - OBJ
 key0-0 - OBJ
 key1-0 - OBJ
 m0 m1 - mishaps
)

(:predicates
(conn ?x - OBJ ?y - OBJ)
(key-shape ?k - OBJ ?s - OBJ)
(Klock-shape ?x - OBJ ?s - OBJ)
(KNlock-shape ?x - OBJ ?s - OBJ)
(NotKlock-shape ?x - OBJ ?s - OBJ)
(at ?r - OBJ ?x - OBJ)
(at-robot ?x - OBJ)
(place ?p - OBJ)
(key ?k - OBJ)
(shape ?s - OBJ)
(locked ?x - OBJ)
(holding ?k - OBJ)
(open ?x - OBJ)
(arm-empty)
(MishapCount ?m - mishaps)
)

(:action unlock
 :parameters (?curpos - OBJ ?lockpos - OBJ ?key - OBJ ?shape - OBJ )
 :precondition 
(and (place ?curpos) (place ?lockpos) (key ?key) (shape ?shape) (conn ?curpos ?lockpos) (key-shape ?key ?shape) (at-robot ?curpos) (holding ?key) (Klock-shape ?lockpos ?shape))
 :effect 
(and (open ?lockpos) (not (locked ?lockpos)))
)
(:action move
 :parameters (?curpos - OBJ ?nextpos - OBJ )
 :precondition 
(and (place ?curpos) (place ?nextpos) (at-robot ?curpos) (conn ?curpos ?nextpos) (open ?nextpos))
 :effect 
(and (at-robot ?nextpos) (not (at-robot ?curpos)))
)
(:action pickup
 :parameters (?curpos - OBJ ?key - OBJ )
 :precondition 
(and (place ?curpos) (key ?key) (at-robot ?curpos) (at ?key ?curpos) (arm-empty ))
 :effect 
(and (holding ?key) (not (at ?key ?curpos)) (not (arm-empty )))
)
(:action putdown
 :parameters (?curpos - OBJ ?key - OBJ )
 :precondition 
(and (place ?curpos) (key ?key) (at-robot ?curpos) (holding ?key))
 :effect 
(and (arm-empty ) (at ?key ?curpos) (not (holding ?key)))
)
(:action R0
:precondition (and(Klock-shape f1-2f shape0))
:effect (and(KNlock-shape f1-2f shape1)(not (NotKlock-shape f1-2f shape1)))
)
(:action R1
:precondition (and(KNlock-shape f1-2f shape1))
:effect (and(Klock-shape f1-2f shape0)(not (NotKlock-shape f1-2f shape0)))
)
(:action R2
:precondition (and(Klock-shape f1-2f shape1))
:effect (and(KNlock-shape f1-2f shape0)(not (NotKlock-shape f1-2f shape0)))
)
(:action R3
:precondition (and(KNlock-shape f1-2f shape0))
:effect (and(Klock-shape f1-2f shape1)(not (NotKlock-shape f1-2f shape1)))
)
(:action R4
:precondition (and(Klock-shape f0-0f shape0))
:effect (and(KNlock-shape f0-0f shape1)(not (NotKlock-shape f0-0f shape1)))
)
(:action R5
:precondition (and(KNlock-shape f0-0f shape1))
:effect (and(Klock-shape f0-0f shape0)(not (NotKlock-shape f0-0f shape0)))
)
(:action R6
:precondition (and(Klock-shape f0-0f shape1))
:effect (and(KNlock-shape f0-0f shape0)(not (NotKlock-shape f0-0f shape0)))
)
(:action R7
:precondition (and(KNlock-shape f0-0f shape0))
:effect (and(Klock-shape f0-0f shape1)(not (NotKlock-shape f0-0f shape1)))
)
(:action R8
:precondition (and(Klock-shape f2-0f shape0))
:effect (and(KNlock-shape f2-0f shape1)(not (NotKlock-shape f2-0f shape1)))
)
(:action R9
:precondition (and(KNlock-shape f2-0f shape1))
:effect (and(Klock-shape f2-0f shape0)(not (NotKlock-shape f2-0f shape0)))
)
(:action R10
:precondition (and(Klock-shape f2-0f shape1))
:effect (and(KNlock-shape f2-0f shape0)(not (NotKlock-shape f2-0f shape0)))
)
(:action R11
:precondition (and(KNlock-shape f2-0f shape0))
:effect (and(Klock-shape f2-0f shape1)(not (NotKlock-shape f2-0f shape1)))
)
(:action R12
:precondition (and(Klock-shape f2-1f shape0))
:effect (and(KNlock-shape f2-1f shape1)(not (NotKlock-shape f2-1f shape1)))
)
(:action R13
:precondition (and(KNlock-shape f2-1f shape1))
:effect (and(Klock-shape f2-1f shape0)(not (NotKlock-shape f2-1f shape0)))
)
(:action R14
:precondition (and(Klock-shape f2-1f shape1))
:effect (and(KNlock-shape f2-1f shape0)(not (NotKlock-shape f2-1f shape0)))
)
(:action R15
:precondition (and(KNlock-shape f2-1f shape0))
:effect (and(Klock-shape f2-1f shape1)(not (NotKlock-shape f2-1f shape1)))
)
)
