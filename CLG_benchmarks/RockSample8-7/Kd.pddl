(define (domain Krocksample8-7)
(:requirements :strips :typing)
(:types location rock height movestep TAG_TYPE VALUE_TYPE)
(:constants
 p1-1 - location
 p1-2 - location
 p1-3 - location
 p1-4 - location
 p1-5 - location
 p1-6 - location
 p1-7 - location
 p1-8 - location
 p2-1 - location
 p2-2 - location
 p2-3 - location
 p2-4 - location
 p2-5 - location
 p2-6 - location
 p2-7 - location
 p2-8 - location
 p3-1 - location
 p3-2 - location
 p3-3 - location
 p3-4 - location
 p3-5 - location
 p3-6 - location
 p3-7 - location
 p3-8 - location
 p4-1 - location
 p4-2 - location
 p4-3 - location
 p4-4 - location
 p4-5 - location
 p4-6 - location
 p4-7 - location
 p4-8 - location
 p5-1 - location
 p5-2 - location
 p5-3 - location
 p5-4 - location
 p5-5 - location
 p5-6 - location
 p5-7 - location
 p5-8 - location
 p6-1 - location
 p6-2 - location
 p6-3 - location
 p6-4 - location
 p6-5 - location
 p6-6 - location
 p6-7 - location
 p6-8 - location
 p7-1 - location
 p7-2 - location
 p7-3 - location
 p7-4 - location
 p7-5 - location
 p7-6 - location
 p7-7 - location
 p7-8 - location
 p8-1 - location
 p8-2 - location
 p8-3 - location
 p8-4 - location
 p8-5 - location
 p8-6 - location
 p8-7 - location
 p8-8 - location
 r0 - rock
 r1 - rock
 r2 - rock
 r3 - rock
 r4 - rock
 r5 - rock
 r6 - rock
 h0 - height
 h1 - height
 tag0 - TAG_TYPE ; (good r3)
 tag1 - TAG_TYPE ; (not (good r3))
 V_TRUE - VALUE_TYPE
 V_FALSE - VALUE_TYPE
)

(:predicates
(rock-at ?r - rock ?p - location)
(agent-at ?p - location)
(adj ?p1 - location ?p2 - location)
(good ?r - rock)
(Kgood ?r - rock)
(KNgood ?r - rock)
(KGivengood ?r - rock ?TAG_PARAM - TAG_TYPE ?V_PARAM - VALUE_TYPE)
(antena-height ?h - height)
(good-rocks-in-range)
(Kgood-rocks-in-range)
(KNgood-rocks-in-range)
(KGivengood-rocks-in-range ?TAG_PARAM - TAG_TYPE ?V_PARAM - VALUE_TYPE)
(KNot ?TAG_PARAM - TAG_TYPE)
)

(:action move
:parameters ( ?psource - location ?ptarget - location)
:precondition 
(and (agent-at ?psource) (adj ?psource ?ptarget) (antena-height h0))
:effect 
(and (agent-at ?ptarget) (not (agent-at ?psource)) (not (good-rocks-in-range )) (KNgood-rocks-in-range) (not (Kgood-rocks-in-range)) (KGivengood-rocks-in-range tag0 V_FALSE) (not (KGivengood-rocks-in-range tag0 V_TRUE)) (KGivengood-rocks-in-range tag1 V_FALSE) (not (KGivengood-rocks-in-range tag1 V_TRUE)))
)
(:action sample
:parameters ( ?r - rock ?p - location)
:precondition 
(and (agent-at ?p) (rock-at ?r ?p) (good ?r) (Kgood ?r))
:effect 
(and (not (good ?r)) (KNgood ?r) (not (Kgood ?r)) (KGivengood ?r tag0 V_FALSE) (not (KGivengood ?r tag0 V_TRUE)) (KGivengood ?r tag1 V_FALSE) (not (KGivengood ?r tag1 V_TRUE)))
)
(:action raise-antena
:effect 
(and (antena-height h1) (not (antena-height h0)))
)
(:action lower-antena
:effect 
(and (not (antena-height h1)) (antena-height h0))
)
(:action activate-sensor-at-p1-1-h1
:precondition 
(and (agent-at p1-1) (antena-height h1))
:effect 
(and 
	
	(when (good r3) (good-rocks-in-range ))
	
	(when (Kgood r3) 
		(and (Kgood-rocks-in-range) (not (KNgood-rocks-in-range))))
	
	(when (not (KNgood r3)) (not (KNgood-rocks-in-range)))
	
	(when (KGivengood r3 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r3 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r3 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r3 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r3)) (not (good-rocks-in-range )))
	
	(when (KNgood r3) 
		(and (KNgood-rocks-in-range) (not (Kgood-rocks-in-range))))
	
	(when (not (Kgood r3)) (not (Kgood-rocks-in-range)))
	
	(when (KGivengood r3 tag0 V_FALSE) (KGivengood-rocks-in-range tag0 V_FALSE))
	
	(when (not (KGivengood r3 tag0 V_TRUE)) (not (KGivengood-rocks-in-range tag0 V_TRUE)))
	
	(when (KGivengood r3 tag1 V_FALSE) (KGivengood-rocks-in-range tag1 V_FALSE))
	
	(when (not (KGivengood r3 tag1 V_TRUE)) (not (KGivengood-rocks-in-range tag1 V_TRUE))))
)
(:action activate-sensor-at-p1-2-h1
:precondition 
(and (agent-at p1-2) (antena-height h1))
:effect 
(and 
	
	(when (good r2) (good-rocks-in-range ))
	
	(when (Kgood r2) 
		(and (Kgood-rocks-in-range) (not (KNgood-rocks-in-range))))
	
	(when (not (KNgood r2)) (not (KNgood-rocks-in-range)))
	
	(when (KGivengood r2 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r2 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r2 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r2 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r2)) (not (good-rocks-in-range )))
	
	(when (KNgood r2) 
		(and (KNgood-rocks-in-range) (not (Kgood-rocks-in-range))))
	
	(when (not (Kgood r2)) (not (Kgood-rocks-in-range)))
	
	(when (KGivengood r2 tag0 V_FALSE) (KGivengood-rocks-in-range tag0 V_FALSE))
	
	(when (not (KGivengood r2 tag0 V_TRUE)) (not (KGivengood-rocks-in-range tag0 V_TRUE)))
	
	(when (KGivengood r2 tag1 V_FALSE) (KGivengood-rocks-in-range tag1 V_FALSE))
	
	(when (not (KGivengood r2 tag1 V_TRUE)) (not (KGivengood-rocks-in-range tag1 V_TRUE))))
)
(:action activate-sensor-at-p1-3-h0
:precondition 
(and (agent-at p1-3) (antena-height h0))
:effect 
(and 
	
	(when (good r2) (good-rocks-in-range ))
	
	(when (Kgood r2) 
		(and (Kgood-rocks-in-range) (not (KNgood-rocks-in-range))))
	
	(when (not (KNgood r2)) (not (KNgood-rocks-in-range)))
	
	(when (KGivengood r2 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r2 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r2 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r2 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r2)) (not (good-rocks-in-range )))
	
	(when (KNgood r2) 
		(and (KNgood-rocks-in-range) (not (Kgood-rocks-in-range))))
	
	(when (not (Kgood r2)) (not (Kgood-rocks-in-range)))
	
	(when (KGivengood r2 tag0 V_FALSE) (KGivengood-rocks-in-range tag0 V_FALSE))
	
	(when (not (KGivengood r2 tag0 V_TRUE)) (not (KGivengood-rocks-in-range tag0 V_TRUE)))
	
	(when (KGivengood r2 tag1 V_FALSE) (KGivengood-rocks-in-range tag1 V_FALSE))
	
	(when (not (KGivengood r2 tag1 V_TRUE)) (not (KGivengood-rocks-in-range tag1 V_TRUE))))
)
(:action activate-sensor-at-p1-3-h1
:precondition 
(and (agent-at p1-3) (antena-height h1))
:effect 
(and 
	
	(when (good r2) (good-rocks-in-range ))
	
	(when (Kgood r2) 
		(and (Kgood-rocks-in-range) (not (KNgood-rocks-in-range))))
	
	(when (not (KNgood r2)) (not (KNgood-rocks-in-range)))
	
	(when (KGivengood r2 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r2 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r2 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r2 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r2)) (not (good-rocks-in-range )))
	
	(when (KNgood r2) 
		(and (KNgood-rocks-in-range) (not (Kgood-rocks-in-range))))
	
	(when (not (Kgood r2)) (not (Kgood-rocks-in-range)))
	
	(when (KGivengood r2 tag0 V_FALSE) (KGivengood-rocks-in-range tag0 V_FALSE))
	
	(when (not (KGivengood r2 tag0 V_TRUE)) (not (KGivengood-rocks-in-range tag0 V_TRUE)))
	
	(when (KGivengood r2 tag1 V_FALSE) (KGivengood-rocks-in-range tag1 V_FALSE))
	
	(when (not (KGivengood r2 tag1 V_TRUE)) (not (KGivengood-rocks-in-range tag1 V_TRUE))))
)
(:action activate-sensor-at-p1-4-h1
:precondition 
(and (agent-at p1-4) (antena-height h1))
:effect 
(and 
	
	(when 
		(or (good r2) (good r5))(good-rocks-in-range ))
	
	(when 
		(or (Kgood r2) (Kgood r5))
		(and (Kgood-rocks-in-range) (not (KNgood-rocks-in-range))))
	
	(when 
		(and (not (KNgood r2)) (not (KNgood r5)))(not (KNgood-rocks-in-range)))
	
	(when 
		(or (KGivengood r2 tag0 V_TRUE) (KGivengood r5 tag0 V_TRUE))(KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when 
		(and (not (KGivengood r2 tag0 V_FALSE)) (not (KGivengood r5 tag0 V_FALSE)))(not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when 
		(or (KGivengood r2 tag1 V_TRUE) (KGivengood r5 tag1 V_TRUE))(KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when 
		(and (not (KGivengood r2 tag1 V_FALSE)) (not (KGivengood r5 tag1 V_FALSE)))(not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when 
		(and (not (good r2)) (not (good r5)))(not (good-rocks-in-range )))
	
	(when 
		(and (KNgood r2) (KNgood r5))
		(and (KNgood-rocks-in-range) (not (Kgood-rocks-in-range))))
	
	(when 
		(and (not (Kgood r2)) (not (Kgood r5)))(not (Kgood-rocks-in-range)))
	
	(when 
		(and (KGivengood r2 tag0 V_FALSE) (KGivengood r5 tag0 V_FALSE))(KGivengood-rocks-in-range tag0 V_FALSE))
	
	(when 
		(and (not (KGivengood r2 tag0 V_TRUE)) (not (KGivengood r5 tag0 V_TRUE)))(not (KGivengood-rocks-in-range tag0 V_TRUE)))
	
	(when 
		(and (KGivengood r2 tag1 V_FALSE) (KGivengood r5 tag1 V_FALSE))(KGivengood-rocks-in-range tag1 V_FALSE))
	
	(when 
		(and (not (KGivengood r2 tag1 V_TRUE)) (not (KGivengood r5 tag1 V_TRUE)))(not (KGivengood-rocks-in-range tag1 V_TRUE))))
)
(:action activate-sensor-at-p1-5-h0
:precondition 
(and (agent-at p1-5) (antena-height h0))
:effect 
(and 
	
	(when (good r5) (good-rocks-in-range ))
	
	(when (Kgood r5) 
		(and (Kgood-rocks-in-range) (not (KNgood-rocks-in-range))))
	
	(when (not (KNgood r5)) (not (KNgood-rocks-in-range)))
	
	(when (KGivengood r5 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r5 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r5 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r5 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r5)) (not (good-rocks-in-range )))
	
	(when (KNgood r5) 
		(and (KNgood-rocks-in-range) (not (Kgood-rocks-in-range))))
	
	(when (not (Kgood r5)) (not (Kgood-rocks-in-range)))
	
	(when (KGivengood r5 tag0 V_FALSE) (KGivengood-rocks-in-range tag0 V_FALSE))
	
	(when (not (KGivengood r5 tag0 V_TRUE)) (not (KGivengood-rocks-in-range tag0 V_TRUE)))
	
	(when (KGivengood r5 tag1 V_FALSE) (KGivengood-rocks-in-range tag1 V_FALSE))
	
	(when (not (KGivengood r5 tag1 V_TRUE)) (not (KGivengood-rocks-in-range tag1 V_TRUE))))
)
(:action activate-sensor-at-p1-5-h1
:precondition 
(and (agent-at p1-5) (antena-height h1))
:effect 
(and 
	
	(when (good r5) (good-rocks-in-range ))
	
	(when (Kgood r5) 
		(and (Kgood-rocks-in-range) (not (KNgood-rocks-in-range))))
	
	(when (not (KNgood r5)) (not (KNgood-rocks-in-range)))
	
	(when (KGivengood r5 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r5 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r5 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r5 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r5)) (not (good-rocks-in-range )))
	
	(when (KNgood r5) 
		(and (KNgood-rocks-in-range) (not (Kgood-rocks-in-range))))
	
	(when (not (Kgood r5)) (not (Kgood-rocks-in-range)))
	
	(when (KGivengood r5 tag0 V_FALSE) (KGivengood-rocks-in-range tag0 V_FALSE))
	
	(when (not (KGivengood r5 tag0 V_TRUE)) (not (KGivengood-rocks-in-range tag0 V_TRUE)))
	
	(when (KGivengood r5 tag1 V_FALSE) (KGivengood-rocks-in-range tag1 V_FALSE))
	
	(when (not (KGivengood r5 tag1 V_TRUE)) (not (KGivengood-rocks-in-range tag1 V_TRUE))))
)
(:action activate-sensor-at-p1-6-h1
:precondition 
(and (agent-at p1-6) (antena-height h1))
:effect 
(and 
	
	(when (good r5) (good-rocks-in-range ))
	
	(when (Kgood r5) 
		(and (Kgood-rocks-in-range) (not (KNgood-rocks-in-range))))
	
	(when (not (KNgood r5)) (not (KNgood-rocks-in-range)))
	
	(when (KGivengood r5 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r5 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r5 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r5 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r5)) (not (good-rocks-in-range )))
	
	(when (KNgood r5) 
		(and (KNgood-rocks-in-range) (not (Kgood-rocks-in-range))))
	
	(when (not (Kgood r5)) (not (Kgood-rocks-in-range)))
	
	(when (KGivengood r5 tag0 V_FALSE) (KGivengood-rocks-in-range tag0 V_FALSE))
	
	(when (not (KGivengood r5 tag0 V_TRUE)) (not (KGivengood-rocks-in-range tag0 V_TRUE)))
	
	(when (KGivengood r5 tag1 V_FALSE) (KGivengood-rocks-in-range tag1 V_FALSE))
	
	(when (not (KGivengood r5 tag1 V_TRUE)) (not (KGivengood-rocks-in-range tag1 V_TRUE))))
)
(:action activate-sensor-at-p1-8-h1
:precondition 
(and (agent-at p1-8) (antena-height h1))
:effect 
(and 
	
	(when (good r1) (good-rocks-in-range ))
	
	(when (Kgood r1) 
		(and (Kgood-rocks-in-range) (not (KNgood-rocks-in-range))))
	
	(when (not (KNgood r1)) (not (KNgood-rocks-in-range)))
	
	(when (KGivengood r1 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r1 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r1 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r1 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r1)) (not (good-rocks-in-range )))
	
	(when (KNgood r1) 
		(and (KNgood-rocks-in-range) (not (Kgood-rocks-in-range))))
	
	(when (not (Kgood r1)) (not (Kgood-rocks-in-range)))
	
	(when (KGivengood r1 tag0 V_FALSE) (KGivengood-rocks-in-range tag0 V_FALSE))
	
	(when (not (KGivengood r1 tag0 V_TRUE)) (not (KGivengood-rocks-in-range tag0 V_TRUE)))
	
	(when (KGivengood r1 tag1 V_FALSE) (KGivengood-rocks-in-range tag1 V_FALSE))
	
	(when (not (KGivengood r1 tag1 V_TRUE)) (not (KGivengood-rocks-in-range tag1 V_TRUE))))
)
(:action activate-sensor-at-p2-1-h0
:precondition 
(and (agent-at p2-1) (antena-height h0))
:effect 
(and 
	
	(when (good r3) (good-rocks-in-range ))
	
	(when (Kgood r3) 
		(and (Kgood-rocks-in-range) (not (KNgood-rocks-in-range))))
	
	(when (not (KNgood r3)) (not (KNgood-rocks-in-range)))
	
	(when (KGivengood r3 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r3 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r3 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r3 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r3)) (not (good-rocks-in-range )))
	
	(when (KNgood r3) 
		(and (KNgood-rocks-in-range) (not (Kgood-rocks-in-range))))
	
	(when (not (Kgood r3)) (not (Kgood-rocks-in-range)))
	
	(when (KGivengood r3 tag0 V_FALSE) (KGivengood-rocks-in-range tag0 V_FALSE))
	
	(when (not (KGivengood r3 tag0 V_TRUE)) (not (KGivengood-rocks-in-range tag0 V_TRUE)))
	
	(when (KGivengood r3 tag1 V_FALSE) (KGivengood-rocks-in-range tag1 V_FALSE))
	
	(when (not (KGivengood r3 tag1 V_TRUE)) (not (KGivengood-rocks-in-range tag1 V_TRUE))))
)
(:action activate-sensor-at-p2-1-h1
:precondition 
(and (agent-at p2-1) (antena-height h1))
:effect 
(and 
	
	(when (good r3) (good-rocks-in-range ))
	
	(when (Kgood r3) 
		(and (Kgood-rocks-in-range) (not (KNgood-rocks-in-range))))
	
	(when (not (KNgood r3)) (not (KNgood-rocks-in-range)))
	
	(when (KGivengood r3 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r3 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r3 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r3 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r3)) (not (good-rocks-in-range )))
	
	(when (KNgood r3) 
		(and (KNgood-rocks-in-range) (not (Kgood-rocks-in-range))))
	
	(when (not (Kgood r3)) (not (Kgood-rocks-in-range)))
	
	(when (KGivengood r3 tag0 V_FALSE) (KGivengood-rocks-in-range tag0 V_FALSE))
	
	(when (not (KGivengood r3 tag0 V_TRUE)) (not (KGivengood-rocks-in-range tag0 V_TRUE)))
	
	(when (KGivengood r3 tag1 V_FALSE) (KGivengood-rocks-in-range tag1 V_FALSE))
	
	(when (not (KGivengood r3 tag1 V_TRUE)) (not (KGivengood-rocks-in-range tag1 V_TRUE))))
)
(:action activate-sensor-at-p2-2-h1
:precondition 
(and (agent-at p2-2) (antena-height h1))
:effect 
(and 
	
	(when (good r3) (good-rocks-in-range ))
	
	(when (Kgood r3) 
		(and (Kgood-rocks-in-range) (not (KNgood-rocks-in-range))))
	
	(when (not (KNgood r3)) (not (KNgood-rocks-in-range)))
	
	(when (KGivengood r3 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r3 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r3 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r3 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r3)) (not (good-rocks-in-range )))
	
	(when (KNgood r3) 
		(and (KNgood-rocks-in-range) (not (Kgood-rocks-in-range))))
	
	(when (not (Kgood r3)) (not (Kgood-rocks-in-range)))
	
	(when (KGivengood r3 tag0 V_FALSE) (KGivengood-rocks-in-range tag0 V_FALSE))
	
	(when (not (KGivengood r3 tag0 V_TRUE)) (not (KGivengood-rocks-in-range tag0 V_TRUE)))
	
	(when (KGivengood r3 tag1 V_FALSE) (KGivengood-rocks-in-range tag1 V_FALSE))
	
	(when (not (KGivengood r3 tag1 V_TRUE)) (not (KGivengood-rocks-in-range tag1 V_TRUE))))
)
(:action activate-sensor-at-p2-3-h1
:precondition 
(and (agent-at p2-3) (antena-height h1))
:effect 
(and 
	
	(when (good r2) (good-rocks-in-range ))
	
	(when (Kgood r2) 
		(and (Kgood-rocks-in-range) (not (KNgood-rocks-in-range))))
	
	(when (not (KNgood r2)) (not (KNgood-rocks-in-range)))
	
	(when (KGivengood r2 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r2 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r2 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r2 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r2)) (not (good-rocks-in-range )))
	
	(when (KNgood r2) 
		(and (KNgood-rocks-in-range) (not (Kgood-rocks-in-range))))
	
	(when (not (Kgood r2)) (not (Kgood-rocks-in-range)))
	
	(when (KGivengood r2 tag0 V_FALSE) (KGivengood-rocks-in-range tag0 V_FALSE))
	
	(when (not (KGivengood r2 tag0 V_TRUE)) (not (KGivengood-rocks-in-range tag0 V_TRUE)))
	
	(when (KGivengood r2 tag1 V_FALSE) (KGivengood-rocks-in-range tag1 V_FALSE))
	
	(when (not (KGivengood r2 tag1 V_TRUE)) (not (KGivengood-rocks-in-range tag1 V_TRUE))))
)
(:action activate-sensor-at-p2-5-h1
:precondition 
(and (agent-at p2-5) (antena-height h1))
:effect 
(and 
	
	(when (good r5) (good-rocks-in-range ))
	
	(when (Kgood r5) 
		(and (Kgood-rocks-in-range) (not (KNgood-rocks-in-range))))
	
	(when (not (KNgood r5)) (not (KNgood-rocks-in-range)))
	
	(when (KGivengood r5 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r5 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r5 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r5 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r5)) (not (good-rocks-in-range )))
	
	(when (KNgood r5) 
		(and (KNgood-rocks-in-range) (not (Kgood-rocks-in-range))))
	
	(when (not (Kgood r5)) (not (Kgood-rocks-in-range)))
	
	(when (KGivengood r5 tag0 V_FALSE) (KGivengood-rocks-in-range tag0 V_FALSE))
	
	(when (not (KGivengood r5 tag0 V_TRUE)) (not (KGivengood-rocks-in-range tag0 V_TRUE)))
	
	(when (KGivengood r5 tag1 V_FALSE) (KGivengood-rocks-in-range tag1 V_FALSE))
	
	(when (not (KGivengood r5 tag1 V_TRUE)) (not (KGivengood-rocks-in-range tag1 V_TRUE))))
)
(:action activate-sensor-at-p2-7-h1
:precondition 
(and (agent-at p2-7) (antena-height h1))
:effect 
(and 
	
	(when (good r1) (good-rocks-in-range ))
	
	(when (Kgood r1) 
		(and (Kgood-rocks-in-range) (not (KNgood-rocks-in-range))))
	
	(when (not (KNgood r1)) (not (KNgood-rocks-in-range)))
	
	(when (KGivengood r1 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r1 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r1 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r1 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r1)) (not (good-rocks-in-range )))
	
	(when (KNgood r1) 
		(and (KNgood-rocks-in-range) (not (Kgood-rocks-in-range))))
	
	(when (not (Kgood r1)) (not (Kgood-rocks-in-range)))
	
	(when (KGivengood r1 tag0 V_FALSE) (KGivengood-rocks-in-range tag0 V_FALSE))
	
	(when (not (KGivengood r1 tag0 V_TRUE)) (not (KGivengood-rocks-in-range tag0 V_TRUE)))
	
	(when (KGivengood r1 tag1 V_FALSE) (KGivengood-rocks-in-range tag1 V_FALSE))
	
	(when (not (KGivengood r1 tag1 V_TRUE)) (not (KGivengood-rocks-in-range tag1 V_TRUE))))
)
(:action activate-sensor-at-p2-8-h0
:precondition 
(and (agent-at p2-8) (antena-height h0))
:effect 
(and 
	
	(when (good r1) (good-rocks-in-range ))
	
	(when (Kgood r1) 
		(and (Kgood-rocks-in-range) (not (KNgood-rocks-in-range))))
	
	(when (not (KNgood r1)) (not (KNgood-rocks-in-range)))
	
	(when (KGivengood r1 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r1 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r1 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r1 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r1)) (not (good-rocks-in-range )))
	
	(when (KNgood r1) 
		(and (KNgood-rocks-in-range) (not (Kgood-rocks-in-range))))
	
	(when (not (Kgood r1)) (not (Kgood-rocks-in-range)))
	
	(when (KGivengood r1 tag0 V_FALSE) (KGivengood-rocks-in-range tag0 V_FALSE))
	
	(when (not (KGivengood r1 tag0 V_TRUE)) (not (KGivengood-rocks-in-range tag0 V_TRUE)))
	
	(when (KGivengood r1 tag1 V_FALSE) (KGivengood-rocks-in-range tag1 V_FALSE))
	
	(when (not (KGivengood r1 tag1 V_TRUE)) (not (KGivengood-rocks-in-range tag1 V_TRUE))))
)
(:action activate-sensor-at-p2-8-h1
:precondition 
(and (agent-at p2-8) (antena-height h1))
:effect 
(and 
	
	(when (good r1) (good-rocks-in-range ))
	
	(when (Kgood r1) 
		(and (Kgood-rocks-in-range) (not (KNgood-rocks-in-range))))
	
	(when (not (KNgood r1)) (not (KNgood-rocks-in-range)))
	
	(when (KGivengood r1 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r1 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r1 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r1 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r1)) (not (good-rocks-in-range )))
	
	(when (KNgood r1) 
		(and (KNgood-rocks-in-range) (not (Kgood-rocks-in-range))))
	
	(when (not (Kgood r1)) (not (Kgood-rocks-in-range)))
	
	(when (KGivengood r1 tag0 V_FALSE) (KGivengood-rocks-in-range tag0 V_FALSE))
	
	(when (not (KGivengood r1 tag0 V_TRUE)) (not (KGivengood-rocks-in-range tag0 V_TRUE)))
	
	(when (KGivengood r1 tag1 V_FALSE) (KGivengood-rocks-in-range tag1 V_FALSE))
	
	(when (not (KGivengood r1 tag1 V_TRUE)) (not (KGivengood-rocks-in-range tag1 V_TRUE))))
)
(:action activate-sensor-at-p3-1-h1
:precondition 
(and (agent-at p3-1) (antena-height h1))
:effect 
(and 
	
	(when (good r3) (good-rocks-in-range ))
	
	(when (Kgood r3) 
		(and (Kgood-rocks-in-range) (not (KNgood-rocks-in-range))))
	
	(when (not (KNgood r3)) (not (KNgood-rocks-in-range)))
	
	(when (KGivengood r3 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r3 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r3 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r3 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r3)) (not (good-rocks-in-range )))
	
	(when (KNgood r3) 
		(and (KNgood-rocks-in-range) (not (Kgood-rocks-in-range))))
	
	(when (not (Kgood r3)) (not (Kgood-rocks-in-range)))
	
	(when (KGivengood r3 tag0 V_FALSE) (KGivengood-rocks-in-range tag0 V_FALSE))
	
	(when (not (KGivengood r3 tag0 V_TRUE)) (not (KGivengood-rocks-in-range tag0 V_TRUE)))
	
	(when (KGivengood r3 tag1 V_FALSE) (KGivengood-rocks-in-range tag1 V_FALSE))
	
	(when (not (KGivengood r3 tag1 V_TRUE)) (not (KGivengood-rocks-in-range tag1 V_TRUE))))
)
(:action activate-sensor-at-p3-3-h1
:precondition 
(and (agent-at p3-3) (antena-height h1))
:effect 
(and 
	
	(when (good r6) (good-rocks-in-range ))
	
	(when (Kgood r6) 
		(and (Kgood-rocks-in-range) (not (KNgood-rocks-in-range))))
	
	(when (not (KNgood r6)) (not (KNgood-rocks-in-range)))
	
	(when (KGivengood r6 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r6 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r6 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r6 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r6)) (not (good-rocks-in-range )))
	
	(when (KNgood r6) 
		(and (KNgood-rocks-in-range) (not (Kgood-rocks-in-range))))
	
	(when (not (Kgood r6)) (not (Kgood-rocks-in-range)))
	
	(when (KGivengood r6 tag0 V_FALSE) (KGivengood-rocks-in-range tag0 V_FALSE))
	
	(when (not (KGivengood r6 tag0 V_TRUE)) (not (KGivengood-rocks-in-range tag0 V_TRUE)))
	
	(when (KGivengood r6 tag1 V_FALSE) (KGivengood-rocks-in-range tag1 V_FALSE))
	
	(when (not (KGivengood r6 tag1 V_TRUE)) (not (KGivengood-rocks-in-range tag1 V_TRUE))))
)
(:action activate-sensor-at-p3-8-h1
:precondition 
(and (agent-at p3-8) (antena-height h1))
:effect 
(and 
	
	(when (good r1) (good-rocks-in-range ))
	
	(when (Kgood r1) 
		(and (Kgood-rocks-in-range) (not (KNgood-rocks-in-range))))
	
	(when (not (KNgood r1)) (not (KNgood-rocks-in-range)))
	
	(when (KGivengood r1 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r1 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r1 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r1 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r1)) (not (good-rocks-in-range )))
	
	(when (KNgood r1) 
		(and (KNgood-rocks-in-range) (not (Kgood-rocks-in-range))))
	
	(when (not (Kgood r1)) (not (Kgood-rocks-in-range)))
	
	(when (KGivengood r1 tag0 V_FALSE) (KGivengood-rocks-in-range tag0 V_FALSE))
	
	(when (not (KGivengood r1 tag0 V_TRUE)) (not (KGivengood-rocks-in-range tag0 V_TRUE)))
	
	(when (KGivengood r1 tag1 V_FALSE) (KGivengood-rocks-in-range tag1 V_FALSE))
	
	(when (not (KGivengood r1 tag1 V_TRUE)) (not (KGivengood-rocks-in-range tag1 V_TRUE))))
)
(:action activate-sensor-at-p4-2-h1
:precondition 
(and (agent-at p4-2) (antena-height h1))
:effect 
(and 
	
	(when (good r6) (good-rocks-in-range ))
	
	(when (Kgood r6) 
		(and (Kgood-rocks-in-range) (not (KNgood-rocks-in-range))))
	
	(when (not (KNgood r6)) (not (KNgood-rocks-in-range)))
	
	(when (KGivengood r6 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r6 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r6 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r6 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r6)) (not (good-rocks-in-range )))
	
	(when (KNgood r6) 
		(and (KNgood-rocks-in-range) (not (Kgood-rocks-in-range))))
	
	(when (not (Kgood r6)) (not (Kgood-rocks-in-range)))
	
	(when (KGivengood r6 tag0 V_FALSE) (KGivengood-rocks-in-range tag0 V_FALSE))
	
	(when (not (KGivengood r6 tag0 V_TRUE)) (not (KGivengood-rocks-in-range tag0 V_TRUE)))
	
	(when (KGivengood r6 tag1 V_FALSE) (KGivengood-rocks-in-range tag1 V_FALSE))
	
	(when (not (KGivengood r6 tag1 V_TRUE)) (not (KGivengood-rocks-in-range tag1 V_TRUE))))
)
(:action activate-sensor-at-p4-3-h0
:precondition 
(and (agent-at p4-3) (antena-height h0))
:effect 
(and 
	
	(when (good r6) (good-rocks-in-range ))
	
	(when (Kgood r6) 
		(and (Kgood-rocks-in-range) (not (KNgood-rocks-in-range))))
	
	(when (not (KNgood r6)) (not (KNgood-rocks-in-range)))
	
	(when (KGivengood r6 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r6 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r6 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r6 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r6)) (not (good-rocks-in-range )))
	
	(when (KNgood r6) 
		(and (KNgood-rocks-in-range) (not (Kgood-rocks-in-range))))
	
	(when (not (Kgood r6)) (not (Kgood-rocks-in-range)))
	
	(when (KGivengood r6 tag0 V_FALSE) (KGivengood-rocks-in-range tag0 V_FALSE))
	
	(when (not (KGivengood r6 tag0 V_TRUE)) (not (KGivengood-rocks-in-range tag0 V_TRUE)))
	
	(when (KGivengood r6 tag1 V_FALSE) (KGivengood-rocks-in-range tag1 V_FALSE))
	
	(when (not (KGivengood r6 tag1 V_TRUE)) (not (KGivengood-rocks-in-range tag1 V_TRUE))))
)
(:action activate-sensor-at-p4-3-h1
:precondition 
(and (agent-at p4-3) (antena-height h1))
:effect 
(and 
	
	(when (good r6) (good-rocks-in-range ))
	
	(when (Kgood r6) 
		(and (Kgood-rocks-in-range) (not (KNgood-rocks-in-range))))
	
	(when (not (KNgood r6)) (not (KNgood-rocks-in-range)))
	
	(when (KGivengood r6 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r6 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r6 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r6 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r6)) (not (good-rocks-in-range )))
	
	(when (KNgood r6) 
		(and (KNgood-rocks-in-range) (not (Kgood-rocks-in-range))))
	
	(when (not (Kgood r6)) (not (Kgood-rocks-in-range)))
	
	(when (KGivengood r6 tag0 V_FALSE) (KGivengood-rocks-in-range tag0 V_FALSE))
	
	(when (not (KGivengood r6 tag0 V_TRUE)) (not (KGivengood-rocks-in-range tag0 V_TRUE)))
	
	(when (KGivengood r6 tag1 V_FALSE) (KGivengood-rocks-in-range tag1 V_FALSE))
	
	(when (not (KGivengood r6 tag1 V_TRUE)) (not (KGivengood-rocks-in-range tag1 V_TRUE))))
)
(:action activate-sensor-at-p4-4-h1
:precondition 
(and (agent-at p4-4) (antena-height h1))
:effect 
(and 
	
	(when (good r6) (good-rocks-in-range ))
	
	(when (Kgood r6) 
		(and (Kgood-rocks-in-range) (not (KNgood-rocks-in-range))))
	
	(when (not (KNgood r6)) (not (KNgood-rocks-in-range)))
	
	(when (KGivengood r6 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r6 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r6 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r6 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r6)) (not (good-rocks-in-range )))
	
	(when (KNgood r6) 
		(and (KNgood-rocks-in-range) (not (Kgood-rocks-in-range))))
	
	(when (not (Kgood r6)) (not (Kgood-rocks-in-range)))
	
	(when (KGivengood r6 tag0 V_FALSE) (KGivengood-rocks-in-range tag0 V_FALSE))
	
	(when (not (KGivengood r6 tag0 V_TRUE)) (not (KGivengood-rocks-in-range tag0 V_TRUE)))
	
	(when (KGivengood r6 tag1 V_FALSE) (KGivengood-rocks-in-range tag1 V_FALSE))
	
	(when (not (KGivengood r6 tag1 V_TRUE)) (not (KGivengood-rocks-in-range tag1 V_TRUE))))
)
(:action activate-sensor-at-p5-3-h1
:precondition 
(and (agent-at p5-3) (antena-height h1))
:effect 
(and 
	
	(when (good r6) (good-rocks-in-range ))
	
	(when (Kgood r6) 
		(and (Kgood-rocks-in-range) (not (KNgood-rocks-in-range))))
	
	(when (not (KNgood r6)) (not (KNgood-rocks-in-range)))
	
	(when (KGivengood r6 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r6 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r6 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r6 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r6)) (not (good-rocks-in-range )))
	
	(when (KNgood r6) 
		(and (KNgood-rocks-in-range) (not (Kgood-rocks-in-range))))
	
	(when (not (Kgood r6)) (not (Kgood-rocks-in-range)))
	
	(when (KGivengood r6 tag0 V_FALSE) (KGivengood-rocks-in-range tag0 V_FALSE))
	
	(when (not (KGivengood r6 tag0 V_TRUE)) (not (KGivengood-rocks-in-range tag0 V_TRUE)))
	
	(when (KGivengood r6 tag1 V_FALSE) (KGivengood-rocks-in-range tag1 V_FALSE))
	
	(when (not (KGivengood r6 tag1 V_TRUE)) (not (KGivengood-rocks-in-range tag1 V_TRUE))))
)
(:action activate-sensor-at-p6-1-h1
:precondition 
(and (agent-at p6-1) (antena-height h1))
:effect 
(and 
	
	(when (good r4) (good-rocks-in-range ))
	
	(when (Kgood r4) 
		(and (Kgood-rocks-in-range) (not (KNgood-rocks-in-range))))
	
	(when (not (KNgood r4)) (not (KNgood-rocks-in-range)))
	
	(when (KGivengood r4 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r4 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r4 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r4 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r4)) (not (good-rocks-in-range )))
	
	(when (KNgood r4) 
		(and (KNgood-rocks-in-range) (not (Kgood-rocks-in-range))))
	
	(when (not (Kgood r4)) (not (Kgood-rocks-in-range)))
	
	(when (KGivengood r4 tag0 V_FALSE) (KGivengood-rocks-in-range tag0 V_FALSE))
	
	(when (not (KGivengood r4 tag0 V_TRUE)) (not (KGivengood-rocks-in-range tag0 V_TRUE)))
	
	(when (KGivengood r4 tag1 V_FALSE) (KGivengood-rocks-in-range tag1 V_FALSE))
	
	(when (not (KGivengood r4 tag1 V_TRUE)) (not (KGivengood-rocks-in-range tag1 V_TRUE))))
)
(:action activate-sensor-at-p6-4-h1
:precondition 
(and (agent-at p6-4) (antena-height h1))
:effect 
(and 
	
	(when (good r0) (good-rocks-in-range ))
	
	(when (Kgood r0) 
		(and (Kgood-rocks-in-range) (not (KNgood-rocks-in-range))))
	
	(when (not (KNgood r0)) (not (KNgood-rocks-in-range)))
	
	(when (KGivengood r0 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r0 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r0 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r0 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r0)) (not (good-rocks-in-range )))
	
	(when (KNgood r0) 
		(and (KNgood-rocks-in-range) (not (Kgood-rocks-in-range))))
	
	(when (not (Kgood r0)) (not (Kgood-rocks-in-range)))
	
	(when (KGivengood r0 tag0 V_FALSE) (KGivengood-rocks-in-range tag0 V_FALSE))
	
	(when (not (KGivengood r0 tag0 V_TRUE)) (not (KGivengood-rocks-in-range tag0 V_TRUE)))
	
	(when (KGivengood r0 tag1 V_FALSE) (KGivengood-rocks-in-range tag1 V_FALSE))
	
	(when (not (KGivengood r0 tag1 V_TRUE)) (not (KGivengood-rocks-in-range tag1 V_TRUE))))
)
(:action activate-sensor-at-p7-1-h0
:precondition 
(and (agent-at p7-1) (antena-height h0))
:effect 
(and 
	
	(when (good r4) (good-rocks-in-range ))
	
	(when (Kgood r4) 
		(and (Kgood-rocks-in-range) (not (KNgood-rocks-in-range))))
	
	(when (not (KNgood r4)) (not (KNgood-rocks-in-range)))
	
	(when (KGivengood r4 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r4 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r4 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r4 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r4)) (not (good-rocks-in-range )))
	
	(when (KNgood r4) 
		(and (KNgood-rocks-in-range) (not (Kgood-rocks-in-range))))
	
	(when (not (Kgood r4)) (not (Kgood-rocks-in-range)))
	
	(when (KGivengood r4 tag0 V_FALSE) (KGivengood-rocks-in-range tag0 V_FALSE))
	
	(when (not (KGivengood r4 tag0 V_TRUE)) (not (KGivengood-rocks-in-range tag0 V_TRUE)))
	
	(when (KGivengood r4 tag1 V_FALSE) (KGivengood-rocks-in-range tag1 V_FALSE))
	
	(when (not (KGivengood r4 tag1 V_TRUE)) (not (KGivengood-rocks-in-range tag1 V_TRUE))))
)
(:action activate-sensor-at-p7-1-h1
:precondition 
(and (agent-at p7-1) (antena-height h1))
:effect 
(and 
	
	(when (good r4) (good-rocks-in-range ))
	
	(when (Kgood r4) 
		(and (Kgood-rocks-in-range) (not (KNgood-rocks-in-range))))
	
	(when (not (KNgood r4)) (not (KNgood-rocks-in-range)))
	
	(when (KGivengood r4 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r4 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r4 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r4 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r4)) (not (good-rocks-in-range )))
	
	(when (KNgood r4) 
		(and (KNgood-rocks-in-range) (not (Kgood-rocks-in-range))))
	
	(when (not (Kgood r4)) (not (Kgood-rocks-in-range)))
	
	(when (KGivengood r4 tag0 V_FALSE) (KGivengood-rocks-in-range tag0 V_FALSE))
	
	(when (not (KGivengood r4 tag0 V_TRUE)) (not (KGivengood-rocks-in-range tag0 V_TRUE)))
	
	(when (KGivengood r4 tag1 V_FALSE) (KGivengood-rocks-in-range tag1 V_FALSE))
	
	(when (not (KGivengood r4 tag1 V_TRUE)) (not (KGivengood-rocks-in-range tag1 V_TRUE))))
)
(:action activate-sensor-at-p7-2-h1
:precondition 
(and (agent-at p7-2) (antena-height h1))
:effect 
(and 
	
	(when (good r4) (good-rocks-in-range ))
	
	(when (Kgood r4) 
		(and (Kgood-rocks-in-range) (not (KNgood-rocks-in-range))))
	
	(when (not (KNgood r4)) (not (KNgood-rocks-in-range)))
	
	(when (KGivengood r4 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r4 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r4 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r4 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r4)) (not (good-rocks-in-range )))
	
	(when (KNgood r4) 
		(and (KNgood-rocks-in-range) (not (Kgood-rocks-in-range))))
	
	(when (not (Kgood r4)) (not (Kgood-rocks-in-range)))
	
	(when (KGivengood r4 tag0 V_FALSE) (KGivengood-rocks-in-range tag0 V_FALSE))
	
	(when (not (KGivengood r4 tag0 V_TRUE)) (not (KGivengood-rocks-in-range tag0 V_TRUE)))
	
	(when (KGivengood r4 tag1 V_FALSE) (KGivengood-rocks-in-range tag1 V_FALSE))
	
	(when (not (KGivengood r4 tag1 V_TRUE)) (not (KGivengood-rocks-in-range tag1 V_TRUE))))
)
(:action activate-sensor-at-p7-3-h1
:precondition 
(and (agent-at p7-3) (antena-height h1))
:effect 
(and 
	
	(when (good r0) (good-rocks-in-range ))
	
	(when (Kgood r0) 
		(and (Kgood-rocks-in-range) (not (KNgood-rocks-in-range))))
	
	(when (not (KNgood r0)) (not (KNgood-rocks-in-range)))
	
	(when (KGivengood r0 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r0 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r0 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r0 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r0)) (not (good-rocks-in-range )))
	
	(when (KNgood r0) 
		(and (KNgood-rocks-in-range) (not (Kgood-rocks-in-range))))
	
	(when (not (Kgood r0)) (not (Kgood-rocks-in-range)))
	
	(when (KGivengood r0 tag0 V_FALSE) (KGivengood-rocks-in-range tag0 V_FALSE))
	
	(when (not (KGivengood r0 tag0 V_TRUE)) (not (KGivengood-rocks-in-range tag0 V_TRUE)))
	
	(when (KGivengood r0 tag1 V_FALSE) (KGivengood-rocks-in-range tag1 V_FALSE))
	
	(when (not (KGivengood r0 tag1 V_TRUE)) (not (KGivengood-rocks-in-range tag1 V_TRUE))))
)
(:action activate-sensor-at-p7-4-h0
:precondition 
(and (agent-at p7-4) (antena-height h0))
:effect 
(and 
	
	(when (good r0) (good-rocks-in-range ))
	
	(when (Kgood r0) 
		(and (Kgood-rocks-in-range) (not (KNgood-rocks-in-range))))
	
	(when (not (KNgood r0)) (not (KNgood-rocks-in-range)))
	
	(when (KGivengood r0 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r0 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r0 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r0 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r0)) (not (good-rocks-in-range )))
	
	(when (KNgood r0) 
		(and (KNgood-rocks-in-range) (not (Kgood-rocks-in-range))))
	
	(when (not (Kgood r0)) (not (Kgood-rocks-in-range)))
	
	(when (KGivengood r0 tag0 V_FALSE) (KGivengood-rocks-in-range tag0 V_FALSE))
	
	(when (not (KGivengood r0 tag0 V_TRUE)) (not (KGivengood-rocks-in-range tag0 V_TRUE)))
	
	(when (KGivengood r0 tag1 V_FALSE) (KGivengood-rocks-in-range tag1 V_FALSE))
	
	(when (not (KGivengood r0 tag1 V_TRUE)) (not (KGivengood-rocks-in-range tag1 V_TRUE))))
)
(:action activate-sensor-at-p7-4-h1
:precondition 
(and (agent-at p7-4) (antena-height h1))
:effect 
(and 
	
	(when (good r0) (good-rocks-in-range ))
	
	(when (Kgood r0) 
		(and (Kgood-rocks-in-range) (not (KNgood-rocks-in-range))))
	
	(when (not (KNgood r0)) (not (KNgood-rocks-in-range)))
	
	(when (KGivengood r0 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r0 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r0 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r0 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r0)) (not (good-rocks-in-range )))
	
	(when (KNgood r0) 
		(and (KNgood-rocks-in-range) (not (Kgood-rocks-in-range))))
	
	(when (not (Kgood r0)) (not (Kgood-rocks-in-range)))
	
	(when (KGivengood r0 tag0 V_FALSE) (KGivengood-rocks-in-range tag0 V_FALSE))
	
	(when (not (KGivengood r0 tag0 V_TRUE)) (not (KGivengood-rocks-in-range tag0 V_TRUE)))
	
	(when (KGivengood r0 tag1 V_FALSE) (KGivengood-rocks-in-range tag1 V_FALSE))
	
	(when (not (KGivengood r0 tag1 V_TRUE)) (not (KGivengood-rocks-in-range tag1 V_TRUE))))
)
(:action activate-sensor-at-p7-5-h1
:precondition 
(and (agent-at p7-5) (antena-height h1))
:effect 
(and 
	
	(when (good r0) (good-rocks-in-range ))
	
	(when (Kgood r0) 
		(and (Kgood-rocks-in-range) (not (KNgood-rocks-in-range))))
	
	(when (not (KNgood r0)) (not (KNgood-rocks-in-range)))
	
	(when (KGivengood r0 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r0 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r0 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r0 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r0)) (not (good-rocks-in-range )))
	
	(when (KNgood r0) 
		(and (KNgood-rocks-in-range) (not (Kgood-rocks-in-range))))
	
	(when (not (Kgood r0)) (not (Kgood-rocks-in-range)))
	
	(when (KGivengood r0 tag0 V_FALSE) (KGivengood-rocks-in-range tag0 V_FALSE))
	
	(when (not (KGivengood r0 tag0 V_TRUE)) (not (KGivengood-rocks-in-range tag0 V_TRUE)))
	
	(when (KGivengood r0 tag1 V_FALSE) (KGivengood-rocks-in-range tag1 V_FALSE))
	
	(when (not (KGivengood r0 tag1 V_TRUE)) (not (KGivengood-rocks-in-range tag1 V_TRUE))))
)
(:action activate-sensor-at-p8-1-h1
:precondition 
(and (agent-at p8-1) (antena-height h1))
:effect 
(and 
	
	(when (good r4) (good-rocks-in-range ))
	
	(when (Kgood r4) 
		(and (Kgood-rocks-in-range) (not (KNgood-rocks-in-range))))
	
	(when (not (KNgood r4)) (not (KNgood-rocks-in-range)))
	
	(when (KGivengood r4 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r4 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r4 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r4 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r4)) (not (good-rocks-in-range )))
	
	(when (KNgood r4) 
		(and (KNgood-rocks-in-range) (not (Kgood-rocks-in-range))))
	
	(when (not (Kgood r4)) (not (Kgood-rocks-in-range)))
	
	(when (KGivengood r4 tag0 V_FALSE) (KGivengood-rocks-in-range tag0 V_FALSE))
	
	(when (not (KGivengood r4 tag0 V_TRUE)) (not (KGivengood-rocks-in-range tag0 V_TRUE)))
	
	(when (KGivengood r4 tag1 V_FALSE) (KGivengood-rocks-in-range tag1 V_FALSE))
	
	(when (not (KGivengood r4 tag1 V_TRUE)) (not (KGivengood-rocks-in-range tag1 V_TRUE))))
)
(:action activate-sensor-at-p8-4-h1
:precondition 
(and (agent-at p8-4) (antena-height h1))
:effect 
(and 
	
	(when (good r0) (good-rocks-in-range ))
	
	(when (Kgood r0) 
		(and (Kgood-rocks-in-range) (not (KNgood-rocks-in-range))))
	
	(when (not (KNgood r0)) (not (KNgood-rocks-in-range)))
	
	(when (KGivengood r0 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r0 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r0 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r0 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r0)) (not (good-rocks-in-range )))
	
	(when (KNgood r0) 
		(and (KNgood-rocks-in-range) (not (Kgood-rocks-in-range))))
	
	(when (not (Kgood r0)) (not (Kgood-rocks-in-range)))
	
	(when (KGivengood r0 tag0 V_FALSE) (KGivengood-rocks-in-range tag0 V_FALSE))
	
	(when (not (KGivengood r0 tag0 V_TRUE)) (not (KGivengood-rocks-in-range tag0 V_TRUE)))
	
	(when (KGivengood r0 tag1 V_FALSE) (KGivengood-rocks-in-range tag1 V_FALSE))
	
	(when (not (KGivengood r0 tag1 V_TRUE)) (not (KGivengood-rocks-in-range tag1 V_TRUE))))
)
(:action observe-sensor-T
:precondition 
(and (good-rocks-in-range ))
:effect (Kgood-rocks-in-range)
)
(:action observe-sensor-F
:precondition 
(and (not (good-rocks-in-range )))
:effect (KNgood-rocks-in-range)
)
(:action Merge-good
:parameters ( ?r - rock ?V_PARAM - VALUE_TYPE)
:precondition 
(and (not (Kgood ?r)) 
	(or (KGivengood ?r tag0 ?V_PARAM) (KNot tag0))
	(or (KGivengood ?r tag1 ?V_PARAM) (KNot tag1)))
:effect 
(and (Kgood ?r))
)

(:action RefuteT-good
:parameters ( ?r - rock ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivengood ?r ?TAG_PARAM V_TRUE) (KNgood ?r) (not (good ?r)))
:effect 
(and (KNot ?TAG_PARAM))
)

(:action RefuteF-good
:parameters ( ?r - rock ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivengood ?r ?TAG_PARAM V_FALSE) (Kgood ?r) (good ?r))
:effect 
(and (KNot ?TAG_PARAM))
)

(:action Merge-good-rocks-in-range
:parameters ( ?V_PARAM - VALUE_TYPE)
:precondition 
(and (not (Kgood-rocks-in-range)) 
	(or (KGivengood-rocks-in-range tag0 ?V_PARAM) (KNot tag0))
	(or (KGivengood-rocks-in-range tag1 ?V_PARAM) (KNot tag1)))
:effect 
(and (Kgood-rocks-in-range))
)

(:action RefuteT-good-rocks-in-range
:parameters ( ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivengood-rocks-in-range ?TAG_PARAM V_TRUE) (KNgood-rocks-in-range) (not (good-rocks-in-range )))
:effect 
(and (KNot ?TAG_PARAM))
)

(:action RefuteF-good-rocks-in-range
:parameters ( ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivengood-rocks-in-range ?TAG_PARAM V_FALSE) (Kgood-rocks-in-range) (good-rocks-in-range ))
:effect 
(and (KNot ?TAG_PARAM))
)

)
