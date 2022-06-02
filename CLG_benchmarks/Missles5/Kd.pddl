(define (domain Kmyworld)
(:requirements :strips :typing)
(:types grid blow rocket patha d_plaunch)
(:constants
 turn - turn
 blown - blow
 a - rocket
 d - rocket
 sensor - rocket
 a1 - patha
 a2 - patha
 a3 - patha
 a4 - patha
 a5 - patha
 n0 - grid
 n1 - grid
 n2 - grid
 n3 - grid
 n4 - grid
 n5 - grid
 n6 - grid
 n7 - grid
 n8 - grid
 n9 - grid
 n10 - grid
 n11 - grid
 n12 - grid
 n13 - grid
 n14 - grid
 d1 - d_plaunch
 d2 - d_plaunch
 d3 - d_plaunch
)

(:predicates
(atx ?r - rocket ?x - grid)
(aty ?r - rocket ?y - grid)
(atz ?r - rocket ?z - grid)
(turn ?r - rocket)
(isblown ?x - blow)
(d_launchfromx ?p - d_plaunch ?x - grid)
(d_launchfromy ?p - d_plaunch ?y - grid)
(d_launchfromz ?p - d_plaunch ?z - grid)
(blurlocation ?r - rocket)
(initlocation ?r - rocket)
(blurpath ?r - rocket)
(pathselected ?p - patha)
(up ?x - grid ?y - grid)
(down ?x - grid ?y - grid)
)

(:action launchd
:parameters ( ?x - grid ?y - grid ?z - grid ?p - d_plaunch)
:precondition 
(and (turn d) (d_launchfromx ?p ?x) (d_launchfromy ?p ?y) (d_launchfromz ?p ?z) (blurlocation d))
:effect 
(and (atx d ?x) (aty d ?y) (atz d ?z) (not (blurlocation d)) (initlocation d) (not (turn d)) (turn a))
)

(:action launchd1
:parameters ( ?x - grid ?y - grid ?p - d_plaunch)
:precondition 
(and (turn d) (d_launchfromx ?p ?x) (d_launchfromy ?p ?y) (d_launchfromz ?p ?y) (blurlocation d))
:effect 
(and (atx d ?x) (aty d ?y) (atz d ?y) (not (blurlocation d)) (initlocation d) (not (turn d)) (turn a))
)

(:action launchd2
:parameters ( ?x - grid ?y - grid ?p - d_plaunch)
:precondition 
(and (turn d) (d_launchfromx ?p ?x) (d_launchfromy ?p ?x) (d_launchfromz ?p ?y) (blurlocation d))
:effect 
(and (atx d ?x) (aty d ?x) (atz d ?y) (not (blurlocation d)) (initlocation d) (not (turn d)) (turn a))
)

(:action launchd3
:parameters ( ?x - grid ?y - grid ?p - d_plaunch)
:precondition 
(and (turn d) (d_launchfromx ?p ?x) (d_launchfromy ?p ?y) (d_launchfromz ?p ?x) (blurlocation d))
:effect 
(and (atx d ?x) (aty d ?y) (atz d ?x) (not (blurlocation d)) (initlocation d) (not (turn d)) (turn a))
)

(:action launchd4
:parameters ( ?x - grid ?p - d_plaunch)
:precondition 
(and (turn d) (d_launchfromx ?p ?x) (d_launchfromy ?p ?x) (d_launchfromz ?p ?x) (blurlocation d))
:effect 
(and (atx d ?x) (aty d ?x) (atz d ?x) (not (blurlocation d)) (initlocation d) (not (turn d)) (turn a))
)

(:action waitbeforelaunchd
:precondition 
(and (turn d) (blurlocation d))
:effect 
(and (not (turn d)) (turn a))
)

(:action moved_x_up
:parameters ( ?x_from - grid ?x_to - grid)
:precondition 
(and (turn d) (atx d ?x_from) (up ?x_from ?x_to) (initlocation d))
:effect 
(and (not (atx d ?x_from)) (atx d ?x_to) (not (turn d)) (turn a))
)

(:action moved_x_down
:parameters ( ?x_from - grid ?x_to - grid)
:precondition 
(and (atx d ?x_from) (turn d) (down ?x_from ?x_to) (initlocation d))
:effect 
(and (not (atx d ?x_from)) (atx d ?x_to) (not (turn d)) (turn a))
)

(:action moved_y_up
:parameters ( ?y_from - grid ?y_to - grid)
:precondition 
(and (turn d) (aty d ?y_from) (up ?y_from ?y_to) (initlocation d))
:effect 
(and (not (aty d ?y_from)) (aty d ?y_to) (not (turn d)) (turn a))
)

(:action moved_y_down
:parameters ( ?y_from - grid ?y_to - grid)
:precondition 
(and (aty d ?y_from) (turn d) (down ?y_from ?y_to) (initlocation d))
:effect 
(and (not (aty d ?y_from)) (aty d ?y_to) (not (turn d)) (turn a))
)

(:action moved_z_up
:parameters ( ?z_from - grid ?z_to - grid)
:precondition 
(and (turn d) (up ?z_from ?z_to) (atz d ?z_from) (initlocation d))
:effect 
(and (not (atz d ?z_from)) (atz d ?z_to) (not (turn d)) (turn a))
)

(:action moved_z_down
:parameters ( ?x_from - grid ?x_to - grid)
:precondition 
(and (turn d) (down ?x_from ?x_to) (atz d ?x_from) (initlocation d))
:effect 
(and (not (atx d ?x_from)) (atx d ?x_to) (not (turn d)) (turn a))
)

(:action launcha
:precondition 
(and (turn a) (blurlocation a))
:effect 
(and (initlocation a) (not (blurlocation a)) (not (turn a)) (turn sensor) 
	(when (pathselected a1) 
		(and (atx a n1) (aty a n0) (atz a n0)))
	(when (pathselected a2) 
		(and (atx a n1) (aty a n0) (atz a n0)))
	(when (pathselected a3) 
		(and (atx a n0) (aty a n1) (atz a n2))))
)

(:action verifya
:parameters ( ?x - grid ?y - grid ?z - grid)
:precondition 
(and (turn sensor) (atx a ?x) (aty a ?y) (atz a ?z))
:effect 
(and (not (turn sensor)) (turn d))
)

(:action movea
:precondition 
(and (initlocation a) (turn a))
:effect 
(and (not (turn a)) (turn sensor) 
	(when 
		(and (pathselected a1) (atx a n1) (aty a n0) (atz a n0))
		(and (not (aty a n0)) (aty a n1)))
	(when 
		(and (pathselected a1) (atx a n1) (aty a n1) (atz a n0))
		(and (not (atz a n0)) (atz a n1)))
	(when 
		(and (pathselected a1) (atx a n1) (aty a n1) (atz a n1))
		(and (not (atz a n1)) (atz a n2)))
	(when 
		(and (pathselected a1) (atx a n1) (aty a n1) (atz a n2))
		(and (not (aty a n1)) (aty a n2)))
	(when 
		(and (pathselected a1) (atx a n1) (aty a n2) (atz a n2))
		(and (not (aty a n2)) (aty a n3)))
	(when 
		(and (pathselected a1) (atx a n1) (aty a n3) (atz a n2))
		(and (not (atz a n2)) (atz a n3)))
	(when 
		(and (pathselected a1) (atx a n1) (aty a n3) (atz a n3))
		(and (not (aty a n3)) (aty a n4)))
	(when 
		(and (pathselected a1) (atx a n1) (aty a n4) (atz a n3))
		(and (not (aty a n4)) (aty a n5)))
	(when 
		(and (pathselected a1) (atx a n1) (aty a n5) (atz a n3))
		(and (not (atz a n3)) (atz a n4)))
	(when 
		(and (pathselected a1) (atx a n1) (aty a n5) (atz a n4))
		(and (not (aty a n5)) (aty a n6)))
	(when 
		(and (pathselected a1) (atx a n1) (aty a n6) (atz a n4))
		(and (not (aty a n6)) (aty a n7)))
	(when 
		(and (pathselected a1) (atx a n1) (aty a n7) (atz a n4))
		(and (not (atz a n4)) (atz a n5)))
	(when 
		(and (pathselected a1) (atx a n1) (aty a n7) (atz a n5))
		(and (not (aty a n7)) (aty a n8)))
	(when 
		(and (pathselected a1) (atx a n1) (aty a n8) (atz a n5))
		(and (not (aty a n8)) (aty a n9)))
	(when 
		(and (pathselected a1) (atx a n1) (aty a n9) (atz a n5))
		(and (not (atz a n5)) (atz a n6)))
	(when 
		(and (pathselected a1) (atx a n1) (aty a n9) (atz a n6))
		(and (not (aty a n9)) (aty a n10)))
	(when 
		(and (pathselected a1) (atx a n1) (aty a n10) (atz a n6))
		(and (not (aty a n10)) (aty a n11)))
	(when 
		(and (pathselected a1) (atx a n1) (aty a n11) (atz a n6))
		(and (not (atz a n6)) (atz a n7)))
	(when 
		(and (pathselected a1) (atx a n1) (aty a n11) (atz a n7))
		(and (not (aty a n11)) (aty a n12)))
	(when 
		(and (pathselected a1) (atx a n1) (aty a n12) (atz a n7))
		(and (not (aty a n12)) (aty a n13)))
	(when 
		(and (pathselected a2) (atx a n1) (aty a n0) (atz a n0))
		(and (not (aty a n0)) (aty a n1)))
	(when 
		(and (pathselected a2) (atx a n1) (aty a n1) (atz a n0))
		(and (not (atz a n0)) (atz a n1)))
	(when 
		(and (pathselected a2) (atx a n1) (aty a n1) (atz a n1))
		(and (not (atx a n1)) (atx a n2)))
	(when 
		(and (pathselected a2) (atx a n2) (aty a n1) (atz a n1))
		(and (not (atx a n2)) (atx a n3)))
	(when 
		(and (pathselected a2) (atx a n3) (aty a n1) (atz a n1))
		(and (not (atz a n1)) (atz a n2)))
	(when 
		(and (pathselected a2) (atx a n3) (aty a n1) (atz a n2))
		(and (not (atx a n3)) (atx a n4)))
	(when 
		(and (pathselected a2) (atx a n4) (aty a n1) (atz a n2))
		(and (not (atx a n4)) (atx a n5)))
	(when 
		(and (pathselected a2) (atx a n5) (aty a n1) (atz a n2))
		(and (not (atz a n2)) (atz a n3)))
	(when 
		(and (pathselected a2) (atx a n5) (aty a n1) (atz a n3))
		(and (not (atx a n5)) (atx a n6)))
	(when 
		(and (pathselected a2) (atx a n6) (aty a n1) (atz a n3))
		(and (not (aty a n1)) (aty a n2)))
	(when 
		(and (pathselected a2) (atx a n6) (aty a n2) (atz a n3))
		(and (not (atz a n3)) (atz a n4)))
	(when 
		(and (pathselected a2) (atx a n6) (aty a n2) (atz a n4))
		(and (not (atx a n6)) (atx a n7)))
	(when 
		(and (pathselected a2) (atx a n7) (aty a n2) (atz a n4))
		(and (not (atx a n7)) (atx a n8)))
	(when 
		(and (pathselected a2) (atx a n8) (aty a n2) (atz a n4))
		(and (not (atx a n8)) (atx a n9)))
	(when 
		(and (pathselected a2) (atx a n9) (aty a n2) (atz a n4))
		(and (not (atz a n4)) (atz a n5)))
	(when 
		(and (pathselected a2) (atx a n9) (aty a n2) (atz a n5))
		(and (not (atx a n9)) (atx a n10)))
	(when 
		(and (pathselected a2) (atx a n10) (aty a n2) (atz a n5))
		(and (not (atx a n10)) (atx a n11)))
	(when 
		(and (pathselected a2) (atx a n11) (aty a n2) (atz a n5))
		(and (not (atz a n5)) (atz a n6)))
	(when 
		(and (pathselected a2) (atx a n11) (aty a n2) (atz a n6))
		(and (not (atx a n11)) (atx a n12)))
	(when 
		(and (pathselected a3) (atx a n0) (aty a n1) (atz a n2))
		(and (not (atz a n2)) (atz a n3)))
	(when 
		(and (pathselected a3) (atx a n0) (aty a n1) (atz a n3))
		(and (not (aty a n1)) (aty a n0)))
	(when 
		(and (pathselected a3) (atx a n0) (aty a n0) (atz a n3))
		(and (not (atx a n0)) (atx a n1)))
	(when 
		(and (pathselected a3) (atx a n1) (aty a n0) (atz a n3))
		(and (not (aty a n0)) (aty a n1)))
	(when 
		(and (pathselected a3) (atx a n1) (aty a n1) (atz a n3))
		(and (not (atz a n3)) (atz a n4)))
	(when 
		(and (pathselected a3) (atx a n1) (aty a n1) (atz a n4))
		(and (not (atz a n4)) (atz a n5)))
	(when 
		(and (pathselected a3) (atx a n1) (aty a n1) (atz a n5))
		(and (not (atz a n5)) (atz a n6)))
	(when 
		(and (pathselected a3) (atx a n1) (aty a n1) (atz a n6))
		(and (not (aty a n1)) (aty a n2)))
	(when 
		(and (pathselected a3) (atx a n1) (aty a n2) (atz a n6))
		(and (not (atz a n6)) (atz a n7)))
	(when 
		(and (pathselected a3) (atx a n1) (aty a n2) (atz a n7))
		(and (not (atz a n7)) (atz a n8)))
	(when 
		(and (pathselected a3) (atx a n1) (aty a n2) (atz a n8))
		(and (not (atx a n1)) (atx a n2)))
	(when 
		(and (pathselected a3) (atx a n2) (aty a n2) (atz a n8))
		(and (not (atz a n8)) (atz a n9)))
	(when 
		(and (pathselected a3) (atx a n2) (aty a n2) (atz a n9))
		(and (not (atz a n9)) (atz a n10)))
	(when 
		(and (pathselected a3) (atx a n2) (aty a n2) (atz a n10))
		(and (not (aty a n2)) (aty a n3)))
	(when 
		(and (pathselected a3) (atx a n2) (aty a n3) (atz a n10))
		(and (not (atz a n10)) (atz a n11)))
	(when 
		(and (pathselected a3) (atx a n2) (aty a n3) (atz a n11))
		(and (not (atz a n11)) (atz a n12)))
	(when 
		(and (pathselected a3) (atx a n2) (aty a n3) (atz a n12))
		(and (not (atx a n2)) (atx a n3)))
	(when 
		(and (pathselected a3) (atx a n3) (aty a n3) (atz a n12))
		(and (not (atz a n12)) (atz a n13)))
	(when 
		(and (pathselected a3) (atx a n3) (aty a n3) (atz a n13))
		(and (not (atz a n13)) (atz a n14))))
)

(:action blowup
:parameters ( ?x - grid ?y - grid ?z - grid)
:precondition 
(and (atx a ?x) (atx d ?x) (aty a ?y) (aty d ?y) (atz a ?z) (atz d ?z) (turn d))
:effect (isblown blown)
)

)
