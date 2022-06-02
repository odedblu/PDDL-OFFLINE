(define (domain Kbts)
(:requirements :strips :typing)
;;BestCase
(:types package bomb toilet)
(:constants
 b0 - bomb
 p0 - package
 p1 - package
 p2 - package
 p3 - package
 p4 - package
 p5 - package
 p6 - package
 p7 - package
 p8 - package
 p9 - package
 t0 - toilet
)

(:predicates
(Kin ?p - package ?b - bomb)
(KNin ?p - package ?b - bomb)
(Kdefused ?b - bomb)
(KNdefused ?b - bomb)
)

(:action sensepT
 :parameters (?p - package ?b - bomb )
 :precondition 
(and (not (Kin ?p ?b)) (not (KNin ?p ?b)))
 :effect 
(and (Kin ?p ?b))
)
(:action sensepF
 :parameters (?p - package ?b - bomb )
 :precondition 
(and (not (Kin ?p ?b)) (not (KNin ?p ?b)))
 :effect 
(and (KNin ?p ?b))
)
(:action dunk
 :parameters (?p - package ?b - bomb ?t - toilet )
 :effect 
(when (Kin ?p ?b) (Kdefused ?b))
)
(:action R0
:precondition (and(Kin p0 b0))
:effect (and(KNin p1 b0)(KNin p2 b0)(KNin p3 b0)(KNin p4 b0)(KNin p5 b0)(KNin p6 b0)(KNin p7 b0)(KNin p8 b0)(KNin p9 b0))
)
(:action R1
:precondition (and(KNin p1 b0)(KNin p2 b0)(KNin p3 b0)(KNin p4 b0)(KNin p5 b0)(KNin p6 b0)(KNin p7 b0)(KNin p8 b0)(KNin p9 b0))
:effect (and(Kin p0 b0))
)
(:action R2
:precondition (and(Kin p1 b0))
:effect (and(KNin p0 b0)(KNin p2 b0)(KNin p3 b0)(KNin p4 b0)(KNin p5 b0)(KNin p6 b0)(KNin p7 b0)(KNin p8 b0)(KNin p9 b0))
)
(:action R3
:precondition (and(KNin p0 b0)(KNin p2 b0)(KNin p3 b0)(KNin p4 b0)(KNin p5 b0)(KNin p6 b0)(KNin p7 b0)(KNin p8 b0)(KNin p9 b0))
:effect (and(Kin p1 b0))
)
(:action R4
:precondition (and(Kin p2 b0))
:effect (and(KNin p0 b0)(KNin p1 b0)(KNin p3 b0)(KNin p4 b0)(KNin p5 b0)(KNin p6 b0)(KNin p7 b0)(KNin p8 b0)(KNin p9 b0))
)
(:action R5
:precondition (and(KNin p0 b0)(KNin p1 b0)(KNin p3 b0)(KNin p4 b0)(KNin p5 b0)(KNin p6 b0)(KNin p7 b0)(KNin p8 b0)(KNin p9 b0))
:effect (and(Kin p2 b0))
)
(:action R6
:precondition (and(Kin p3 b0))
:effect (and(KNin p0 b0)(KNin p1 b0)(KNin p2 b0)(KNin p4 b0)(KNin p5 b0)(KNin p6 b0)(KNin p7 b0)(KNin p8 b0)(KNin p9 b0))
)
(:action R7
:precondition (and(KNin p0 b0)(KNin p1 b0)(KNin p2 b0)(KNin p4 b0)(KNin p5 b0)(KNin p6 b0)(KNin p7 b0)(KNin p8 b0)(KNin p9 b0))
:effect (and(Kin p3 b0))
)
(:action R8
:precondition (and(Kin p4 b0))
:effect (and(KNin p0 b0)(KNin p1 b0)(KNin p2 b0)(KNin p3 b0)(KNin p5 b0)(KNin p6 b0)(KNin p7 b0)(KNin p8 b0)(KNin p9 b0))
)
(:action R9
:precondition (and(KNin p0 b0)(KNin p1 b0)(KNin p2 b0)(KNin p3 b0)(KNin p5 b0)(KNin p6 b0)(KNin p7 b0)(KNin p8 b0)(KNin p9 b0))
:effect (and(Kin p4 b0))
)
(:action R10
:precondition (and(Kin p5 b0))
:effect (and(KNin p0 b0)(KNin p1 b0)(KNin p2 b0)(KNin p3 b0)(KNin p4 b0)(KNin p6 b0)(KNin p7 b0)(KNin p8 b0)(KNin p9 b0))
)
(:action R11
:precondition (and(KNin p0 b0)(KNin p1 b0)(KNin p2 b0)(KNin p3 b0)(KNin p4 b0)(KNin p6 b0)(KNin p7 b0)(KNin p8 b0)(KNin p9 b0))
:effect (and(Kin p5 b0))
)
(:action R12
:precondition (and(Kin p6 b0))
:effect (and(KNin p0 b0)(KNin p1 b0)(KNin p2 b0)(KNin p3 b0)(KNin p4 b0)(KNin p5 b0)(KNin p7 b0)(KNin p8 b0)(KNin p9 b0))
)
(:action R13
:precondition (and(KNin p0 b0)(KNin p1 b0)(KNin p2 b0)(KNin p3 b0)(KNin p4 b0)(KNin p5 b0)(KNin p7 b0)(KNin p8 b0)(KNin p9 b0))
:effect (and(Kin p6 b0))
)
(:action R14
:precondition (and(Kin p7 b0))
:effect (and(KNin p0 b0)(KNin p1 b0)(KNin p2 b0)(KNin p3 b0)(KNin p4 b0)(KNin p5 b0)(KNin p6 b0)(KNin p8 b0)(KNin p9 b0))
)
(:action R15
:precondition (and(KNin p0 b0)(KNin p1 b0)(KNin p2 b0)(KNin p3 b0)(KNin p4 b0)(KNin p5 b0)(KNin p6 b0)(KNin p8 b0)(KNin p9 b0))
:effect (and(Kin p7 b0))
)
(:action R16
:precondition (and(Kin p8 b0))
:effect (and(KNin p0 b0)(KNin p1 b0)(KNin p2 b0)(KNin p3 b0)(KNin p4 b0)(KNin p5 b0)(KNin p6 b0)(KNin p7 b0)(KNin p9 b0))
)
(:action R17
:precondition (and(KNin p0 b0)(KNin p1 b0)(KNin p2 b0)(KNin p3 b0)(KNin p4 b0)(KNin p5 b0)(KNin p6 b0)(KNin p7 b0)(KNin p9 b0))
:effect (and(Kin p8 b0))
)
(:action R18
:precondition (and(Kin p9 b0))
:effect (and(KNin p0 b0)(KNin p1 b0)(KNin p2 b0)(KNin p3 b0)(KNin p4 b0)(KNin p5 b0)(KNin p6 b0)(KNin p7 b0)(KNin p8 b0))
)
(:action R19
:precondition (and(KNin p0 b0)(KNin p1 b0)(KNin p2 b0)(KNin p3 b0)(KNin p4 b0)(KNin p5 b0)(KNin p6 b0)(KNin p7 b0)(KNin p8 b0))
:effect (and(Kin p9 b0))
)
)
