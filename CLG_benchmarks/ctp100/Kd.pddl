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
 v51 - vertex
 v52 - vertex
 v53 - vertex
 v54 - vertex
 v55 - vertex
 v56 - vertex
 v57 - vertex
 v58 - vertex
 v59 - vertex
 v60 - vertex
 v61 - vertex
 v62 - vertex
 v63 - vertex
 v64 - vertex
 v65 - vertex
 v66 - vertex
 v67 - vertex
 v68 - vertex
 v69 - vertex
 v70 - vertex
 v71 - vertex
 v72 - vertex
 v73 - vertex
 v74 - vertex
 v75 - vertex
 v76 - vertex
 v77 - vertex
 v78 - vertex
 v79 - vertex
 v80 - vertex
 v81 - vertex
 v82 - vertex
 v83 - vertex
 v84 - vertex
 v85 - vertex
 v86 - vertex
 v87 - vertex
 v88 - vertex
 v89 - vertex
 v90 - vertex
 v91 - vertex
 v92 - vertex
 v93 - vertex
 v94 - vertex
 v95 - vertex
 v96 - vertex
 v97 - vertex
 v98 - vertex
 v99 - vertex
 v100 - vertex
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
 e100 - edge
 e101 - edge
 e102 - edge
 e103 - edge
 e104 - edge
 e105 - edge
 e106 - edge
 e107 - edge
 e108 - edge
 e109 - edge
 e110 - edge
 e111 - edge
 e112 - edge
 e113 - edge
 e114 - edge
 e115 - edge
 e116 - edge
 e117 - edge
 e118 - edge
 e119 - edge
 e120 - edge
 e121 - edge
 e122 - edge
 e123 - edge
 e124 - edge
 e125 - edge
 e126 - edge
 e127 - edge
 e128 - edge
 e129 - edge
 e130 - edge
 e131 - edge
 e132 - edge
 e133 - edge
 e134 - edge
 e135 - edge
 e136 - edge
 e137 - edge
 e138 - edge
 e139 - edge
 e140 - edge
 e141 - edge
 e142 - edge
 e143 - edge
 e144 - edge
 e145 - edge
 e146 - edge
 e147 - edge
 e148 - edge
 e149 - edge
 e150 - edge
 e151 - edge
 e152 - edge
 e153 - edge
 e154 - edge
 e155 - edge
 e156 - edge
 e157 - edge
 e158 - edge
 e159 - edge
 e160 - edge
 e161 - edge
 e162 - edge
 e163 - edge
 e164 - edge
 e165 - edge
 e166 - edge
 e167 - edge
 e168 - edge
 e169 - edge
 e170 - edge
 e171 - edge
 e172 - edge
 e173 - edge
 e174 - edge
 e175 - edge
 e176 - edge
 e177 - edge
 e178 - edge
 e179 - edge
 e180 - edge
 e181 - edge
 e182 - edge
 e183 - edge
 e184 - edge
 e185 - edge
 e186 - edge
 e187 - edge
 e188 - edge
 e189 - edge
 e190 - edge
 e191 - edge
 e192 - edge
 e193 - edge
 e194 - edge
 e195 - edge
 e196 - edge
 e197 - edge
 e198 - edge
 e199 - edge
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
(:action R200
:precondition (and(Ktraversable e100)(traversable e100)(not (traversable e101)))
:effect (and(KNtraversable e101))
)
(:action R201
:precondition (and(not (traversable e101))(KNtraversable e101)(traversable e100))
:effect (and(Ktraversable e100))
)
(:action R202
:precondition (and(Ktraversable e101)(traversable e101)(not (traversable e100)))
:effect (and(KNtraversable e100))
)
(:action R203
:precondition (and(not (traversable e100))(KNtraversable e100)(traversable e101))
:effect (and(Ktraversable e101))
)
(:action R204
:precondition (and(Ktraversable e102)(traversable e102)(not (traversable e103)))
:effect (and(KNtraversable e103))
)
(:action R205
:precondition (and(not (traversable e103))(KNtraversable e103)(traversable e102))
:effect (and(Ktraversable e102))
)
(:action R206
:precondition (and(Ktraversable e103)(traversable e103)(not (traversable e102)))
:effect (and(KNtraversable e102))
)
(:action R207
:precondition (and(not (traversable e102))(KNtraversable e102)(traversable e103))
:effect (and(Ktraversable e103))
)
(:action R208
:precondition (and(Ktraversable e104)(traversable e104)(not (traversable e105)))
:effect (and(KNtraversable e105))
)
(:action R209
:precondition (and(not (traversable e105))(KNtraversable e105)(traversable e104))
:effect (and(Ktraversable e104))
)
(:action R210
:precondition (and(Ktraversable e105)(traversable e105)(not (traversable e104)))
:effect (and(KNtraversable e104))
)
(:action R211
:precondition (and(not (traversable e104))(KNtraversable e104)(traversable e105))
:effect (and(Ktraversable e105))
)
(:action R212
:precondition (and(Ktraversable e106)(traversable e106)(not (traversable e107)))
:effect (and(KNtraversable e107))
)
(:action R213
:precondition (and(not (traversable e107))(KNtraversable e107)(traversable e106))
:effect (and(Ktraversable e106))
)
(:action R214
:precondition (and(Ktraversable e107)(traversable e107)(not (traversable e106)))
:effect (and(KNtraversable e106))
)
(:action R215
:precondition (and(not (traversable e106))(KNtraversable e106)(traversable e107))
:effect (and(Ktraversable e107))
)
(:action R216
:precondition (and(Ktraversable e108)(traversable e108)(not (traversable e109)))
:effect (and(KNtraversable e109))
)
(:action R217
:precondition (and(not (traversable e109))(KNtraversable e109)(traversable e108))
:effect (and(Ktraversable e108))
)
(:action R218
:precondition (and(Ktraversable e109)(traversable e109)(not (traversable e108)))
:effect (and(KNtraversable e108))
)
(:action R219
:precondition (and(not (traversable e108))(KNtraversable e108)(traversable e109))
:effect (and(Ktraversable e109))
)
(:action R220
:precondition (and(Ktraversable e110)(traversable e110)(not (traversable e111)))
:effect (and(KNtraversable e111))
)
(:action R221
:precondition (and(not (traversable e111))(KNtraversable e111)(traversable e110))
:effect (and(Ktraversable e110))
)
(:action R222
:precondition (and(Ktraversable e111)(traversable e111)(not (traversable e110)))
:effect (and(KNtraversable e110))
)
(:action R223
:precondition (and(not (traversable e110))(KNtraversable e110)(traversable e111))
:effect (and(Ktraversable e111))
)
(:action R224
:precondition (and(Ktraversable e112)(traversable e112)(not (traversable e113)))
:effect (and(KNtraversable e113))
)
(:action R225
:precondition (and(not (traversable e113))(KNtraversable e113)(traversable e112))
:effect (and(Ktraversable e112))
)
(:action R226
:precondition (and(Ktraversable e113)(traversable e113)(not (traversable e112)))
:effect (and(KNtraversable e112))
)
(:action R227
:precondition (and(not (traversable e112))(KNtraversable e112)(traversable e113))
:effect (and(Ktraversable e113))
)
(:action R228
:precondition (and(Ktraversable e114)(traversable e114)(not (traversable e115)))
:effect (and(KNtraversable e115))
)
(:action R229
:precondition (and(not (traversable e115))(KNtraversable e115)(traversable e114))
:effect (and(Ktraversable e114))
)
(:action R230
:precondition (and(Ktraversable e115)(traversable e115)(not (traversable e114)))
:effect (and(KNtraversable e114))
)
(:action R231
:precondition (and(not (traversable e114))(KNtraversable e114)(traversable e115))
:effect (and(Ktraversable e115))
)
(:action R232
:precondition (and(Ktraversable e116)(traversable e116)(not (traversable e117)))
:effect (and(KNtraversable e117))
)
(:action R233
:precondition (and(not (traversable e117))(KNtraversable e117)(traversable e116))
:effect (and(Ktraversable e116))
)
(:action R234
:precondition (and(Ktraversable e117)(traversable e117)(not (traversable e116)))
:effect (and(KNtraversable e116))
)
(:action R235
:precondition (and(not (traversable e116))(KNtraversable e116)(traversable e117))
:effect (and(Ktraversable e117))
)
(:action R236
:precondition (and(Ktraversable e118)(traversable e118)(not (traversable e119)))
:effect (and(KNtraversable e119))
)
(:action R237
:precondition (and(not (traversable e119))(KNtraversable e119)(traversable e118))
:effect (and(Ktraversable e118))
)
(:action R238
:precondition (and(Ktraversable e119)(traversable e119)(not (traversable e118)))
:effect (and(KNtraversable e118))
)
(:action R239
:precondition (and(not (traversable e118))(KNtraversable e118)(traversable e119))
:effect (and(Ktraversable e119))
)
(:action R240
:precondition (and(Ktraversable e120)(traversable e120)(not (traversable e121)))
:effect (and(KNtraversable e121))
)
(:action R241
:precondition (and(not (traversable e121))(KNtraversable e121)(traversable e120))
:effect (and(Ktraversable e120))
)
(:action R242
:precondition (and(Ktraversable e121)(traversable e121)(not (traversable e120)))
:effect (and(KNtraversable e120))
)
(:action R243
:precondition (and(not (traversable e120))(KNtraversable e120)(traversable e121))
:effect (and(Ktraversable e121))
)
(:action R244
:precondition (and(Ktraversable e122)(traversable e122)(not (traversable e123)))
:effect (and(KNtraversable e123))
)
(:action R245
:precondition (and(not (traversable e123))(KNtraversable e123)(traversable e122))
:effect (and(Ktraversable e122))
)
(:action R246
:precondition (and(Ktraversable e123)(traversable e123)(not (traversable e122)))
:effect (and(KNtraversable e122))
)
(:action R247
:precondition (and(not (traversable e122))(KNtraversable e122)(traversable e123))
:effect (and(Ktraversable e123))
)
(:action R248
:precondition (and(Ktraversable e124)(traversable e124)(not (traversable e125)))
:effect (and(KNtraversable e125))
)
(:action R249
:precondition (and(not (traversable e125))(KNtraversable e125)(traversable e124))
:effect (and(Ktraversable e124))
)
(:action R250
:precondition (and(Ktraversable e125)(traversable e125)(not (traversable e124)))
:effect (and(KNtraversable e124))
)
(:action R251
:precondition (and(not (traversable e124))(KNtraversable e124)(traversable e125))
:effect (and(Ktraversable e125))
)
(:action R252
:precondition (and(Ktraversable e126)(traversable e126)(not (traversable e127)))
:effect (and(KNtraversable e127))
)
(:action R253
:precondition (and(not (traversable e127))(KNtraversable e127)(traversable e126))
:effect (and(Ktraversable e126))
)
(:action R254
:precondition (and(Ktraversable e127)(traversable e127)(not (traversable e126)))
:effect (and(KNtraversable e126))
)
(:action R255
:precondition (and(not (traversable e126))(KNtraversable e126)(traversable e127))
:effect (and(Ktraversable e127))
)
(:action R256
:precondition (and(Ktraversable e128)(traversable e128)(not (traversable e129)))
:effect (and(KNtraversable e129))
)
(:action R257
:precondition (and(not (traversable e129))(KNtraversable e129)(traversable e128))
:effect (and(Ktraversable e128))
)
(:action R258
:precondition (and(Ktraversable e129)(traversable e129)(not (traversable e128)))
:effect (and(KNtraversable e128))
)
(:action R259
:precondition (and(not (traversable e128))(KNtraversable e128)(traversable e129))
:effect (and(Ktraversable e129))
)
(:action R260
:precondition (and(Ktraversable e130)(traversable e130)(not (traversable e131)))
:effect (and(KNtraversable e131))
)
(:action R261
:precondition (and(not (traversable e131))(KNtraversable e131)(traversable e130))
:effect (and(Ktraversable e130))
)
(:action R262
:precondition (and(Ktraversable e131)(traversable e131)(not (traversable e130)))
:effect (and(KNtraversable e130))
)
(:action R263
:precondition (and(not (traversable e130))(KNtraversable e130)(traversable e131))
:effect (and(Ktraversable e131))
)
(:action R264
:precondition (and(Ktraversable e132)(traversable e132)(not (traversable e133)))
:effect (and(KNtraversable e133))
)
(:action R265
:precondition (and(not (traversable e133))(KNtraversable e133)(traversable e132))
:effect (and(Ktraversable e132))
)
(:action R266
:precondition (and(Ktraversable e133)(traversable e133)(not (traversable e132)))
:effect (and(KNtraversable e132))
)
(:action R267
:precondition (and(not (traversable e132))(KNtraversable e132)(traversable e133))
:effect (and(Ktraversable e133))
)
(:action R268
:precondition (and(Ktraversable e134)(traversable e134)(not (traversable e135)))
:effect (and(KNtraversable e135))
)
(:action R269
:precondition (and(not (traversable e135))(KNtraversable e135)(traversable e134))
:effect (and(Ktraversable e134))
)
(:action R270
:precondition (and(Ktraversable e135)(traversable e135)(not (traversable e134)))
:effect (and(KNtraversable e134))
)
(:action R271
:precondition (and(not (traversable e134))(KNtraversable e134)(traversable e135))
:effect (and(Ktraversable e135))
)
(:action R272
:precondition (and(Ktraversable e136)(traversable e136)(not (traversable e137)))
:effect (and(KNtraversable e137))
)
(:action R273
:precondition (and(not (traversable e137))(KNtraversable e137)(traversable e136))
:effect (and(Ktraversable e136))
)
(:action R274
:precondition (and(Ktraversable e137)(traversable e137)(not (traversable e136)))
:effect (and(KNtraversable e136))
)
(:action R275
:precondition (and(not (traversable e136))(KNtraversable e136)(traversable e137))
:effect (and(Ktraversable e137))
)
(:action R276
:precondition (and(Ktraversable e138)(traversable e138)(not (traversable e139)))
:effect (and(KNtraversable e139))
)
(:action R277
:precondition (and(not (traversable e139))(KNtraversable e139)(traversable e138))
:effect (and(Ktraversable e138))
)
(:action R278
:precondition (and(Ktraversable e139)(traversable e139)(not (traversable e138)))
:effect (and(KNtraversable e138))
)
(:action R279
:precondition (and(not (traversable e138))(KNtraversable e138)(traversable e139))
:effect (and(Ktraversable e139))
)
(:action R280
:precondition (and(Ktraversable e140)(traversable e140)(not (traversable e141)))
:effect (and(KNtraversable e141))
)
(:action R281
:precondition (and(not (traversable e141))(KNtraversable e141)(traversable e140))
:effect (and(Ktraversable e140))
)
(:action R282
:precondition (and(Ktraversable e141)(traversable e141)(not (traversable e140)))
:effect (and(KNtraversable e140))
)
(:action R283
:precondition (and(not (traversable e140))(KNtraversable e140)(traversable e141))
:effect (and(Ktraversable e141))
)
(:action R284
:precondition (and(Ktraversable e142)(traversable e142)(not (traversable e143)))
:effect (and(KNtraversable e143))
)
(:action R285
:precondition (and(not (traversable e143))(KNtraversable e143)(traversable e142))
:effect (and(Ktraversable e142))
)
(:action R286
:precondition (and(Ktraversable e143)(traversable e143)(not (traversable e142)))
:effect (and(KNtraversable e142))
)
(:action R287
:precondition (and(not (traversable e142))(KNtraversable e142)(traversable e143))
:effect (and(Ktraversable e143))
)
(:action R288
:precondition (and(Ktraversable e144)(traversable e144)(not (traversable e145)))
:effect (and(KNtraversable e145))
)
(:action R289
:precondition (and(not (traversable e145))(KNtraversable e145)(traversable e144))
:effect (and(Ktraversable e144))
)
(:action R290
:precondition (and(Ktraversable e145)(traversable e145)(not (traversable e144)))
:effect (and(KNtraversable e144))
)
(:action R291
:precondition (and(not (traversable e144))(KNtraversable e144)(traversable e145))
:effect (and(Ktraversable e145))
)
(:action R292
:precondition (and(Ktraversable e146)(traversable e146)(not (traversable e147)))
:effect (and(KNtraversable e147))
)
(:action R293
:precondition (and(not (traversable e147))(KNtraversable e147)(traversable e146))
:effect (and(Ktraversable e146))
)
(:action R294
:precondition (and(Ktraversable e147)(traversable e147)(not (traversable e146)))
:effect (and(KNtraversable e146))
)
(:action R295
:precondition (and(not (traversable e146))(KNtraversable e146)(traversable e147))
:effect (and(Ktraversable e147))
)
(:action R296
:precondition (and(Ktraversable e148)(traversable e148)(not (traversable e149)))
:effect (and(KNtraversable e149))
)
(:action R297
:precondition (and(not (traversable e149))(KNtraversable e149)(traversable e148))
:effect (and(Ktraversable e148))
)
(:action R298
:precondition (and(Ktraversable e149)(traversable e149)(not (traversable e148)))
:effect (and(KNtraversable e148))
)
(:action R299
:precondition (and(not (traversable e148))(KNtraversable e148)(traversable e149))
:effect (and(Ktraversable e149))
)
(:action R300
:precondition (and(Ktraversable e150)(traversable e150)(not (traversable e151)))
:effect (and(KNtraversable e151))
)
(:action R301
:precondition (and(not (traversable e151))(KNtraversable e151)(traversable e150))
:effect (and(Ktraversable e150))
)
(:action R302
:precondition (and(Ktraversable e151)(traversable e151)(not (traversable e150)))
:effect (and(KNtraversable e150))
)
(:action R303
:precondition (and(not (traversable e150))(KNtraversable e150)(traversable e151))
:effect (and(Ktraversable e151))
)
(:action R304
:precondition (and(Ktraversable e152)(traversable e152)(not (traversable e153)))
:effect (and(KNtraversable e153))
)
(:action R305
:precondition (and(not (traversable e153))(KNtraversable e153)(traversable e152))
:effect (and(Ktraversable e152))
)
(:action R306
:precondition (and(Ktraversable e153)(traversable e153)(not (traversable e152)))
:effect (and(KNtraversable e152))
)
(:action R307
:precondition (and(not (traversable e152))(KNtraversable e152)(traversable e153))
:effect (and(Ktraversable e153))
)
(:action R308
:precondition (and(Ktraversable e154)(traversable e154)(not (traversable e155)))
:effect (and(KNtraversable e155))
)
(:action R309
:precondition (and(not (traversable e155))(KNtraversable e155)(traversable e154))
:effect (and(Ktraversable e154))
)
(:action R310
:precondition (and(Ktraversable e155)(traversable e155)(not (traversable e154)))
:effect (and(KNtraversable e154))
)
(:action R311
:precondition (and(not (traversable e154))(KNtraversable e154)(traversable e155))
:effect (and(Ktraversable e155))
)
(:action R312
:precondition (and(Ktraversable e156)(traversable e156)(not (traversable e157)))
:effect (and(KNtraversable e157))
)
(:action R313
:precondition (and(not (traversable e157))(KNtraversable e157)(traversable e156))
:effect (and(Ktraversable e156))
)
(:action R314
:precondition (and(Ktraversable e157)(traversable e157)(not (traversable e156)))
:effect (and(KNtraversable e156))
)
(:action R315
:precondition (and(not (traversable e156))(KNtraversable e156)(traversable e157))
:effect (and(Ktraversable e157))
)
(:action R316
:precondition (and(Ktraversable e158)(traversable e158)(not (traversable e159)))
:effect (and(KNtraversable e159))
)
(:action R317
:precondition (and(not (traversable e159))(KNtraversable e159)(traversable e158))
:effect (and(Ktraversable e158))
)
(:action R318
:precondition (and(Ktraversable e159)(traversable e159)(not (traversable e158)))
:effect (and(KNtraversable e158))
)
(:action R319
:precondition (and(not (traversable e158))(KNtraversable e158)(traversable e159))
:effect (and(Ktraversable e159))
)
(:action R320
:precondition (and(Ktraversable e160)(traversable e160)(not (traversable e161)))
:effect (and(KNtraversable e161))
)
(:action R321
:precondition (and(not (traversable e161))(KNtraversable e161)(traversable e160))
:effect (and(Ktraversable e160))
)
(:action R322
:precondition (and(Ktraversable e161)(traversable e161)(not (traversable e160)))
:effect (and(KNtraversable e160))
)
(:action R323
:precondition (and(not (traversable e160))(KNtraversable e160)(traversable e161))
:effect (and(Ktraversable e161))
)
(:action R324
:precondition (and(Ktraversable e162)(traversable e162)(not (traversable e163)))
:effect (and(KNtraversable e163))
)
(:action R325
:precondition (and(not (traversable e163))(KNtraversable e163)(traversable e162))
:effect (and(Ktraversable e162))
)
(:action R326
:precondition (and(Ktraversable e163)(traversable e163)(not (traversable e162)))
:effect (and(KNtraversable e162))
)
(:action R327
:precondition (and(not (traversable e162))(KNtraversable e162)(traversable e163))
:effect (and(Ktraversable e163))
)
(:action R328
:precondition (and(Ktraversable e164)(traversable e164)(not (traversable e165)))
:effect (and(KNtraversable e165))
)
(:action R329
:precondition (and(not (traversable e165))(KNtraversable e165)(traversable e164))
:effect (and(Ktraversable e164))
)
(:action R330
:precondition (and(Ktraversable e165)(traversable e165)(not (traversable e164)))
:effect (and(KNtraversable e164))
)
(:action R331
:precondition (and(not (traversable e164))(KNtraversable e164)(traversable e165))
:effect (and(Ktraversable e165))
)
(:action R332
:precondition (and(Ktraversable e166)(traversable e166)(not (traversable e167)))
:effect (and(KNtraversable e167))
)
(:action R333
:precondition (and(not (traversable e167))(KNtraversable e167)(traversable e166))
:effect (and(Ktraversable e166))
)
(:action R334
:precondition (and(Ktraversable e167)(traversable e167)(not (traversable e166)))
:effect (and(KNtraversable e166))
)
(:action R335
:precondition (and(not (traversable e166))(KNtraversable e166)(traversable e167))
:effect (and(Ktraversable e167))
)
(:action R336
:precondition (and(Ktraversable e168)(traversable e168)(not (traversable e169)))
:effect (and(KNtraversable e169))
)
(:action R337
:precondition (and(not (traversable e169))(KNtraversable e169)(traversable e168))
:effect (and(Ktraversable e168))
)
(:action R338
:precondition (and(Ktraversable e169)(traversable e169)(not (traversable e168)))
:effect (and(KNtraversable e168))
)
(:action R339
:precondition (and(not (traversable e168))(KNtraversable e168)(traversable e169))
:effect (and(Ktraversable e169))
)
(:action R340
:precondition (and(Ktraversable e170)(traversable e170)(not (traversable e171)))
:effect (and(KNtraversable e171))
)
(:action R341
:precondition (and(not (traversable e171))(KNtraversable e171)(traversable e170))
:effect (and(Ktraversable e170))
)
(:action R342
:precondition (and(Ktraversable e171)(traversable e171)(not (traversable e170)))
:effect (and(KNtraversable e170))
)
(:action R343
:precondition (and(not (traversable e170))(KNtraversable e170)(traversable e171))
:effect (and(Ktraversable e171))
)
(:action R344
:precondition (and(Ktraversable e172)(traversable e172)(not (traversable e173)))
:effect (and(KNtraversable e173))
)
(:action R345
:precondition (and(not (traversable e173))(KNtraversable e173)(traversable e172))
:effect (and(Ktraversable e172))
)
(:action R346
:precondition (and(Ktraversable e173)(traversable e173)(not (traversable e172)))
:effect (and(KNtraversable e172))
)
(:action R347
:precondition (and(not (traversable e172))(KNtraversable e172)(traversable e173))
:effect (and(Ktraversable e173))
)
(:action R348
:precondition (and(Ktraversable e174)(traversable e174)(not (traversable e175)))
:effect (and(KNtraversable e175))
)
(:action R349
:precondition (and(not (traversable e175))(KNtraversable e175)(traversable e174))
:effect (and(Ktraversable e174))
)
(:action R350
:precondition (and(Ktraversable e175)(traversable e175)(not (traversable e174)))
:effect (and(KNtraversable e174))
)
(:action R351
:precondition (and(not (traversable e174))(KNtraversable e174)(traversable e175))
:effect (and(Ktraversable e175))
)
(:action R352
:precondition (and(Ktraversable e176)(traversable e176)(not (traversable e177)))
:effect (and(KNtraversable e177))
)
(:action R353
:precondition (and(not (traversable e177))(KNtraversable e177)(traversable e176))
:effect (and(Ktraversable e176))
)
(:action R354
:precondition (and(Ktraversable e177)(traversable e177)(not (traversable e176)))
:effect (and(KNtraversable e176))
)
(:action R355
:precondition (and(not (traversable e176))(KNtraversable e176)(traversable e177))
:effect (and(Ktraversable e177))
)
(:action R356
:precondition (and(Ktraversable e178)(traversable e178)(not (traversable e179)))
:effect (and(KNtraversable e179))
)
(:action R357
:precondition (and(not (traversable e179))(KNtraversable e179)(traversable e178))
:effect (and(Ktraversable e178))
)
(:action R358
:precondition (and(Ktraversable e179)(traversable e179)(not (traversable e178)))
:effect (and(KNtraversable e178))
)
(:action R359
:precondition (and(not (traversable e178))(KNtraversable e178)(traversable e179))
:effect (and(Ktraversable e179))
)
(:action R360
:precondition (and(Ktraversable e180)(traversable e180)(not (traversable e181)))
:effect (and(KNtraversable e181))
)
(:action R361
:precondition (and(not (traversable e181))(KNtraversable e181)(traversable e180))
:effect (and(Ktraversable e180))
)
(:action R362
:precondition (and(Ktraversable e181)(traversable e181)(not (traversable e180)))
:effect (and(KNtraversable e180))
)
(:action R363
:precondition (and(not (traversable e180))(KNtraversable e180)(traversable e181))
:effect (and(Ktraversable e181))
)
(:action R364
:precondition (and(Ktraversable e182)(traversable e182)(not (traversable e183)))
:effect (and(KNtraversable e183))
)
(:action R365
:precondition (and(not (traversable e183))(KNtraversable e183)(traversable e182))
:effect (and(Ktraversable e182))
)
(:action R366
:precondition (and(Ktraversable e183)(traversable e183)(not (traversable e182)))
:effect (and(KNtraversable e182))
)
(:action R367
:precondition (and(not (traversable e182))(KNtraversable e182)(traversable e183))
:effect (and(Ktraversable e183))
)
(:action R368
:precondition (and(Ktraversable e184)(traversable e184)(not (traversable e185)))
:effect (and(KNtraversable e185))
)
(:action R369
:precondition (and(not (traversable e185))(KNtraversable e185)(traversable e184))
:effect (and(Ktraversable e184))
)
(:action R370
:precondition (and(Ktraversable e185)(traversable e185)(not (traversable e184)))
:effect (and(KNtraversable e184))
)
(:action R371
:precondition (and(not (traversable e184))(KNtraversable e184)(traversable e185))
:effect (and(Ktraversable e185))
)
(:action R372
:precondition (and(Ktraversable e186)(traversable e186)(not (traversable e187)))
:effect (and(KNtraversable e187))
)
(:action R373
:precondition (and(not (traversable e187))(KNtraversable e187)(traversable e186))
:effect (and(Ktraversable e186))
)
(:action R374
:precondition (and(Ktraversable e187)(traversable e187)(not (traversable e186)))
:effect (and(KNtraversable e186))
)
(:action R375
:precondition (and(not (traversable e186))(KNtraversable e186)(traversable e187))
:effect (and(Ktraversable e187))
)
(:action R376
:precondition (and(Ktraversable e188)(traversable e188)(not (traversable e189)))
:effect (and(KNtraversable e189))
)
(:action R377
:precondition (and(not (traversable e189))(KNtraversable e189)(traversable e188))
:effect (and(Ktraversable e188))
)
(:action R378
:precondition (and(Ktraversable e189)(traversable e189)(not (traversable e188)))
:effect (and(KNtraversable e188))
)
(:action R379
:precondition (and(not (traversable e188))(KNtraversable e188)(traversable e189))
:effect (and(Ktraversable e189))
)
(:action R380
:precondition (and(Ktraversable e190)(traversable e190)(not (traversable e191)))
:effect (and(KNtraversable e191))
)
(:action R381
:precondition (and(not (traversable e191))(KNtraversable e191)(traversable e190))
:effect (and(Ktraversable e190))
)
(:action R382
:precondition (and(Ktraversable e191)(traversable e191)(not (traversable e190)))
:effect (and(KNtraversable e190))
)
(:action R383
:precondition (and(not (traversable e190))(KNtraversable e190)(traversable e191))
:effect (and(Ktraversable e191))
)
(:action R384
:precondition (and(Ktraversable e192)(traversable e192)(not (traversable e193)))
:effect (and(KNtraversable e193))
)
(:action R385
:precondition (and(not (traversable e193))(KNtraversable e193)(traversable e192))
:effect (and(Ktraversable e192))
)
(:action R386
:precondition (and(Ktraversable e193)(traversable e193)(not (traversable e192)))
:effect (and(KNtraversable e192))
)
(:action R387
:precondition (and(not (traversable e192))(KNtraversable e192)(traversable e193))
:effect (and(Ktraversable e193))
)
(:action R388
:precondition (and(Ktraversable e194)(traversable e194)(not (traversable e195)))
:effect (and(KNtraversable e195))
)
(:action R389
:precondition (and(not (traversable e195))(KNtraversable e195)(traversable e194))
:effect (and(Ktraversable e194))
)
(:action R390
:precondition (and(Ktraversable e195)(traversable e195)(not (traversable e194)))
:effect (and(KNtraversable e194))
)
(:action R391
:precondition (and(not (traversable e194))(KNtraversable e194)(traversable e195))
:effect (and(Ktraversable e195))
)
(:action R392
:precondition (and(Ktraversable e196)(traversable e196)(not (traversable e197)))
:effect (and(KNtraversable e197))
)
(:action R393
:precondition (and(not (traversable e197))(KNtraversable e197)(traversable e196))
:effect (and(Ktraversable e196))
)
(:action R394
:precondition (and(Ktraversable e197)(traversable e197)(not (traversable e196)))
:effect (and(KNtraversable e196))
)
(:action R395
:precondition (and(not (traversable e196))(KNtraversable e196)(traversable e197))
:effect (and(Ktraversable e197))
)
(:action R396
:precondition (and(Ktraversable e198)(traversable e198)(not (traversable e199)))
:effect (and(KNtraversable e199))
)
(:action R397
:precondition (and(not (traversable e199))(KNtraversable e199)(traversable e198))
:effect (and(Ktraversable e198))
)
(:action R398
:precondition (and(Ktraversable e199)(traversable e199)(not (traversable e198)))
:effect (and(KNtraversable e198))
)
(:action R399
:precondition (and(not (traversable e198))(KNtraversable e198)(traversable e199))
:effect (and(Ktraversable e199))
)
)
