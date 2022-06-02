(define (domain KRockSample8-8)
(:requirements :strips :typing)
(:types LOCATION ROCK HEIGHT MOVESTEP TAG_TYPE VALUE_TYPE)
(:constants
 p1-1 - LOCATION
 p1-2 - LOCATION
 p1-3 - LOCATION
 p1-4 - LOCATION
 p1-5 - LOCATION
 p1-6 - LOCATION
 p1-7 - LOCATION
 p1-8 - LOCATION
 p2-1 - LOCATION
 p2-2 - LOCATION
 p2-3 - LOCATION
 p2-4 - LOCATION
 p2-5 - LOCATION
 p2-6 - LOCATION
 p2-7 - LOCATION
 p2-8 - LOCATION
 p3-1 - LOCATION
 p3-2 - LOCATION
 p3-3 - LOCATION
 p3-4 - LOCATION
 p3-5 - LOCATION
 p3-6 - LOCATION
 p3-7 - LOCATION
 p3-8 - LOCATION
 p4-1 - LOCATION
 p4-2 - LOCATION
 p4-3 - LOCATION
 p4-4 - LOCATION
 p4-5 - LOCATION
 p4-6 - LOCATION
 p4-7 - LOCATION
 p4-8 - LOCATION
 p5-1 - LOCATION
 p5-2 - LOCATION
 p5-3 - LOCATION
 p5-4 - LOCATION
 p5-5 - LOCATION
 p5-6 - LOCATION
 p5-7 - LOCATION
 p5-8 - LOCATION
 p6-1 - LOCATION
 p6-2 - LOCATION
 p6-3 - LOCATION
 p6-4 - LOCATION
 p6-5 - LOCATION
 p6-6 - LOCATION
 p6-7 - LOCATION
 p6-8 - LOCATION
 p7-1 - LOCATION
 p7-2 - LOCATION
 p7-3 - LOCATION
 p7-4 - LOCATION
 p7-5 - LOCATION
 p7-6 - LOCATION
 p7-7 - LOCATION
 p7-8 - LOCATION
 p8-1 - LOCATION
 p8-2 - LOCATION
 p8-3 - LOCATION
 p8-4 - LOCATION
 p8-5 - LOCATION
 p8-6 - LOCATION
 p8-7 - LOCATION
 p8-8 - LOCATION
 r0 - ROCK
 r1 - ROCK
 r2 - ROCK
 r3 - ROCK
 r4 - ROCK
 r5 - ROCK
 r6 - ROCK
 r7 - ROCK
 h0 - HEIGHT
 h1 - HEIGHT
 tag0 - TAG_TYPE ; (good r6) (not (good r3)) (good r7) (not (good r1)) (not (good r5)) (not (good r4)) (not (good r2)) (good r0)
 tag1 - TAG_TYPE ; (not (good r7)) (not (good r6)) (not (good r0)) (good r4) (good r1) (good r3) (good r2) (good r5)
 V_TRUE - VALUE_TYPE
 V_FALSE - VALUE_TYPE
)

(:predicates
(rock-at ?r - ROCK ?p - LOCATION)
(agent-at ?p - LOCATION)
(adj ?p1 - LOCATION ?p2 - LOCATION)
(good ?r - ROCK)
(Kgood ?r - ROCK ?V_PARAM - VALUE_TYPE)
(KGivengood ?r - ROCK ?TAG_PARAM - TAG_TYPE ?V_PARAM - VALUE_TYPE)
(antena-height ?h - HEIGHT)
(good-rocks-in-range)
(Kgood-rocks-in-range ?V_PARAM - VALUE_TYPE)
(KGivengood-rocks-in-range ?TAG_PARAM - TAG_TYPE ?V_PARAM - VALUE_TYPE)
(KNot ?TAG_PARAM - TAG_TYPE)
)

(:action move
:parameters ( ?pSource - LOCATION ?pTarget - LOCATION)
:precondition 
(and (agent-at ?pSource) (adj ?pSource ?pTarget) (antena-height h0))
:effect 
(and (agent-at ?pTarget) (not (agent-at ?pSource)) (not (good-rocks-in-range )) (Kgood-rocks-in-range V_FALSE) (not (Kgood-rocks-in-range V_TRUE)) (KGivengood-rocks-in-range tag0 V_FALSE) (not (KGivengood-rocks-in-range tag0 V_TRUE)) (KGivengood-rocks-in-range tag1 V_FALSE) (not (KGivengood-rocks-in-range tag1 V_TRUE)))
)
(:action sample
:parameters ( ?r - ROCK ?p - LOCATION)
:precondition 
(and (agent-at ?p) (rock-at ?r ?p) (good ?r) (Kgood ?r V_TRUE))
:effect 
(and (not (good ?r)) (Kgood ?r V_FALSE) (not (Kgood ?r V_TRUE)) (KGivengood ?r tag0 V_FALSE) (not (KGivengood ?r tag0 V_TRUE)) (KGivengood ?r tag1 V_FALSE) (not (KGivengood ?r tag1 V_TRUE)))
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
	
	(when (Kgood r3 V_TRUE) 
		(and (Kgood-rocks-in-range V_TRUE) (not (Kgood-rocks-in-range V_FALSE))))
	
	(when (not (Kgood r3 V_FALSE)) (not (Kgood-rocks-in-range V_FALSE)))
	
	(when (KGivengood r3 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r3 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r3 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r3 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r3)) (not (good-rocks-in-range )))
	
	(when (Kgood r3 V_FALSE) 
		(and (Kgood-rocks-in-range V_FALSE) (not (Kgood-rocks-in-range V_TRUE))))
	
	(when (not (Kgood r3 V_TRUE)) (not (Kgood-rocks-in-range V_TRUE)))
	
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
	
	(when (Kgood r2 V_TRUE) 
		(and (Kgood-rocks-in-range V_TRUE) (not (Kgood-rocks-in-range V_FALSE))))
	
	(when (not (Kgood r2 V_FALSE)) (not (Kgood-rocks-in-range V_FALSE)))
	
	(when (KGivengood r2 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r2 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r2 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r2 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r2)) (not (good-rocks-in-range )))
	
	(when (Kgood r2 V_FALSE) 
		(and (Kgood-rocks-in-range V_FALSE) (not (Kgood-rocks-in-range V_TRUE))))
	
	(when (not (Kgood r2 V_TRUE)) (not (Kgood-rocks-in-range V_TRUE)))
	
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
	
	(when (Kgood r2 V_TRUE) 
		(and (Kgood-rocks-in-range V_TRUE) (not (Kgood-rocks-in-range V_FALSE))))
	
	(when (not (Kgood r2 V_FALSE)) (not (Kgood-rocks-in-range V_FALSE)))
	
	(when (KGivengood r2 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r2 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r2 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r2 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r2)) (not (good-rocks-in-range )))
	
	(when (Kgood r2 V_FALSE) 
		(and (Kgood-rocks-in-range V_FALSE) (not (Kgood-rocks-in-range V_TRUE))))
	
	(when (not (Kgood r2 V_TRUE)) (not (Kgood-rocks-in-range V_TRUE)))
	
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
	
	(when (Kgood r2 V_TRUE) 
		(and (Kgood-rocks-in-range V_TRUE) (not (Kgood-rocks-in-range V_FALSE))))
	
	(when (not (Kgood r2 V_FALSE)) (not (Kgood-rocks-in-range V_FALSE)))
	
	(when (KGivengood r2 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r2 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r2 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r2 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r2)) (not (good-rocks-in-range )))
	
	(when (Kgood r2 V_FALSE) 
		(and (Kgood-rocks-in-range V_FALSE) (not (Kgood-rocks-in-range V_TRUE))))
	
	(when (not (Kgood r2 V_TRUE)) (not (Kgood-rocks-in-range V_TRUE)))
	
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
		(or (Kgood r2 V_TRUE) (Kgood r5 V_TRUE))
		(and (Kgood-rocks-in-range V_TRUE) (not (Kgood-rocks-in-range V_FALSE))))
	
	(when 
		(and (not (Kgood r2 V_FALSE)) (not (Kgood r5 V_FALSE)))(not (Kgood-rocks-in-range V_FALSE)))
	
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
		(and (Kgood r2 V_FALSE) (Kgood r5 V_FALSE))
		(and (Kgood-rocks-in-range V_FALSE) (not (Kgood-rocks-in-range V_TRUE))))
	
	(when 
		(and (not (Kgood r2 V_TRUE)) (not (Kgood r5 V_TRUE)))(not (Kgood-rocks-in-range V_TRUE)))
	
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
	
	(when (Kgood r5 V_TRUE) 
		(and (Kgood-rocks-in-range V_TRUE) (not (Kgood-rocks-in-range V_FALSE))))
	
	(when (not (Kgood r5 V_FALSE)) (not (Kgood-rocks-in-range V_FALSE)))
	
	(when (KGivengood r5 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r5 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r5 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r5 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r5)) (not (good-rocks-in-range )))
	
	(when (Kgood r5 V_FALSE) 
		(and (Kgood-rocks-in-range V_FALSE) (not (Kgood-rocks-in-range V_TRUE))))
	
	(when (not (Kgood r5 V_TRUE)) (not (Kgood-rocks-in-range V_TRUE)))
	
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
	
	(when (Kgood r5 V_TRUE) 
		(and (Kgood-rocks-in-range V_TRUE) (not (Kgood-rocks-in-range V_FALSE))))
	
	(when (not (Kgood r5 V_FALSE)) (not (Kgood-rocks-in-range V_FALSE)))
	
	(when (KGivengood r5 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r5 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r5 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r5 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r5)) (not (good-rocks-in-range )))
	
	(when (Kgood r5 V_FALSE) 
		(and (Kgood-rocks-in-range V_FALSE) (not (Kgood-rocks-in-range V_TRUE))))
	
	(when (not (Kgood r5 V_TRUE)) (not (Kgood-rocks-in-range V_TRUE)))
	
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
	
	(when (Kgood r5 V_TRUE) 
		(and (Kgood-rocks-in-range V_TRUE) (not (Kgood-rocks-in-range V_FALSE))))
	
	(when (not (Kgood r5 V_FALSE)) (not (Kgood-rocks-in-range V_FALSE)))
	
	(when (KGivengood r5 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r5 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r5 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r5 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r5)) (not (good-rocks-in-range )))
	
	(when (Kgood r5 V_FALSE) 
		(and (Kgood-rocks-in-range V_FALSE) (not (Kgood-rocks-in-range V_TRUE))))
	
	(when (not (Kgood r5 V_TRUE)) (not (Kgood-rocks-in-range V_TRUE)))
	
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
	
	(when (Kgood r1 V_TRUE) 
		(and (Kgood-rocks-in-range V_TRUE) (not (Kgood-rocks-in-range V_FALSE))))
	
	(when (not (Kgood r1 V_FALSE)) (not (Kgood-rocks-in-range V_FALSE)))
	
	(when (KGivengood r1 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r1 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r1 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r1 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r1)) (not (good-rocks-in-range )))
	
	(when (Kgood r1 V_FALSE) 
		(and (Kgood-rocks-in-range V_FALSE) (not (Kgood-rocks-in-range V_TRUE))))
	
	(when (not (Kgood r1 V_TRUE)) (not (Kgood-rocks-in-range V_TRUE)))
	
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
	
	(when (Kgood r3 V_TRUE) 
		(and (Kgood-rocks-in-range V_TRUE) (not (Kgood-rocks-in-range V_FALSE))))
	
	(when (not (Kgood r3 V_FALSE)) (not (Kgood-rocks-in-range V_FALSE)))
	
	(when (KGivengood r3 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r3 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r3 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r3 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r3)) (not (good-rocks-in-range )))
	
	(when (Kgood r3 V_FALSE) 
		(and (Kgood-rocks-in-range V_FALSE) (not (Kgood-rocks-in-range V_TRUE))))
	
	(when (not (Kgood r3 V_TRUE)) (not (Kgood-rocks-in-range V_TRUE)))
	
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
	
	(when (Kgood r3 V_TRUE) 
		(and (Kgood-rocks-in-range V_TRUE) (not (Kgood-rocks-in-range V_FALSE))))
	
	(when (not (Kgood r3 V_FALSE)) (not (Kgood-rocks-in-range V_FALSE)))
	
	(when (KGivengood r3 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r3 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r3 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r3 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r3)) (not (good-rocks-in-range )))
	
	(when (Kgood r3 V_FALSE) 
		(and (Kgood-rocks-in-range V_FALSE) (not (Kgood-rocks-in-range V_TRUE))))
	
	(when (not (Kgood r3 V_TRUE)) (not (Kgood-rocks-in-range V_TRUE)))
	
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
	
	(when (Kgood r3 V_TRUE) 
		(and (Kgood-rocks-in-range V_TRUE) (not (Kgood-rocks-in-range V_FALSE))))
	
	(when (not (Kgood r3 V_FALSE)) (not (Kgood-rocks-in-range V_FALSE)))
	
	(when (KGivengood r3 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r3 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r3 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r3 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r3)) (not (good-rocks-in-range )))
	
	(when (Kgood r3 V_FALSE) 
		(and (Kgood-rocks-in-range V_FALSE) (not (Kgood-rocks-in-range V_TRUE))))
	
	(when (not (Kgood r3 V_TRUE)) (not (Kgood-rocks-in-range V_TRUE)))
	
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
	
	(when (Kgood r2 V_TRUE) 
		(and (Kgood-rocks-in-range V_TRUE) (not (Kgood-rocks-in-range V_FALSE))))
	
	(when (not (Kgood r2 V_FALSE)) (not (Kgood-rocks-in-range V_FALSE)))
	
	(when (KGivengood r2 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r2 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r2 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r2 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r2)) (not (good-rocks-in-range )))
	
	(when (Kgood r2 V_FALSE) 
		(and (Kgood-rocks-in-range V_FALSE) (not (Kgood-rocks-in-range V_TRUE))))
	
	(when (not (Kgood r2 V_TRUE)) (not (Kgood-rocks-in-range V_TRUE)))
	
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
	
	(when (Kgood r5 V_TRUE) 
		(and (Kgood-rocks-in-range V_TRUE) (not (Kgood-rocks-in-range V_FALSE))))
	
	(when (not (Kgood r5 V_FALSE)) (not (Kgood-rocks-in-range V_FALSE)))
	
	(when (KGivengood r5 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r5 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r5 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r5 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r5)) (not (good-rocks-in-range )))
	
	(when (Kgood r5 V_FALSE) 
		(and (Kgood-rocks-in-range V_FALSE) (not (Kgood-rocks-in-range V_TRUE))))
	
	(when (not (Kgood r5 V_TRUE)) (not (Kgood-rocks-in-range V_TRUE)))
	
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
	
	(when (Kgood r1 V_TRUE) 
		(and (Kgood-rocks-in-range V_TRUE) (not (Kgood-rocks-in-range V_FALSE))))
	
	(when (not (Kgood r1 V_FALSE)) (not (Kgood-rocks-in-range V_FALSE)))
	
	(when (KGivengood r1 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r1 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r1 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r1 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r1)) (not (good-rocks-in-range )))
	
	(when (Kgood r1 V_FALSE) 
		(and (Kgood-rocks-in-range V_FALSE) (not (Kgood-rocks-in-range V_TRUE))))
	
	(when (not (Kgood r1 V_TRUE)) (not (Kgood-rocks-in-range V_TRUE)))
	
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
	
	(when (Kgood r1 V_TRUE) 
		(and (Kgood-rocks-in-range V_TRUE) (not (Kgood-rocks-in-range V_FALSE))))
	
	(when (not (Kgood r1 V_FALSE)) (not (Kgood-rocks-in-range V_FALSE)))
	
	(when (KGivengood r1 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r1 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r1 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r1 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r1)) (not (good-rocks-in-range )))
	
	(when (Kgood r1 V_FALSE) 
		(and (Kgood-rocks-in-range V_FALSE) (not (Kgood-rocks-in-range V_TRUE))))
	
	(when (not (Kgood r1 V_TRUE)) (not (Kgood-rocks-in-range V_TRUE)))
	
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
	
	(when (Kgood r1 V_TRUE) 
		(and (Kgood-rocks-in-range V_TRUE) (not (Kgood-rocks-in-range V_FALSE))))
	
	(when (not (Kgood r1 V_FALSE)) (not (Kgood-rocks-in-range V_FALSE)))
	
	(when (KGivengood r1 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r1 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r1 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r1 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r1)) (not (good-rocks-in-range )))
	
	(when (Kgood r1 V_FALSE) 
		(and (Kgood-rocks-in-range V_FALSE) (not (Kgood-rocks-in-range V_TRUE))))
	
	(when (not (Kgood r1 V_TRUE)) (not (Kgood-rocks-in-range V_TRUE)))
	
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
	
	(when (Kgood r3 V_TRUE) 
		(and (Kgood-rocks-in-range V_TRUE) (not (Kgood-rocks-in-range V_FALSE))))
	
	(when (not (Kgood r3 V_FALSE)) (not (Kgood-rocks-in-range V_FALSE)))
	
	(when (KGivengood r3 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r3 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r3 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r3 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r3)) (not (good-rocks-in-range )))
	
	(when (Kgood r3 V_FALSE) 
		(and (Kgood-rocks-in-range V_FALSE) (not (Kgood-rocks-in-range V_TRUE))))
	
	(when (not (Kgood r3 V_TRUE)) (not (Kgood-rocks-in-range V_TRUE)))
	
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
	
	(when (Kgood r6 V_TRUE) 
		(and (Kgood-rocks-in-range V_TRUE) (not (Kgood-rocks-in-range V_FALSE))))
	
	(when (not (Kgood r6 V_FALSE)) (not (Kgood-rocks-in-range V_FALSE)))
	
	(when (KGivengood r6 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r6 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r6 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r6 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r6)) (not (good-rocks-in-range )))
	
	(when (Kgood r6 V_FALSE) 
		(and (Kgood-rocks-in-range V_FALSE) (not (Kgood-rocks-in-range V_TRUE))))
	
	(when (not (Kgood r6 V_TRUE)) (not (Kgood-rocks-in-range V_TRUE)))
	
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
	
	(when (Kgood r1 V_TRUE) 
		(and (Kgood-rocks-in-range V_TRUE) (not (Kgood-rocks-in-range V_FALSE))))
	
	(when (not (Kgood r1 V_FALSE)) (not (Kgood-rocks-in-range V_FALSE)))
	
	(when (KGivengood r1 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r1 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r1 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r1 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r1)) (not (good-rocks-in-range )))
	
	(when (Kgood r1 V_FALSE) 
		(and (Kgood-rocks-in-range V_FALSE) (not (Kgood-rocks-in-range V_TRUE))))
	
	(when (not (Kgood r1 V_TRUE)) (not (Kgood-rocks-in-range V_TRUE)))
	
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
	
	(when (Kgood r6 V_TRUE) 
		(and (Kgood-rocks-in-range V_TRUE) (not (Kgood-rocks-in-range V_FALSE))))
	
	(when (not (Kgood r6 V_FALSE)) (not (Kgood-rocks-in-range V_FALSE)))
	
	(when (KGivengood r6 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r6 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r6 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r6 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r6)) (not (good-rocks-in-range )))
	
	(when (Kgood r6 V_FALSE) 
		(and (Kgood-rocks-in-range V_FALSE) (not (Kgood-rocks-in-range V_TRUE))))
	
	(when (not (Kgood r6 V_TRUE)) (not (Kgood-rocks-in-range V_TRUE)))
	
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
	
	(when (Kgood r6 V_TRUE) 
		(and (Kgood-rocks-in-range V_TRUE) (not (Kgood-rocks-in-range V_FALSE))))
	
	(when (not (Kgood r6 V_FALSE)) (not (Kgood-rocks-in-range V_FALSE)))
	
	(when (KGivengood r6 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r6 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r6 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r6 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r6)) (not (good-rocks-in-range )))
	
	(when (Kgood r6 V_FALSE) 
		(and (Kgood-rocks-in-range V_FALSE) (not (Kgood-rocks-in-range V_TRUE))))
	
	(when (not (Kgood r6 V_TRUE)) (not (Kgood-rocks-in-range V_TRUE)))
	
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
	
	(when (Kgood r6 V_TRUE) 
		(and (Kgood-rocks-in-range V_TRUE) (not (Kgood-rocks-in-range V_FALSE))))
	
	(when (not (Kgood r6 V_FALSE)) (not (Kgood-rocks-in-range V_FALSE)))
	
	(when (KGivengood r6 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r6 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r6 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r6 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r6)) (not (good-rocks-in-range )))
	
	(when (Kgood r6 V_FALSE) 
		(and (Kgood-rocks-in-range V_FALSE) (not (Kgood-rocks-in-range V_TRUE))))
	
	(when (not (Kgood r6 V_TRUE)) (not (Kgood-rocks-in-range V_TRUE)))
	
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
	
	(when (Kgood r6 V_TRUE) 
		(and (Kgood-rocks-in-range V_TRUE) (not (Kgood-rocks-in-range V_FALSE))))
	
	(when (not (Kgood r6 V_FALSE)) (not (Kgood-rocks-in-range V_FALSE)))
	
	(when (KGivengood r6 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r6 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r6 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r6 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r6)) (not (good-rocks-in-range )))
	
	(when (Kgood r6 V_FALSE) 
		(and (Kgood-rocks-in-range V_FALSE) (not (Kgood-rocks-in-range V_TRUE))))
	
	(when (not (Kgood r6 V_TRUE)) (not (Kgood-rocks-in-range V_TRUE)))
	
	(when (KGivengood r6 tag0 V_FALSE) (KGivengood-rocks-in-range tag0 V_FALSE))
	
	(when (not (KGivengood r6 tag0 V_TRUE)) (not (KGivengood-rocks-in-range tag0 V_TRUE)))
	
	(when (KGivengood r6 tag1 V_FALSE) (KGivengood-rocks-in-range tag1 V_FALSE))
	
	(when (not (KGivengood r6 tag1 V_TRUE)) (not (KGivengood-rocks-in-range tag1 V_TRUE))))
)
(:action activate-sensor-at-p5-2-h1
:precondition 
(and (agent-at p5-2) (antena-height h1))
:effect 
(and 
	
	(when (good r7) (good-rocks-in-range ))
	
	(when (Kgood r7 V_TRUE) 
		(and (Kgood-rocks-in-range V_TRUE) (not (Kgood-rocks-in-range V_FALSE))))
	
	(when (not (Kgood r7 V_FALSE)) (not (Kgood-rocks-in-range V_FALSE)))
	
	(when (KGivengood r7 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r7 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r7 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r7 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r7)) (not (good-rocks-in-range )))
	
	(when (Kgood r7 V_FALSE) 
		(and (Kgood-rocks-in-range V_FALSE) (not (Kgood-rocks-in-range V_TRUE))))
	
	(when (not (Kgood r7 V_TRUE)) (not (Kgood-rocks-in-range V_TRUE)))
	
	(when (KGivengood r7 tag0 V_FALSE) (KGivengood-rocks-in-range tag0 V_FALSE))
	
	(when (not (KGivengood r7 tag0 V_TRUE)) (not (KGivengood-rocks-in-range tag0 V_TRUE)))
	
	(when (KGivengood r7 tag1 V_FALSE) (KGivengood-rocks-in-range tag1 V_FALSE))
	
	(when (not (KGivengood r7 tag1 V_TRUE)) (not (KGivengood-rocks-in-range tag1 V_TRUE))))
)
(:action activate-sensor-at-p5-3-h1
:precondition 
(and (agent-at p5-3) (antena-height h1))
:effect 
(and 
	
	(when (good r6) (good-rocks-in-range ))
	
	(when (Kgood r6 V_TRUE) 
		(and (Kgood-rocks-in-range V_TRUE) (not (Kgood-rocks-in-range V_FALSE))))
	
	(when (not (Kgood r6 V_FALSE)) (not (Kgood-rocks-in-range V_FALSE)))
	
	(when (KGivengood r6 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r6 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r6 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r6 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r6)) (not (good-rocks-in-range )))
	
	(when (Kgood r6 V_FALSE) 
		(and (Kgood-rocks-in-range V_FALSE) (not (Kgood-rocks-in-range V_TRUE))))
	
	(when (not (Kgood r6 V_TRUE)) (not (Kgood-rocks-in-range V_TRUE)))
	
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
	
	(when 
		(or (good r4) (good r7))(good-rocks-in-range ))
	
	(when 
		(or (Kgood r4 V_TRUE) (Kgood r7 V_TRUE))
		(and (Kgood-rocks-in-range V_TRUE) (not (Kgood-rocks-in-range V_FALSE))))
	
	(when 
		(and (not (Kgood r4 V_FALSE)) (not (Kgood r7 V_FALSE)))(not (Kgood-rocks-in-range V_FALSE)))
	
	(when 
		(or (KGivengood r4 tag0 V_TRUE) (KGivengood r7 tag0 V_TRUE))(KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when 
		(and (not (KGivengood r4 tag0 V_FALSE)) (not (KGivengood r7 tag0 V_FALSE)))(not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when 
		(or (KGivengood r4 tag1 V_TRUE) (KGivengood r7 tag1 V_TRUE))(KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when 
		(and (not (KGivengood r4 tag1 V_FALSE)) (not (KGivengood r7 tag1 V_FALSE)))(not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when 
		(and (not (good r4)) (not (good r7)))(not (good-rocks-in-range )))
	
	(when 
		(and (Kgood r4 V_FALSE) (Kgood r7 V_FALSE))
		(and (Kgood-rocks-in-range V_FALSE) (not (Kgood-rocks-in-range V_TRUE))))
	
	(when 
		(and (not (Kgood r4 V_TRUE)) (not (Kgood r7 V_TRUE)))(not (Kgood-rocks-in-range V_TRUE)))
	
	(when 
		(and (KGivengood r4 tag0 V_FALSE) (KGivengood r7 tag0 V_FALSE))(KGivengood-rocks-in-range tag0 V_FALSE))
	
	(when 
		(and (not (KGivengood r4 tag0 V_TRUE)) (not (KGivengood r7 tag0 V_TRUE)))(not (KGivengood-rocks-in-range tag0 V_TRUE)))
	
	(when 
		(and (KGivengood r4 tag1 V_FALSE) (KGivengood r7 tag1 V_FALSE))(KGivengood-rocks-in-range tag1 V_FALSE))
	
	(when 
		(and (not (KGivengood r4 tag1 V_TRUE)) (not (KGivengood r7 tag1 V_TRUE)))(not (KGivengood-rocks-in-range tag1 V_TRUE))))
)
(:action activate-sensor-at-p6-2-h0
:precondition 
(and (agent-at p6-2) (antena-height h0))
:effect 
(and 
	
	(when (good r7) (good-rocks-in-range ))
	
	(when (Kgood r7 V_TRUE) 
		(and (Kgood-rocks-in-range V_TRUE) (not (Kgood-rocks-in-range V_FALSE))))
	
	(when (not (Kgood r7 V_FALSE)) (not (Kgood-rocks-in-range V_FALSE)))
	
	(when (KGivengood r7 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r7 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r7 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r7 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r7)) (not (good-rocks-in-range )))
	
	(when (Kgood r7 V_FALSE) 
		(and (Kgood-rocks-in-range V_FALSE) (not (Kgood-rocks-in-range V_TRUE))))
	
	(when (not (Kgood r7 V_TRUE)) (not (Kgood-rocks-in-range V_TRUE)))
	
	(when (KGivengood r7 tag0 V_FALSE) (KGivengood-rocks-in-range tag0 V_FALSE))
	
	(when (not (KGivengood r7 tag0 V_TRUE)) (not (KGivengood-rocks-in-range tag0 V_TRUE)))
	
	(when (KGivengood r7 tag1 V_FALSE) (KGivengood-rocks-in-range tag1 V_FALSE))
	
	(when (not (KGivengood r7 tag1 V_TRUE)) (not (KGivengood-rocks-in-range tag1 V_TRUE))))
)
(:action activate-sensor-at-p6-2-h1
:precondition 
(and (agent-at p6-2) (antena-height h1))
:effect 
(and 
	
	(when (good r7) (good-rocks-in-range ))
	
	(when (Kgood r7 V_TRUE) 
		(and (Kgood-rocks-in-range V_TRUE) (not (Kgood-rocks-in-range V_FALSE))))
	
	(when (not (Kgood r7 V_FALSE)) (not (Kgood-rocks-in-range V_FALSE)))
	
	(when (KGivengood r7 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r7 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r7 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r7 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r7)) (not (good-rocks-in-range )))
	
	(when (Kgood r7 V_FALSE) 
		(and (Kgood-rocks-in-range V_FALSE) (not (Kgood-rocks-in-range V_TRUE))))
	
	(when (not (Kgood r7 V_TRUE)) (not (Kgood-rocks-in-range V_TRUE)))
	
	(when (KGivengood r7 tag0 V_FALSE) (KGivengood-rocks-in-range tag0 V_FALSE))
	
	(when (not (KGivengood r7 tag0 V_TRUE)) (not (KGivengood-rocks-in-range tag0 V_TRUE)))
	
	(when (KGivengood r7 tag1 V_FALSE) (KGivengood-rocks-in-range tag1 V_FALSE))
	
	(when (not (KGivengood r7 tag1 V_TRUE)) (not (KGivengood-rocks-in-range tag1 V_TRUE))))
)
(:action activate-sensor-at-p6-3-h1
:precondition 
(and (agent-at p6-3) (antena-height h1))
:effect 
(and 
	
	(when (good r7) (good-rocks-in-range ))
	
	(when (Kgood r7 V_TRUE) 
		(and (Kgood-rocks-in-range V_TRUE) (not (Kgood-rocks-in-range V_FALSE))))
	
	(when (not (Kgood r7 V_FALSE)) (not (Kgood-rocks-in-range V_FALSE)))
	
	(when (KGivengood r7 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r7 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r7 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r7 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r7)) (not (good-rocks-in-range )))
	
	(when (Kgood r7 V_FALSE) 
		(and (Kgood-rocks-in-range V_FALSE) (not (Kgood-rocks-in-range V_TRUE))))
	
	(when (not (Kgood r7 V_TRUE)) (not (Kgood-rocks-in-range V_TRUE)))
	
	(when (KGivengood r7 tag0 V_FALSE) (KGivengood-rocks-in-range tag0 V_FALSE))
	
	(when (not (KGivengood r7 tag0 V_TRUE)) (not (KGivengood-rocks-in-range tag0 V_TRUE)))
	
	(when (KGivengood r7 tag1 V_FALSE) (KGivengood-rocks-in-range tag1 V_FALSE))
	
	(when (not (KGivengood r7 tag1 V_TRUE)) (not (KGivengood-rocks-in-range tag1 V_TRUE))))
)
(:action activate-sensor-at-p6-4-h1
:precondition 
(and (agent-at p6-4) (antena-height h1))
:effect 
(and 
	
	(when (good r0) (good-rocks-in-range ))
	
	(when (Kgood r0 V_TRUE) 
		(and (Kgood-rocks-in-range V_TRUE) (not (Kgood-rocks-in-range V_FALSE))))
	
	(when (not (Kgood r0 V_FALSE)) (not (Kgood-rocks-in-range V_FALSE)))
	
	(when (KGivengood r0 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r0 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r0 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r0 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r0)) (not (good-rocks-in-range )))
	
	(when (Kgood r0 V_FALSE) 
		(and (Kgood-rocks-in-range V_FALSE) (not (Kgood-rocks-in-range V_TRUE))))
	
	(when (not (Kgood r0 V_TRUE)) (not (Kgood-rocks-in-range V_TRUE)))
	
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
	
	(when (Kgood r4 V_TRUE) 
		(and (Kgood-rocks-in-range V_TRUE) (not (Kgood-rocks-in-range V_FALSE))))
	
	(when (not (Kgood r4 V_FALSE)) (not (Kgood-rocks-in-range V_FALSE)))
	
	(when (KGivengood r4 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r4 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r4 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r4 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r4)) (not (good-rocks-in-range )))
	
	(when (Kgood r4 V_FALSE) 
		(and (Kgood-rocks-in-range V_FALSE) (not (Kgood-rocks-in-range V_TRUE))))
	
	(when (not (Kgood r4 V_TRUE)) (not (Kgood-rocks-in-range V_TRUE)))
	
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
	
	(when (Kgood r4 V_TRUE) 
		(and (Kgood-rocks-in-range V_TRUE) (not (Kgood-rocks-in-range V_FALSE))))
	
	(when (not (Kgood r4 V_FALSE)) (not (Kgood-rocks-in-range V_FALSE)))
	
	(when (KGivengood r4 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r4 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r4 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r4 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r4)) (not (good-rocks-in-range )))
	
	(when (Kgood r4 V_FALSE) 
		(and (Kgood-rocks-in-range V_FALSE) (not (Kgood-rocks-in-range V_TRUE))))
	
	(when (not (Kgood r4 V_TRUE)) (not (Kgood-rocks-in-range V_TRUE)))
	
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
	
	(when 
		(or (good r4) (good r7))(good-rocks-in-range ))
	
	(when 
		(or (Kgood r4 V_TRUE) (Kgood r7 V_TRUE))
		(and (Kgood-rocks-in-range V_TRUE) (not (Kgood-rocks-in-range V_FALSE))))
	
	(when 
		(and (not (Kgood r4 V_FALSE)) (not (Kgood r7 V_FALSE)))(not (Kgood-rocks-in-range V_FALSE)))
	
	(when 
		(or (KGivengood r4 tag0 V_TRUE) (KGivengood r7 tag0 V_TRUE))(KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when 
		(and (not (KGivengood r4 tag0 V_FALSE)) (not (KGivengood r7 tag0 V_FALSE)))(not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when 
		(or (KGivengood r4 tag1 V_TRUE) (KGivengood r7 tag1 V_TRUE))(KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when 
		(and (not (KGivengood r4 tag1 V_FALSE)) (not (KGivengood r7 tag1 V_FALSE)))(not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when 
		(and (not (good r4)) (not (good r7)))(not (good-rocks-in-range )))
	
	(when 
		(and (Kgood r4 V_FALSE) (Kgood r7 V_FALSE))
		(and (Kgood-rocks-in-range V_FALSE) (not (Kgood-rocks-in-range V_TRUE))))
	
	(when 
		(and (not (Kgood r4 V_TRUE)) (not (Kgood r7 V_TRUE)))(not (Kgood-rocks-in-range V_TRUE)))
	
	(when 
		(and (KGivengood r4 tag0 V_FALSE) (KGivengood r7 tag0 V_FALSE))(KGivengood-rocks-in-range tag0 V_FALSE))
	
	(when 
		(and (not (KGivengood r4 tag0 V_TRUE)) (not (KGivengood r7 tag0 V_TRUE)))(not (KGivengood-rocks-in-range tag0 V_TRUE)))
	
	(when 
		(and (KGivengood r4 tag1 V_FALSE) (KGivengood r7 tag1 V_FALSE))(KGivengood-rocks-in-range tag1 V_FALSE))
	
	(when 
		(and (not (KGivengood r4 tag1 V_TRUE)) (not (KGivengood r7 tag1 V_TRUE)))(not (KGivengood-rocks-in-range tag1 V_TRUE))))
)
(:action activate-sensor-at-p7-3-h1
:precondition 
(and (agent-at p7-3) (antena-height h1))
:effect 
(and 
	
	(when (good r0) (good-rocks-in-range ))
	
	(when (Kgood r0 V_TRUE) 
		(and (Kgood-rocks-in-range V_TRUE) (not (Kgood-rocks-in-range V_FALSE))))
	
	(when (not (Kgood r0 V_FALSE)) (not (Kgood-rocks-in-range V_FALSE)))
	
	(when (KGivengood r0 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r0 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r0 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r0 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r0)) (not (good-rocks-in-range )))
	
	(when (Kgood r0 V_FALSE) 
		(and (Kgood-rocks-in-range V_FALSE) (not (Kgood-rocks-in-range V_TRUE))))
	
	(when (not (Kgood r0 V_TRUE)) (not (Kgood-rocks-in-range V_TRUE)))
	
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
	
	(when (Kgood r0 V_TRUE) 
		(and (Kgood-rocks-in-range V_TRUE) (not (Kgood-rocks-in-range V_FALSE))))
	
	(when (not (Kgood r0 V_FALSE)) (not (Kgood-rocks-in-range V_FALSE)))
	
	(when (KGivengood r0 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r0 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r0 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r0 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r0)) (not (good-rocks-in-range )))
	
	(when (Kgood r0 V_FALSE) 
		(and (Kgood-rocks-in-range V_FALSE) (not (Kgood-rocks-in-range V_TRUE))))
	
	(when (not (Kgood r0 V_TRUE)) (not (Kgood-rocks-in-range V_TRUE)))
	
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
	
	(when (Kgood r0 V_TRUE) 
		(and (Kgood-rocks-in-range V_TRUE) (not (Kgood-rocks-in-range V_FALSE))))
	
	(when (not (Kgood r0 V_FALSE)) (not (Kgood-rocks-in-range V_FALSE)))
	
	(when (KGivengood r0 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r0 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r0 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r0 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r0)) (not (good-rocks-in-range )))
	
	(when (Kgood r0 V_FALSE) 
		(and (Kgood-rocks-in-range V_FALSE) (not (Kgood-rocks-in-range V_TRUE))))
	
	(when (not (Kgood r0 V_TRUE)) (not (Kgood-rocks-in-range V_TRUE)))
	
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
	
	(when (Kgood r0 V_TRUE) 
		(and (Kgood-rocks-in-range V_TRUE) (not (Kgood-rocks-in-range V_FALSE))))
	
	(when (not (Kgood r0 V_FALSE)) (not (Kgood-rocks-in-range V_FALSE)))
	
	(when (KGivengood r0 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r0 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r0 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r0 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r0)) (not (good-rocks-in-range )))
	
	(when (Kgood r0 V_FALSE) 
		(and (Kgood-rocks-in-range V_FALSE) (not (Kgood-rocks-in-range V_TRUE))))
	
	(when (not (Kgood r0 V_TRUE)) (not (Kgood-rocks-in-range V_TRUE)))
	
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
	
	(when (Kgood r4 V_TRUE) 
		(and (Kgood-rocks-in-range V_TRUE) (not (Kgood-rocks-in-range V_FALSE))))
	
	(when (not (Kgood r4 V_FALSE)) (not (Kgood-rocks-in-range V_FALSE)))
	
	(when (KGivengood r4 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r4 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r4 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r4 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r4)) (not (good-rocks-in-range )))
	
	(when (Kgood r4 V_FALSE) 
		(and (Kgood-rocks-in-range V_FALSE) (not (Kgood-rocks-in-range V_TRUE))))
	
	(when (not (Kgood r4 V_TRUE)) (not (Kgood-rocks-in-range V_TRUE)))
	
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
	
	(when (Kgood r0 V_TRUE) 
		(and (Kgood-rocks-in-range V_TRUE) (not (Kgood-rocks-in-range V_FALSE))))
	
	(when (not (Kgood r0 V_FALSE)) (not (Kgood-rocks-in-range V_FALSE)))
	
	(when (KGivengood r0 tag0 V_TRUE) (KGivengood-rocks-in-range tag0 V_TRUE))
	
	(when (not (KGivengood r0 tag0 V_FALSE)) (not (KGivengood-rocks-in-range tag0 V_FALSE)))
	
	(when (KGivengood r0 tag1 V_TRUE) (KGivengood-rocks-in-range tag1 V_TRUE))
	
	(when (not (KGivengood r0 tag1 V_FALSE)) (not (KGivengood-rocks-in-range tag1 V_FALSE)))
	
	(when (not (good r0)) (not (good-rocks-in-range )))
	
	(when (Kgood r0 V_FALSE) 
		(and (Kgood-rocks-in-range V_FALSE) (not (Kgood-rocks-in-range V_TRUE))))
	
	(when (not (Kgood r0 V_TRUE)) (not (Kgood-rocks-in-range V_TRUE)))
	
	(when (KGivengood r0 tag0 V_FALSE) (KGivengood-rocks-in-range tag0 V_FALSE))
	
	(when (not (KGivengood r0 tag0 V_TRUE)) (not (KGivengood-rocks-in-range tag0 V_TRUE)))
	
	(when (KGivengood r0 tag1 V_FALSE) (KGivengood-rocks-in-range tag1 V_FALSE))
	
	(when (not (KGivengood r0 tag1 V_TRUE)) (not (KGivengood-rocks-in-range tag1 V_TRUE))))
)
(:action observe-sensor-T
:precondition 
(and (good-rocks-in-range ))
:effect (Kgood-rocks-in-range V_TRUE)
)
(:action observe-sensor-F
:precondition 
(and (not (good-rocks-in-range )))
:effect (Kgood-rocks-in-range V_FALSE)
)
(:action Merge-good
:parameters ( ?r - ROCK ?V_PARAM - VALUE_TYPE)
:precondition 
(and (not (Kgood ?r ?V_PARAM)) 
	(or (KGivengood ?r tag0 ?V_PARAM) (KNot tag0))
	(or (KGivengood ?r tag1 ?V_PARAM) (KNot tag1)))
:effect 
(and (Kgood ?r ?V_PARAM))
)

(:action RefuteT-good
:parameters ( ?r - ROCK ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivengood ?r ?TAG_PARAM V_TRUE) (Kgood ?r V_FALSE) (not (good ?r)))
:effect 
(and (KNot ?TAG_PARAM))
)

(:action RefuteF-good
:parameters ( ?r - ROCK ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivengood ?r ?TAG_PARAM V_FALSE) (Kgood ?r V_TRUE) (good ?r))
:effect 
(and (KNot ?TAG_PARAM))
)

(:action Merge-good-rocks-in-range
:parameters ( ?V_PARAM - VALUE_TYPE)
:precondition 
(and (not (Kgood-rocks-in-range ?V_PARAM)) 
	(or (KGivengood-rocks-in-range tag0 ?V_PARAM) (KNot tag0))
	(or (KGivengood-rocks-in-range tag1 ?V_PARAM) (KNot tag1)))
:effect 
(and (Kgood-rocks-in-range ?V_PARAM))
)

(:action RefuteT-good-rocks-in-range
:parameters ( ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivengood-rocks-in-range ?TAG_PARAM V_TRUE) (Kgood-rocks-in-range V_FALSE) (not (good-rocks-in-range )))
:effect 
(and (KNot ?TAG_PARAM))
)

(:action RefuteF-good-rocks-in-range
:parameters ( ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivengood-rocks-in-range ?TAG_PARAM V_FALSE) (Kgood-rocks-in-range V_TRUE) (good-rocks-in-range ))
:effect 
(and (KNot ?TAG_PARAM))
)

)
