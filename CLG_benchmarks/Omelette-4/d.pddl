(define 
(domain Omelette-4)
(:types bowl value)
(:constants
 bowl1 bowl2 - bowl
 v0 v1 v2 v3 v4 v5 v6 v7 v8 - value
)

(:predicates
	(plus ?v1 - value ?v2 - value ?v3 - value)
	(good ?i - bowl)
	(eggs-in ?i - bowl ?j - value)
	(different ?i - bowl ?j - bowl)
	(holding-egg)
	(bad-egg)
)
(:action get-egg
	:precondition (not (holding-egg))
	:effect (and
(holding-egg)
(oneof (not (bad-egg)) (bad-egg))
	)
)

(:action break-egg
	:parameters (?i - bowl ?v1 - value ?v2 - value)
	:precondition (and (holding-egg) (eggs-in ?i ?v1) (plus ?v1 v1 ?v2))
	:effect (and
	(not (eggs-in ?i ?v1)) (eggs-in ?i ?v2)
(when (bad-egg) (not (good ?i)))
(not (holding-egg))
(bad-egg)
	)
)

(:action pour
	:parameters (?i - bowl ?j - bowl ?v1 - value ?v2 - value ?v3 - value)
	:precondition (and (different ?i ?j) (eggs-in ?i ?v1) (eggs-in ?j ?v2) (plus ?v1 ?v2 ?v3))
	:effect (and
(not (eggs-in ?i ?v1)) (not (eggs-in ?j ?v2))
(eggs-in ?i v0) (eggs-in ?j ?v3)
(when (not (good ?i)) (not (good ?j)))
(good ?i)
	)
)

(:action empty
	:parameters (?i - bowl)
	:effect (and (good ?i) (not (eggs-in ?i v1)) (not (eggs-in ?i v2)) (not (eggs-in ?i v3)) (not (eggs-in ?i v4)) (eggs-in ?i v0))
)

(:action observe-bowl
	:parameters (?i - bowl)
	:observe (good ?i)
)

)