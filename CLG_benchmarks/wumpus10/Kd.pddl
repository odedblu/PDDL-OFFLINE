(define (domain Kwumpus)
(:requirements :strips :typing)
;;SingleStateK
(:types pos)
(:constants
 p1-1 - pos
 p1-2 - pos
 p1-3 - pos
 p1-4 - pos
 p1-5 - pos
 p1-6 - pos
 p1-7 - pos
 p1-8 - pos
 p1-9 - pos
 p1-10 - pos
 p2-1 - pos
 p2-2 - pos
 p2-3 - pos
 p2-4 - pos
 p2-5 - pos
 p2-6 - pos
 p2-7 - pos
 p2-8 - pos
 p2-9 - pos
 p2-10 - pos
 p3-1 - pos
 p3-2 - pos
 p3-3 - pos
 p3-4 - pos
 p3-5 - pos
 p3-6 - pos
 p3-7 - pos
 p3-8 - pos
 p3-9 - pos
 p3-10 - pos
 p4-1 - pos
 p4-2 - pos
 p4-3 - pos
 p4-4 - pos
 p4-5 - pos
 p4-6 - pos
 p4-7 - pos
 p4-8 - pos
 p4-9 - pos
 p4-10 - pos
 p5-1 - pos
 p5-2 - pos
 p5-3 - pos
 p5-4 - pos
 p5-5 - pos
 p5-6 - pos
 p5-7 - pos
 p5-8 - pos
 p5-9 - pos
 p5-10 - pos
 p6-1 - pos
 p6-2 - pos
 p6-3 - pos
 p6-4 - pos
 p6-5 - pos
 p6-6 - pos
 p6-7 - pos
 p6-8 - pos
 p6-9 - pos
 p6-10 - pos
 p7-1 - pos
 p7-2 - pos
 p7-3 - pos
 p7-4 - pos
 p7-5 - pos
 p7-6 - pos
 p7-7 - pos
 p7-8 - pos
 p7-9 - pos
 p7-10 - pos
 p8-1 - pos
 p8-2 - pos
 p8-3 - pos
 p8-4 - pos
 p8-5 - pos
 p8-6 - pos
 p8-7 - pos
 p8-8 - pos
 p8-9 - pos
 p8-10 - pos
 p9-1 - pos
 p9-2 - pos
 p9-3 - pos
 p9-4 - pos
 p9-5 - pos
 p9-6 - pos
 p9-7 - pos
 p9-8 - pos
 p9-9 - pos
 p9-10 - pos
 p10-1 - pos
 p10-2 - pos
 p10-3 - pos
 p10-4 - pos
 p10-5 - pos
 p10-6 - pos
 p10-7 - pos
 p10-8 - pos
 p10-9 - pos
 p10-10 - pos
)

(:predicates
(adj ?i - pos ?j - pos)
(at ?i - pos)
(safe ?i - pos)
(Ksafe ?i - pos)
(KNsafe ?i - pos)
(wumpus-at ?x - pos)
(Kwumpus-at ?x - pos)
(KNwumpus-at ?x - pos)
(alive)
(stench ?i - pos)
(Kstench ?i - pos)
(KNstench ?i - pos)
(gold-at ?i - pos)
(got-the-treasure)
(breeze ?i - pos)
(Kbreeze ?i - pos)
(KNbreeze ?i - pos)
(pit-at ?p - pos)
(Kpit-at ?p - pos)
(KNpit-at ?p - pos)
)

(:action move
 :parameters (?i - pos ?j - pos )
 :precondition 
(and (adj ?i ?j) (at ?i) (Ksafe ?j))
 :effect 
(and (not (at ?i)) (at ?j))
)
(:action smell_wumpusT
 :parameters (?pos - pos )
 :precondition 
(and (not (Kstench ?pos)) (not (KNstench ?pos)) (at ?pos) (stench ?pos))
 :effect 
(and (Kstench ?pos))
)
(:action smell_wumpusF
 :parameters (?pos - pos )
 :precondition 
(and (not (Kstench ?pos)) (not (KNstench ?pos)) (at ?pos) (not (stench ?pos)))
 :effect 
(and (KNstench ?pos))
)
(:action feel-breezeT
 :parameters (?pos - pos )
 :precondition 
(and (not (Kbreeze ?pos)) (not (KNbreeze ?pos)) (at ?pos) (breeze ?pos))
 :effect 
(and (Kbreeze ?pos))
)
(:action feel-breezeF
 :parameters (?pos - pos )
 :precondition 
(and (not (Kbreeze ?pos)) (not (KNbreeze ?pos)) (at ?pos) (not (breeze ?pos)))
 :effect 
(and (KNbreeze ?pos))
)
(:action grab
 :parameters (?i - pos )
 :precondition 
(and (at ?i) (gold-at ?i))
 :effect 
(and (got-the-treasure ) (not (gold-at ?i)))
)
(:action R0
:precondition (and(Ksafe p2-3)(safe p2-3)(not (safe p3-2)))
:effect (and(KNsafe p3-2))
)
(:action R1
:precondition (and(not (safe p3-2))(KNsafe p3-2)(safe p2-3))
:effect (and(Ksafe p2-3))
)
(:action R2
:precondition (and(Ksafe p3-2)(safe p3-2)(not (safe p2-3)))
:effect (and(KNsafe p2-3))
)
(:action R3
:precondition (and(not (safe p2-3))(KNsafe p2-3)(safe p3-2))
:effect (and(Ksafe p3-2))
)
(:action R4
:precondition (and(Ksafe p3-4)(safe p3-4)(not (safe p4-3)))
:effect (and(KNsafe p4-3))
)
(:action R5
:precondition (and(not (safe p4-3))(KNsafe p4-3)(safe p3-4))
:effect (and(Ksafe p3-4))
)
(:action R6
:precondition (and(Ksafe p4-3)(safe p4-3)(not (safe p3-4)))
:effect (and(KNsafe p3-4))
)
(:action R7
:precondition (and(not (safe p3-4))(KNsafe p3-4)(safe p4-3))
:effect (and(Ksafe p4-3))
)
(:action R8
:precondition (and(Ksafe p4-5)(safe p4-5)(not (safe p5-4)))
:effect (and(KNsafe p5-4))
)
(:action R9
:precondition (and(not (safe p5-4))(KNsafe p5-4)(safe p4-5))
:effect (and(Ksafe p4-5))
)
(:action R10
:precondition (and(Ksafe p5-4)(safe p5-4)(not (safe p4-5)))
:effect (and(KNsafe p4-5))
)
(:action R11
:precondition (and(not (safe p4-5))(KNsafe p4-5)(safe p5-4))
:effect (and(Ksafe p5-4))
)
(:action R12
:precondition (and(Ksafe p5-6)(safe p5-6)(not (safe p6-5)))
:effect (and(KNsafe p6-5))
)
(:action R13
:precondition (and(not (safe p6-5))(KNsafe p6-5)(safe p5-6))
:effect (and(Ksafe p5-6))
)
(:action R14
:precondition (and(Ksafe p6-5)(safe p6-5)(not (safe p5-6)))
:effect (and(KNsafe p5-6))
)
(:action R15
:precondition (and(not (safe p5-6))(KNsafe p5-6)(safe p6-5))
:effect (and(Ksafe p6-5))
)
(:action R16
:precondition (and(Ksafe p6-7)(safe p6-7)(not (safe p7-6)))
:effect (and(KNsafe p7-6))
)
(:action R17
:precondition (and(not (safe p7-6))(KNsafe p7-6)(safe p6-7))
:effect (and(Ksafe p6-7))
)
(:action R18
:precondition (and(Ksafe p7-6)(safe p7-6)(not (safe p6-7)))
:effect (and(KNsafe p6-7))
)
(:action R19
:precondition (and(not (safe p6-7))(KNsafe p6-7)(safe p7-6))
:effect (and(Ksafe p7-6))
)
(:action R20
:precondition (and(Ksafe p7-8)(safe p7-8)(not (safe p8-7)))
:effect (and(KNsafe p8-7))
)
(:action R21
:precondition (and(not (safe p8-7))(KNsafe p8-7)(safe p7-8))
:effect (and(Ksafe p7-8))
)
(:action R22
:precondition (and(Ksafe p8-7)(safe p8-7)(not (safe p7-8)))
:effect (and(KNsafe p7-8))
)
(:action R23
:precondition (and(not (safe p7-8))(KNsafe p7-8)(safe p8-7))
:effect (and(Ksafe p8-7))
)
(:action R24
:precondition (and(Ksafe p8-9)(safe p8-9)(not (safe p9-8)))
:effect (and(KNsafe p9-8))
)
(:action R25
:precondition (and(not (safe p9-8))(KNsafe p9-8)(safe p8-9))
:effect (and(Ksafe p8-9))
)
(:action R26
:precondition (and(Ksafe p9-8)(safe p9-8)(not (safe p8-9)))
:effect (and(KNsafe p8-9))
)
(:action R27
:precondition (and(not (safe p8-9))(KNsafe p8-9)(safe p9-8))
:effect (and(Ksafe p9-8))
)
(:action R28
:precondition (and(Ksafe p9-10)(safe p9-10)(not (safe p10-9)))
:effect (and(KNsafe p10-9))
)
(:action R29
:precondition (and(not (safe p10-9))(KNsafe p10-9)(safe p9-10))
:effect (and(Ksafe p9-10))
)
(:action R30
:precondition (and(Ksafe p10-9)(safe p10-9)(not (safe p9-10)))
:effect (and(KNsafe p9-10))
)
(:action R31
:precondition (and(not (safe p9-10))(KNsafe p9-10)(safe p10-9))
:effect (and(Ksafe p10-9))
)
(:action R32
:precondition (and(wumpus-at p2-3)(Kwumpus-at p2-3)(not (safe p2-3)))
:effect (and(KNsafe p2-3))
)
(:action R33
:precondition (and(safe p2-3)(Ksafe p2-3)(not (wumpus-at p2-3)))
:effect (and(KNwumpus-at p2-3))
)
(:action R34
:precondition (and(pit-at p2-3)(Kpit-at p2-3)(not (safe p2-3)))
:effect (and(KNsafe p2-3))
)
(:action R35
:precondition (and(safe p2-3)(Ksafe p2-3)(not (pit-at p2-3)))
:effect (and(KNpit-at p2-3))
)
(:action R36
:precondition (and(not (wumpus-at p2-3))(KNwumpus-at p2-3)(not (pit-at p2-3))(KNpit-at p2-3)(safe p2-3))
:effect (and(Ksafe p2-3))
)
(:action R37
:precondition (and(not (safe p2-3))(KNsafe p2-3)(not (pit-at p2-3))(KNpit-at p2-3)(wumpus-at p2-3))
:effect (and(Kwumpus-at p2-3))
)
(:action R38
:precondition (and(not (safe p2-3))(KNsafe p2-3)(not (wumpus-at p2-3))(KNwumpus-at p2-3)(pit-at p2-3))
:effect (and(Kpit-at p2-3))
)
(:action R39
:precondition (and(wumpus-at p3-2)(Kwumpus-at p3-2)(not (safe p3-2)))
:effect (and(KNsafe p3-2))
)
(:action R40
:precondition (and(safe p3-2)(Ksafe p3-2)(not (wumpus-at p3-2)))
:effect (and(KNwumpus-at p3-2))
)
(:action R41
:precondition (and(pit-at p3-2)(Kpit-at p3-2)(not (safe p3-2)))
:effect (and(KNsafe p3-2))
)
(:action R42
:precondition (and(safe p3-2)(Ksafe p3-2)(not (pit-at p3-2)))
:effect (and(KNpit-at p3-2))
)
(:action R43
:precondition (and(not (wumpus-at p3-2))(KNwumpus-at p3-2)(not (pit-at p3-2))(KNpit-at p3-2)(safe p3-2))
:effect (and(Ksafe p3-2))
)
(:action R44
:precondition (and(not (safe p3-2))(KNsafe p3-2)(not (pit-at p3-2))(KNpit-at p3-2)(wumpus-at p3-2))
:effect (and(Kwumpus-at p3-2))
)
(:action R45
:precondition (and(not (safe p3-2))(KNsafe p3-2)(not (wumpus-at p3-2))(KNwumpus-at p3-2)(pit-at p3-2))
:effect (and(Kpit-at p3-2))
)
(:action R46
:precondition (and(wumpus-at p3-4)(Kwumpus-at p3-4)(not (safe p3-4)))
:effect (and(KNsafe p3-4))
)
(:action R47
:precondition (and(safe p3-4)(Ksafe p3-4)(not (wumpus-at p3-4)))
:effect (and(KNwumpus-at p3-4))
)
(:action R48
:precondition (and(pit-at p3-4)(Kpit-at p3-4)(not (safe p3-4)))
:effect (and(KNsafe p3-4))
)
(:action R49
:precondition (and(safe p3-4)(Ksafe p3-4)(not (pit-at p3-4)))
:effect (and(KNpit-at p3-4))
)
(:action R50
:precondition (and(not (wumpus-at p3-4))(KNwumpus-at p3-4)(not (pit-at p3-4))(KNpit-at p3-4)(safe p3-4))
:effect (and(Ksafe p3-4))
)
(:action R51
:precondition (and(not (safe p3-4))(KNsafe p3-4)(not (pit-at p3-4))(KNpit-at p3-4)(wumpus-at p3-4))
:effect (and(Kwumpus-at p3-4))
)
(:action R52
:precondition (and(not (safe p3-4))(KNsafe p3-4)(not (wumpus-at p3-4))(KNwumpus-at p3-4)(pit-at p3-4))
:effect (and(Kpit-at p3-4))
)
(:action R53
:precondition (and(wumpus-at p4-3)(Kwumpus-at p4-3)(not (safe p4-3)))
:effect (and(KNsafe p4-3))
)
(:action R54
:precondition (and(safe p4-3)(Ksafe p4-3)(not (wumpus-at p4-3)))
:effect (and(KNwumpus-at p4-3))
)
(:action R55
:precondition (and(pit-at p4-3)(Kpit-at p4-3)(not (safe p4-3)))
:effect (and(KNsafe p4-3))
)
(:action R56
:precondition (and(safe p4-3)(Ksafe p4-3)(not (pit-at p4-3)))
:effect (and(KNpit-at p4-3))
)
(:action R57
:precondition (and(not (wumpus-at p4-3))(KNwumpus-at p4-3)(not (pit-at p4-3))(KNpit-at p4-3)(safe p4-3))
:effect (and(Ksafe p4-3))
)
(:action R58
:precondition (and(not (safe p4-3))(KNsafe p4-3)(not (pit-at p4-3))(KNpit-at p4-3)(wumpus-at p4-3))
:effect (and(Kwumpus-at p4-3))
)
(:action R59
:precondition (and(not (safe p4-3))(KNsafe p4-3)(not (wumpus-at p4-3))(KNwumpus-at p4-3)(pit-at p4-3))
:effect (and(Kpit-at p4-3))
)
(:action R60
:precondition (and(wumpus-at p4-5)(Kwumpus-at p4-5)(not (safe p4-5)))
:effect (and(KNsafe p4-5))
)
(:action R61
:precondition (and(safe p4-5)(Ksafe p4-5)(not (wumpus-at p4-5)))
:effect (and(KNwumpus-at p4-5))
)
(:action R62
:precondition (and(pit-at p4-5)(Kpit-at p4-5)(not (safe p4-5)))
:effect (and(KNsafe p4-5))
)
(:action R63
:precondition (and(safe p4-5)(Ksafe p4-5)(not (pit-at p4-5)))
:effect (and(KNpit-at p4-5))
)
(:action R64
:precondition (and(not (wumpus-at p4-5))(KNwumpus-at p4-5)(not (pit-at p4-5))(KNpit-at p4-5)(safe p4-5))
:effect (and(Ksafe p4-5))
)
(:action R65
:precondition (and(not (safe p4-5))(KNsafe p4-5)(not (pit-at p4-5))(KNpit-at p4-5)(wumpus-at p4-5))
:effect (and(Kwumpus-at p4-5))
)
(:action R66
:precondition (and(not (safe p4-5))(KNsafe p4-5)(not (wumpus-at p4-5))(KNwumpus-at p4-5)(pit-at p4-5))
:effect (and(Kpit-at p4-5))
)
(:action R67
:precondition (and(wumpus-at p5-4)(Kwumpus-at p5-4)(not (safe p5-4)))
:effect (and(KNsafe p5-4))
)
(:action R68
:precondition (and(safe p5-4)(Ksafe p5-4)(not (wumpus-at p5-4)))
:effect (and(KNwumpus-at p5-4))
)
(:action R69
:precondition (and(pit-at p5-4)(Kpit-at p5-4)(not (safe p5-4)))
:effect (and(KNsafe p5-4))
)
(:action R70
:precondition (and(safe p5-4)(Ksafe p5-4)(not (pit-at p5-4)))
:effect (and(KNpit-at p5-4))
)
(:action R71
:precondition (and(not (wumpus-at p5-4))(KNwumpus-at p5-4)(not (pit-at p5-4))(KNpit-at p5-4)(safe p5-4))
:effect (and(Ksafe p5-4))
)
(:action R72
:precondition (and(not (safe p5-4))(KNsafe p5-4)(not (pit-at p5-4))(KNpit-at p5-4)(wumpus-at p5-4))
:effect (and(Kwumpus-at p5-4))
)
(:action R73
:precondition (and(not (safe p5-4))(KNsafe p5-4)(not (wumpus-at p5-4))(KNwumpus-at p5-4)(pit-at p5-4))
:effect (and(Kpit-at p5-4))
)
(:action R74
:precondition (and(wumpus-at p5-6)(Kwumpus-at p5-6)(not (safe p5-6)))
:effect (and(KNsafe p5-6))
)
(:action R75
:precondition (and(safe p5-6)(Ksafe p5-6)(not (wumpus-at p5-6)))
:effect (and(KNwumpus-at p5-6))
)
(:action R76
:precondition (and(pit-at p5-6)(Kpit-at p5-6)(not (safe p5-6)))
:effect (and(KNsafe p5-6))
)
(:action R77
:precondition (and(safe p5-6)(Ksafe p5-6)(not (pit-at p5-6)))
:effect (and(KNpit-at p5-6))
)
(:action R78
:precondition (and(not (wumpus-at p5-6))(KNwumpus-at p5-6)(not (pit-at p5-6))(KNpit-at p5-6)(safe p5-6))
:effect (and(Ksafe p5-6))
)
(:action R79
:precondition (and(not (safe p5-6))(KNsafe p5-6)(not (pit-at p5-6))(KNpit-at p5-6)(wumpus-at p5-6))
:effect (and(Kwumpus-at p5-6))
)
(:action R80
:precondition (and(not (safe p5-6))(KNsafe p5-6)(not (wumpus-at p5-6))(KNwumpus-at p5-6)(pit-at p5-6))
:effect (and(Kpit-at p5-6))
)
(:action R81
:precondition (and(wumpus-at p6-5)(Kwumpus-at p6-5)(not (safe p6-5)))
:effect (and(KNsafe p6-5))
)
(:action R82
:precondition (and(safe p6-5)(Ksafe p6-5)(not (wumpus-at p6-5)))
:effect (and(KNwumpus-at p6-5))
)
(:action R83
:precondition (and(pit-at p6-5)(Kpit-at p6-5)(not (safe p6-5)))
:effect (and(KNsafe p6-5))
)
(:action R84
:precondition (and(safe p6-5)(Ksafe p6-5)(not (pit-at p6-5)))
:effect (and(KNpit-at p6-5))
)
(:action R85
:precondition (and(not (wumpus-at p6-5))(KNwumpus-at p6-5)(not (pit-at p6-5))(KNpit-at p6-5)(safe p6-5))
:effect (and(Ksafe p6-5))
)
(:action R86
:precondition (and(not (safe p6-5))(KNsafe p6-5)(not (pit-at p6-5))(KNpit-at p6-5)(wumpus-at p6-5))
:effect (and(Kwumpus-at p6-5))
)
(:action R87
:precondition (and(not (safe p6-5))(KNsafe p6-5)(not (wumpus-at p6-5))(KNwumpus-at p6-5)(pit-at p6-5))
:effect (and(Kpit-at p6-5))
)
(:action R88
:precondition (and(wumpus-at p6-7)(Kwumpus-at p6-7)(not (safe p6-7)))
:effect (and(KNsafe p6-7))
)
(:action R89
:precondition (and(safe p6-7)(Ksafe p6-7)(not (wumpus-at p6-7)))
:effect (and(KNwumpus-at p6-7))
)
(:action R90
:precondition (and(pit-at p6-7)(Kpit-at p6-7)(not (safe p6-7)))
:effect (and(KNsafe p6-7))
)
(:action R91
:precondition (and(safe p6-7)(Ksafe p6-7)(not (pit-at p6-7)))
:effect (and(KNpit-at p6-7))
)
(:action R92
:precondition (and(not (wumpus-at p6-7))(KNwumpus-at p6-7)(not (pit-at p6-7))(KNpit-at p6-7)(safe p6-7))
:effect (and(Ksafe p6-7))
)
(:action R93
:precondition (and(not (safe p6-7))(KNsafe p6-7)(not (pit-at p6-7))(KNpit-at p6-7)(wumpus-at p6-7))
:effect (and(Kwumpus-at p6-7))
)
(:action R94
:precondition (and(not (safe p6-7))(KNsafe p6-7)(not (wumpus-at p6-7))(KNwumpus-at p6-7)(pit-at p6-7))
:effect (and(Kpit-at p6-7))
)
(:action R95
:precondition (and(wumpus-at p7-6)(Kwumpus-at p7-6)(not (safe p7-6)))
:effect (and(KNsafe p7-6))
)
(:action R96
:precondition (and(safe p7-6)(Ksafe p7-6)(not (wumpus-at p7-6)))
:effect (and(KNwumpus-at p7-6))
)
(:action R97
:precondition (and(pit-at p7-6)(Kpit-at p7-6)(not (safe p7-6)))
:effect (and(KNsafe p7-6))
)
(:action R98
:precondition (and(safe p7-6)(Ksafe p7-6)(not (pit-at p7-6)))
:effect (and(KNpit-at p7-6))
)
(:action R99
:precondition (and(not (wumpus-at p7-6))(KNwumpus-at p7-6)(not (pit-at p7-6))(KNpit-at p7-6)(safe p7-6))
:effect (and(Ksafe p7-6))
)
(:action R100
:precondition (and(not (safe p7-6))(KNsafe p7-6)(not (pit-at p7-6))(KNpit-at p7-6)(wumpus-at p7-6))
:effect (and(Kwumpus-at p7-6))
)
(:action R101
:precondition (and(not (safe p7-6))(KNsafe p7-6)(not (wumpus-at p7-6))(KNwumpus-at p7-6)(pit-at p7-6))
:effect (and(Kpit-at p7-6))
)
(:action R102
:precondition (and(wumpus-at p7-8)(Kwumpus-at p7-8)(not (safe p7-8)))
:effect (and(KNsafe p7-8))
)
(:action R103
:precondition (and(safe p7-8)(Ksafe p7-8)(not (wumpus-at p7-8)))
:effect (and(KNwumpus-at p7-8))
)
(:action R104
:precondition (and(pit-at p7-8)(Kpit-at p7-8)(not (safe p7-8)))
:effect (and(KNsafe p7-8))
)
(:action R105
:precondition (and(safe p7-8)(Ksafe p7-8)(not (pit-at p7-8)))
:effect (and(KNpit-at p7-8))
)
(:action R106
:precondition (and(not (wumpus-at p7-8))(KNwumpus-at p7-8)(not (pit-at p7-8))(KNpit-at p7-8)(safe p7-8))
:effect (and(Ksafe p7-8))
)
(:action R107
:precondition (and(not (safe p7-8))(KNsafe p7-8)(not (pit-at p7-8))(KNpit-at p7-8)(wumpus-at p7-8))
:effect (and(Kwumpus-at p7-8))
)
(:action R108
:precondition (and(not (safe p7-8))(KNsafe p7-8)(not (wumpus-at p7-8))(KNwumpus-at p7-8)(pit-at p7-8))
:effect (and(Kpit-at p7-8))
)
(:action R109
:precondition (and(wumpus-at p8-7)(Kwumpus-at p8-7)(not (safe p8-7)))
:effect (and(KNsafe p8-7))
)
(:action R110
:precondition (and(safe p8-7)(Ksafe p8-7)(not (wumpus-at p8-7)))
:effect (and(KNwumpus-at p8-7))
)
(:action R111
:precondition (and(pit-at p8-7)(Kpit-at p8-7)(not (safe p8-7)))
:effect (and(KNsafe p8-7))
)
(:action R112
:precondition (and(safe p8-7)(Ksafe p8-7)(not (pit-at p8-7)))
:effect (and(KNpit-at p8-7))
)
(:action R113
:precondition (and(not (wumpus-at p8-7))(KNwumpus-at p8-7)(not (pit-at p8-7))(KNpit-at p8-7)(safe p8-7))
:effect (and(Ksafe p8-7))
)
(:action R114
:precondition (and(not (safe p8-7))(KNsafe p8-7)(not (pit-at p8-7))(KNpit-at p8-7)(wumpus-at p8-7))
:effect (and(Kwumpus-at p8-7))
)
(:action R115
:precondition (and(not (safe p8-7))(KNsafe p8-7)(not (wumpus-at p8-7))(KNwumpus-at p8-7)(pit-at p8-7))
:effect (and(Kpit-at p8-7))
)
(:action R116
:precondition (and(wumpus-at p8-9)(Kwumpus-at p8-9)(not (safe p8-9)))
:effect (and(KNsafe p8-9))
)
(:action R117
:precondition (and(safe p8-9)(Ksafe p8-9)(not (wumpus-at p8-9)))
:effect (and(KNwumpus-at p8-9))
)
(:action R118
:precondition (and(pit-at p8-9)(Kpit-at p8-9)(not (safe p8-9)))
:effect (and(KNsafe p8-9))
)
(:action R119
:precondition (and(safe p8-9)(Ksafe p8-9)(not (pit-at p8-9)))
:effect (and(KNpit-at p8-9))
)
(:action R120
:precondition (and(not (wumpus-at p8-9))(KNwumpus-at p8-9)(not (pit-at p8-9))(KNpit-at p8-9)(safe p8-9))
:effect (and(Ksafe p8-9))
)
(:action R121
:precondition (and(not (safe p8-9))(KNsafe p8-9)(not (pit-at p8-9))(KNpit-at p8-9)(wumpus-at p8-9))
:effect (and(Kwumpus-at p8-9))
)
(:action R122
:precondition (and(not (safe p8-9))(KNsafe p8-9)(not (wumpus-at p8-9))(KNwumpus-at p8-9)(pit-at p8-9))
:effect (and(Kpit-at p8-9))
)
(:action R123
:precondition (and(wumpus-at p9-8)(Kwumpus-at p9-8)(not (safe p9-8)))
:effect (and(KNsafe p9-8))
)
(:action R124
:precondition (and(safe p9-8)(Ksafe p9-8)(not (wumpus-at p9-8)))
:effect (and(KNwumpus-at p9-8))
)
(:action R125
:precondition (and(pit-at p9-8)(Kpit-at p9-8)(not (safe p9-8)))
:effect (and(KNsafe p9-8))
)
(:action R126
:precondition (and(safe p9-8)(Ksafe p9-8)(not (pit-at p9-8)))
:effect (and(KNpit-at p9-8))
)
(:action R127
:precondition (and(not (wumpus-at p9-8))(KNwumpus-at p9-8)(not (pit-at p9-8))(KNpit-at p9-8)(safe p9-8))
:effect (and(Ksafe p9-8))
)
(:action R128
:precondition (and(not (safe p9-8))(KNsafe p9-8)(not (pit-at p9-8))(KNpit-at p9-8)(wumpus-at p9-8))
:effect (and(Kwumpus-at p9-8))
)
(:action R129
:precondition (and(not (safe p9-8))(KNsafe p9-8)(not (wumpus-at p9-8))(KNwumpus-at p9-8)(pit-at p9-8))
:effect (and(Kpit-at p9-8))
)
(:action R130
:precondition (and(wumpus-at p9-10)(Kwumpus-at p9-10)(not (safe p9-10)))
:effect (and(KNsafe p9-10))
)
(:action R131
:precondition (and(safe p9-10)(Ksafe p9-10)(not (wumpus-at p9-10)))
:effect (and(KNwumpus-at p9-10))
)
(:action R132
:precondition (and(pit-at p9-10)(Kpit-at p9-10)(not (safe p9-10)))
:effect (and(KNsafe p9-10))
)
(:action R133
:precondition (and(safe p9-10)(Ksafe p9-10)(not (pit-at p9-10)))
:effect (and(KNpit-at p9-10))
)
(:action R134
:precondition (and(not (wumpus-at p9-10))(KNwumpus-at p9-10)(not (pit-at p9-10))(KNpit-at p9-10)(safe p9-10))
:effect (and(Ksafe p9-10))
)
(:action R135
:precondition (and(not (safe p9-10))(KNsafe p9-10)(not (pit-at p9-10))(KNpit-at p9-10)(wumpus-at p9-10))
:effect (and(Kwumpus-at p9-10))
)
(:action R136
:precondition (and(not (safe p9-10))(KNsafe p9-10)(not (wumpus-at p9-10))(KNwumpus-at p9-10)(pit-at p9-10))
:effect (and(Kpit-at p9-10))
)
(:action R137
:precondition (and(wumpus-at p10-9)(Kwumpus-at p10-9)(not (safe p10-9)))
:effect (and(KNsafe p10-9))
)
(:action R138
:precondition (and(safe p10-9)(Ksafe p10-9)(not (wumpus-at p10-9)))
:effect (and(KNwumpus-at p10-9))
)
(:action R139
:precondition (and(pit-at p10-9)(Kpit-at p10-9)(not (safe p10-9)))
:effect (and(KNsafe p10-9))
)
(:action R140
:precondition (and(safe p10-9)(Ksafe p10-9)(not (pit-at p10-9)))
:effect (and(KNpit-at p10-9))
)
(:action R141
:precondition (and(not (wumpus-at p10-9))(KNwumpus-at p10-9)(not (pit-at p10-9))(KNpit-at p10-9)(safe p10-9))
:effect (and(Ksafe p10-9))
)
(:action R142
:precondition (and(not (safe p10-9))(KNsafe p10-9)(not (pit-at p10-9))(KNpit-at p10-9)(wumpus-at p10-9))
:effect (and(Kwumpus-at p10-9))
)
(:action R143
:precondition (and(not (safe p10-9))(KNsafe p10-9)(not (wumpus-at p10-9))(KNwumpus-at p10-9)(pit-at p10-9))
:effect (and(Kpit-at p10-9))
)
(:action R144
:precondition (and(wumpus-at p2-3)(Kwumpus-at p2-3)(stench p1-3))
:effect (and(Kstench p1-3))
)
(:action R145
:precondition (and(not (stench p1-3))(KNstench p1-3)(not (wumpus-at p2-3)))
:effect (and(KNwumpus-at p2-3))
)
(:action R146
:precondition (and(not (wumpus-at p2-3))(KNwumpus-at p2-3)(not (stench p1-3)))
:effect (and(KNstench p1-3))
)
(:action R147
:precondition (and(stench p1-3)(Kstench p1-3)(wumpus-at p2-3))
:effect (and(Kwumpus-at p2-3))
)
(:action R148
:precondition (and(wumpus-at p3-2)(Kwumpus-at p3-2)(stench p3-1))
:effect (and(Kstench p3-1))
)
(:action R149
:precondition (and(not (stench p3-1))(KNstench p3-1)(not (wumpus-at p3-2)))
:effect (and(KNwumpus-at p3-2))
)
(:action R150
:precondition (and(not (wumpus-at p3-2))(KNwumpus-at p3-2)(not (stench p3-1)))
:effect (and(KNstench p3-1))
)
(:action R151
:precondition (and(stench p3-1)(Kstench p3-1)(wumpus-at p3-2))
:effect (and(Kwumpus-at p3-2))
)
(:action R152
:precondition (and(not (wumpus-at p3-2))(KNwumpus-at p3-2)(not (wumpus-at p2-3))(KNwumpus-at p2-3)(not (stench p2-2)))
:effect (and(KNstench p2-2))
)
(:action R153
:precondition (and(stench p2-2)(Kstench p2-2)(not (wumpus-at p2-3))(KNwumpus-at p2-3)(wumpus-at p3-2))
:effect (and(Kwumpus-at p3-2))
)
(:action R154
:precondition (and(stench p2-2)(Kstench p2-2)(not (wumpus-at p3-2))(KNwumpus-at p3-2)(wumpus-at p2-3))
:effect (and(Kwumpus-at p2-3))
)
(:action R155
:precondition (and(wumpus-at p3-2)(Kwumpus-at p3-2)(stench p2-2))
:effect (and(Kstench p2-2))
)
(:action R156
:precondition (and(not (stench p2-2))(KNstench p2-2)(not (wumpus-at p3-2)))
:effect (and(KNwumpus-at p3-2))
)
(:action R157
:precondition (and(wumpus-at p2-3)(Kwumpus-at p2-3)(stench p2-2))
:effect (and(Kstench p2-2))
)
(:action R158
:precondition (and(not (stench p2-2))(KNstench p2-2)(not (wumpus-at p2-3)))
:effect (and(KNwumpus-at p2-3))
)
(:action R159
:precondition (and(not (wumpus-at p2-3))(KNwumpus-at p2-3)(not (wumpus-at p3-4))(KNwumpus-at p3-4)(not (stench p2-4)))
:effect (and(KNstench p2-4))
)
(:action R160
:precondition (and(stench p2-4)(Kstench p2-4)(not (wumpus-at p3-4))(KNwumpus-at p3-4)(wumpus-at p2-3))
:effect (and(Kwumpus-at p2-3))
)
(:action R161
:precondition (and(stench p2-4)(Kstench p2-4)(not (wumpus-at p2-3))(KNwumpus-at p2-3)(wumpus-at p3-4))
:effect (and(Kwumpus-at p3-4))
)
(:action R162
:precondition (and(wumpus-at p2-3)(Kwumpus-at p2-3)(stench p2-4))
:effect (and(Kstench p2-4))
)
(:action R163
:precondition (and(not (stench p2-4))(KNstench p2-4)(not (wumpus-at p2-3)))
:effect (and(KNwumpus-at p2-3))
)
(:action R164
:precondition (and(wumpus-at p3-4)(Kwumpus-at p3-4)(stench p2-4))
:effect (and(Kstench p2-4))
)
(:action R165
:precondition (and(not (stench p2-4))(KNstench p2-4)(not (wumpus-at p3-4)))
:effect (and(KNwumpus-at p3-4))
)
(:action R166
:precondition (and(not (wumpus-at p4-3))(KNwumpus-at p4-3)(not (wumpus-at p3-2))(KNwumpus-at p3-2)(not (stench p4-2)))
:effect (and(KNstench p4-2))
)
(:action R167
:precondition (and(stench p4-2)(Kstench p4-2)(not (wumpus-at p3-2))(KNwumpus-at p3-2)(wumpus-at p4-3))
:effect (and(Kwumpus-at p4-3))
)
(:action R168
:precondition (and(stench p4-2)(Kstench p4-2)(not (wumpus-at p4-3))(KNwumpus-at p4-3)(wumpus-at p3-2))
:effect (and(Kwumpus-at p3-2))
)
(:action R169
:precondition (and(wumpus-at p4-3)(Kwumpus-at p4-3)(stench p4-2))
:effect (and(Kstench p4-2))
)
(:action R170
:precondition (and(not (stench p4-2))(KNstench p4-2)(not (wumpus-at p4-3)))
:effect (and(KNwumpus-at p4-3))
)
(:action R171
:precondition (and(wumpus-at p3-2)(Kwumpus-at p3-2)(stench p4-2))
:effect (and(Kstench p4-2))
)
(:action R172
:precondition (and(not (stench p4-2))(KNstench p4-2)(not (wumpus-at p3-2)))
:effect (and(KNwumpus-at p3-2))
)
(:action R173
:precondition (and(not (wumpus-at p4-3))(KNwumpus-at p4-3)(not (wumpus-at p3-2))(KNwumpus-at p3-2)(not (wumpus-at p2-3))(KNwumpus-at p2-3)(not (wumpus-at p3-4))(KNwumpus-at p3-4)(not (stench p3-3)))
:effect (and(KNstench p3-3))
)
(:action R174
:precondition (and(stench p3-3)(Kstench p3-3)(not (wumpus-at p3-2))(KNwumpus-at p3-2)(not (wumpus-at p2-3))(KNwumpus-at p2-3)(not (wumpus-at p3-4))(KNwumpus-at p3-4)(wumpus-at p4-3))
:effect (and(Kwumpus-at p4-3))
)
(:action R175
:precondition (and(stench p3-3)(Kstench p3-3)(not (wumpus-at p4-3))(KNwumpus-at p4-3)(not (wumpus-at p2-3))(KNwumpus-at p2-3)(not (wumpus-at p3-4))(KNwumpus-at p3-4)(wumpus-at p3-2))
:effect (and(Kwumpus-at p3-2))
)
(:action R176
:precondition (and(stench p3-3)(Kstench p3-3)(not (wumpus-at p4-3))(KNwumpus-at p4-3)(not (wumpus-at p3-2))(KNwumpus-at p3-2)(not (wumpus-at p3-4))(KNwumpus-at p3-4)(wumpus-at p2-3))
:effect (and(Kwumpus-at p2-3))
)
(:action R177
:precondition (and(stench p3-3)(Kstench p3-3)(not (wumpus-at p4-3))(KNwumpus-at p4-3)(not (wumpus-at p3-2))(KNwumpus-at p3-2)(not (wumpus-at p2-3))(KNwumpus-at p2-3)(wumpus-at p3-4))
:effect (and(Kwumpus-at p3-4))
)
(:action R178
:precondition (and(wumpus-at p4-3)(Kwumpus-at p4-3)(stench p3-3))
:effect (and(Kstench p3-3))
)
(:action R179
:precondition (and(not (stench p3-3))(KNstench p3-3)(not (wumpus-at p4-3)))
:effect (and(KNwumpus-at p4-3))
)
(:action R180
:precondition (and(wumpus-at p3-2)(Kwumpus-at p3-2)(stench p3-3))
:effect (and(Kstench p3-3))
)
(:action R181
:precondition (and(not (stench p3-3))(KNstench p3-3)(not (wumpus-at p3-2)))
:effect (and(KNwumpus-at p3-2))
)
(:action R182
:precondition (and(wumpus-at p2-3)(Kwumpus-at p2-3)(stench p3-3))
:effect (and(Kstench p3-3))
)
(:action R183
:precondition (and(not (stench p3-3))(KNstench p3-3)(not (wumpus-at p2-3)))
:effect (and(KNwumpus-at p2-3))
)
(:action R184
:precondition (and(wumpus-at p3-4)(Kwumpus-at p3-4)(stench p3-3))
:effect (and(Kstench p3-3))
)
(:action R185
:precondition (and(not (stench p3-3))(KNstench p3-3)(not (wumpus-at p3-4)))
:effect (and(KNwumpus-at p3-4))
)
(:action R186
:precondition (and(not (wumpus-at p3-4))(KNwumpus-at p3-4)(not (wumpus-at p4-5))(KNwumpus-at p4-5)(not (stench p3-5)))
:effect (and(KNstench p3-5))
)
(:action R187
:precondition (and(stench p3-5)(Kstench p3-5)(not (wumpus-at p4-5))(KNwumpus-at p4-5)(wumpus-at p3-4))
:effect (and(Kwumpus-at p3-4))
)
(:action R188
:precondition (and(stench p3-5)(Kstench p3-5)(not (wumpus-at p3-4))(KNwumpus-at p3-4)(wumpus-at p4-5))
:effect (and(Kwumpus-at p4-5))
)
(:action R189
:precondition (and(wumpus-at p3-4)(Kwumpus-at p3-4)(stench p3-5))
:effect (and(Kstench p3-5))
)
(:action R190
:precondition (and(not (stench p3-5))(KNstench p3-5)(not (wumpus-at p3-4)))
:effect (and(KNwumpus-at p3-4))
)
(:action R191
:precondition (and(wumpus-at p4-5)(Kwumpus-at p4-5)(stench p3-5))
:effect (and(Kstench p3-5))
)
(:action R192
:precondition (and(not (stench p3-5))(KNstench p3-5)(not (wumpus-at p4-5)))
:effect (and(KNwumpus-at p4-5))
)
(:action R193
:precondition (and(not (wumpus-at p5-4))(KNwumpus-at p5-4)(not (wumpus-at p4-3))(KNwumpus-at p4-3)(not (stench p5-3)))
:effect (and(KNstench p5-3))
)
(:action R194
:precondition (and(stench p5-3)(Kstench p5-3)(not (wumpus-at p4-3))(KNwumpus-at p4-3)(wumpus-at p5-4))
:effect (and(Kwumpus-at p5-4))
)
(:action R195
:precondition (and(stench p5-3)(Kstench p5-3)(not (wumpus-at p5-4))(KNwumpus-at p5-4)(wumpus-at p4-3))
:effect (and(Kwumpus-at p4-3))
)
(:action R196
:precondition (and(wumpus-at p5-4)(Kwumpus-at p5-4)(stench p5-3))
:effect (and(Kstench p5-3))
)
(:action R197
:precondition (and(not (stench p5-3))(KNstench p5-3)(not (wumpus-at p5-4)))
:effect (and(KNwumpus-at p5-4))
)
(:action R198
:precondition (and(wumpus-at p4-3)(Kwumpus-at p4-3)(stench p5-3))
:effect (and(Kstench p5-3))
)
(:action R199
:precondition (and(not (stench p5-3))(KNstench p5-3)(not (wumpus-at p4-3)))
:effect (and(KNwumpus-at p4-3))
)
(:action R200
:precondition (and(not (wumpus-at p5-4))(KNwumpus-at p5-4)(not (wumpus-at p4-3))(KNwumpus-at p4-3)(not (wumpus-at p3-4))(KNwumpus-at p3-4)(not (wumpus-at p4-5))(KNwumpus-at p4-5)(not (stench p4-4)))
:effect (and(KNstench p4-4))
)
(:action R201
:precondition (and(stench p4-4)(Kstench p4-4)(not (wumpus-at p4-3))(KNwumpus-at p4-3)(not (wumpus-at p3-4))(KNwumpus-at p3-4)(not (wumpus-at p4-5))(KNwumpus-at p4-5)(wumpus-at p5-4))
:effect (and(Kwumpus-at p5-4))
)
(:action R202
:precondition (and(stench p4-4)(Kstench p4-4)(not (wumpus-at p5-4))(KNwumpus-at p5-4)(not (wumpus-at p3-4))(KNwumpus-at p3-4)(not (wumpus-at p4-5))(KNwumpus-at p4-5)(wumpus-at p4-3))
:effect (and(Kwumpus-at p4-3))
)
(:action R203
:precondition (and(stench p4-4)(Kstench p4-4)(not (wumpus-at p5-4))(KNwumpus-at p5-4)(not (wumpus-at p4-3))(KNwumpus-at p4-3)(not (wumpus-at p4-5))(KNwumpus-at p4-5)(wumpus-at p3-4))
:effect (and(Kwumpus-at p3-4))
)
(:action R204
:precondition (and(stench p4-4)(Kstench p4-4)(not (wumpus-at p5-4))(KNwumpus-at p5-4)(not (wumpus-at p4-3))(KNwumpus-at p4-3)(not (wumpus-at p3-4))(KNwumpus-at p3-4)(wumpus-at p4-5))
:effect (and(Kwumpus-at p4-5))
)
(:action R205
:precondition (and(wumpus-at p5-4)(Kwumpus-at p5-4)(stench p4-4))
:effect (and(Kstench p4-4))
)
(:action R206
:precondition (and(not (stench p4-4))(KNstench p4-4)(not (wumpus-at p5-4)))
:effect (and(KNwumpus-at p5-4))
)
(:action R207
:precondition (and(wumpus-at p4-3)(Kwumpus-at p4-3)(stench p4-4))
:effect (and(Kstench p4-4))
)
(:action R208
:precondition (and(not (stench p4-4))(KNstench p4-4)(not (wumpus-at p4-3)))
:effect (and(KNwumpus-at p4-3))
)
(:action R209
:precondition (and(wumpus-at p3-4)(Kwumpus-at p3-4)(stench p4-4))
:effect (and(Kstench p4-4))
)
(:action R210
:precondition (and(not (stench p4-4))(KNstench p4-4)(not (wumpus-at p3-4)))
:effect (and(KNwumpus-at p3-4))
)
(:action R211
:precondition (and(wumpus-at p4-5)(Kwumpus-at p4-5)(stench p4-4))
:effect (and(Kstench p4-4))
)
(:action R212
:precondition (and(not (stench p4-4))(KNstench p4-4)(not (wumpus-at p4-5)))
:effect (and(KNwumpus-at p4-5))
)
(:action R213
:precondition (and(not (wumpus-at p4-5))(KNwumpus-at p4-5)(not (wumpus-at p5-6))(KNwumpus-at p5-6)(not (stench p4-6)))
:effect (and(KNstench p4-6))
)
(:action R214
:precondition (and(stench p4-6)(Kstench p4-6)(not (wumpus-at p5-6))(KNwumpus-at p5-6)(wumpus-at p4-5))
:effect (and(Kwumpus-at p4-5))
)
(:action R215
:precondition (and(stench p4-6)(Kstench p4-6)(not (wumpus-at p4-5))(KNwumpus-at p4-5)(wumpus-at p5-6))
:effect (and(Kwumpus-at p5-6))
)
(:action R216
:precondition (and(wumpus-at p4-5)(Kwumpus-at p4-5)(stench p4-6))
:effect (and(Kstench p4-6))
)
(:action R217
:precondition (and(not (stench p4-6))(KNstench p4-6)(not (wumpus-at p4-5)))
:effect (and(KNwumpus-at p4-5))
)
(:action R218
:precondition (and(wumpus-at p5-6)(Kwumpus-at p5-6)(stench p4-6))
:effect (and(Kstench p4-6))
)
(:action R219
:precondition (and(not (stench p4-6))(KNstench p4-6)(not (wumpus-at p5-6)))
:effect (and(KNwumpus-at p5-6))
)
(:action R220
:precondition (and(not (wumpus-at p6-5))(KNwumpus-at p6-5)(not (wumpus-at p5-4))(KNwumpus-at p5-4)(not (stench p6-4)))
:effect (and(KNstench p6-4))
)
(:action R221
:precondition (and(stench p6-4)(Kstench p6-4)(not (wumpus-at p5-4))(KNwumpus-at p5-4)(wumpus-at p6-5))
:effect (and(Kwumpus-at p6-5))
)
(:action R222
:precondition (and(stench p6-4)(Kstench p6-4)(not (wumpus-at p6-5))(KNwumpus-at p6-5)(wumpus-at p5-4))
:effect (and(Kwumpus-at p5-4))
)
(:action R223
:precondition (and(wumpus-at p6-5)(Kwumpus-at p6-5)(stench p6-4))
:effect (and(Kstench p6-4))
)
(:action R224
:precondition (and(not (stench p6-4))(KNstench p6-4)(not (wumpus-at p6-5)))
:effect (and(KNwumpus-at p6-5))
)
(:action R225
:precondition (and(wumpus-at p5-4)(Kwumpus-at p5-4)(stench p6-4))
:effect (and(Kstench p6-4))
)
(:action R226
:precondition (and(not (stench p6-4))(KNstench p6-4)(not (wumpus-at p5-4)))
:effect (and(KNwumpus-at p5-4))
)
(:action R227
:precondition (and(not (wumpus-at p6-5))(KNwumpus-at p6-5)(not (wumpus-at p5-4))(KNwumpus-at p5-4)(not (wumpus-at p4-5))(KNwumpus-at p4-5)(not (wumpus-at p5-6))(KNwumpus-at p5-6)(not (stench p5-5)))
:effect (and(KNstench p5-5))
)
(:action R228
:precondition (and(stench p5-5)(Kstench p5-5)(not (wumpus-at p5-4))(KNwumpus-at p5-4)(not (wumpus-at p4-5))(KNwumpus-at p4-5)(not (wumpus-at p5-6))(KNwumpus-at p5-6)(wumpus-at p6-5))
:effect (and(Kwumpus-at p6-5))
)
(:action R229
:precondition (and(stench p5-5)(Kstench p5-5)(not (wumpus-at p6-5))(KNwumpus-at p6-5)(not (wumpus-at p4-5))(KNwumpus-at p4-5)(not (wumpus-at p5-6))(KNwumpus-at p5-6)(wumpus-at p5-4))
:effect (and(Kwumpus-at p5-4))
)
(:action R230
:precondition (and(stench p5-5)(Kstench p5-5)(not (wumpus-at p6-5))(KNwumpus-at p6-5)(not (wumpus-at p5-4))(KNwumpus-at p5-4)(not (wumpus-at p5-6))(KNwumpus-at p5-6)(wumpus-at p4-5))
:effect (and(Kwumpus-at p4-5))
)
(:action R231
:precondition (and(stench p5-5)(Kstench p5-5)(not (wumpus-at p6-5))(KNwumpus-at p6-5)(not (wumpus-at p5-4))(KNwumpus-at p5-4)(not (wumpus-at p4-5))(KNwumpus-at p4-5)(wumpus-at p5-6))
:effect (and(Kwumpus-at p5-6))
)
(:action R232
:precondition (and(wumpus-at p6-5)(Kwumpus-at p6-5)(stench p5-5))
:effect (and(Kstench p5-5))
)
(:action R233
:precondition (and(not (stench p5-5))(KNstench p5-5)(not (wumpus-at p6-5)))
:effect (and(KNwumpus-at p6-5))
)
(:action R234
:precondition (and(wumpus-at p5-4)(Kwumpus-at p5-4)(stench p5-5))
:effect (and(Kstench p5-5))
)
(:action R235
:precondition (and(not (stench p5-5))(KNstench p5-5)(not (wumpus-at p5-4)))
:effect (and(KNwumpus-at p5-4))
)
(:action R236
:precondition (and(wumpus-at p4-5)(Kwumpus-at p4-5)(stench p5-5))
:effect (and(Kstench p5-5))
)
(:action R237
:precondition (and(not (stench p5-5))(KNstench p5-5)(not (wumpus-at p4-5)))
:effect (and(KNwumpus-at p4-5))
)
(:action R238
:precondition (and(wumpus-at p5-6)(Kwumpus-at p5-6)(stench p5-5))
:effect (and(Kstench p5-5))
)
(:action R239
:precondition (and(not (stench p5-5))(KNstench p5-5)(not (wumpus-at p5-6)))
:effect (and(KNwumpus-at p5-6))
)
(:action R240
:precondition (and(not (wumpus-at p5-6))(KNwumpus-at p5-6)(not (wumpus-at p6-7))(KNwumpus-at p6-7)(not (stench p5-7)))
:effect (and(KNstench p5-7))
)
(:action R241
:precondition (and(stench p5-7)(Kstench p5-7)(not (wumpus-at p6-7))(KNwumpus-at p6-7)(wumpus-at p5-6))
:effect (and(Kwumpus-at p5-6))
)
(:action R242
:precondition (and(stench p5-7)(Kstench p5-7)(not (wumpus-at p5-6))(KNwumpus-at p5-6)(wumpus-at p6-7))
:effect (and(Kwumpus-at p6-7))
)
(:action R243
:precondition (and(wumpus-at p5-6)(Kwumpus-at p5-6)(stench p5-7))
:effect (and(Kstench p5-7))
)
(:action R244
:precondition (and(not (stench p5-7))(KNstench p5-7)(not (wumpus-at p5-6)))
:effect (and(KNwumpus-at p5-6))
)
(:action R245
:precondition (and(wumpus-at p6-7)(Kwumpus-at p6-7)(stench p5-7))
:effect (and(Kstench p5-7))
)
(:action R246
:precondition (and(not (stench p5-7))(KNstench p5-7)(not (wumpus-at p6-7)))
:effect (and(KNwumpus-at p6-7))
)
(:action R247
:precondition (and(not (wumpus-at p7-6))(KNwumpus-at p7-6)(not (wumpus-at p6-5))(KNwumpus-at p6-5)(not (stench p7-5)))
:effect (and(KNstench p7-5))
)
(:action R248
:precondition (and(stench p7-5)(Kstench p7-5)(not (wumpus-at p6-5))(KNwumpus-at p6-5)(wumpus-at p7-6))
:effect (and(Kwumpus-at p7-6))
)
(:action R249
:precondition (and(stench p7-5)(Kstench p7-5)(not (wumpus-at p7-6))(KNwumpus-at p7-6)(wumpus-at p6-5))
:effect (and(Kwumpus-at p6-5))
)
(:action R250
:precondition (and(wumpus-at p7-6)(Kwumpus-at p7-6)(stench p7-5))
:effect (and(Kstench p7-5))
)
(:action R251
:precondition (and(not (stench p7-5))(KNstench p7-5)(not (wumpus-at p7-6)))
:effect (and(KNwumpus-at p7-6))
)
(:action R252
:precondition (and(wumpus-at p6-5)(Kwumpus-at p6-5)(stench p7-5))
:effect (and(Kstench p7-5))
)
(:action R253
:precondition (and(not (stench p7-5))(KNstench p7-5)(not (wumpus-at p6-5)))
:effect (and(KNwumpus-at p6-5))
)
(:action R254
:precondition (and(not (wumpus-at p7-6))(KNwumpus-at p7-6)(not (wumpus-at p6-5))(KNwumpus-at p6-5)(not (wumpus-at p5-6))(KNwumpus-at p5-6)(not (wumpus-at p6-7))(KNwumpus-at p6-7)(not (stench p6-6)))
:effect (and(KNstench p6-6))
)
(:action R255
:precondition (and(stench p6-6)(Kstench p6-6)(not (wumpus-at p6-5))(KNwumpus-at p6-5)(not (wumpus-at p5-6))(KNwumpus-at p5-6)(not (wumpus-at p6-7))(KNwumpus-at p6-7)(wumpus-at p7-6))
:effect (and(Kwumpus-at p7-6))
)
(:action R256
:precondition (and(stench p6-6)(Kstench p6-6)(not (wumpus-at p7-6))(KNwumpus-at p7-6)(not (wumpus-at p5-6))(KNwumpus-at p5-6)(not (wumpus-at p6-7))(KNwumpus-at p6-7)(wumpus-at p6-5))
:effect (and(Kwumpus-at p6-5))
)
(:action R257
:precondition (and(stench p6-6)(Kstench p6-6)(not (wumpus-at p7-6))(KNwumpus-at p7-6)(not (wumpus-at p6-5))(KNwumpus-at p6-5)(not (wumpus-at p6-7))(KNwumpus-at p6-7)(wumpus-at p5-6))
:effect (and(Kwumpus-at p5-6))
)
(:action R258
:precondition (and(stench p6-6)(Kstench p6-6)(not (wumpus-at p7-6))(KNwumpus-at p7-6)(not (wumpus-at p6-5))(KNwumpus-at p6-5)(not (wumpus-at p5-6))(KNwumpus-at p5-6)(wumpus-at p6-7))
:effect (and(Kwumpus-at p6-7))
)
(:action R259
:precondition (and(wumpus-at p7-6)(Kwumpus-at p7-6)(stench p6-6))
:effect (and(Kstench p6-6))
)
(:action R260
:precondition (and(not (stench p6-6))(KNstench p6-6)(not (wumpus-at p7-6)))
:effect (and(KNwumpus-at p7-6))
)
(:action R261
:precondition (and(wumpus-at p6-5)(Kwumpus-at p6-5)(stench p6-6))
:effect (and(Kstench p6-6))
)
(:action R262
:precondition (and(not (stench p6-6))(KNstench p6-6)(not (wumpus-at p6-5)))
:effect (and(KNwumpus-at p6-5))
)
(:action R263
:precondition (and(wumpus-at p5-6)(Kwumpus-at p5-6)(stench p6-6))
:effect (and(Kstench p6-6))
)
(:action R264
:precondition (and(not (stench p6-6))(KNstench p6-6)(not (wumpus-at p5-6)))
:effect (and(KNwumpus-at p5-6))
)
(:action R265
:precondition (and(wumpus-at p6-7)(Kwumpus-at p6-7)(stench p6-6))
:effect (and(Kstench p6-6))
)
(:action R266
:precondition (and(not (stench p6-6))(KNstench p6-6)(not (wumpus-at p6-7)))
:effect (and(KNwumpus-at p6-7))
)
(:action R267
:precondition (and(not (wumpus-at p6-7))(KNwumpus-at p6-7)(not (wumpus-at p7-8))(KNwumpus-at p7-8)(not (stench p6-8)))
:effect (and(KNstench p6-8))
)
(:action R268
:precondition (and(stench p6-8)(Kstench p6-8)(not (wumpus-at p7-8))(KNwumpus-at p7-8)(wumpus-at p6-7))
:effect (and(Kwumpus-at p6-7))
)
(:action R269
:precondition (and(stench p6-8)(Kstench p6-8)(not (wumpus-at p6-7))(KNwumpus-at p6-7)(wumpus-at p7-8))
:effect (and(Kwumpus-at p7-8))
)
(:action R270
:precondition (and(wumpus-at p6-7)(Kwumpus-at p6-7)(stench p6-8))
:effect (and(Kstench p6-8))
)
(:action R271
:precondition (and(not (stench p6-8))(KNstench p6-8)(not (wumpus-at p6-7)))
:effect (and(KNwumpus-at p6-7))
)
(:action R272
:precondition (and(wumpus-at p7-8)(Kwumpus-at p7-8)(stench p6-8))
:effect (and(Kstench p6-8))
)
(:action R273
:precondition (and(not (stench p6-8))(KNstench p6-8)(not (wumpus-at p7-8)))
:effect (and(KNwumpus-at p7-8))
)
(:action R274
:precondition (and(not (wumpus-at p8-7))(KNwumpus-at p8-7)(not (wumpus-at p7-6))(KNwumpus-at p7-6)(not (stench p8-6)))
:effect (and(KNstench p8-6))
)
(:action R275
:precondition (and(stench p8-6)(Kstench p8-6)(not (wumpus-at p7-6))(KNwumpus-at p7-6)(wumpus-at p8-7))
:effect (and(Kwumpus-at p8-7))
)
(:action R276
:precondition (and(stench p8-6)(Kstench p8-6)(not (wumpus-at p8-7))(KNwumpus-at p8-7)(wumpus-at p7-6))
:effect (and(Kwumpus-at p7-6))
)
(:action R277
:precondition (and(wumpus-at p8-7)(Kwumpus-at p8-7)(stench p8-6))
:effect (and(Kstench p8-6))
)
(:action R278
:precondition (and(not (stench p8-6))(KNstench p8-6)(not (wumpus-at p8-7)))
:effect (and(KNwumpus-at p8-7))
)
(:action R279
:precondition (and(wumpus-at p7-6)(Kwumpus-at p7-6)(stench p8-6))
:effect (and(Kstench p8-6))
)
(:action R280
:precondition (and(not (stench p8-6))(KNstench p8-6)(not (wumpus-at p7-6)))
:effect (and(KNwumpus-at p7-6))
)
(:action R281
:precondition (and(not (wumpus-at p8-7))(KNwumpus-at p8-7)(not (wumpus-at p7-6))(KNwumpus-at p7-6)(not (wumpus-at p6-7))(KNwumpus-at p6-7)(not (wumpus-at p7-8))(KNwumpus-at p7-8)(not (stench p7-7)))
:effect (and(KNstench p7-7))
)
(:action R282
:precondition (and(stench p7-7)(Kstench p7-7)(not (wumpus-at p7-6))(KNwumpus-at p7-6)(not (wumpus-at p6-7))(KNwumpus-at p6-7)(not (wumpus-at p7-8))(KNwumpus-at p7-8)(wumpus-at p8-7))
:effect (and(Kwumpus-at p8-7))
)
(:action R283
:precondition (and(stench p7-7)(Kstench p7-7)(not (wumpus-at p8-7))(KNwumpus-at p8-7)(not (wumpus-at p6-7))(KNwumpus-at p6-7)(not (wumpus-at p7-8))(KNwumpus-at p7-8)(wumpus-at p7-6))
:effect (and(Kwumpus-at p7-6))
)
(:action R284
:precondition (and(stench p7-7)(Kstench p7-7)(not (wumpus-at p8-7))(KNwumpus-at p8-7)(not (wumpus-at p7-6))(KNwumpus-at p7-6)(not (wumpus-at p7-8))(KNwumpus-at p7-8)(wumpus-at p6-7))
:effect (and(Kwumpus-at p6-7))
)
(:action R285
:precondition (and(stench p7-7)(Kstench p7-7)(not (wumpus-at p8-7))(KNwumpus-at p8-7)(not (wumpus-at p7-6))(KNwumpus-at p7-6)(not (wumpus-at p6-7))(KNwumpus-at p6-7)(wumpus-at p7-8))
:effect (and(Kwumpus-at p7-8))
)
(:action R286
:precondition (and(wumpus-at p8-7)(Kwumpus-at p8-7)(stench p7-7))
:effect (and(Kstench p7-7))
)
(:action R287
:precondition (and(not (stench p7-7))(KNstench p7-7)(not (wumpus-at p8-7)))
:effect (and(KNwumpus-at p8-7))
)
(:action R288
:precondition (and(wumpus-at p7-6)(Kwumpus-at p7-6)(stench p7-7))
:effect (and(Kstench p7-7))
)
(:action R289
:precondition (and(not (stench p7-7))(KNstench p7-7)(not (wumpus-at p7-6)))
:effect (and(KNwumpus-at p7-6))
)
(:action R290
:precondition (and(wumpus-at p6-7)(Kwumpus-at p6-7)(stench p7-7))
:effect (and(Kstench p7-7))
)
(:action R291
:precondition (and(not (stench p7-7))(KNstench p7-7)(not (wumpus-at p6-7)))
:effect (and(KNwumpus-at p6-7))
)
(:action R292
:precondition (and(wumpus-at p7-8)(Kwumpus-at p7-8)(stench p7-7))
:effect (and(Kstench p7-7))
)
(:action R293
:precondition (and(not (stench p7-7))(KNstench p7-7)(not (wumpus-at p7-8)))
:effect (and(KNwumpus-at p7-8))
)
(:action R294
:precondition (and(not (wumpus-at p7-8))(KNwumpus-at p7-8)(not (wumpus-at p8-9))(KNwumpus-at p8-9)(not (stench p7-9)))
:effect (and(KNstench p7-9))
)
(:action R295
:precondition (and(stench p7-9)(Kstench p7-9)(not (wumpus-at p8-9))(KNwumpus-at p8-9)(wumpus-at p7-8))
:effect (and(Kwumpus-at p7-8))
)
(:action R296
:precondition (and(stench p7-9)(Kstench p7-9)(not (wumpus-at p7-8))(KNwumpus-at p7-8)(wumpus-at p8-9))
:effect (and(Kwumpus-at p8-9))
)
(:action R297
:precondition (and(wumpus-at p7-8)(Kwumpus-at p7-8)(stench p7-9))
:effect (and(Kstench p7-9))
)
(:action R298
:precondition (and(not (stench p7-9))(KNstench p7-9)(not (wumpus-at p7-8)))
:effect (and(KNwumpus-at p7-8))
)
(:action R299
:precondition (and(wumpus-at p8-9)(Kwumpus-at p8-9)(stench p7-9))
:effect (and(Kstench p7-9))
)
(:action R300
:precondition (and(not (stench p7-9))(KNstench p7-9)(not (wumpus-at p8-9)))
:effect (and(KNwumpus-at p8-9))
)
(:action R301
:precondition (and(not (wumpus-at p9-8))(KNwumpus-at p9-8)(not (wumpus-at p8-7))(KNwumpus-at p8-7)(not (stench p9-7)))
:effect (and(KNstench p9-7))
)
(:action R302
:precondition (and(stench p9-7)(Kstench p9-7)(not (wumpus-at p8-7))(KNwumpus-at p8-7)(wumpus-at p9-8))
:effect (and(Kwumpus-at p9-8))
)
(:action R303
:precondition (and(stench p9-7)(Kstench p9-7)(not (wumpus-at p9-8))(KNwumpus-at p9-8)(wumpus-at p8-7))
:effect (and(Kwumpus-at p8-7))
)
(:action R304
:precondition (and(wumpus-at p9-8)(Kwumpus-at p9-8)(stench p9-7))
:effect (and(Kstench p9-7))
)
(:action R305
:precondition (and(not (stench p9-7))(KNstench p9-7)(not (wumpus-at p9-8)))
:effect (and(KNwumpus-at p9-8))
)
(:action R306
:precondition (and(wumpus-at p8-7)(Kwumpus-at p8-7)(stench p9-7))
:effect (and(Kstench p9-7))
)
(:action R307
:precondition (and(not (stench p9-7))(KNstench p9-7)(not (wumpus-at p8-7)))
:effect (and(KNwumpus-at p8-7))
)
(:action R308
:precondition (and(not (wumpus-at p9-8))(KNwumpus-at p9-8)(not (wumpus-at p8-7))(KNwumpus-at p8-7)(not (wumpus-at p7-8))(KNwumpus-at p7-8)(not (wumpus-at p8-9))(KNwumpus-at p8-9)(not (stench p8-8)))
:effect (and(KNstench p8-8))
)
(:action R309
:precondition (and(stench p8-8)(Kstench p8-8)(not (wumpus-at p8-7))(KNwumpus-at p8-7)(not (wumpus-at p7-8))(KNwumpus-at p7-8)(not (wumpus-at p8-9))(KNwumpus-at p8-9)(wumpus-at p9-8))
:effect (and(Kwumpus-at p9-8))
)
(:action R310
:precondition (and(stench p8-8)(Kstench p8-8)(not (wumpus-at p9-8))(KNwumpus-at p9-8)(not (wumpus-at p7-8))(KNwumpus-at p7-8)(not (wumpus-at p8-9))(KNwumpus-at p8-9)(wumpus-at p8-7))
:effect (and(Kwumpus-at p8-7))
)
(:action R311
:precondition (and(stench p8-8)(Kstench p8-8)(not (wumpus-at p9-8))(KNwumpus-at p9-8)(not (wumpus-at p8-7))(KNwumpus-at p8-7)(not (wumpus-at p8-9))(KNwumpus-at p8-9)(wumpus-at p7-8))
:effect (and(Kwumpus-at p7-8))
)
(:action R312
:precondition (and(stench p8-8)(Kstench p8-8)(not (wumpus-at p9-8))(KNwumpus-at p9-8)(not (wumpus-at p8-7))(KNwumpus-at p8-7)(not (wumpus-at p7-8))(KNwumpus-at p7-8)(wumpus-at p8-9))
:effect (and(Kwumpus-at p8-9))
)
(:action R313
:precondition (and(wumpus-at p9-8)(Kwumpus-at p9-8)(stench p8-8))
:effect (and(Kstench p8-8))
)
(:action R314
:precondition (and(not (stench p8-8))(KNstench p8-8)(not (wumpus-at p9-8)))
:effect (and(KNwumpus-at p9-8))
)
(:action R315
:precondition (and(wumpus-at p8-7)(Kwumpus-at p8-7)(stench p8-8))
:effect (and(Kstench p8-8))
)
(:action R316
:precondition (and(not (stench p8-8))(KNstench p8-8)(not (wumpus-at p8-7)))
:effect (and(KNwumpus-at p8-7))
)
(:action R317
:precondition (and(wumpus-at p7-8)(Kwumpus-at p7-8)(stench p8-8))
:effect (and(Kstench p8-8))
)
(:action R318
:precondition (and(not (stench p8-8))(KNstench p8-8)(not (wumpus-at p7-8)))
:effect (and(KNwumpus-at p7-8))
)
(:action R319
:precondition (and(wumpus-at p8-9)(Kwumpus-at p8-9)(stench p8-8))
:effect (and(Kstench p8-8))
)
(:action R320
:precondition (and(not (stench p8-8))(KNstench p8-8)(not (wumpus-at p8-9)))
:effect (and(KNwumpus-at p8-9))
)
(:action R321
:precondition (and(not (wumpus-at p8-9))(KNwumpus-at p8-9)(not (wumpus-at p9-10))(KNwumpus-at p9-10)(not (stench p8-10)))
:effect (and(KNstench p8-10))
)
(:action R322
:precondition (and(stench p8-10)(Kstench p8-10)(not (wumpus-at p9-10))(KNwumpus-at p9-10)(wumpus-at p8-9))
:effect (and(Kwumpus-at p8-9))
)
(:action R323
:precondition (and(stench p8-10)(Kstench p8-10)(not (wumpus-at p8-9))(KNwumpus-at p8-9)(wumpus-at p9-10))
:effect (and(Kwumpus-at p9-10))
)
(:action R324
:precondition (and(wumpus-at p8-9)(Kwumpus-at p8-9)(stench p8-10))
:effect (and(Kstench p8-10))
)
(:action R325
:precondition (and(not (stench p8-10))(KNstench p8-10)(not (wumpus-at p8-9)))
:effect (and(KNwumpus-at p8-9))
)
(:action R326
:precondition (and(wumpus-at p9-10)(Kwumpus-at p9-10)(stench p8-10))
:effect (and(Kstench p8-10))
)
(:action R327
:precondition (and(not (stench p8-10))(KNstench p8-10)(not (wumpus-at p9-10)))
:effect (and(KNwumpus-at p9-10))
)
(:action R328
:precondition (and(not (wumpus-at p10-9))(KNwumpus-at p10-9)(not (wumpus-at p9-8))(KNwumpus-at p9-8)(not (stench p10-8)))
:effect (and(KNstench p10-8))
)
(:action R329
:precondition (and(stench p10-8)(Kstench p10-8)(not (wumpus-at p9-8))(KNwumpus-at p9-8)(wumpus-at p10-9))
:effect (and(Kwumpus-at p10-9))
)
(:action R330
:precondition (and(stench p10-8)(Kstench p10-8)(not (wumpus-at p10-9))(KNwumpus-at p10-9)(wumpus-at p9-8))
:effect (and(Kwumpus-at p9-8))
)
(:action R331
:precondition (and(wumpus-at p10-9)(Kwumpus-at p10-9)(stench p10-8))
:effect (and(Kstench p10-8))
)
(:action R332
:precondition (and(not (stench p10-8))(KNstench p10-8)(not (wumpus-at p10-9)))
:effect (and(KNwumpus-at p10-9))
)
(:action R333
:precondition (and(wumpus-at p9-8)(Kwumpus-at p9-8)(stench p10-8))
:effect (and(Kstench p10-8))
)
(:action R334
:precondition (and(not (stench p10-8))(KNstench p10-8)(not (wumpus-at p9-8)))
:effect (and(KNwumpus-at p9-8))
)
(:action R335
:precondition (and(not (wumpus-at p10-9))(KNwumpus-at p10-9)(not (wumpus-at p9-8))(KNwumpus-at p9-8)(not (wumpus-at p8-9))(KNwumpus-at p8-9)(not (wumpus-at p9-10))(KNwumpus-at p9-10)(not (stench p9-9)))
:effect (and(KNstench p9-9))
)
(:action R336
:precondition (and(stench p9-9)(Kstench p9-9)(not (wumpus-at p9-8))(KNwumpus-at p9-8)(not (wumpus-at p8-9))(KNwumpus-at p8-9)(not (wumpus-at p9-10))(KNwumpus-at p9-10)(wumpus-at p10-9))
:effect (and(Kwumpus-at p10-9))
)
(:action R337
:precondition (and(stench p9-9)(Kstench p9-9)(not (wumpus-at p10-9))(KNwumpus-at p10-9)(not (wumpus-at p8-9))(KNwumpus-at p8-9)(not (wumpus-at p9-10))(KNwumpus-at p9-10)(wumpus-at p9-8))
:effect (and(Kwumpus-at p9-8))
)
(:action R338
:precondition (and(stench p9-9)(Kstench p9-9)(not (wumpus-at p10-9))(KNwumpus-at p10-9)(not (wumpus-at p9-8))(KNwumpus-at p9-8)(not (wumpus-at p9-10))(KNwumpus-at p9-10)(wumpus-at p8-9))
:effect (and(Kwumpus-at p8-9))
)
(:action R339
:precondition (and(stench p9-9)(Kstench p9-9)(not (wumpus-at p10-9))(KNwumpus-at p10-9)(not (wumpus-at p9-8))(KNwumpus-at p9-8)(not (wumpus-at p8-9))(KNwumpus-at p8-9)(wumpus-at p9-10))
:effect (and(Kwumpus-at p9-10))
)
(:action R340
:precondition (and(wumpus-at p10-9)(Kwumpus-at p10-9)(stench p9-9))
:effect (and(Kstench p9-9))
)
(:action R341
:precondition (and(not (stench p9-9))(KNstench p9-9)(not (wumpus-at p10-9)))
:effect (and(KNwumpus-at p10-9))
)
(:action R342
:precondition (and(wumpus-at p9-8)(Kwumpus-at p9-8)(stench p9-9))
:effect (and(Kstench p9-9))
)
(:action R343
:precondition (and(not (stench p9-9))(KNstench p9-9)(not (wumpus-at p9-8)))
:effect (and(KNwumpus-at p9-8))
)
(:action R344
:precondition (and(wumpus-at p8-9)(Kwumpus-at p8-9)(stench p9-9))
:effect (and(Kstench p9-9))
)
(:action R345
:precondition (and(not (stench p9-9))(KNstench p9-9)(not (wumpus-at p8-9)))
:effect (and(KNwumpus-at p8-9))
)
(:action R346
:precondition (and(wumpus-at p9-10)(Kwumpus-at p9-10)(stench p9-9))
:effect (and(Kstench p9-9))
)
(:action R347
:precondition (and(not (stench p9-9))(KNstench p9-9)(not (wumpus-at p9-10)))
:effect (and(KNwumpus-at p9-10))
)
(:action R348
:precondition (and(not (wumpus-at p9-10))(KNwumpus-at p9-10)(not (wumpus-at p10-9))(KNwumpus-at p10-9)(not (stench p10-10)))
:effect (and(KNstench p10-10))
)
(:action R349
:precondition (and(stench p10-10)(Kstench p10-10)(not (wumpus-at p10-9))(KNwumpus-at p10-9)(wumpus-at p9-10))
:effect (and(Kwumpus-at p9-10))
)
(:action R350
:precondition (and(stench p10-10)(Kstench p10-10)(not (wumpus-at p9-10))(KNwumpus-at p9-10)(wumpus-at p10-9))
:effect (and(Kwumpus-at p10-9))
)
(:action R351
:precondition (and(wumpus-at p9-10)(Kwumpus-at p9-10)(stench p10-10))
:effect (and(Kstench p10-10))
)
(:action R352
:precondition (and(not (stench p10-10))(KNstench p10-10)(not (wumpus-at p9-10)))
:effect (and(KNwumpus-at p9-10))
)
(:action R353
:precondition (and(wumpus-at p10-9)(Kwumpus-at p10-9)(stench p10-10))
:effect (and(Kstench p10-10))
)
(:action R354
:precondition (and(not (stench p10-10))(KNstench p10-10)(not (wumpus-at p10-9)))
:effect (and(KNwumpus-at p10-9))
)
(:action R355
:precondition (and(pit-at p2-3)(Kpit-at p2-3)(breeze p1-3))
:effect (and(Kbreeze p1-3))
)
(:action R356
:precondition (and(not (breeze p1-3))(KNbreeze p1-3)(not (pit-at p2-3)))
:effect (and(KNpit-at p2-3))
)
(:action R357
:precondition (and(not (pit-at p2-3))(KNpit-at p2-3)(not (breeze p1-3)))
:effect (and(KNbreeze p1-3))
)
(:action R358
:precondition (and(breeze p1-3)(Kbreeze p1-3)(pit-at p2-3))
:effect (and(Kpit-at p2-3))
)
(:action R359
:precondition (and(pit-at p3-2)(Kpit-at p3-2)(breeze p3-1))
:effect (and(Kbreeze p3-1))
)
(:action R360
:precondition (and(not (breeze p3-1))(KNbreeze p3-1)(not (pit-at p3-2)))
:effect (and(KNpit-at p3-2))
)
(:action R361
:precondition (and(not (pit-at p3-2))(KNpit-at p3-2)(not (breeze p3-1)))
:effect (and(KNbreeze p3-1))
)
(:action R362
:precondition (and(breeze p3-1)(Kbreeze p3-1)(pit-at p3-2))
:effect (and(Kpit-at p3-2))
)
(:action R363
:precondition (and(not (pit-at p3-2))(KNpit-at p3-2)(not (pit-at p2-3))(KNpit-at p2-3)(not (breeze p2-2)))
:effect (and(KNbreeze p2-2))
)
(:action R364
:precondition (and(breeze p2-2)(Kbreeze p2-2)(not (pit-at p2-3))(KNpit-at p2-3)(pit-at p3-2))
:effect (and(Kpit-at p3-2))
)
(:action R365
:precondition (and(breeze p2-2)(Kbreeze p2-2)(not (pit-at p3-2))(KNpit-at p3-2)(pit-at p2-3))
:effect (and(Kpit-at p2-3))
)
(:action R366
:precondition (and(pit-at p3-2)(Kpit-at p3-2)(breeze p2-2))
:effect (and(Kbreeze p2-2))
)
(:action R367
:precondition (and(not (breeze p2-2))(KNbreeze p2-2)(not (pit-at p3-2)))
:effect (and(KNpit-at p3-2))
)
(:action R368
:precondition (and(pit-at p2-3)(Kpit-at p2-3)(breeze p2-2))
:effect (and(Kbreeze p2-2))
)
(:action R369
:precondition (and(not (breeze p2-2))(KNbreeze p2-2)(not (pit-at p2-3)))
:effect (and(KNpit-at p2-3))
)
(:action R370
:precondition (and(not (pit-at p2-3))(KNpit-at p2-3)(not (pit-at p3-4))(KNpit-at p3-4)(not (breeze p2-4)))
:effect (and(KNbreeze p2-4))
)
(:action R371
:precondition (and(breeze p2-4)(Kbreeze p2-4)(not (pit-at p3-4))(KNpit-at p3-4)(pit-at p2-3))
:effect (and(Kpit-at p2-3))
)
(:action R372
:precondition (and(breeze p2-4)(Kbreeze p2-4)(not (pit-at p2-3))(KNpit-at p2-3)(pit-at p3-4))
:effect (and(Kpit-at p3-4))
)
(:action R373
:precondition (and(pit-at p2-3)(Kpit-at p2-3)(breeze p2-4))
:effect (and(Kbreeze p2-4))
)
(:action R374
:precondition (and(not (breeze p2-4))(KNbreeze p2-4)(not (pit-at p2-3)))
:effect (and(KNpit-at p2-3))
)
(:action R375
:precondition (and(pit-at p3-4)(Kpit-at p3-4)(breeze p2-4))
:effect (and(Kbreeze p2-4))
)
(:action R376
:precondition (and(not (breeze p2-4))(KNbreeze p2-4)(not (pit-at p3-4)))
:effect (and(KNpit-at p3-4))
)
(:action R377
:precondition (and(not (pit-at p4-3))(KNpit-at p4-3)(not (pit-at p3-2))(KNpit-at p3-2)(not (breeze p4-2)))
:effect (and(KNbreeze p4-2))
)
(:action R378
:precondition (and(breeze p4-2)(Kbreeze p4-2)(not (pit-at p3-2))(KNpit-at p3-2)(pit-at p4-3))
:effect (and(Kpit-at p4-3))
)
(:action R379
:precondition (and(breeze p4-2)(Kbreeze p4-2)(not (pit-at p4-3))(KNpit-at p4-3)(pit-at p3-2))
:effect (and(Kpit-at p3-2))
)
(:action R380
:precondition (and(pit-at p4-3)(Kpit-at p4-3)(breeze p4-2))
:effect (and(Kbreeze p4-2))
)
(:action R381
:precondition (and(not (breeze p4-2))(KNbreeze p4-2)(not (pit-at p4-3)))
:effect (and(KNpit-at p4-3))
)
(:action R382
:precondition (and(pit-at p3-2)(Kpit-at p3-2)(breeze p4-2))
:effect (and(Kbreeze p4-2))
)
(:action R383
:precondition (and(not (breeze p4-2))(KNbreeze p4-2)(not (pit-at p3-2)))
:effect (and(KNpit-at p3-2))
)
(:action R384
:precondition (and(not (pit-at p4-3))(KNpit-at p4-3)(not (pit-at p3-2))(KNpit-at p3-2)(not (pit-at p2-3))(KNpit-at p2-3)(not (pit-at p3-4))(KNpit-at p3-4)(not (breeze p3-3)))
:effect (and(KNbreeze p3-3))
)
(:action R385
:precondition (and(breeze p3-3)(Kbreeze p3-3)(not (pit-at p3-2))(KNpit-at p3-2)(not (pit-at p2-3))(KNpit-at p2-3)(not (pit-at p3-4))(KNpit-at p3-4)(pit-at p4-3))
:effect (and(Kpit-at p4-3))
)
(:action R386
:precondition (and(breeze p3-3)(Kbreeze p3-3)(not (pit-at p4-3))(KNpit-at p4-3)(not (pit-at p2-3))(KNpit-at p2-3)(not (pit-at p3-4))(KNpit-at p3-4)(pit-at p3-2))
:effect (and(Kpit-at p3-2))
)
(:action R387
:precondition (and(breeze p3-3)(Kbreeze p3-3)(not (pit-at p4-3))(KNpit-at p4-3)(not (pit-at p3-2))(KNpit-at p3-2)(not (pit-at p3-4))(KNpit-at p3-4)(pit-at p2-3))
:effect (and(Kpit-at p2-3))
)
(:action R388
:precondition (and(breeze p3-3)(Kbreeze p3-3)(not (pit-at p4-3))(KNpit-at p4-3)(not (pit-at p3-2))(KNpit-at p3-2)(not (pit-at p2-3))(KNpit-at p2-3)(pit-at p3-4))
:effect (and(Kpit-at p3-4))
)
(:action R389
:precondition (and(pit-at p4-3)(Kpit-at p4-3)(breeze p3-3))
:effect (and(Kbreeze p3-3))
)
(:action R390
:precondition (and(not (breeze p3-3))(KNbreeze p3-3)(not (pit-at p4-3)))
:effect (and(KNpit-at p4-3))
)
(:action R391
:precondition (and(pit-at p3-2)(Kpit-at p3-2)(breeze p3-3))
:effect (and(Kbreeze p3-3))
)
(:action R392
:precondition (and(not (breeze p3-3))(KNbreeze p3-3)(not (pit-at p3-2)))
:effect (and(KNpit-at p3-2))
)
(:action R393
:precondition (and(pit-at p2-3)(Kpit-at p2-3)(breeze p3-3))
:effect (and(Kbreeze p3-3))
)
(:action R394
:precondition (and(not (breeze p3-3))(KNbreeze p3-3)(not (pit-at p2-3)))
:effect (and(KNpit-at p2-3))
)
(:action R395
:precondition (and(pit-at p3-4)(Kpit-at p3-4)(breeze p3-3))
:effect (and(Kbreeze p3-3))
)
(:action R396
:precondition (and(not (breeze p3-3))(KNbreeze p3-3)(not (pit-at p3-4)))
:effect (and(KNpit-at p3-4))
)
(:action R397
:precondition (and(not (pit-at p3-4))(KNpit-at p3-4)(not (pit-at p4-5))(KNpit-at p4-5)(not (breeze p3-5)))
:effect (and(KNbreeze p3-5))
)
(:action R398
:precondition (and(breeze p3-5)(Kbreeze p3-5)(not (pit-at p4-5))(KNpit-at p4-5)(pit-at p3-4))
:effect (and(Kpit-at p3-4))
)
(:action R399
:precondition (and(breeze p3-5)(Kbreeze p3-5)(not (pit-at p3-4))(KNpit-at p3-4)(pit-at p4-5))
:effect (and(Kpit-at p4-5))
)
(:action R400
:precondition (and(pit-at p3-4)(Kpit-at p3-4)(breeze p3-5))
:effect (and(Kbreeze p3-5))
)
(:action R401
:precondition (and(not (breeze p3-5))(KNbreeze p3-5)(not (pit-at p3-4)))
:effect (and(KNpit-at p3-4))
)
(:action R402
:precondition (and(pit-at p4-5)(Kpit-at p4-5)(breeze p3-5))
:effect (and(Kbreeze p3-5))
)
(:action R403
:precondition (and(not (breeze p3-5))(KNbreeze p3-5)(not (pit-at p4-5)))
:effect (and(KNpit-at p4-5))
)
(:action R404
:precondition (and(not (pit-at p5-4))(KNpit-at p5-4)(not (pit-at p4-3))(KNpit-at p4-3)(not (breeze p5-3)))
:effect (and(KNbreeze p5-3))
)
(:action R405
:precondition (and(breeze p5-3)(Kbreeze p5-3)(not (pit-at p4-3))(KNpit-at p4-3)(pit-at p5-4))
:effect (and(Kpit-at p5-4))
)
(:action R406
:precondition (and(breeze p5-3)(Kbreeze p5-3)(not (pit-at p5-4))(KNpit-at p5-4)(pit-at p4-3))
:effect (and(Kpit-at p4-3))
)
(:action R407
:precondition (and(pit-at p5-4)(Kpit-at p5-4)(breeze p5-3))
:effect (and(Kbreeze p5-3))
)
(:action R408
:precondition (and(not (breeze p5-3))(KNbreeze p5-3)(not (pit-at p5-4)))
:effect (and(KNpit-at p5-4))
)
(:action R409
:precondition (and(pit-at p4-3)(Kpit-at p4-3)(breeze p5-3))
:effect (and(Kbreeze p5-3))
)
(:action R410
:precondition (and(not (breeze p5-3))(KNbreeze p5-3)(not (pit-at p4-3)))
:effect (and(KNpit-at p4-3))
)
(:action R411
:precondition (and(not (pit-at p5-4))(KNpit-at p5-4)(not (pit-at p4-3))(KNpit-at p4-3)(not (pit-at p3-4))(KNpit-at p3-4)(not (pit-at p4-5))(KNpit-at p4-5)(not (breeze p4-4)))
:effect (and(KNbreeze p4-4))
)
(:action R412
:precondition (and(breeze p4-4)(Kbreeze p4-4)(not (pit-at p4-3))(KNpit-at p4-3)(not (pit-at p3-4))(KNpit-at p3-4)(not (pit-at p4-5))(KNpit-at p4-5)(pit-at p5-4))
:effect (and(Kpit-at p5-4))
)
(:action R413
:precondition (and(breeze p4-4)(Kbreeze p4-4)(not (pit-at p5-4))(KNpit-at p5-4)(not (pit-at p3-4))(KNpit-at p3-4)(not (pit-at p4-5))(KNpit-at p4-5)(pit-at p4-3))
:effect (and(Kpit-at p4-3))
)
(:action R414
:precondition (and(breeze p4-4)(Kbreeze p4-4)(not (pit-at p5-4))(KNpit-at p5-4)(not (pit-at p4-3))(KNpit-at p4-3)(not (pit-at p4-5))(KNpit-at p4-5)(pit-at p3-4))
:effect (and(Kpit-at p3-4))
)
(:action R415
:precondition (and(breeze p4-4)(Kbreeze p4-4)(not (pit-at p5-4))(KNpit-at p5-4)(not (pit-at p4-3))(KNpit-at p4-3)(not (pit-at p3-4))(KNpit-at p3-4)(pit-at p4-5))
:effect (and(Kpit-at p4-5))
)
(:action R416
:precondition (and(pit-at p5-4)(Kpit-at p5-4)(breeze p4-4))
:effect (and(Kbreeze p4-4))
)
(:action R417
:precondition (and(not (breeze p4-4))(KNbreeze p4-4)(not (pit-at p5-4)))
:effect (and(KNpit-at p5-4))
)
(:action R418
:precondition (and(pit-at p4-3)(Kpit-at p4-3)(breeze p4-4))
:effect (and(Kbreeze p4-4))
)
(:action R419
:precondition (and(not (breeze p4-4))(KNbreeze p4-4)(not (pit-at p4-3)))
:effect (and(KNpit-at p4-3))
)
(:action R420
:precondition (and(pit-at p3-4)(Kpit-at p3-4)(breeze p4-4))
:effect (and(Kbreeze p4-4))
)
(:action R421
:precondition (and(not (breeze p4-4))(KNbreeze p4-4)(not (pit-at p3-4)))
:effect (and(KNpit-at p3-4))
)
(:action R422
:precondition (and(pit-at p4-5)(Kpit-at p4-5)(breeze p4-4))
:effect (and(Kbreeze p4-4))
)
(:action R423
:precondition (and(not (breeze p4-4))(KNbreeze p4-4)(not (pit-at p4-5)))
:effect (and(KNpit-at p4-5))
)
(:action R424
:precondition (and(not (pit-at p4-5))(KNpit-at p4-5)(not (pit-at p5-6))(KNpit-at p5-6)(not (breeze p4-6)))
:effect (and(KNbreeze p4-6))
)
(:action R425
:precondition (and(breeze p4-6)(Kbreeze p4-6)(not (pit-at p5-6))(KNpit-at p5-6)(pit-at p4-5))
:effect (and(Kpit-at p4-5))
)
(:action R426
:precondition (and(breeze p4-6)(Kbreeze p4-6)(not (pit-at p4-5))(KNpit-at p4-5)(pit-at p5-6))
:effect (and(Kpit-at p5-6))
)
(:action R427
:precondition (and(pit-at p4-5)(Kpit-at p4-5)(breeze p4-6))
:effect (and(Kbreeze p4-6))
)
(:action R428
:precondition (and(not (breeze p4-6))(KNbreeze p4-6)(not (pit-at p4-5)))
:effect (and(KNpit-at p4-5))
)
(:action R429
:precondition (and(pit-at p5-6)(Kpit-at p5-6)(breeze p4-6))
:effect (and(Kbreeze p4-6))
)
(:action R430
:precondition (and(not (breeze p4-6))(KNbreeze p4-6)(not (pit-at p5-6)))
:effect (and(KNpit-at p5-6))
)
(:action R431
:precondition (and(not (pit-at p6-5))(KNpit-at p6-5)(not (pit-at p5-4))(KNpit-at p5-4)(not (breeze p6-4)))
:effect (and(KNbreeze p6-4))
)
(:action R432
:precondition (and(breeze p6-4)(Kbreeze p6-4)(not (pit-at p5-4))(KNpit-at p5-4)(pit-at p6-5))
:effect (and(Kpit-at p6-5))
)
(:action R433
:precondition (and(breeze p6-4)(Kbreeze p6-4)(not (pit-at p6-5))(KNpit-at p6-5)(pit-at p5-4))
:effect (and(Kpit-at p5-4))
)
(:action R434
:precondition (and(pit-at p6-5)(Kpit-at p6-5)(breeze p6-4))
:effect (and(Kbreeze p6-4))
)
(:action R435
:precondition (and(not (breeze p6-4))(KNbreeze p6-4)(not (pit-at p6-5)))
:effect (and(KNpit-at p6-5))
)
(:action R436
:precondition (and(pit-at p5-4)(Kpit-at p5-4)(breeze p6-4))
:effect (and(Kbreeze p6-4))
)
(:action R437
:precondition (and(not (breeze p6-4))(KNbreeze p6-4)(not (pit-at p5-4)))
:effect (and(KNpit-at p5-4))
)
(:action R438
:precondition (and(not (pit-at p6-5))(KNpit-at p6-5)(not (pit-at p5-4))(KNpit-at p5-4)(not (pit-at p4-5))(KNpit-at p4-5)(not (pit-at p5-6))(KNpit-at p5-6)(not (breeze p5-5)))
:effect (and(KNbreeze p5-5))
)
(:action R439
:precondition (and(breeze p5-5)(Kbreeze p5-5)(not (pit-at p5-4))(KNpit-at p5-4)(not (pit-at p4-5))(KNpit-at p4-5)(not (pit-at p5-6))(KNpit-at p5-6)(pit-at p6-5))
:effect (and(Kpit-at p6-5))
)
(:action R440
:precondition (and(breeze p5-5)(Kbreeze p5-5)(not (pit-at p6-5))(KNpit-at p6-5)(not (pit-at p4-5))(KNpit-at p4-5)(not (pit-at p5-6))(KNpit-at p5-6)(pit-at p5-4))
:effect (and(Kpit-at p5-4))
)
(:action R441
:precondition (and(breeze p5-5)(Kbreeze p5-5)(not (pit-at p6-5))(KNpit-at p6-5)(not (pit-at p5-4))(KNpit-at p5-4)(not (pit-at p5-6))(KNpit-at p5-6)(pit-at p4-5))
:effect (and(Kpit-at p4-5))
)
(:action R442
:precondition (and(breeze p5-5)(Kbreeze p5-5)(not (pit-at p6-5))(KNpit-at p6-5)(not (pit-at p5-4))(KNpit-at p5-4)(not (pit-at p4-5))(KNpit-at p4-5)(pit-at p5-6))
:effect (and(Kpit-at p5-6))
)
(:action R443
:precondition (and(pit-at p6-5)(Kpit-at p6-5)(breeze p5-5))
:effect (and(Kbreeze p5-5))
)
(:action R444
:precondition (and(not (breeze p5-5))(KNbreeze p5-5)(not (pit-at p6-5)))
:effect (and(KNpit-at p6-5))
)
(:action R445
:precondition (and(pit-at p5-4)(Kpit-at p5-4)(breeze p5-5))
:effect (and(Kbreeze p5-5))
)
(:action R446
:precondition (and(not (breeze p5-5))(KNbreeze p5-5)(not (pit-at p5-4)))
:effect (and(KNpit-at p5-4))
)
(:action R447
:precondition (and(pit-at p4-5)(Kpit-at p4-5)(breeze p5-5))
:effect (and(Kbreeze p5-5))
)
(:action R448
:precondition (and(not (breeze p5-5))(KNbreeze p5-5)(not (pit-at p4-5)))
:effect (and(KNpit-at p4-5))
)
(:action R449
:precondition (and(pit-at p5-6)(Kpit-at p5-6)(breeze p5-5))
:effect (and(Kbreeze p5-5))
)
(:action R450
:precondition (and(not (breeze p5-5))(KNbreeze p5-5)(not (pit-at p5-6)))
:effect (and(KNpit-at p5-6))
)
(:action R451
:precondition (and(not (pit-at p5-6))(KNpit-at p5-6)(not (pit-at p6-7))(KNpit-at p6-7)(not (breeze p5-7)))
:effect (and(KNbreeze p5-7))
)
(:action R452
:precondition (and(breeze p5-7)(Kbreeze p5-7)(not (pit-at p6-7))(KNpit-at p6-7)(pit-at p5-6))
:effect (and(Kpit-at p5-6))
)
(:action R453
:precondition (and(breeze p5-7)(Kbreeze p5-7)(not (pit-at p5-6))(KNpit-at p5-6)(pit-at p6-7))
:effect (and(Kpit-at p6-7))
)
(:action R454
:precondition (and(pit-at p5-6)(Kpit-at p5-6)(breeze p5-7))
:effect (and(Kbreeze p5-7))
)
(:action R455
:precondition (and(not (breeze p5-7))(KNbreeze p5-7)(not (pit-at p5-6)))
:effect (and(KNpit-at p5-6))
)
(:action R456
:precondition (and(pit-at p6-7)(Kpit-at p6-7)(breeze p5-7))
:effect (and(Kbreeze p5-7))
)
(:action R457
:precondition (and(not (breeze p5-7))(KNbreeze p5-7)(not (pit-at p6-7)))
:effect (and(KNpit-at p6-7))
)
(:action R458
:precondition (and(not (pit-at p7-6))(KNpit-at p7-6)(not (pit-at p6-5))(KNpit-at p6-5)(not (breeze p7-5)))
:effect (and(KNbreeze p7-5))
)
(:action R459
:precondition (and(breeze p7-5)(Kbreeze p7-5)(not (pit-at p6-5))(KNpit-at p6-5)(pit-at p7-6))
:effect (and(Kpit-at p7-6))
)
(:action R460
:precondition (and(breeze p7-5)(Kbreeze p7-5)(not (pit-at p7-6))(KNpit-at p7-6)(pit-at p6-5))
:effect (and(Kpit-at p6-5))
)
(:action R461
:precondition (and(pit-at p7-6)(Kpit-at p7-6)(breeze p7-5))
:effect (and(Kbreeze p7-5))
)
(:action R462
:precondition (and(not (breeze p7-5))(KNbreeze p7-5)(not (pit-at p7-6)))
:effect (and(KNpit-at p7-6))
)
(:action R463
:precondition (and(pit-at p6-5)(Kpit-at p6-5)(breeze p7-5))
:effect (and(Kbreeze p7-5))
)
(:action R464
:precondition (and(not (breeze p7-5))(KNbreeze p7-5)(not (pit-at p6-5)))
:effect (and(KNpit-at p6-5))
)
(:action R465
:precondition (and(not (pit-at p7-6))(KNpit-at p7-6)(not (pit-at p6-5))(KNpit-at p6-5)(not (pit-at p5-6))(KNpit-at p5-6)(not (pit-at p6-7))(KNpit-at p6-7)(not (breeze p6-6)))
:effect (and(KNbreeze p6-6))
)
(:action R466
:precondition (and(breeze p6-6)(Kbreeze p6-6)(not (pit-at p6-5))(KNpit-at p6-5)(not (pit-at p5-6))(KNpit-at p5-6)(not (pit-at p6-7))(KNpit-at p6-7)(pit-at p7-6))
:effect (and(Kpit-at p7-6))
)
(:action R467
:precondition (and(breeze p6-6)(Kbreeze p6-6)(not (pit-at p7-6))(KNpit-at p7-6)(not (pit-at p5-6))(KNpit-at p5-6)(not (pit-at p6-7))(KNpit-at p6-7)(pit-at p6-5))
:effect (and(Kpit-at p6-5))
)
(:action R468
:precondition (and(breeze p6-6)(Kbreeze p6-6)(not (pit-at p7-6))(KNpit-at p7-6)(not (pit-at p6-5))(KNpit-at p6-5)(not (pit-at p6-7))(KNpit-at p6-7)(pit-at p5-6))
:effect (and(Kpit-at p5-6))
)
(:action R469
:precondition (and(breeze p6-6)(Kbreeze p6-6)(not (pit-at p7-6))(KNpit-at p7-6)(not (pit-at p6-5))(KNpit-at p6-5)(not (pit-at p5-6))(KNpit-at p5-6)(pit-at p6-7))
:effect (and(Kpit-at p6-7))
)
(:action R470
:precondition (and(pit-at p7-6)(Kpit-at p7-6)(breeze p6-6))
:effect (and(Kbreeze p6-6))
)
(:action R471
:precondition (and(not (breeze p6-6))(KNbreeze p6-6)(not (pit-at p7-6)))
:effect (and(KNpit-at p7-6))
)
(:action R472
:precondition (and(pit-at p6-5)(Kpit-at p6-5)(breeze p6-6))
:effect (and(Kbreeze p6-6))
)
(:action R473
:precondition (and(not (breeze p6-6))(KNbreeze p6-6)(not (pit-at p6-5)))
:effect (and(KNpit-at p6-5))
)
(:action R474
:precondition (and(pit-at p5-6)(Kpit-at p5-6)(breeze p6-6))
:effect (and(Kbreeze p6-6))
)
(:action R475
:precondition (and(not (breeze p6-6))(KNbreeze p6-6)(not (pit-at p5-6)))
:effect (and(KNpit-at p5-6))
)
(:action R476
:precondition (and(pit-at p6-7)(Kpit-at p6-7)(breeze p6-6))
:effect (and(Kbreeze p6-6))
)
(:action R477
:precondition (and(not (breeze p6-6))(KNbreeze p6-6)(not (pit-at p6-7)))
:effect (and(KNpit-at p6-7))
)
(:action R478
:precondition (and(not (pit-at p6-7))(KNpit-at p6-7)(not (pit-at p7-8))(KNpit-at p7-8)(not (breeze p6-8)))
:effect (and(KNbreeze p6-8))
)
(:action R479
:precondition (and(breeze p6-8)(Kbreeze p6-8)(not (pit-at p7-8))(KNpit-at p7-8)(pit-at p6-7))
:effect (and(Kpit-at p6-7))
)
(:action R480
:precondition (and(breeze p6-8)(Kbreeze p6-8)(not (pit-at p6-7))(KNpit-at p6-7)(pit-at p7-8))
:effect (and(Kpit-at p7-8))
)
(:action R481
:precondition (and(pit-at p6-7)(Kpit-at p6-7)(breeze p6-8))
:effect (and(Kbreeze p6-8))
)
(:action R482
:precondition (and(not (breeze p6-8))(KNbreeze p6-8)(not (pit-at p6-7)))
:effect (and(KNpit-at p6-7))
)
(:action R483
:precondition (and(pit-at p7-8)(Kpit-at p7-8)(breeze p6-8))
:effect (and(Kbreeze p6-8))
)
(:action R484
:precondition (and(not (breeze p6-8))(KNbreeze p6-8)(not (pit-at p7-8)))
:effect (and(KNpit-at p7-8))
)
(:action R485
:precondition (and(not (pit-at p8-7))(KNpit-at p8-7)(not (pit-at p7-6))(KNpit-at p7-6)(not (breeze p8-6)))
:effect (and(KNbreeze p8-6))
)
(:action R486
:precondition (and(breeze p8-6)(Kbreeze p8-6)(not (pit-at p7-6))(KNpit-at p7-6)(pit-at p8-7))
:effect (and(Kpit-at p8-7))
)
(:action R487
:precondition (and(breeze p8-6)(Kbreeze p8-6)(not (pit-at p8-7))(KNpit-at p8-7)(pit-at p7-6))
:effect (and(Kpit-at p7-6))
)
(:action R488
:precondition (and(pit-at p8-7)(Kpit-at p8-7)(breeze p8-6))
:effect (and(Kbreeze p8-6))
)
(:action R489
:precondition (and(not (breeze p8-6))(KNbreeze p8-6)(not (pit-at p8-7)))
:effect (and(KNpit-at p8-7))
)
(:action R490
:precondition (and(pit-at p7-6)(Kpit-at p7-6)(breeze p8-6))
:effect (and(Kbreeze p8-6))
)
(:action R491
:precondition (and(not (breeze p8-6))(KNbreeze p8-6)(not (pit-at p7-6)))
:effect (and(KNpit-at p7-6))
)
(:action R492
:precondition (and(not (pit-at p8-7))(KNpit-at p8-7)(not (pit-at p7-6))(KNpit-at p7-6)(not (pit-at p6-7))(KNpit-at p6-7)(not (pit-at p7-8))(KNpit-at p7-8)(not (breeze p7-7)))
:effect (and(KNbreeze p7-7))
)
(:action R493
:precondition (and(breeze p7-7)(Kbreeze p7-7)(not (pit-at p7-6))(KNpit-at p7-6)(not (pit-at p6-7))(KNpit-at p6-7)(not (pit-at p7-8))(KNpit-at p7-8)(pit-at p8-7))
:effect (and(Kpit-at p8-7))
)
(:action R494
:precondition (and(breeze p7-7)(Kbreeze p7-7)(not (pit-at p8-7))(KNpit-at p8-7)(not (pit-at p6-7))(KNpit-at p6-7)(not (pit-at p7-8))(KNpit-at p7-8)(pit-at p7-6))
:effect (and(Kpit-at p7-6))
)
(:action R495
:precondition (and(breeze p7-7)(Kbreeze p7-7)(not (pit-at p8-7))(KNpit-at p8-7)(not (pit-at p7-6))(KNpit-at p7-6)(not (pit-at p7-8))(KNpit-at p7-8)(pit-at p6-7))
:effect (and(Kpit-at p6-7))
)
(:action R496
:precondition (and(breeze p7-7)(Kbreeze p7-7)(not (pit-at p8-7))(KNpit-at p8-7)(not (pit-at p7-6))(KNpit-at p7-6)(not (pit-at p6-7))(KNpit-at p6-7)(pit-at p7-8))
:effect (and(Kpit-at p7-8))
)
(:action R497
:precondition (and(pit-at p8-7)(Kpit-at p8-7)(breeze p7-7))
:effect (and(Kbreeze p7-7))
)
(:action R498
:precondition (and(not (breeze p7-7))(KNbreeze p7-7)(not (pit-at p8-7)))
:effect (and(KNpit-at p8-7))
)
(:action R499
:precondition (and(pit-at p7-6)(Kpit-at p7-6)(breeze p7-7))
:effect (and(Kbreeze p7-7))
)
(:action R500
:precondition (and(not (breeze p7-7))(KNbreeze p7-7)(not (pit-at p7-6)))
:effect (and(KNpit-at p7-6))
)
(:action R501
:precondition (and(pit-at p6-7)(Kpit-at p6-7)(breeze p7-7))
:effect (and(Kbreeze p7-7))
)
(:action R502
:precondition (and(not (breeze p7-7))(KNbreeze p7-7)(not (pit-at p6-7)))
:effect (and(KNpit-at p6-7))
)
(:action R503
:precondition (and(pit-at p7-8)(Kpit-at p7-8)(breeze p7-7))
:effect (and(Kbreeze p7-7))
)
(:action R504
:precondition (and(not (breeze p7-7))(KNbreeze p7-7)(not (pit-at p7-8)))
:effect (and(KNpit-at p7-8))
)
(:action R505
:precondition (and(not (pit-at p7-8))(KNpit-at p7-8)(not (pit-at p8-9))(KNpit-at p8-9)(not (breeze p7-9)))
:effect (and(KNbreeze p7-9))
)
(:action R506
:precondition (and(breeze p7-9)(Kbreeze p7-9)(not (pit-at p8-9))(KNpit-at p8-9)(pit-at p7-8))
:effect (and(Kpit-at p7-8))
)
(:action R507
:precondition (and(breeze p7-9)(Kbreeze p7-9)(not (pit-at p7-8))(KNpit-at p7-8)(pit-at p8-9))
:effect (and(Kpit-at p8-9))
)
(:action R508
:precondition (and(pit-at p7-8)(Kpit-at p7-8)(breeze p7-9))
:effect (and(Kbreeze p7-9))
)
(:action R509
:precondition (and(not (breeze p7-9))(KNbreeze p7-9)(not (pit-at p7-8)))
:effect (and(KNpit-at p7-8))
)
(:action R510
:precondition (and(pit-at p8-9)(Kpit-at p8-9)(breeze p7-9))
:effect (and(Kbreeze p7-9))
)
(:action R511
:precondition (and(not (breeze p7-9))(KNbreeze p7-9)(not (pit-at p8-9)))
:effect (and(KNpit-at p8-9))
)
(:action R512
:precondition (and(not (pit-at p9-8))(KNpit-at p9-8)(not (pit-at p8-7))(KNpit-at p8-7)(not (breeze p9-7)))
:effect (and(KNbreeze p9-7))
)
(:action R513
:precondition (and(breeze p9-7)(Kbreeze p9-7)(not (pit-at p8-7))(KNpit-at p8-7)(pit-at p9-8))
:effect (and(Kpit-at p9-8))
)
(:action R514
:precondition (and(breeze p9-7)(Kbreeze p9-7)(not (pit-at p9-8))(KNpit-at p9-8)(pit-at p8-7))
:effect (and(Kpit-at p8-7))
)
(:action R515
:precondition (and(pit-at p9-8)(Kpit-at p9-8)(breeze p9-7))
:effect (and(Kbreeze p9-7))
)
(:action R516
:precondition (and(not (breeze p9-7))(KNbreeze p9-7)(not (pit-at p9-8)))
:effect (and(KNpit-at p9-8))
)
(:action R517
:precondition (and(pit-at p8-7)(Kpit-at p8-7)(breeze p9-7))
:effect (and(Kbreeze p9-7))
)
(:action R518
:precondition (and(not (breeze p9-7))(KNbreeze p9-7)(not (pit-at p8-7)))
:effect (and(KNpit-at p8-7))
)
(:action R519
:precondition (and(not (pit-at p9-8))(KNpit-at p9-8)(not (pit-at p8-7))(KNpit-at p8-7)(not (pit-at p7-8))(KNpit-at p7-8)(not (pit-at p8-9))(KNpit-at p8-9)(not (breeze p8-8)))
:effect (and(KNbreeze p8-8))
)
(:action R520
:precondition (and(breeze p8-8)(Kbreeze p8-8)(not (pit-at p8-7))(KNpit-at p8-7)(not (pit-at p7-8))(KNpit-at p7-8)(not (pit-at p8-9))(KNpit-at p8-9)(pit-at p9-8))
:effect (and(Kpit-at p9-8))
)
(:action R521
:precondition (and(breeze p8-8)(Kbreeze p8-8)(not (pit-at p9-8))(KNpit-at p9-8)(not (pit-at p7-8))(KNpit-at p7-8)(not (pit-at p8-9))(KNpit-at p8-9)(pit-at p8-7))
:effect (and(Kpit-at p8-7))
)
(:action R522
:precondition (and(breeze p8-8)(Kbreeze p8-8)(not (pit-at p9-8))(KNpit-at p9-8)(not (pit-at p8-7))(KNpit-at p8-7)(not (pit-at p8-9))(KNpit-at p8-9)(pit-at p7-8))
:effect (and(Kpit-at p7-8))
)
(:action R523
:precondition (and(breeze p8-8)(Kbreeze p8-8)(not (pit-at p9-8))(KNpit-at p9-8)(not (pit-at p8-7))(KNpit-at p8-7)(not (pit-at p7-8))(KNpit-at p7-8)(pit-at p8-9))
:effect (and(Kpit-at p8-9))
)
(:action R524
:precondition (and(pit-at p9-8)(Kpit-at p9-8)(breeze p8-8))
:effect (and(Kbreeze p8-8))
)
(:action R525
:precondition (and(not (breeze p8-8))(KNbreeze p8-8)(not (pit-at p9-8)))
:effect (and(KNpit-at p9-8))
)
(:action R526
:precondition (and(pit-at p8-7)(Kpit-at p8-7)(breeze p8-8))
:effect (and(Kbreeze p8-8))
)
(:action R527
:precondition (and(not (breeze p8-8))(KNbreeze p8-8)(not (pit-at p8-7)))
:effect (and(KNpit-at p8-7))
)
(:action R528
:precondition (and(pit-at p7-8)(Kpit-at p7-8)(breeze p8-8))
:effect (and(Kbreeze p8-8))
)
(:action R529
:precondition (and(not (breeze p8-8))(KNbreeze p8-8)(not (pit-at p7-8)))
:effect (and(KNpit-at p7-8))
)
(:action R530
:precondition (and(pit-at p8-9)(Kpit-at p8-9)(breeze p8-8))
:effect (and(Kbreeze p8-8))
)
(:action R531
:precondition (and(not (breeze p8-8))(KNbreeze p8-8)(not (pit-at p8-9)))
:effect (and(KNpit-at p8-9))
)
(:action R532
:precondition (and(not (pit-at p8-9))(KNpit-at p8-9)(not (pit-at p9-10))(KNpit-at p9-10)(not (breeze p8-10)))
:effect (and(KNbreeze p8-10))
)
(:action R533
:precondition (and(breeze p8-10)(Kbreeze p8-10)(not (pit-at p9-10))(KNpit-at p9-10)(pit-at p8-9))
:effect (and(Kpit-at p8-9))
)
(:action R534
:precondition (and(breeze p8-10)(Kbreeze p8-10)(not (pit-at p8-9))(KNpit-at p8-9)(pit-at p9-10))
:effect (and(Kpit-at p9-10))
)
(:action R535
:precondition (and(pit-at p8-9)(Kpit-at p8-9)(breeze p8-10))
:effect (and(Kbreeze p8-10))
)
(:action R536
:precondition (and(not (breeze p8-10))(KNbreeze p8-10)(not (pit-at p8-9)))
:effect (and(KNpit-at p8-9))
)
(:action R537
:precondition (and(pit-at p9-10)(Kpit-at p9-10)(breeze p8-10))
:effect (and(Kbreeze p8-10))
)
(:action R538
:precondition (and(not (breeze p8-10))(KNbreeze p8-10)(not (pit-at p9-10)))
:effect (and(KNpit-at p9-10))
)
(:action R539
:precondition (and(not (pit-at p10-9))(KNpit-at p10-9)(not (pit-at p9-8))(KNpit-at p9-8)(not (breeze p10-8)))
:effect (and(KNbreeze p10-8))
)
(:action R540
:precondition (and(breeze p10-8)(Kbreeze p10-8)(not (pit-at p9-8))(KNpit-at p9-8)(pit-at p10-9))
:effect (and(Kpit-at p10-9))
)
(:action R541
:precondition (and(breeze p10-8)(Kbreeze p10-8)(not (pit-at p10-9))(KNpit-at p10-9)(pit-at p9-8))
:effect (and(Kpit-at p9-8))
)
(:action R542
:precondition (and(pit-at p10-9)(Kpit-at p10-9)(breeze p10-8))
:effect (and(Kbreeze p10-8))
)
(:action R543
:precondition (and(not (breeze p10-8))(KNbreeze p10-8)(not (pit-at p10-9)))
:effect (and(KNpit-at p10-9))
)
(:action R544
:precondition (and(pit-at p9-8)(Kpit-at p9-8)(breeze p10-8))
:effect (and(Kbreeze p10-8))
)
(:action R545
:precondition (and(not (breeze p10-8))(KNbreeze p10-8)(not (pit-at p9-8)))
:effect (and(KNpit-at p9-8))
)
(:action R546
:precondition (and(not (pit-at p10-9))(KNpit-at p10-9)(not (pit-at p9-8))(KNpit-at p9-8)(not (pit-at p8-9))(KNpit-at p8-9)(not (pit-at p9-10))(KNpit-at p9-10)(not (breeze p9-9)))
:effect (and(KNbreeze p9-9))
)
(:action R547
:precondition (and(breeze p9-9)(Kbreeze p9-9)(not (pit-at p9-8))(KNpit-at p9-8)(not (pit-at p8-9))(KNpit-at p8-9)(not (pit-at p9-10))(KNpit-at p9-10)(pit-at p10-9))
:effect (and(Kpit-at p10-9))
)
(:action R548
:precondition (and(breeze p9-9)(Kbreeze p9-9)(not (pit-at p10-9))(KNpit-at p10-9)(not (pit-at p8-9))(KNpit-at p8-9)(not (pit-at p9-10))(KNpit-at p9-10)(pit-at p9-8))
:effect (and(Kpit-at p9-8))
)
(:action R549
:precondition (and(breeze p9-9)(Kbreeze p9-9)(not (pit-at p10-9))(KNpit-at p10-9)(not (pit-at p9-8))(KNpit-at p9-8)(not (pit-at p9-10))(KNpit-at p9-10)(pit-at p8-9))
:effect (and(Kpit-at p8-9))
)
(:action R550
:precondition (and(breeze p9-9)(Kbreeze p9-9)(not (pit-at p10-9))(KNpit-at p10-9)(not (pit-at p9-8))(KNpit-at p9-8)(not (pit-at p8-9))(KNpit-at p8-9)(pit-at p9-10))
:effect (and(Kpit-at p9-10))
)
(:action R551
:precondition (and(pit-at p10-9)(Kpit-at p10-9)(breeze p9-9))
:effect (and(Kbreeze p9-9))
)
(:action R552
:precondition (and(not (breeze p9-9))(KNbreeze p9-9)(not (pit-at p10-9)))
:effect (and(KNpit-at p10-9))
)
(:action R553
:precondition (and(pit-at p9-8)(Kpit-at p9-8)(breeze p9-9))
:effect (and(Kbreeze p9-9))
)
(:action R554
:precondition (and(not (breeze p9-9))(KNbreeze p9-9)(not (pit-at p9-8)))
:effect (and(KNpit-at p9-8))
)
(:action R555
:precondition (and(pit-at p8-9)(Kpit-at p8-9)(breeze p9-9))
:effect (and(Kbreeze p9-9))
)
(:action R556
:precondition (and(not (breeze p9-9))(KNbreeze p9-9)(not (pit-at p8-9)))
:effect (and(KNpit-at p8-9))
)
(:action R557
:precondition (and(pit-at p9-10)(Kpit-at p9-10)(breeze p9-9))
:effect (and(Kbreeze p9-9))
)
(:action R558
:precondition (and(not (breeze p9-9))(KNbreeze p9-9)(not (pit-at p9-10)))
:effect (and(KNpit-at p9-10))
)
(:action R559
:precondition (and(not (pit-at p9-10))(KNpit-at p9-10)(not (pit-at p10-9))(KNpit-at p10-9)(not (breeze p10-10)))
:effect (and(KNbreeze p10-10))
)
(:action R560
:precondition (and(breeze p10-10)(Kbreeze p10-10)(not (pit-at p10-9))(KNpit-at p10-9)(pit-at p9-10))
:effect (and(Kpit-at p9-10))
)
(:action R561
:precondition (and(breeze p10-10)(Kbreeze p10-10)(not (pit-at p9-10))(KNpit-at p9-10)(pit-at p10-9))
:effect (and(Kpit-at p10-9))
)
(:action R562
:precondition (and(pit-at p9-10)(Kpit-at p9-10)(breeze p10-10))
:effect (and(Kbreeze p10-10))
)
(:action R563
:precondition (and(not (breeze p10-10))(KNbreeze p10-10)(not (pit-at p9-10)))
:effect (and(KNpit-at p9-10))
)
(:action R564
:precondition (and(pit-at p10-9)(Kpit-at p10-9)(breeze p10-10))
:effect (and(Kbreeze p10-10))
)
(:action R565
:precondition (and(not (breeze p10-10))(KNbreeze p10-10)(not (pit-at p10-9)))
:effect (and(KNpit-at p10-9))
)
)
