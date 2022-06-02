(define (domain Kctp)
(:requirements :strips :typing)
(:types vertex edge)
(:constants
 v0 - vertex
 v1 - vertex
 v2 - vertex
 v3 - vertex
 v4 - vertex
 v5 - vertex
 v6 - vertex
 v7 - vertex
 v8 - vertex
 v9 - vertex
 v10 - vertex
 e0 - edge
 e1 - edge
 e2 - edge
 e3 - edge
 e4 - edge
 e5 - edge
 e6 - edge
 e7 - edge
 e8 - edge
 e9 - edge
 e10 - edge
 e11 - edge
 e12 - edge
 e13 - edge
 e14 - edge
 e15 - edge
 e16 - edge
 e17 - edge
 e18 - edge
 e19 - edge
)

(:predicates
(adjacent ?x - vertex ?e - edge)
(Ktraversable ?e - edge)
(KNtraversable ?e - edge)
(at ?x - vertex)
)

(:action move-along
 :parameters (?x - vertex ?y - vertex ?e - edge )
 :precondition 
(and (at ?x) (adjacent ?x ?e) (adjacent ?y ?e) (Ktraversable ?e))
 :effect 
(and (not (at ?x)) (at ?y))
)
(:action edge-obsT
 :parameters (?x - vertex ?e - edge )
 :precondition 
(and (at ?x) (adjacent ?x ?e) (not (Ktraversable ?e)) (not (KNtraversable ?e)))
 :effect 
(and (Ktraversable ?e))
)
(:action edge-obsF
 :parameters (?x - vertex ?e - edge )
 :precondition 
(and (at ?x) (adjacent ?x ?e) (not (Ktraversable ?e)) (not (KNtraversable ?e)))
 :effect 
(and (KNtraversable ?e))
)
(:action R0
:precondition (and(Ktraversable e0)(not (KNtraversable e1)))
:effect (and(KNtraversable e1))
)
(:action R1
:precondition (and(KNtraversable e1)(not (Ktraversable e0)))
:effect (and(Ktraversable e0))
)
(:action R2
:precondition (and(Ktraversable e1)(not (KNtraversable e0)))
:effect (and(KNtraversable e0))
)
(:action R3
:precondition (and(KNtraversable e0)(not (Ktraversable e1)))
:effect (and(Ktraversable e1))
)
(:action R4
:precondition (and(Ktraversable e2)(not (KNtraversable e3)))
:effect (and(KNtraversable e3))
)
(:action R5
:precondition (and(KNtraversable e3)(not (Ktraversable e2)))
:effect (and(Ktraversable e2))
)
(:action R6
:precondition (and(Ktraversable e3)(not (KNtraversable e2)))
:effect (and(KNtraversable e2))
)
(:action R7
:precondition (and(KNtraversable e2)(not (Ktraversable e3)))
:effect (and(Ktraversable e3))
)
(:action R8
:precondition (and(Ktraversable e4)(not (KNtraversable e5)))
:effect (and(KNtraversable e5))
)
(:action R9
:precondition (and(KNtraversable e5)(not (Ktraversable e4)))
:effect (and(Ktraversable e4))
)
(:action R10
:precondition (and(Ktraversable e5)(not (KNtraversable e4)))
:effect (and(KNtraversable e4))
)
(:action R11
:precondition (and(KNtraversable e4)(not (Ktraversable e5)))
:effect (and(Ktraversable e5))
)
(:action R12
:precondition (and(Ktraversable e6)(not (KNtraversable e7)))
:effect (and(KNtraversable e7))
)
(:action R13
:precondition (and(KNtraversable e7)(not (Ktraversable e6)))
:effect (and(Ktraversable e6))
)
(:action R14
:precondition (and(Ktraversable e7)(not (KNtraversable e6)))
:effect (and(KNtraversable e6))
)
(:action R15
:precondition (and(KNtraversable e6)(not (Ktraversable e7)))
:effect (and(Ktraversable e7))
)
(:action R16
:precondition (and(Ktraversable e8)(not (KNtraversable e9)))
:effect (and(KNtraversable e9))
)
(:action R17
:precondition (and(KNtraversable e9)(not (Ktraversable e8)))
:effect (and(Ktraversable e8))
)
(:action R18
:precondition (and(Ktraversable e9)(not (KNtraversable e8)))
:effect (and(KNtraversable e8))
)
(:action R19
:precondition (and(KNtraversable e8)(not (Ktraversable e9)))
:effect (and(Ktraversable e9))
)
(:action R20
:precondition (and(Ktraversable e10)(not (KNtraversable e11)))
:effect (and(KNtraversable e11))
)
(:action R21
:precondition (and(KNtraversable e11)(not (Ktraversable e10)))
:effect (and(Ktraversable e10))
)
(:action R22
:precondition (and(Ktraversable e11)(not (KNtraversable e10)))
:effect (and(KNtraversable e10))
)
(:action R23
:precondition (and(KNtraversable e10)(not (Ktraversable e11)))
:effect (and(Ktraversable e11))
)
(:action R24
:precondition (and(Ktraversable e12)(not (KNtraversable e13)))
:effect (and(KNtraversable e13))
)
(:action R25
:precondition (and(KNtraversable e13)(not (Ktraversable e12)))
:effect (and(Ktraversable e12))
)
(:action R26
:precondition (and(Ktraversable e13)(not (KNtraversable e12)))
:effect (and(KNtraversable e12))
)
(:action R27
:precondition (and(KNtraversable e12)(not (Ktraversable e13)))
:effect (and(Ktraversable e13))
)
(:action R28
:precondition (and(Ktraversable e14)(not (KNtraversable e15)))
:effect (and(KNtraversable e15))
)
(:action R29
:precondition (and(KNtraversable e15)(not (Ktraversable e14)))
:effect (and(Ktraversable e14))
)
(:action R30
:precondition (and(Ktraversable e15)(not (KNtraversable e14)))
:effect (and(KNtraversable e14))
)
(:action R31
:precondition (and(KNtraversable e14)(not (Ktraversable e15)))
:effect (and(Ktraversable e15))
)
(:action R32
:precondition (and(Ktraversable e16)(not (KNtraversable e17)))
:effect (and(KNtraversable e17))
)
(:action R33
:precondition (and(KNtraversable e17)(not (Ktraversable e16)))
:effect (and(Ktraversable e16))
)
(:action R34
:precondition (and(Ktraversable e17)(not (KNtraversable e16)))
:effect (and(KNtraversable e16))
)
(:action R35
:precondition (and(KNtraversable e16)(not (Ktraversable e17)))
:effect (and(Ktraversable e17))
)
(:action R36
:precondition (and(Ktraversable e18)(not (KNtraversable e19)))
:effect (and(KNtraversable e19))
)
(:action R37
:precondition (and(KNtraversable e19)(not (Ktraversable e18)))
:effect (and(Ktraversable e18))
)
(:action R38
:precondition (and(Ktraversable e19)(not (KNtraversable e18)))
:effect (and(KNtraversable e18))
)
(:action R39
:precondition (and(KNtraversable e18)(not (Ktraversable e19)))
:effect (and(Ktraversable e19))
)
)
