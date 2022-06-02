(define (domain myWorld)

;(:requirements :typing :adl :equality)

(:types Grid Blow Rocket PathA D_pLaunch)

(:predicates                  
		(atX ?r ?x)
		(atY ?r ?y)
		(atZ ?r ?z)
		(turn ?r - Rocket) 
		(isBlown ?x - Blow) 
		(D_launchFromX ?p - D_pLaunch ?x - Grid)
		(D_launchFromY ?p - D_pLaunch ?y - Grid)
		(D_launchFromZ ?p - D_pLaunch ?z - Grid)
		(blurLocation ?r - Rocket)
		(initLocation ?r - Rocket)	
		(blurPath ?r - Rocket)
		(pathSelected ?p - PathA)
		(up ?x - Grid ?y - Grid)
		(down ?x - Grid ?y - Grid)	
)


(:constants     turn - Turn 
		blown - Blow
		a d sensor - Rocket
		A1 A2 A3 A4 A5 - pathA	
		n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12 n13 n14  - Grid
		d1 d2 d3 - D_pLaunch
)
	
(:action launchD											
	:parameters (?x - Grid ?y - Grid ?z - Grid ?p - D_pLaunch)
	:precondition (and (turn d) (D_launchFromX ?p ?x) (D_launchFromY ?p ?y) (D_launchFromZ ?p ?z) (blurLocation d))
	:effect (and (atX d ?x) (atY d ?y) (atZ d ?z) (not (blurLocation d)) (initLocation d) (not (turn d)) (turn a))
				
)

(:action launchD1											
	:parameters (?x - Grid ?y - Grid ?p - D_pLaunch)
	:precondition (and (turn d) (D_launchFromX ?p ?x) (D_launchFromY ?p ?y) (D_launchFromZ ?p ?y) (blurLocation d))
	:effect (and (atX d ?x) (atY d ?y) (atZ d ?y) (not (blurLocation d)) (initLocation d) (not (turn d)) (turn a))
				
)

(:action launchD2											
	:parameters (?x - Grid ?y - Grid ?p - D_pLaunch)
	:precondition (and (turn d) (D_launchFromX ?p ?x) (D_launchFromY ?p ?x) (D_launchFromZ ?p ?y) (blurLocation d))
	:effect (and (atX d ?x) (atY d ?x) (atZ d ?y) (not (blurLocation d)) (initLocation d) (not (turn d)) (turn a))
				
)

(:action launchD3											
	:parameters (?x - Grid ?y - Grid ?p - D_pLaunch)
	:precondition (and (turn d) (D_launchFromX ?p ?x) (D_launchFromY ?p ?y) (D_launchFromZ ?p ?x) (blurLocation d))
	:effect (and (atX d ?x) (atY d ?y) (atZ d ?x) (not (blurLocation d)) (initLocation d) (not (turn d)) (turn a))
				
)

(:action launchD4											
	:parameters (?x - Grid ?p - D_pLaunch)
	:precondition (and (turn d) (D_launchFromX ?p ?x) (D_launchFromY ?p ?x) (D_launchFromZ ?p ?x) (blurLocation d))
	:effect (and (atX d ?x) (atY d ?x) (atZ d ?x) (not (blurLocation d)) (initLocation d) (not (turn d)) (turn a))
				
)

(:action waitBeforeLaunchD										
	:precondition (and (turn d) (blurLocation d))
	:effect (and (not (turn d)) (turn a))
)

(:action moveD_x_up
	:parameters (?x_from - Grid ?x_to - Grid)
	:precondition (and (turn d) (atX d ?x_from) (up ?x_from ?x_to) (initLocation d))
	:effect (and (not (atX d ?x_from)) (atX d ?x_to) (not (turn d)) (turn a))
)

(:action moveD_x_down
	:parameters (?x_from - Grid ?x_to - Grid)
	:precondition (and (atX d ?x_from) (turn d) (down ?x_from ?x_to) (initLocation d))
	:effect (and (not (atX d ?x_from)) (atX d ?x_to) (not (turn d)) (turn a))
)

(:action moveD_y_up
	:parameters (?y_from - Grid ?y_to - Grid)
	:precondition (and (turn d) (atY d ?y_from) (up ?y_from ?y_to) (initLocation d))
	:effect (and (not (atY d ?y_from)) (atY d ?y_to) (not (turn d)) (turn a))
)

(:action moveD_y_down
	:parameters (?y_from - Grid ?y_to - Grid)
	:precondition (and (atY d ?y_from) (turn d) (down ?y_from ?y_to) (initLocation d))
	:effect (and (not (atY d ?y_from)) (atY d ?y_to) (not (turn d)) (turn a))
)

(:action moveD_z_up
	:parameters (?z_from - Grid ?z_to - Grid)
	:precondition (and (turn d) (up ?z_from ?z_to) (atZ d ?z_from) (initLocation d))
	:effect (and (not (atZ d ?z_from)) (atZ d ?z_to) (not (turn d)) (turn a))
)

(:action moveD_z_down
	:parameters (?x_from - Grid ?x_to - Grid)
	:precondition (and (turn d) (down ?x_from ?x_to) (atZ d ?x_from) (initLocation d))
	:effect (and (not (atX d ?x_from)) (atX d ?x_to) (not (turn d)) (turn a))
) 





(:action launchA
	:precondition (and (turn a) (blurLocation a))
	:effect (and (initlocation a) (not (blurLocation a)) (not (turn a)) (turn sensor) 
			(when (pathSelected A1) (and (atX a n1) (atY a n0) (atZ a n0)))
			(when (pathSelected A2) (and (atX a n1) (atY a n0) (atZ a n0)))
			(when (pathSelected A3) (and (atX a n0) (atY a n1) (atZ a n2)))
		)
		     
)


(:action observeX
	:parameters (?x - Grid)
	:precondition (turn sensor)
	:observe (atX a ?x)
) 

(:action observeY
	:parameters (?y - Grid)
	:precondition (turn sensor)
	:observe (atY a ?y)
) 

(:action observeZ
	:parameters (?z - Grid)
	:precondition (turn sensor)
	:observe (atZ a ?z)
) 

(:action VerifyA
	:parameters (?x - Grid ?y - Grid ?z - Grid)
	:precondition (and (turn sensor) (atX a ?x) (atY a ?y) (atZ a ?z))
	:effect (and (not (turn sensor)) (turn d))
)

(:action moveA 
	:precondition (and (initLocation a) (turn a))
	:effect (and  (not (turn a)) (turn sensor) 
			(when (and (pathSelected A1) (atX a n1) (atY a n0) (atZ a n0)) (and (not (atY a n0)) (atY a n1)))
			(when (and (pathSelected A1) (atX a n1) (atY a n1) (atZ a n0)) (and (not (atZ a n0)) (atZ a n1)))
			(when (and (pathSelected A1) (atX a n1) (atY a n1) (atZ a n1)) (and (not (atZ a n1)) (atZ a n2)))
			(when (and (pathSelected A1) (atX a n1) (atY a n1) (atZ a n2)) (and (not (atY a n1)) (atY a n2)))
			(when (and (pathSelected A1) (atX a n1) (atY a n2) (atZ a n2)) (and (not (atY a n2)) (atY a n3)))
			(when (and (pathSelected A1) (atX a n1) (atY a n3) (atZ a n2)) (and (not (atZ a n2)) (atZ a n3)))
			(when (and (pathSelected A1) (atX a n1) (atY a n3) (atZ a n3)) (and (not (atY a n3)) (atY a n4)))
			(when (and (pathSelected A1) (atX a n1) (atY a n4) (atZ a n3)) (and (not (atY a n4)) (atY a n5)))
			(when (and (pathSelected A1) (atX a n1) (atY a n5) (atZ a n3)) (and (not (atZ a n3)) (atZ a n4)))
			(when (and (pathSelected A1) (atX a n1) (atY a n5) (atZ a n4)) (and (not (atY a n5)) (atY a n6)))
			(when (and (pathSelected A1) (atX a n1) (atY a n6) (atZ a n4)) (and (not (atY a n6)) (atY a n7)))
			(when (and (pathSelected A1) (atX a n1) (atY a n7) (atZ a n4)) (and (not (atZ a n4)) (atZ a n5)))
			(when (and (pathSelected A1) (atX a n1) (atY a n7) (atZ a n5)) (and (not (atY a n7)) (atY a n8)))
			(when (and (pathSelected A1) (atX a n1) (atY a n8) (atZ a n5)) (and (not (atY a n8)) (atY a n9)))
			(when (and (pathSelected A1) (atX a n1) (atY a n9) (atZ a n5)) (and (not (atZ a n5)) (atZ a n6)))
			(when (and (pathSelected A1) (atX a n1) (atY a n9) (atZ a n6)) (and (not (atY a n9)) (atY a n10)))
			(when (and (pathSelected A1) (atX a n1) (atY a n10) (atZ a n6)) (and (not (atY a n10)) (atY a n11)))
			(when (and (pathSelected A1) (atX a n1) (atY a n11) (atZ a n6)) (and (not (atZ a n6)) (atZ a n7)))
			(when (and (pathSelected A1) (atX a n1) (atY a n11) (atZ a n7)) (and (not (atY a n11)) (atY a n12)))
			(when (and (pathSelected A1) (atX a n1) (atY a n12) (atZ a n7)) (and (not (atY a n12)) (atY a n13)))
			; done at 1,13,7


			(when (and (pathSelected A2) (atX a n1) (atY a n0) (atZ a n0)) (and (not (atY a n0)) (atY a n1)))
			(when (and (pathSelected A2) (atX a n1) (atY a n1) (atZ a n0)) (and (not (atZ a n0)) (atZ a n1)))
			(when (and (pathSelected A2) (atX a n1) (atY a n1) (atZ a n1)) (and (not (atX a n1)) (atX a n2)))
			(when (and (pathSelected A2) (atX a n2) (atY a n1) (atZ a n1)) (and (not (atX a n2)) (atX a n3)))
			(when (and (pathSelected A2) (atX a n3) (atY a n1) (atZ a n1)) (and (not (atZ a n1)) (atZ a n2)))
			(when (and (pathSelected A2) (atX a n3) (atY a n1) (atZ a n2)) (and (not (atX a n3)) (atX a n4)))
			(when (and (pathSelected A2) (atX a n4) (atY a n1) (atZ a n2)) (and (not (atX a n4)) (atX a n5)))
			(when (and (pathSelected A2) (atX a n5) (atY a n1) (atZ a n2)) (and (not (atZ a n2)) (atZ a n3)))
			(when (and (pathSelected A2) (atX a n5) (atY a n1) (atZ a n3)) (and (not (atX a n5)) (atX a n6)))
			(when (and (pathSelected A2) (atX a n6) (atY a n1) (atZ a n3)) (and (not (atY a n1)) (atY a n2)))
			(when (and (pathSelected A2) (atX a n6) (atY a n2) (atZ a n3)) (and (not (atZ a n3)) (atZ a n4)))
			(when (and (pathSelected A2) (atX a n6) (atY a n2) (atZ a n4)) (and (not (atX a n6)) (atX a n7)))
			(when (and (pathSelected A2) (atX a n7) (atY a n2) (atZ a n4)) (and (not (atX a n7)) (atX a n8)))
			(when (and (pathSelected A2) (atX a n8) (atY a n2) (atZ a n4)) (and (not (atX a n8)) (atX a n9)))
			(when (and (pathSelected A2) (atX a n9) (atY a n2) (atZ a n4)) (and (not (atZ a n4)) (atZ a n5)))
			(when (and (pathSelected A2) (atX a n9) (atY a n2) (atZ a n5)) (and (not (atX a n9)) (atX a n10)))
			(when (and (pathSelected A2) (atX a n10) (atY a n2) (atZ a n5)) (and (not (atX a n10)) (atX a n11)))
			(when (and (pathSelected A2) (atX a n11) (atY a n2) (atZ a n5)) (and (not (atZ a n5)) (atZ a n6)))
			(when (and (pathSelected A2) (atX a n11) (atY a n2) (atZ a n6)) (and (not (atX a n11)) (atX a n12)))
			; done at 12,2,6


			(when (and (pathSelected A3) (atX a n0) (atY a n1) (atZ a n2)) (and (not (atZ a n2)) (atZ a n3)))
			(when (and (pathSelected A3) (atX a n0) (atY a n1) (atZ a n3)) (and (not (atY a n1)) (atY a n0)))
			(when (and (pathSelected A3) (atX a n0) (atY a n0) (atZ a n3)) (and (not (atX a n0)) (atX a n1)))
			(when (and (pathSelected A3) (atX a n1) (atY a n0) (atZ a n3)) (and (not (atY a n0)) (atY a n1)))
			(when (and (pathSelected A3) (atX a n1) (atY a n1) (atZ a n3)) (and (not (atZ a n3)) (atZ a n4)))
			(when (and (pathSelected A3) (atX a n1) (atY a n1) (atZ a n4)) (and (not (atZ a n4)) (atZ a n5)))
			(when (and (pathSelected A3) (atX a n1) (atY a n1) (atZ a n5)) (and (not (atZ a n5)) (atZ a n6)))
			(when (and (pathSelected A3) (atX a n1) (atY a n1) (atZ a n6)) (and (not (atY a n1)) (atY a n2)))
			(when (and (pathSelected A3) (atX a n1) (atY a n2) (atZ a n6)) (and (not (atZ a n6)) (atZ a n7)))
			(when (and (pathSelected A3) (atX a n1) (atY a n2) (atZ a n7)) (and (not (atZ a n7)) (atZ a n8)))
			(when (and (pathSelected A3) (atX a n1) (atY a n2) (atZ a n8)) (and (not (atX a n1)) (atX a n2)))
			(when (and (pathSelected A3) (atX a n2) (atY a n2) (atZ a n8)) (and (not (atZ a n8)) (atZ a n9)))
			(when (and (pathSelected A3) (atX a n2) (atY a n2) (atZ a n9)) (and (not (atZ a n9)) (atZ a n10)))
			(when (and (pathSelected A3) (atX a n2) (atY a n2) (atZ a n10)) (and (not (atY a n2)) (atY a n3)))
			(when (and (pathSelected A3) (atX a n2) (atY a n3) (atZ a n10)) (and (not (atZ a n10)) (atZ a n11)))
			(when (and (pathSelected A3) (atX a n2) (atY a n3) (atZ a n11)) (and (not (atZ a n11)) (atZ a n12)))
			(when (and (pathSelected A3) (atX a n2) (atY a n3) (atZ a n12)) (and (not (atX a n2)) (atX a n3)))
			(when (and (pathSelected A3) (atX a n3) (atY a n3) (atZ a n12)) (and (not (atZ a n12)) (atZ a n13)))
			(when (and (pathSelected A3) (atX a n3) (atY a n3) (atZ a n13)) (and (not (atZ a n13)) (atZ a n14)))
			;done at 3,3,14
		)
)


(:action blowUp 
	:parameters (?x - Grid ?y - Grid ?z - Grid)
	:precondition (and (atX a ?x) (atX d ?x) (atY a ?y) (atY d ?y) (atZ a ?z) (atZ d ?z) (turn d))
	:effect (isBlown blown)
)



)
