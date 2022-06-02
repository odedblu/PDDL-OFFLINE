(define (domain myWorld)

;(:requirements :typing :adl)

(:types Grid Blow)

(:predicates   (atD ?x - Grid)                   
				     (atA ?x - Grid) 
				     (turnA) 
					 (turnD) 
					 (adj ?x - Grid ?y - Grid) 
					 (isBlown ?x - Blow) 
					 (startD)
					 (launchDFrom ?g - Grid)
					(initALocation)
					(pathA1) (pathA2)
)

(:action launchD											
	:parameters (?x - Grid )
	:precondition (and (turnD )  (launchDFrom ?x))
	:effect (when (not (startD)) (and (atD ?x) (startD)))
				
)

(:action waitBeforeLaunchD										
	:precondition (turnD)
	:effect (when (not (startD)) (and (not (turnD)) (turnA)))
)

(:action moveD 
	:parameters (?x - Grid ?y - Grid)
	:precondition (and (atD ?x) (turnD) (adj ?x ?y) (startD))
	:effect (and (atD ?y) (not (atD ?x)) (not (turnD)) (turnA))
)

(:action moveA 
	:precondition (turnA)
	:effect (and (when (and (pathA1) (atA G100)) (and (not (atA G100)) (atA G111) (not (turnA)) (turnD)))
		     (when (and (pathA1) (atA G111)) (and (not (atA G111)) (atA G012) (not (turnA)) (turnD)))
	             (when (and (pathA1) (atA G012)) (and (not (atA G012)) (atA G021) (not (turnA)) (turnD)))
		     (when (and (pathA1) (atA G021)) (and (not (atA G021)) (atA G120) (not (turnA)) (turnD)))
		     (when (and (pathA2) (atA G100)) (and (not (atA G100)) (atA G001) (not (turnA)) (turnD)))
		     (when (and (pathA2) (atA G001)) (and (not (atA G001)) (atA G012) (not (turnA)) (turnD)))
	             (when (and (pathA2) (atA G012)) (and (not (atA G012)) (atA G111) (not (turnA)) (turnD)))
		     (when (and (pathA2) (atA G111)) (and (not (atA G111)) (atA G210) (not (turnA)) (turnD))))
)

(:action initA
	:precondition (turnA)
	:effect (and (when (and (not (initALocation)) (pathA1)) (and (atA G100) (initALocation)))
		     (when (and (not (initALocation)) (pathA2)) (and (atA G100) (initALocation))))
)

(:action blowUp 
	:parameters (?x - Grid ?b - Blow)
	:precondition (and (atA ?x) (atD ?x))
	:effect (isBlown ?b)
)


	)
