(define (domain Kctp)
(:requirements :strips :typing)
;;SingleStateK
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
 v11 - vertex
 v12 - vertex
 v13 - vertex
 v14 - vertex
 v15 - vertex
 v16 - vertex
 v17 - vertex
 v18 - vertex
 v19 - vertex
 v20 - vertex
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
 e20 - edge
 e21 - edge
 e22 - edge
 e23 - edge
 e24 - edge
 e25 - edge
 e26 - edge
 e27 - edge
 e28 - edge
 e29 - edge
 e30 - edge
 e31 - edge
 e32 - edge
 e33 - edge
 e34 - edge
 e35 - edge
 e36 - edge
 e37 - edge
 e38 - edge
 e39 - edge
)

(:predicates
(adjacent ?x - vertex ?e - edge)
(traversable ?e - edge)
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
(and (not (Ktraversable ?e)) (not (KNtraversable ?e)) (at ?x) (adjacent ?x ?e) (traversable ?e))
 :effect 
(and (Ktraversable ?e))
)
(:action edge-obsF
 :parameters (?x - vertex ?e - edge )
 :precondition 
(and (not (Ktraversable ?e)) (not (KNtraversable ?e)) (at ?x) (adjacent ?x ?e) (not (traversable ?e)))
 :effect 
(and (KNtraversable ?e))
)
(:action R0
:precondition (and(Ktraversable e0)(traversable e0)(not (traversable e1)))
:effect (and(KNtraversable e1))
)
(:action R1
:precondition (and(not (traversable e1))(KNtraversable e1)(traversable e0))
:effect (and(Ktraversable e0))
)
(:action R2
:precondition (and(Ktraversable e1)(traversable e1)(not (traversable e0)))
:effect (and(KNtraversable e0))
)
(:action R3
:precondition (and(not (traversable e0))(KNtraversable e0)(traversable e1))
:effect (and(Ktraversable e1))
)
(:action R4
:precondition (and(Ktraversable e2)(traversable e2)(not (traversable e3)))
:effect (and(KNtraversable e3))
)
(:action R5
:precondition (and(not (traversable e3))(KNtraversable e3)(traversable e2))
:effect (and(Ktraversable e2))
)
(:action R6
:precondition (and(Ktraversable e3)(traversable e3)(not (traversable e2)))
:effect (and(KNtraversable e2))
)
(:action R7
:precondition (and(not (traversable e2))(KNtraversable e2)(traversable e3))
:effect (and(Ktraversable e3))
)
(:action R8
:precondition (and(Ktraversable e4)(traversable e4)(not (traversable e5)))
:effect (and(KNtraversable e5))
)
(:action R9
:precondition (and(not (traversable e5))(KNtraversable e5)(traversable e4))
:effect (and(Ktraversable e4))
)
(:action R10
:precondition (and(Ktraversable e5)(traversable e5)(not (traversable e4)))
:effect (and(KNtraversable e4))
)
(:action R11
:precondition (and(not (traversable e4))(KNtraversable e4)(traversable e5))
:effect (and(Ktraversable e5))
)
(:action R12
:precondition (and(Ktraversable e6)(traversable e6)(not (traversable e7)))
:effect (and(KNtraversable e7))
)
(:action R13
:precondition (and(not (traversable e7))(KNtraversable e7)(traversable e6))
:effect (and(Ktraversable e6))
)
(:action R14
:precondition (and(Ktraversable e7)(traversable e7)(not (traversable e6)))
:effect (and(KNtraversable e6))
)
(:action R15
:precondition (and(not (traversable e6))(KNtraversable e6)(traversable e7))
:effect (and(Ktraversable e7))
)
(:action R16
:precondition (and(Ktraversable e8)(traversable e8)(not (traversable e9)))
:effect (and(KNtraversable e9))
)
(:action R17
:precondition (and(not (traversable e9))(KNtraversable e9)(traversable e8))
:effect (and(Ktraversable e8))
)
(:action R18
:precondition (and(Ktraversable e9)(traversable e9)(not (traversable e8)))
:effect (and(KNtraversable e8))
)
(:action R19
:precondition (and(not (traversable e8))(KNtraversable e8)(traversable e9))
:effect (and(Ktraversable e9))
)
(:action R20
:precondition (and(Ktraversable e10)(traversable e10)(not (traversable e11)))
:effect (and(KNtraversable e11))
)
(:action R21
:precondition (and(not (traversable e11))(KNtraversable e11)(traversable e10))
:effect (and(Ktraversable e10))
)
(:action R22
:precondition (and(Ktraversable e11)(traversable e11)(not (traversable e10)))
:effect (and(KNtraversable e10))
)
(:action R23
:precondition (and(not (traversable e10))(KNtraversable e10)(traversable e11))
:effect (and(Ktraversable e11))
)
(:action R24
:precondition (and(Ktraversable e12)(traversable e12)(not (traversable e13)))
:effect (and(KNtraversable e13))
)
(:action R25
:precondition (and(not (traversable e13))(KNtraversable e13)(traversable e12))
:effect (and(Ktraversable e12))
)
(:action R26
:precondition (and(Ktraversable e13)(traversable e13)(not (traversable e12)))
:effect (and(KNtraversable e12))
)
(:action R27
:precondition (and(not (traversable e12))(KNtraversable e12)(traversable e13))
:effect (and(Ktraversable e13))
)
(:action R28
:precondition (and(Ktraversable e14)(traversable e14)(not (traversable e15)))
:effect (and(KNtraversable e15))
)
(:action R29
:precondition (and(not (traversable e15))(KNtraversable e15)(traversable e14))
:effect (and(Ktraversable e14))
)
(:action R30
:precondition (and(Ktraversable e15)(traversable e15)(not (traversable e14)))
:effect (and(KNtraversable e14))
)
(:action R31
:precondition (and(not (traversable e14))(KNtraversable e14)(traversable e15))
:effect (and(Ktraversable e15))
)
(:action R32
:precondition (and(Ktraversable e16)(traversable e16)(not (traversable e17)))
:effect (and(KNtraversable e17))
)
(:action R33
:precondition (and(not (traversable e17))(KNtraversable e17)(traversable e16))
:effect (and(Ktraversable e16))
)
(:action R34
:precondition (and(Ktraversable e17)(traversable e17)(not (traversable e16)))
:effect (and(KNtraversable e16))
)
(:action R35
:precondition (and(not (traversable e16))(KNtraversable e16)(traversable e17))
:effect (and(Ktraversable e17))
)
(:action R36
:precondition (and(Ktraversable e18)(traversable e18)(not (traversable e19)))
:effect (and(KNtraversable e19))
)
(:action R37
:precondition (and(not (traversable e19))(KNtraversable e19)(traversable e18))
:effect (and(Ktraversable e18))
)
(:action R38
:precondition (and(Ktraversable e19)(traversable e19)(not (traversable e18)))
:effect (and(KNtraversable e18))
)
(:action R39
:precondition (and(not (traversable e18))(KNtraversable e18)(traversable e19))
:effect (and(Ktraversable e19))
)
(:action R40
:precondition (and(Ktraversable e20)(traversable e20)(not (traversable e21)))
:effect (and(KNtraversable e21))
)
(:action R41
:precondition (and(not (traversable e21))(KNtraversable e21)(traversable e20))
:effect (and(Ktraversable e20))
)
(:action R42
:precondition (and(Ktraversable e21)(traversable e21)(not (traversable e20)))
:effect (and(KNtraversable e20))
)
(:action R43
:precondition (and(not (traversable e20))(KNtraversable e20)(traversable e21))
:effect (and(Ktraversable e21))
)
(:action R44
:precondition (and(Ktraversable e22)(traversable e22)(not (traversable e23)))
:effect (and(KNtraversable e23))
)
(:action R45
:precondition (and(not (traversable e23))(KNtraversable e23)(traversable e22))
:effect (and(Ktraversable e22))
)
(:action R46
:precondition (and(Ktraversable e23)(traversable e23)(not (traversable e22)))
:effect (and(KNtraversable e22))
)
(:action R47
:precondition (and(not (traversable e22))(KNtraversable e22)(traversable e23))
:effect (and(Ktraversable e23))
)
(:action R48
:precondition (and(Ktraversable e24)(traversable e24)(not (traversable e25)))
:effect (and(KNtraversable e25))
)
(:action R49
:precondition (and(not (traversable e25))(KNtraversable e25)(traversable e24))
:effect (and(Ktraversable e24))
)
(:action R50
:precondition (and(Ktraversable e25)(traversable e25)(not (traversable e24)))
:effect (and(KNtraversable e24))
)
(:action R51
:precondition (and(not (traversable e24))(KNtraversable e24)(traversable e25))
:effect (and(Ktraversable e25))
)
(:action R52
:precondition (and(Ktraversable e26)(traversable e26)(not (traversable e27)))
:effect (and(KNtraversable e27))
)
(:action R53
:precondition (and(not (traversable e27))(KNtraversable e27)(traversable e26))
:effect (and(Ktraversable e26))
)
(:action R54
:precondition (and(Ktraversable e27)(traversable e27)(not (traversable e26)))
:effect (and(KNtraversable e26))
)
(:action R55
:precondition (and(not (traversable e26))(KNtraversable e26)(traversable e27))
:effect (and(Ktraversable e27))
)
(:action R56
:precondition (and(Ktraversable e28)(traversable e28)(not (traversable e29)))
:effect (and(KNtraversable e29))
)
(:action R57
:precondition (and(not (traversable e29))(KNtraversable e29)(traversable e28))
:effect (and(Ktraversable e28))
)
(:action R58
:precondition (and(Ktraversable e29)(traversable e29)(not (traversable e28)))
:effect (and(KNtraversable e28))
)
(:action R59
:precondition (and(not (traversable e28))(KNtraversable e28)(traversable e29))
:effect (and(Ktraversable e29))
)
(:action R60
:precondition (and(Ktraversable e30)(traversable e30)(not (traversable e31)))
:effect (and(KNtraversable e31))
)
(:action R61
:precondition (and(not (traversable e31))(KNtraversable e31)(traversable e30))
:effect (and(Ktraversable e30))
)
(:action R62
:precondition (and(Ktraversable e31)(traversable e31)(not (traversable e30)))
:effect (and(KNtraversable e30))
)
(:action R63
:precondition (and(not (traversable e30))(KNtraversable e30)(traversable e31))
:effect (and(Ktraversable e31))
)
(:action R64
:precondition (and(Ktraversable e32)(traversable e32)(not (traversable e33)))
:effect (and(KNtraversable e33))
)
(:action R65
:precondition (and(not (traversable e33))(KNtraversable e33)(traversable e32))
:effect (and(Ktraversable e32))
)
(:action R66
:precondition (and(Ktraversable e33)(traversable e33)(not (traversable e32)))
:effect (and(KNtraversable e32))
)
(:action R67
:precondition (and(not (traversable e32))(KNtraversable e32)(traversable e33))
:effect (and(Ktraversable e33))
)
(:action R68
:precondition (and(Ktraversable e34)(traversable e34)(not (traversable e35)))
:effect (and(KNtraversable e35))
)
(:action R69
:precondition (and(not (traversable e35))(KNtraversable e35)(traversable e34))
:effect (and(Ktraversable e34))
)
(:action R70
:precondition (and(Ktraversable e35)(traversable e35)(not (traversable e34)))
:effect (and(KNtraversable e34))
)
(:action R71
:precondition (and(not (traversable e34))(KNtraversable e34)(traversable e35))
:effect (and(Ktraversable e35))
)
(:action R72
:precondition (and(Ktraversable e36)(traversable e36)(not (traversable e37)))
:effect (and(KNtraversable e37))
)
(:action R73
:precondition (and(not (traversable e37))(KNtraversable e37)(traversable e36))
:effect (and(Ktraversable e36))
)
(:action R74
:precondition (and(Ktraversable e37)(traversable e37)(not (traversable e36)))
:effect (and(KNtraversable e36))
)
(:action R75
:precondition (and(not (traversable e36))(KNtraversable e36)(traversable e37))
:effect (and(Ktraversable e37))
)
(:action R76
:precondition (and(Ktraversable e38)(traversable e38)(not (traversable e39)))
:effect (and(KNtraversable e39))
)
(:action R77
:precondition (and(not (traversable e39))(KNtraversable e39)(traversable e38))
:effect (and(Ktraversable e38))
)
(:action R78
:precondition (and(Ktraversable e39)(traversable e39)(not (traversable e38)))
:effect (and(KNtraversable e38))
)
(:action R79
:precondition (and(not (traversable e38))(KNtraversable e38)(traversable e39))
:effect (and(Ktraversable e39))
)
)
