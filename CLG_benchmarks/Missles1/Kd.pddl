(define (domain Kmyworld)
(:requirements :strips :typing)
;;SingleStateK
(:types grid blow)
(:constants
 g000 - grid
 g100 - grid
 g200 - grid
 g010 - grid
 g110 - grid
 g210 - grid
 g020 - grid
 g120 - grid
 g220 - grid
 g001 - grid
 g101 - grid
 g201 - grid
 g011 - grid
 g111 - grid
 g211 - grid
 g021 - grid
 g121 - grid
 g221 - grid
 g002 - grid
 g102 - grid
 g202 - grid
 g012 - grid
 g112 - grid
 g212 - grid
 g022 - grid
 g122 - grid
 g222 - grid
 blown - blow
)

(:predicates
(atd ?x - grid)
(ata ?x - grid)
(Kata ?x - grid)
(KNata ?x - grid)
(turna)
(Kturna)
(KNturna)
(turnd)
(Kturnd)
(KNturnd)
(adj ?x - grid ?y - grid)
(isblown ?x - blow)
(startd)
(launchdfrom ?g - grid)
(initalocation)
(Kinitalocation)
(KNinitalocation)
(patha1)
(Kpatha1)
(KNpatha1)
(patha2)
(Kpatha2)
(KNpatha2)
)

(:action launchd
 :parameters (?x - grid )
 :precondition 
(and (Kturnd) (launchdfrom ?x))
 :effect 
(when (not (startd )) 
	(and (atd ?x) (startd )))
)
(:action waitbeforelaunchd
 :precondition (Kturnd)
 :effect 
(when (not (startd )) 
	(and (KNturnd) (Kturna)))
)
(:action moved
 :parameters (?x - grid ?y - grid )
 :precondition 
(and (atd ?x) (Kturnd) (adj ?x ?y) (startd ))
 :effect 
(and (atd ?y) (not (atd ?x)) (KNturnd) (Kturna))
)
(:action movea
 :precondition (Kturna)
 :effect 
(and 
	(when 
		(and (Kpatha1) (Kata))
		(and (KNata) (KNturna) (Kturnd)))
	(when 
		(and (Kpatha2) (Kata))
		(and (KNata) (KNturna) (Kturnd))))
)
(:action inita
 :precondition (Kturna)
 :effect 
(and 
	(when 
		(and (KNinitalocation) (Kpatha1))
		(and (Kata) (Kinitalocation)))
	(when 
		(and (KNinitalocation) (Kpatha2))
		(and (Kata) (Kinitalocation))))
)
(:action blowup
 :parameters (?x - grid ?b - blow )
 :precondition 
(and (Kata ?x) (atd ?x))
 :effect (isblown ?b)
)
(:action R0
:precondition (and(Kpatha1)(patha1 )(not (patha2 )))
:effect (and(KNpatha2))
)
(:action R1
:precondition (and(not (patha2 ))(KNpatha2)(patha1 ))
:effect (and(Kpatha1))
)
(:action R2
:precondition (and(Kpatha2)(patha2 )(not (patha1 )))
:effect (and(KNpatha1))
)
(:action R3
:precondition (and(not (patha1 ))(KNpatha1)(patha2 ))
:effect (and(Kpatha2))
)
)
