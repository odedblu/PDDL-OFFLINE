(define (domain myWorld)

;(:requirements :typing :adl :equality)

(:types Grid Blow Rocket PathA D_pLaunch)

(:predicates                  
		(atX ?r ?x)
		(atY ?r ?y)
		(atZ ?r ?z)
		(turn ?r - Rocket) 
		(adj ?x - Grid ?y - Grid) 
		(eq ?x - Grid ?y - Grid) 
		(isBlown ?x - Blow) 
		(D_launchFromX ?r - D_pLaunch ?x - Grid)
		(D_launchFromY ?r - D_pLaunch ?y - Grid)
		(D_launchFromZ ?r - D_pLaunch ?z - Grid)
		(blurLocation ?r - Rocket)
		(initLocation ?r - Rocket)	
		(blurPath ?r - Rocket)
		(pathSelected ?p - PathA)
									
					
)


(:constants     turn - Turn 
		blown - Blow
		a d - Rocket
		A1 A2 A3 A4 A5 - pathA	
		n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12 n13 n14  - Grid
		d1 d2 - D_pLaunch
)
			
		

(:action launchD											
	:parameters (?x - Grid ?y - Grid ?z - Grid ?pd - D_pLaunch)
	:precondition (and (turn d) (D_launchFromX ?pd ?x) (D_launchFromY ?pd ?y) (D_launchFromZ ?pd ?z) (blurLocation d))
	:effect (and (atX d ?x) (atY d ?y) (atZ d ?z) (not (blurLocation d)))
				
)

(:action waitBeforeLaunchD										
	:precondition (and (turn d) (blurLocation d))
	:effect (and (not (turn d)) (turn a))
)

(:action moveD 
	:parameters (?x_from - Grid ?y_from - Grid ?z_from - Grid ?x_to - Grid ?y_to - Grid ?z_to - Grid )
	:precondition (and (atX d ?x_from) (atY d ?y_from) (atZ d ?z_from) (turn d) (adj ?x_from ?x_to) (adj ?y_from ?y_to) (adj ?z_from ?z_to))
	:effect  
			(and (not (atX d ?x_from)) (not (atY d ?y_from)) (not (atZ d ?z_from)) (atX d ?x_to) (atY d ?y_to) (atZ d ?z_to) (not (turn d)) (turn a))
)

(:action launchA
	:precondition (and (turn a) (blurLocation a))
	:effect (and (when (pathSelected A1) (and (atX a n1) (atY a n0) (atZ a n0) (initlocation a) (not (blurLocation a))))
		     (when (pathSelected A2) (and (atX a n1) (atY a n5) (atZ a n0) (initlocation a) (not (blurLocation a)))))
)

(:action blowUp 
	:parameters (?x - Grid ?y - Grid ?z - Grid ?b - Blow)
	:precondition (and (atX a ?x) (atX d ?x) (atY a ?y) (atY d ?y) (atZ a ?z) (atZ d ?z))
	:effect (isBlown ?b)
)

(:action observeX 
	:parameters (?x - Grid)
	:precondition (turn d)
	:observe (atX a ?x)
)


(:action observeY 
	:parameters (?y - Grid)
	:precondition (turn d)
	:observe (atY a ?y)
)


(:action observeZ 
	:parameters (?z - Grid)
	:precondition (turn d)
	:observe (atZ a ?z)
)



(:action moveA 
	:precondition (turn a)
	:effect (and 
		(when (and (pathSelected A1) (atX a n1) (atY a n0) (atZ a n0)) 
				(and (not (atX a n1)) (not (atY a n0)) (not (atZ a n0)) (atX a n1) (atY a n1) (atZ a n1) (not (turn a)) (turn d)))
		(when (and (pathSelected A1) (atX a n1) (atY a n1) (atZ a n1)) 
				(and (not (atX a n1)) (not (atY a n1)) (not (atZ a n1)) (atX a n1) (atY a n0) (atZ a n2) (not (turn a)) (turn d)))
		(when (and (pathSelected A1) (atX a n1) (atY a n0) (atZ a n2)) 
				(and (not (atX a n1)) (not (atY a n0)) (not (atZ a n2)) (atX a n1) (atY a n1) (atZ a n3) (not (turn a)) (turn d)))
		(when (and (pathSelected A1) (atX a n1) (atY a n1) (atZ a n3)) 
				(and (not (atX a n1)) (not (atY a n1)) (not (atZ a n3)) (atX a n2) (atY a n2) (atZ a n4) (not (turn a)) (turn d)))
		(when (and (pathSelected A1) (atX a n2) (atY a n2) (atZ a n4)) 
				(and (not (atX a n2)) (not (atY a n2)) (not (atZ a n4)) (atX a n2) (atY a n3) (atZ a n5) (not (turn a)) (turn d)))
		(when (and (pathSelected A1) (atX a n2) (atY a n3) (atZ a n5)) 
				(and (not (atX a n2)) (not (atY a n3)) (not (atZ a n5)) (atX a n2) (atY a n4) (atZ a n6) (not (turn a)) (turn d)))
		(when (and (pathSelected A1) (atX a n2) (atY a n4) (atZ a n7)) 
				(and (not (atX a n2)) (not (atY a n4)) (not (atZ a n7)) (atX a n3) (atY a n5) (atZ a n8) (not (turn a)) (turn d)))
		(when (and (pathSelected A1) (atX a n3) (atY a n5) (atZ a n8)) 
				(and (not (atX a n3)) (not (atY a n5)) (not (atZ a n8)) (atX a n4) (atY a n6) (atZ a n9) (not (turn a)) (turn d)))
		(when (and (pathSelected A1) (atX a n4) (atY a n6) (atZ a n9)) 
				(and (not (atX a n4)) (not (atY a n6)) (not (atZ a n9)) (atX a n4) (atY a n7) (atZ a n10) (not (turn a)) (turn d)))
		(when (and (pathSelected A1) (atX a n4) (atY a n7) (atZ a n10)) 
				(and (not (atX a n4)) (not (atY a n7)) (not (atZ a n10)) (atX a n5) (atY a n7) (atZ a n11) (not (turn a)) (turn d)))
		     

		(when (and (pathSelected A2) (atX a n1) (atY a n0) (atZ a n0)) 
				(and (not (atX a n1)) (not (atY a n0)) (not (atZ a n0)) (atX a n2) (atY a n1) (atZ a n1) (not (turn a)) (turn d)))
		(when (and (pathSelected A2) (atX a n1) (atY a n1) (atZ a n1)) 
				(and (not (atX a n2)) (not (atY a n1)) (not (atZ a n1)) (atX a n1) (atY a n0) (atZ a n2) (not (turn a)) (turn d)))
		(when (and (pathSelected A2) (atX a n1) (atY a n0) (atZ a n2)) 
				(and (not (atX a n1)) (not (atY a n0)) (not (atZ a n2)) (atX a n1) (atY a n1) (atZ a n3) (not (turn a)) (turn d)))
		(when (and (pathSelected A2) (atX a n1) (atY a n1) (atZ a n3)) 
				(and (not (atX a n1)) (not (atY a n1)) (not (atZ a n3)) (atX a n3) (atY a n2) (atZ a n4) (not (turn a)) (turn d)))
		(when (and (pathSelected A2) (atX a n2) (atY a n2) (atZ a n4)) 
				(and (not (atX a n3)) (not (atY a n2)) (not (atZ a n4)) (atX a n2) (atY a n3) (atZ a n5) (not (turn a)) (turn d)))
		(when (and (pathSelected A2) (atX a n2) (atY a n3) (atZ a n5)) 
				(and (not (atX a n2)) (not (atY a n3)) (not (atZ a n5)) (atX a n4) (atY a n4) (atZ a n6) (not (turn a)) (turn d)))
		(when (and (pathSelected A2) (atX a n2) (atY a n4) (atZ a n7)) 
				(and (not (atX a n4)) (not (atY a n4)) (not (atZ a n7)) (atX a n3) (atY a n5) (atZ a n8) (not (turn a)) (turn d)))
		(when (and (pathSelected A2) (atX a n3) (atY a n5) (atZ a n8)) 
				(and (not (atX a n3)) (not (atY a n5)) (not (atZ a n8)) (atX a n4) (atY a n6) (atZ a n9) (not (turn a)) (turn d)))
		(when (and (pathSelected A2) (atX a n4) (atY a n6) (atZ a n9)) 
				(and (not (atX a n4)) (not (atY a n6)) (not (atZ a n9)) (atX a n6) (atY a n7) (atZ a n10) (not (turn a)) (turn d)))
		(when (and (pathSelected A2) (atX a n4) (atY a n7) (atZ a n10)) 
				(and (not (atX a n6)) (not (atY a n7)) (not (atZ a n10)) (atX a n5) (atY a n7) (atZ a n11) (not (turn a)) (turn d)))

))








	)
