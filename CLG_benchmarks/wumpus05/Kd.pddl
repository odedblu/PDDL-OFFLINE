(define (domain Kwumpus)
(:requirements :strips :typing)
(:types pos TAG_TYPE VALUE_TYPE)
(:constants
 p1-1 - pos
 p1-2 - pos
 p1-3 - pos
 p1-4 - pos
 p1-5 - pos
 p2-1 - pos
 p2-2 - pos
 p2-3 - pos
 p2-4 - pos
 p2-5 - pos
 p3-1 - pos
 p3-2 - pos
 p3-3 - pos
 p3-4 - pos
 p3-5 - pos
 p4-1 - pos
 p4-2 - pos
 p4-3 - pos
 p4-4 - pos
 p4-5 - pos
 p5-1 - pos
 p5-2 - pos
 p5-3 - pos
 p5-4 - pos
 p5-5 - pos
 tag0 - TAG_TYPE ; (safe p4-5) (not (safe p5-4)) (not (wumpus-at p4-5)) (not (stench p3-5)) (wumpus-at p4-3) (stench p4-2) (stench p3-3) (stench p5-3) (wumpus-at p5-4) (pit-at p5-4) (breeze p5-5)
 tag1 - TAG_TYPE ; (not (safe p4-5)) (safe p5-4) (wumpus-at p4-5) (not (wumpus-at p5-4)) (not (pit-at p5-4)) (stench p3-5) (not (breeze p5-5)) (not (wumpus-at p4-3)) (not (stench p4-2)) (not (stench p3-3)) (not (stench p5-3))
 V_TRUE - VALUE_TYPE
 V_FALSE - VALUE_TYPE
)

(:predicates
(adj ?i - pos ?j - pos)
(at ?i - pos)
(safe ?i - pos)
(Ksafe ?i - pos)
(KNsafe ?i - pos)
(KGivensafe ?i - pos ?TAG_PARAM - TAG_TYPE ?V_PARAM - VALUE_TYPE)
(wumpus-at ?x - pos)
(Kwumpus-at ?x - pos)
(KNwumpus-at ?x - pos)
(KGivenwumpus-at ?x - pos ?TAG_PARAM - TAG_TYPE ?V_PARAM - VALUE_TYPE)
(alive)
(stench ?i - pos)
(Kstench ?i - pos)
(KNstench ?i - pos)
(KGivenstench ?i - pos ?TAG_PARAM - TAG_TYPE ?V_PARAM - VALUE_TYPE)
(gold-at ?i - pos)
(got-the-treasure)
(breeze ?i - pos)
(Kbreeze ?i - pos)
(KNbreeze ?i - pos)
(KGivenbreeze ?i - pos ?TAG_PARAM - TAG_TYPE ?V_PARAM - VALUE_TYPE)
(pit-at ?p - pos)
(Kpit-at ?p - pos)
(KNpit-at ?p - pos)
(KGivenpit-at ?p - pos ?TAG_PARAM - TAG_TYPE ?V_PARAM - VALUE_TYPE)
(KNot ?TAG_PARAM - TAG_TYPE)
)

(:action move
:parameters ( ?i - pos ?j - pos)
:precondition 
(and (adj ?i ?j) (at ?i) (safe ?j) (safe ?i) (Ksafe ?j) (Ksafe ?i))
:effect 
(and (not (at ?i)) (at ?j))
)
(:action smell_wumpus-T
:parameters ( ?pos - pos)
:precondition 
(and (at ?pos) (stench ?pos))
:effect (Kstench ?pos)
)
(:action smell_wumpus-F
:parameters ( ?pos - pos)
:precondition 
(and (at ?pos) (not (stench ?pos)))
:effect (KNstench ?pos)
)
(:action feel-breeze-T
:parameters ( ?pos - pos)
:precondition 
(and (at ?pos) (breeze ?pos))
:effect (Kbreeze ?pos)
)
(:action feel-breeze-F
:parameters ( ?pos - pos)
:precondition 
(and (at ?pos) (not (breeze ?pos)))
:effect (KNbreeze ?pos)
)
(:action grab
:parameters ( ?i - pos)
:precondition 
(and (at ?i) (gold-at ?i))
:effect 
(and (got-the-treasure ) (not (gold-at ?i)))
)
(:action Merge-safe
:parameters ( ?i - pos ?V_PARAM - VALUE_TYPE)
:precondition 
(and (not (Ksafe ?i)) 
	(or (KGivensafe ?i tag0 ?V_PARAM) (KNot tag0))
	(or (KGivensafe ?i tag1 ?V_PARAM) (KNot tag1)))
:effect 
(and (Ksafe ?i))
)

(:action RefuteT-safe
:parameters ( ?i - pos ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivensafe ?i ?TAG_PARAM V_TRUE) (KNsafe ?i) (not (safe ?i)))
:effect 
(and (KNot ?TAG_PARAM))
)

(:action RefuteF-safe
:parameters ( ?i - pos ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivensafe ?i ?TAG_PARAM V_FALSE) (Ksafe ?i) (safe ?i))
:effect 
(and (KNot ?TAG_PARAM))
)

(:action Merge-wumpus-at
:parameters ( ?x - pos ?V_PARAM - VALUE_TYPE)
:precondition 
(and (not (Kwumpus-at ?x)) 
	(or (KGivenwumpus-at ?x tag0 ?V_PARAM) (KNot tag0))
	(or (KGivenwumpus-at ?x tag1 ?V_PARAM) (KNot tag1)))
:effect 
(and (Kwumpus-at ?x))
)

(:action RefuteT-wumpus-at
:parameters ( ?x - pos ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivenwumpus-at ?x ?TAG_PARAM V_TRUE) (KNwumpus-at ?x) (not (wumpus-at ?x)))
:effect 
(and (KNot ?TAG_PARAM))
)

(:action RefuteF-wumpus-at
:parameters ( ?x - pos ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivenwumpus-at ?x ?TAG_PARAM V_FALSE) (Kwumpus-at ?x) (wumpus-at ?x))
:effect 
(and (KNot ?TAG_PARAM))
)

(:action Merge-stench
:parameters ( ?i - pos ?V_PARAM - VALUE_TYPE)
:precondition 
(and (not (Kstench ?i)) 
	(or (KGivenstench ?i tag0 ?V_PARAM) (KNot tag0))
	(or (KGivenstench ?i tag1 ?V_PARAM) (KNot tag1)))
:effect 
(and (Kstench ?i))
)

(:action RefuteT-stench
:parameters ( ?i - pos ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivenstench ?i ?TAG_PARAM V_TRUE) (KNstench ?i) (not (stench ?i)))
:effect 
(and (KNot ?TAG_PARAM))
)

(:action RefuteF-stench
:parameters ( ?i - pos ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivenstench ?i ?TAG_PARAM V_FALSE) (Kstench ?i) (stench ?i))
:effect 
(and (KNot ?TAG_PARAM))
)

(:action Merge-breeze
:parameters ( ?i - pos ?V_PARAM - VALUE_TYPE)
:precondition 
(and (not (Kbreeze ?i)) 
	(or (KGivenbreeze ?i tag0 ?V_PARAM) (KNot tag0))
	(or (KGivenbreeze ?i tag1 ?V_PARAM) (KNot tag1)))
:effect 
(and (Kbreeze ?i))
)

(:action RefuteT-breeze
:parameters ( ?i - pos ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivenbreeze ?i ?TAG_PARAM V_TRUE) (KNbreeze ?i) (not (breeze ?i)))
:effect 
(and (KNot ?TAG_PARAM))
)

(:action RefuteF-breeze
:parameters ( ?i - pos ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivenbreeze ?i ?TAG_PARAM V_FALSE) (Kbreeze ?i) (breeze ?i))
:effect 
(and (KNot ?TAG_PARAM))
)

(:action Merge-pit-at
:parameters ( ?p - pos ?V_PARAM - VALUE_TYPE)
:precondition 
(and (not (Kpit-at ?p)) 
	(or (KGivenpit-at ?p tag0 ?V_PARAM) (KNot tag0))
	(or (KGivenpit-at ?p tag1 ?V_PARAM) (KNot tag1)))
:effect 
(and (Kpit-at ?p))
)

(:action RefuteT-pit-at
:parameters ( ?p - pos ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivenpit-at ?p ?TAG_PARAM V_TRUE) (KNpit-at ?p) (not (pit-at ?p)))
:effect 
(and (KNot ?TAG_PARAM))
)

(:action RefuteF-pit-at
:parameters ( ?p - pos ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivenpit-at ?p ?TAG_PARAM V_FALSE) (Kpit-at ?p) (pit-at ?p))
:effect 
(and (KNot ?TAG_PARAM))
)

)
