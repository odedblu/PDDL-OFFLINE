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
 v21 - vertex
 v22 - vertex
 v23 - vertex
 v24 - vertex
 v25 - vertex
 v26 - vertex
 v27 - vertex
 v28 - vertex
 v29 - vertex
 v30 - vertex
 v31 - vertex
 v32 - vertex
 v33 - vertex
 v34 - vertex
 v35 - vertex
 v36 - vertex
 v37 - vertex
 v38 - vertex
 v39 - vertex
 v40 - vertex
 v41 - vertex
 v42 - vertex
 v43 - vertex
 v44 - vertex
 v45 - vertex
 v46 - vertex
 v47 - vertex
 v48 - vertex
 v49 - vertex
 v50 - vertex
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
 e40 - edge
 e41 - edge
 e42 - edge
 e43 - edge
 e44 - edge
 e45 - edge
 e46 - edge
 e47 - edge
 e48 - edge
 e49 - edge
 e50 - edge
 e51 - edge
 e52 - edge
 e53 - edge
 e54 - edge
 e55 - edge
 e56 - edge
 e57 - edge
 e58 - edge
 e59 - edge
 e60 - edge
 e61 - edge
 e62 - edge
 e63 - edge
 e64 - edge
 e65 - edge
 e66 - edge
 e67 - edge
 e68 - edge
 e69 - edge
 e70 - edge
 e71 - edge
 e72 - edge
 e73 - edge
 e74 - edge
 e75 - edge
 e76 - edge
 e77 - edge
 e78 - edge
 e79 - edge
 e80 - edge
 e81 - edge
 e82 - edge
 e83 - edge
 e84 - edge
 e85 - edge
 e86 - edge
 e87 - edge
 e88 - edge
 e89 - edge
 e90 - edge
 e91 - edge
 e92 - edge
 e93 - edge
 e94 - edge
 e95 - edge
 e96 - edge
 e97 - edge
 e98 - edge
 e99 - edge
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
(:action R80
:precondition (and(Ktraversable e40)(traversable e40)(not (traversable e41)))
:effect (and(KNtraversable e41))
)
(:action R81
:precondition (and(not (traversable e41))(KNtraversable e41)(traversable e40))
:effect (and(Ktraversable e40))
)
(:action R82
:precondition (and(Ktraversable e41)(traversable e41)(not (traversable e40)))
:effect (and(KNtraversable e40))
)
(:action R83
:precondition (and(not (traversable e40))(KNtraversable e40)(traversable e41))
:effect (and(Ktraversable e41))
)
(:action R84
:precondition (and(Ktraversable e42)(traversable e42)(not (traversable e43)))
:effect (and(KNtraversable e43))
)
(:action R85
:precondition (and(not (traversable e43))(KNtraversable e43)(traversable e42))
:effect (and(Ktraversable e42))
)
(:action R86
:precondition (and(Ktraversable e43)(traversable e43)(not (traversable e42)))
:effect (and(KNtraversable e42))
)
(:action R87
:precondition (and(not (traversable e42))(KNtraversable e42)(traversable e43))
:effect (and(Ktraversable e43))
)
(:action R88
:precondition (and(Ktraversable e44)(traversable e44)(not (traversable e45)))
:effect (and(KNtraversable e45))
)
(:action R89
:precondition (and(not (traversable e45))(KNtraversable e45)(traversable e44))
:effect (and(Ktraversable e44))
)
(:action R90
:precondition (and(Ktraversable e45)(traversable e45)(not (traversable e44)))
:effect (and(KNtraversable e44))
)
(:action R91
:precondition (and(not (traversable e44))(KNtraversable e44)(traversable e45))
:effect (and(Ktraversable e45))
)
(:action R92
:precondition (and(Ktraversable e46)(traversable e46)(not (traversable e47)))
:effect (and(KNtraversable e47))
)
(:action R93
:precondition (and(not (traversable e47))(KNtraversable e47)(traversable e46))
:effect (and(Ktraversable e46))
)
(:action R94
:precondition (and(Ktraversable e47)(traversable e47)(not (traversable e46)))
:effect (and(KNtraversable e46))
)
(:action R95
:precondition (and(not (traversable e46))(KNtraversable e46)(traversable e47))
:effect (and(Ktraversable e47))
)
(:action R96
:precondition (and(Ktraversable e48)(traversable e48)(not (traversable e49)))
:effect (and(KNtraversable e49))
)
(:action R97
:precondition (and(not (traversable e49))(KNtraversable e49)(traversable e48))
:effect (and(Ktraversable e48))
)
(:action R98
:precondition (and(Ktraversable e49)(traversable e49)(not (traversable e48)))
:effect (and(KNtraversable e48))
)
(:action R99
:precondition (and(not (traversable e48))(KNtraversable e48)(traversable e49))
:effect (and(Ktraversable e49))
)
(:action R100
:precondition (and(Ktraversable e50)(traversable e50)(not (traversable e51)))
:effect (and(KNtraversable e51))
)
(:action R101
:precondition (and(not (traversable e51))(KNtraversable e51)(traversable e50))
:effect (and(Ktraversable e50))
)
(:action R102
:precondition (and(Ktraversable e51)(traversable e51)(not (traversable e50)))
:effect (and(KNtraversable e50))
)
(:action R103
:precondition (and(not (traversable e50))(KNtraversable e50)(traversable e51))
:effect (and(Ktraversable e51))
)
(:action R104
:precondition (and(Ktraversable e52)(traversable e52)(not (traversable e53)))
:effect (and(KNtraversable e53))
)
(:action R105
:precondition (and(not (traversable e53))(KNtraversable e53)(traversable e52))
:effect (and(Ktraversable e52))
)
(:action R106
:precondition (and(Ktraversable e53)(traversable e53)(not (traversable e52)))
:effect (and(KNtraversable e52))
)
(:action R107
:precondition (and(not (traversable e52))(KNtraversable e52)(traversable e53))
:effect (and(Ktraversable e53))
)
(:action R108
:precondition (and(Ktraversable e54)(traversable e54)(not (traversable e55)))
:effect (and(KNtraversable e55))
)
(:action R109
:precondition (and(not (traversable e55))(KNtraversable e55)(traversable e54))
:effect (and(Ktraversable e54))
)
(:action R110
:precondition (and(Ktraversable e55)(traversable e55)(not (traversable e54)))
:effect (and(KNtraversable e54))
)
(:action R111
:precondition (and(not (traversable e54))(KNtraversable e54)(traversable e55))
:effect (and(Ktraversable e55))
)
(:action R112
:precondition (and(Ktraversable e56)(traversable e56)(not (traversable e57)))
:effect (and(KNtraversable e57))
)
(:action R113
:precondition (and(not (traversable e57))(KNtraversable e57)(traversable e56))
:effect (and(Ktraversable e56))
)
(:action R114
:precondition (and(Ktraversable e57)(traversable e57)(not (traversable e56)))
:effect (and(KNtraversable e56))
)
(:action R115
:precondition (and(not (traversable e56))(KNtraversable e56)(traversable e57))
:effect (and(Ktraversable e57))
)
(:action R116
:precondition (and(Ktraversable e58)(traversable e58)(not (traversable e59)))
:effect (and(KNtraversable e59))
)
(:action R117
:precondition (and(not (traversable e59))(KNtraversable e59)(traversable e58))
:effect (and(Ktraversable e58))
)
(:action R118
:precondition (and(Ktraversable e59)(traversable e59)(not (traversable e58)))
:effect (and(KNtraversable e58))
)
(:action R119
:precondition (and(not (traversable e58))(KNtraversable e58)(traversable e59))
:effect (and(Ktraversable e59))
)
(:action R120
:precondition (and(Ktraversable e60)(traversable e60)(not (traversable e61)))
:effect (and(KNtraversable e61))
)
(:action R121
:precondition (and(not (traversable e61))(KNtraversable e61)(traversable e60))
:effect (and(Ktraversable e60))
)
(:action R122
:precondition (and(Ktraversable e61)(traversable e61)(not (traversable e60)))
:effect (and(KNtraversable e60))
)
(:action R123
:precondition (and(not (traversable e60))(KNtraversable e60)(traversable e61))
:effect (and(Ktraversable e61))
)
(:action R124
:precondition (and(Ktraversable e62)(traversable e62)(not (traversable e63)))
:effect (and(KNtraversable e63))
)
(:action R125
:precondition (and(not (traversable e63))(KNtraversable e63)(traversable e62))
:effect (and(Ktraversable e62))
)
(:action R126
:precondition (and(Ktraversable e63)(traversable e63)(not (traversable e62)))
:effect (and(KNtraversable e62))
)
(:action R127
:precondition (and(not (traversable e62))(KNtraversable e62)(traversable e63))
:effect (and(Ktraversable e63))
)
(:action R128
:precondition (and(Ktraversable e64)(traversable e64)(not (traversable e65)))
:effect (and(KNtraversable e65))
)
(:action R129
:precondition (and(not (traversable e65))(KNtraversable e65)(traversable e64))
:effect (and(Ktraversable e64))
)
(:action R130
:precondition (and(Ktraversable e65)(traversable e65)(not (traversable e64)))
:effect (and(KNtraversable e64))
)
(:action R131
:precondition (and(not (traversable e64))(KNtraversable e64)(traversable e65))
:effect (and(Ktraversable e65))
)
(:action R132
:precondition (and(Ktraversable e66)(traversable e66)(not (traversable e67)))
:effect (and(KNtraversable e67))
)
(:action R133
:precondition (and(not (traversable e67))(KNtraversable e67)(traversable e66))
:effect (and(Ktraversable e66))
)
(:action R134
:precondition (and(Ktraversable e67)(traversable e67)(not (traversable e66)))
:effect (and(KNtraversable e66))
)
(:action R135
:precondition (and(not (traversable e66))(KNtraversable e66)(traversable e67))
:effect (and(Ktraversable e67))
)
(:action R136
:precondition (and(Ktraversable e68)(traversable e68)(not (traversable e69)))
:effect (and(KNtraversable e69))
)
(:action R137
:precondition (and(not (traversable e69))(KNtraversable e69)(traversable e68))
:effect (and(Ktraversable e68))
)
(:action R138
:precondition (and(Ktraversable e69)(traversable e69)(not (traversable e68)))
:effect (and(KNtraversable e68))
)
(:action R139
:precondition (and(not (traversable e68))(KNtraversable e68)(traversable e69))
:effect (and(Ktraversable e69))
)
(:action R140
:precondition (and(Ktraversable e70)(traversable e70)(not (traversable e71)))
:effect (and(KNtraversable e71))
)
(:action R141
:precondition (and(not (traversable e71))(KNtraversable e71)(traversable e70))
:effect (and(Ktraversable e70))
)
(:action R142
:precondition (and(Ktraversable e71)(traversable e71)(not (traversable e70)))
:effect (and(KNtraversable e70))
)
(:action R143
:precondition (and(not (traversable e70))(KNtraversable e70)(traversable e71))
:effect (and(Ktraversable e71))
)
(:action R144
:precondition (and(Ktraversable e72)(traversable e72)(not (traversable e73)))
:effect (and(KNtraversable e73))
)
(:action R145
:precondition (and(not (traversable e73))(KNtraversable e73)(traversable e72))
:effect (and(Ktraversable e72))
)
(:action R146
:precondition (and(Ktraversable e73)(traversable e73)(not (traversable e72)))
:effect (and(KNtraversable e72))
)
(:action R147
:precondition (and(not (traversable e72))(KNtraversable e72)(traversable e73))
:effect (and(Ktraversable e73))
)
(:action R148
:precondition (and(Ktraversable e74)(traversable e74)(not (traversable e75)))
:effect (and(KNtraversable e75))
)
(:action R149
:precondition (and(not (traversable e75))(KNtraversable e75)(traversable e74))
:effect (and(Ktraversable e74))
)
(:action R150
:precondition (and(Ktraversable e75)(traversable e75)(not (traversable e74)))
:effect (and(KNtraversable e74))
)
(:action R151
:precondition (and(not (traversable e74))(KNtraversable e74)(traversable e75))
:effect (and(Ktraversable e75))
)
(:action R152
:precondition (and(Ktraversable e76)(traversable e76)(not (traversable e77)))
:effect (and(KNtraversable e77))
)
(:action R153
:precondition (and(not (traversable e77))(KNtraversable e77)(traversable e76))
:effect (and(Ktraversable e76))
)
(:action R154
:precondition (and(Ktraversable e77)(traversable e77)(not (traversable e76)))
:effect (and(KNtraversable e76))
)
(:action R155
:precondition (and(not (traversable e76))(KNtraversable e76)(traversable e77))
:effect (and(Ktraversable e77))
)
(:action R156
:precondition (and(Ktraversable e78)(traversable e78)(not (traversable e79)))
:effect (and(KNtraversable e79))
)
(:action R157
:precondition (and(not (traversable e79))(KNtraversable e79)(traversable e78))
:effect (and(Ktraversable e78))
)
(:action R158
:precondition (and(Ktraversable e79)(traversable e79)(not (traversable e78)))
:effect (and(KNtraversable e78))
)
(:action R159
:precondition (and(not (traversable e78))(KNtraversable e78)(traversable e79))
:effect (and(Ktraversable e79))
)
(:action R160
:precondition (and(Ktraversable e80)(traversable e80)(not (traversable e81)))
:effect (and(KNtraversable e81))
)
(:action R161
:precondition (and(not (traversable e81))(KNtraversable e81)(traversable e80))
:effect (and(Ktraversable e80))
)
(:action R162
:precondition (and(Ktraversable e81)(traversable e81)(not (traversable e80)))
:effect (and(KNtraversable e80))
)
(:action R163
:precondition (and(not (traversable e80))(KNtraversable e80)(traversable e81))
:effect (and(Ktraversable e81))
)
(:action R164
:precondition (and(Ktraversable e82)(traversable e82)(not (traversable e83)))
:effect (and(KNtraversable e83))
)
(:action R165
:precondition (and(not (traversable e83))(KNtraversable e83)(traversable e82))
:effect (and(Ktraversable e82))
)
(:action R166
:precondition (and(Ktraversable e83)(traversable e83)(not (traversable e82)))
:effect (and(KNtraversable e82))
)
(:action R167
:precondition (and(not (traversable e82))(KNtraversable e82)(traversable e83))
:effect (and(Ktraversable e83))
)
(:action R168
:precondition (and(Ktraversable e84)(traversable e84)(not (traversable e85)))
:effect (and(KNtraversable e85))
)
(:action R169
:precondition (and(not (traversable e85))(KNtraversable e85)(traversable e84))
:effect (and(Ktraversable e84))
)
(:action R170
:precondition (and(Ktraversable e85)(traversable e85)(not (traversable e84)))
:effect (and(KNtraversable e84))
)
(:action R171
:precondition (and(not (traversable e84))(KNtraversable e84)(traversable e85))
:effect (and(Ktraversable e85))
)
(:action R172
:precondition (and(Ktraversable e86)(traversable e86)(not (traversable e87)))
:effect (and(KNtraversable e87))
)
(:action R173
:precondition (and(not (traversable e87))(KNtraversable e87)(traversable e86))
:effect (and(Ktraversable e86))
)
(:action R174
:precondition (and(Ktraversable e87)(traversable e87)(not (traversable e86)))
:effect (and(KNtraversable e86))
)
(:action R175
:precondition (and(not (traversable e86))(KNtraversable e86)(traversable e87))
:effect (and(Ktraversable e87))
)
(:action R176
:precondition (and(Ktraversable e88)(traversable e88)(not (traversable e89)))
:effect (and(KNtraversable e89))
)
(:action R177
:precondition (and(not (traversable e89))(KNtraversable e89)(traversable e88))
:effect (and(Ktraversable e88))
)
(:action R178
:precondition (and(Ktraversable e89)(traversable e89)(not (traversable e88)))
:effect (and(KNtraversable e88))
)
(:action R179
:precondition (and(not (traversable e88))(KNtraversable e88)(traversable e89))
:effect (and(Ktraversable e89))
)
(:action R180
:precondition (and(Ktraversable e90)(traversable e90)(not (traversable e91)))
:effect (and(KNtraversable e91))
)
(:action R181
:precondition (and(not (traversable e91))(KNtraversable e91)(traversable e90))
:effect (and(Ktraversable e90))
)
(:action R182
:precondition (and(Ktraversable e91)(traversable e91)(not (traversable e90)))
:effect (and(KNtraversable e90))
)
(:action R183
:precondition (and(not (traversable e90))(KNtraversable e90)(traversable e91))
:effect (and(Ktraversable e91))
)
(:action R184
:precondition (and(Ktraversable e92)(traversable e92)(not (traversable e93)))
:effect (and(KNtraversable e93))
)
(:action R185
:precondition (and(not (traversable e93))(KNtraversable e93)(traversable e92))
:effect (and(Ktraversable e92))
)
(:action R186
:precondition (and(Ktraversable e93)(traversable e93)(not (traversable e92)))
:effect (and(KNtraversable e92))
)
(:action R187
:precondition (and(not (traversable e92))(KNtraversable e92)(traversable e93))
:effect (and(Ktraversable e93))
)
(:action R188
:precondition (and(Ktraversable e94)(traversable e94)(not (traversable e95)))
:effect (and(KNtraversable e95))
)
(:action R189
:precondition (and(not (traversable e95))(KNtraversable e95)(traversable e94))
:effect (and(Ktraversable e94))
)
(:action R190
:precondition (and(Ktraversable e95)(traversable e95)(not (traversable e94)))
:effect (and(KNtraversable e94))
)
(:action R191
:precondition (and(not (traversable e94))(KNtraversable e94)(traversable e95))
:effect (and(Ktraversable e95))
)
(:action R192
:precondition (and(Ktraversable e96)(traversable e96)(not (traversable e97)))
:effect (and(KNtraversable e97))
)
(:action R193
:precondition (and(not (traversable e97))(KNtraversable e97)(traversable e96))
:effect (and(Ktraversable e96))
)
(:action R194
:precondition (and(Ktraversable e97)(traversable e97)(not (traversable e96)))
:effect (and(KNtraversable e96))
)
(:action R195
:precondition (and(not (traversable e96))(KNtraversable e96)(traversable e97))
:effect (and(Ktraversable e97))
)
(:action R196
:precondition (and(Ktraversable e98)(traversable e98)(not (traversable e99)))
:effect (and(KNtraversable e99))
)
(:action R197
:precondition (and(not (traversable e99))(KNtraversable e99)(traversable e98))
:effect (and(Ktraversable e98))
)
(:action R198
:precondition (and(Ktraversable e99)(traversable e99)(not (traversable e98)))
:effect (and(KNtraversable e98))
)
(:action R199
:precondition (and(not (traversable e98))(KNtraversable e98)(traversable e99))
:effect (and(Ktraversable e99))
)
)
