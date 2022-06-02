(define (domain myWorld)

;(:requirements :typing :adl :equality)

(:types Grid Blow Rocket Path)

(:predicates                  
				     (at ?r ?x) 
				     (turn ?r - Rocket) 
					 (adj ?x - Grid ?y - Grid) 
					 (isBlown ?x - Blow) 
					 (launchDFrom ?g - Grid)
					(blurLocation ?r - Rocket)
					(initLocation ?r - Rocket)
					(eq ?x ?y - Grid)	
					(blurPath ?r - Rocket)
					(pathSelected ?p - Path)
					(path ?n - Path)					
					
)

(:constants ;z=0
		
		G000 G100 G200 - Grid
		G010 G110 G210 - Grid
		G020 G120 G220 - Grid
		;z=1
		G001 G101 G201 - Grid
		G011 G111 G211 - Grid
		G021 G121 G221 - Grid
		;z=2
		G002 G102 G202 - Grid
		G012 G112 G212 - Grid
		G022 G122 G222 - Grid
		
		A1 A2 - Path
		turn - Turn 
		blown - Blow
		a d - Rocket
		)

(:action launchD											
	:parameters (?x - Grid )
	:precondition (and (turn d) (launchDFrom ?x) (blurLocation d))
	:effect (and (at d ?x) (not (blurLocation d)))
				
)

(:action waitBeforeLaunchD										
	:precondition (and (turn d) (blurLocation d))
	:effect (and (not (turn d)) (turn a))
)

(:action moveD 
	:parameters (?x - Grid ?y - Grid)
	:precondition (and (at d ?x) (turn d) (adj ?x ?y))
	:effect (and (at d ?y) (not (at d ?x)) (not (turn d)) (turn a))
)

(:action moveA
	:precondition (and (turn a) (not (blurLocation a)))
	:effect (and (not (turn a)) (turn d)
		(when (and (at a G100) (path A1)) (and (not (at a G100)) (at a G111)))
		(when (and (at a G111) (path A1)) (and (not (at a G111)) (at a G012)))
		(when (and (at a G012) (path A1)) (and (not (at a G012)) (at a G021)))
		(when (and (at a G021) (path A1)) (and (not (at a G021)) (at a G120)))
		
		(when (and (at a G100) (path A2)) (and (not (at a G100)) (at a G110)))
		(when (and (at a G110) (path A2)) (and (not (at a G110)) (at a G011)))
		(when (and (at a G011) (path A2)) (and (not (at a G011)) (at a G021)))
		(when (and (at a G021) (path A2)) (and (not (at a G021)) (at a G120)))
			)
)


(:action launchA
	:precondition (and (turn a) (blurLocation a))
	:effect (and  (initlocation a) (not (blurLocation a))
			(when (path A1) (and (at a G100)))
		     (when (path A2) (and (at a G100))))
)

(:action blowUp 
	:parameters (?x - Grid ?b - Blow)
	:precondition (and (at a ?x) (at d ?x))
	:effect (isBlown ?b)
)

(:action ObserveA
	:parameters (?x - Grid)
	:precondition (turn d)
	:observe (at a ?x)
)
)