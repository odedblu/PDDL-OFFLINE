(define (domain KRockSample8-9)
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
 r8 - ROCK
 h0 - HEIGHT
 h1 - HEIGHT
 tag0 - TAG_TYPE ; (good r1)
 tag1 - TAG_TYPE ; (not (good r1))
 V_TRUE - VALUE_TYPE
 V_FALSE - VALUE_TYPE
)

(:predicates
(NotInAction)
(rock-at ?r - ROCK ?p - LOCATION)
(Givenagent-at ?p - LOCATION ?TAG_PARAM - TAG_TYPE)
(adj ?p1 - LOCATION ?p2 - LOCATION)
(Givengood ?r - ROCK ?TAG_PARAM - TAG_TYPE)
(Givenantena-height ?h - HEIGHT ?TAG_PARAM - TAG_TYPE)
(Givengood-rocks-in-range ?TAG_PARAM - TAG_TYPE)
(KNot ?TAG_PARAM1 - TAG_TYPE ?TAG_PARAM2 - TAG_TYPE)
)

(:action move-KW-tag0
:parameters ( ?pSource - LOCATION ?pTarget - LOCATION)
:precondition 
(and (adj ?pSource ?pTarget) (not (KNot tag0 tag0)) (Givenagent-at ?pSource tag0) (Givenantena-height h0 tag0) 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at ?pSource tag1) (Givenantena-height h0 tag1))(KNot tag0 tag1)))
:effect 
(and (Givenagent-at ?pTarget tag0) (not (Givenagent-at ?pSource tag0)) (not (Givengood-rocks-in-range tag0)) 
	
	(when (not (KNot tag0 tag1)) 
		(and (Givenagent-at ?pTarget tag1) (not (Givenagent-at ?pSource tag1)) (not (Givengood-rocks-in-range tag1)))))
)
(:action move-KW-tag1
:parameters ( ?pSource - LOCATION ?pTarget - LOCATION)
:precondition 
(and (adj ?pSource ?pTarget) 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at ?pSource tag0) (Givenantena-height h0 tag0))(KNot tag0 tag1))(not (KNot tag1 tag1)) (Givenagent-at ?pSource tag1) (Givenantena-height h0 tag1))
:effect 
(and 
	
	(when (not (KNot tag0 tag1)) 
		(and (Givenagent-at ?pTarget tag0) (not (Givenagent-at ?pSource tag0)) (not (Givengood-rocks-in-range tag0))))(Givenagent-at ?pTarget tag1) (not (Givenagent-at ?pSource tag1)) (not (Givengood-rocks-in-range tag1)))
)
(:action sample-KW-tag0
:parameters ( ?r - ROCK ?p - LOCATION)
:precondition 
(and (rock-at ?r ?p) (not (KNot tag0 tag0)) (Givenagent-at ?p tag0) (Givengood ?r tag0) 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at ?p tag1) (Givengood ?r tag1))(KNot tag0 tag1)))
:effect 
(and (not (Givengood ?r tag0)) 
	
	(when (not (KNot tag0 tag1)) (not (Givengood ?r tag1))))
)
(:action sample-KW-tag1
:parameters ( ?r - ROCK ?p - LOCATION)
:precondition 
(and (rock-at ?r ?p) 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at ?p tag0) (Givengood ?r tag0))(KNot tag0 tag1))(not (KNot tag1 tag1)) (Givenagent-at ?p tag1) (Givengood ?r tag1))
:effect 
(and 
	
	(when (not (KNot tag0 tag1)) (not (Givengood ?r tag0)))(not (Givengood ?r tag1)))
)
(:action raise-antena-KW-tag0
:parameters ()
:effect 
(and (Givenantena-height h1 tag0) (not (Givenantena-height h0 tag0)) 
	
	(when (not (KNot tag0 tag1)) 
		(and (Givenantena-height h1 tag1) (not (Givenantena-height h0 tag1)))))
)
(:action raise-antena-KW-tag1
:parameters ()
:effect 
(and 
	
	(when (not (KNot tag0 tag1)) 
		(and (Givenantena-height h1 tag0) (not (Givenantena-height h0 tag0))))(Givenantena-height h1 tag1) (not (Givenantena-height h0 tag1)))
)
(:action lower-antena-KW-tag0
:parameters ()
:effect 
(and (not (Givenantena-height h1 tag0)) (Givenantena-height h0 tag0) 
	
	(when (not (KNot tag0 tag1)) 
		(and (not (Givenantena-height h1 tag1)) (Givenantena-height h0 tag1))))
)
(:action lower-antena-KW-tag1
:parameters ()
:effect 
(and 
	
	(when (not (KNot tag0 tag1)) 
		(and (not (Givenantena-height h1 tag0)) (Givenantena-height h0 tag0)))(not (Givenantena-height h1 tag1)) (Givenantena-height h0 tag1))
)
(:action activate-sensor-at-p1-1-h1-KW-tag0
:parameters ()
:precondition 
(and (not (KNot tag0 tag0)) (Givenagent-at p1-1 tag0) (Givenantena-height h1 tag0) 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p1-1 tag1) (Givenantena-height h1 tag1))(KNot tag0 tag1)))
:effect 
(and 
	
	(when (Givengood r3 tag0) (Givengood-rocks-in-range tag0))
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r3 tag1))(Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r3 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r3 tag1)))(not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p1-1-h1-KW-tag1
:parameters ()
:precondition 
(and 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p1-1 tag0) (Givenantena-height h1 tag0))(KNot tag0 tag1))(not (KNot tag1 tag1)) (Givenagent-at p1-1 tag1) (Givenantena-height h1 tag1))
:effect 
(and 
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r3 tag0))(Givengood-rocks-in-range tag0))
	
	(when (Givengood r3 tag1) (Givengood-rocks-in-range tag1))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r3 tag0)))(not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r3 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p1-2-h1-KW-tag0
:parameters ()
:precondition 
(and (not (KNot tag0 tag0)) (Givenagent-at p1-2 tag0) (Givenantena-height h1 tag0) 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p1-2 tag1) (Givenantena-height h1 tag1))(KNot tag0 tag1)))
:effect 
(and 
	
	(when (Givengood r2 tag0) (Givengood-rocks-in-range tag0))
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r2 tag1))(Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r2 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r2 tag1)))(not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p1-2-h1-KW-tag1
:parameters ()
:precondition 
(and 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p1-2 tag0) (Givenantena-height h1 tag0))(KNot tag0 tag1))(not (KNot tag1 tag1)) (Givenagent-at p1-2 tag1) (Givenantena-height h1 tag1))
:effect 
(and 
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r2 tag0))(Givengood-rocks-in-range tag0))
	
	(when (Givengood r2 tag1) (Givengood-rocks-in-range tag1))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r2 tag0)))(not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r2 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p1-3-h0-KW-tag0
:parameters ()
:precondition 
(and (not (KNot tag0 tag0)) (Givenagent-at p1-3 tag0) (Givenantena-height h0 tag0) 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p1-3 tag1) (Givenantena-height h0 tag1))(KNot tag0 tag1)))
:effect 
(and 
	
	(when (Givengood r2 tag0) (Givengood-rocks-in-range tag0))
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r2 tag1))(Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r2 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r2 tag1)))(not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p1-3-h0-KW-tag1
:parameters ()
:precondition 
(and 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p1-3 tag0) (Givenantena-height h0 tag0))(KNot tag0 tag1))(not (KNot tag1 tag1)) (Givenagent-at p1-3 tag1) (Givenantena-height h0 tag1))
:effect 
(and 
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r2 tag0))(Givengood-rocks-in-range tag0))
	
	(when (Givengood r2 tag1) (Givengood-rocks-in-range tag1))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r2 tag0)))(not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r2 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p1-3-h1-KW-tag0
:parameters ()
:precondition 
(and (not (KNot tag0 tag0)) (Givenagent-at p1-3 tag0) (Givenantena-height h1 tag0) 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p1-3 tag1) (Givenantena-height h1 tag1))(KNot tag0 tag1)))
:effect 
(and 
	
	(when (Givengood r2 tag0) (Givengood-rocks-in-range tag0))
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r2 tag1))(Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r2 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r2 tag1)))(not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p1-3-h1-KW-tag1
:parameters ()
:precondition 
(and 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p1-3 tag0) (Givenantena-height h1 tag0))(KNot tag0 tag1))(not (KNot tag1 tag1)) (Givenagent-at p1-3 tag1) (Givenantena-height h1 tag1))
:effect 
(and 
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r2 tag0))(Givengood-rocks-in-range tag0))
	
	(when (Givengood r2 tag1) (Givengood-rocks-in-range tag1))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r2 tag0)))(not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r2 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p1-4-h1-KW-tag0
:parameters ()
:precondition 
(and (not (KNot tag0 tag0)) (Givenagent-at p1-4 tag0) (Givenantena-height h1 tag0) 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p1-4 tag1) (Givenantena-height h1 tag1))(KNot tag0 tag1)))
:effect 
(and 
	
	(when 
		(and (Givengood r2 tag0) (Givengood r5 tag0))(Givengood-rocks-in-range tag0))
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r2 tag1) (Givengood r5 tag1))(Givengood-rocks-in-range tag1))
	
	(when 
		(and (not (Givengood r2 tag0)) (not (Givengood r5 tag0)))(not (Givengood-rocks-in-range tag0)))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r2 tag1)) (not (Givengood r5 tag1)))(not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p1-4-h1-KW-tag1
:parameters ()
:precondition 
(and 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p1-4 tag0) (Givenantena-height h1 tag0))(KNot tag0 tag1))(not (KNot tag1 tag1)) (Givenagent-at p1-4 tag1) (Givenantena-height h1 tag1))
:effect 
(and 
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r2 tag0) (Givengood r5 tag0))(Givengood-rocks-in-range tag0))
	
	(when 
		(and (Givengood r2 tag1) (Givengood r5 tag1))(Givengood-rocks-in-range tag1))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r2 tag0)) (not (Givengood r5 tag0)))(not (Givengood-rocks-in-range tag0)))
	
	(when 
		(and (not (Givengood r2 tag1)) (not (Givengood r5 tag1)))(not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p1-5-h0-KW-tag0
:parameters ()
:precondition 
(and (not (KNot tag0 tag0)) (Givenagent-at p1-5 tag0) (Givenantena-height h0 tag0) 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p1-5 tag1) (Givenantena-height h0 tag1))(KNot tag0 tag1)))
:effect 
(and 
	
	(when (Givengood r5 tag0) (Givengood-rocks-in-range tag0))
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r5 tag1))(Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r5 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r5 tag1)))(not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p1-5-h0-KW-tag1
:parameters ()
:precondition 
(and 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p1-5 tag0) (Givenantena-height h0 tag0))(KNot tag0 tag1))(not (KNot tag1 tag1)) (Givenagent-at p1-5 tag1) (Givenantena-height h0 tag1))
:effect 
(and 
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r5 tag0))(Givengood-rocks-in-range tag0))
	
	(when (Givengood r5 tag1) (Givengood-rocks-in-range tag1))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r5 tag0)))(not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r5 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p1-5-h1-KW-tag0
:parameters ()
:precondition 
(and (not (KNot tag0 tag0)) (Givenagent-at p1-5 tag0) (Givenantena-height h1 tag0) 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p1-5 tag1) (Givenantena-height h1 tag1))(KNot tag0 tag1)))
:effect 
(and 
	
	(when (Givengood r5 tag0) (Givengood-rocks-in-range tag0))
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r5 tag1))(Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r5 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r5 tag1)))(not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p1-5-h1-KW-tag1
:parameters ()
:precondition 
(and 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p1-5 tag0) (Givenantena-height h1 tag0))(KNot tag0 tag1))(not (KNot tag1 tag1)) (Givenagent-at p1-5 tag1) (Givenantena-height h1 tag1))
:effect 
(and 
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r5 tag0))(Givengood-rocks-in-range tag0))
	
	(when (Givengood r5 tag1) (Givengood-rocks-in-range tag1))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r5 tag0)))(not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r5 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p1-6-h1-KW-tag0
:parameters ()
:precondition 
(and (not (KNot tag0 tag0)) (Givenagent-at p1-6 tag0) (Givenantena-height h1 tag0) 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p1-6 tag1) (Givenantena-height h1 tag1))(KNot tag0 tag1)))
:effect 
(and 
	
	(when (Givengood r5 tag0) (Givengood-rocks-in-range tag0))
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r5 tag1))(Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r5 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r5 tag1)))(not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p1-6-h1-KW-tag1
:parameters ()
:precondition 
(and 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p1-6 tag0) (Givenantena-height h1 tag0))(KNot tag0 tag1))(not (KNot tag1 tag1)) (Givenagent-at p1-6 tag1) (Givenantena-height h1 tag1))
:effect 
(and 
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r5 tag0))(Givengood-rocks-in-range tag0))
	
	(when (Givengood r5 tag1) (Givengood-rocks-in-range tag1))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r5 tag0)))(not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r5 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p1-8-h1-KW-tag0
:parameters ()
:precondition 
(and (not (KNot tag0 tag0)) (Givenagent-at p1-8 tag0) (Givenantena-height h1 tag0) 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p1-8 tag1) (Givenantena-height h1 tag1))(KNot tag0 tag1)))
:effect 
(and 
	
	(when (Givengood r1 tag0) (Givengood-rocks-in-range tag0))
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r1 tag1))(Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r1 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r1 tag1)))(not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p1-8-h1-KW-tag1
:parameters ()
:precondition 
(and 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p1-8 tag0) (Givenantena-height h1 tag0))(KNot tag0 tag1))(not (KNot tag1 tag1)) (Givenagent-at p1-8 tag1) (Givenantena-height h1 tag1))
:effect 
(and 
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r1 tag0))(Givengood-rocks-in-range tag0))
	
	(when (Givengood r1 tag1) (Givengood-rocks-in-range tag1))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r1 tag0)))(not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r1 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p2-1-h0-KW-tag0
:parameters ()
:precondition 
(and (not (KNot tag0 tag0)) (Givenagent-at p2-1 tag0) (Givenantena-height h0 tag0) 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p2-1 tag1) (Givenantena-height h0 tag1))(KNot tag0 tag1)))
:effect 
(and 
	
	(when (Givengood r3 tag0) (Givengood-rocks-in-range tag0))
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r3 tag1))(Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r3 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r3 tag1)))(not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p2-1-h0-KW-tag1
:parameters ()
:precondition 
(and 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p2-1 tag0) (Givenantena-height h0 tag0))(KNot tag0 tag1))(not (KNot tag1 tag1)) (Givenagent-at p2-1 tag1) (Givenantena-height h0 tag1))
:effect 
(and 
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r3 tag0))(Givengood-rocks-in-range tag0))
	
	(when (Givengood r3 tag1) (Givengood-rocks-in-range tag1))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r3 tag0)))(not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r3 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p2-1-h1-KW-tag0
:parameters ()
:precondition 
(and (not (KNot tag0 tag0)) (Givenagent-at p2-1 tag0) (Givenantena-height h1 tag0) 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p2-1 tag1) (Givenantena-height h1 tag1))(KNot tag0 tag1)))
:effect 
(and 
	
	(when (Givengood r3 tag0) (Givengood-rocks-in-range tag0))
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r3 tag1))(Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r3 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r3 tag1)))(not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p2-1-h1-KW-tag1
:parameters ()
:precondition 
(and 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p2-1 tag0) (Givenantena-height h1 tag0))(KNot tag0 tag1))(not (KNot tag1 tag1)) (Givenagent-at p2-1 tag1) (Givenantena-height h1 tag1))
:effect 
(and 
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r3 tag0))(Givengood-rocks-in-range tag0))
	
	(when (Givengood r3 tag1) (Givengood-rocks-in-range tag1))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r3 tag0)))(not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r3 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p2-2-h1-KW-tag0
:parameters ()
:precondition 
(and (not (KNot tag0 tag0)) (Givenagent-at p2-2 tag0) (Givenantena-height h1 tag0) 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p2-2 tag1) (Givenantena-height h1 tag1))(KNot tag0 tag1)))
:effect 
(and 
	
	(when (Givengood r3 tag0) (Givengood-rocks-in-range tag0))
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r3 tag1))(Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r3 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r3 tag1)))(not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p2-2-h1-KW-tag1
:parameters ()
:precondition 
(and 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p2-2 tag0) (Givenantena-height h1 tag0))(KNot tag0 tag1))(not (KNot tag1 tag1)) (Givenagent-at p2-2 tag1) (Givenantena-height h1 tag1))
:effect 
(and 
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r3 tag0))(Givengood-rocks-in-range tag0))
	
	(when (Givengood r3 tag1) (Givengood-rocks-in-range tag1))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r3 tag0)))(not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r3 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p2-3-h1-KW-tag0
:parameters ()
:precondition 
(and (not (KNot tag0 tag0)) (Givenagent-at p2-3 tag0) (Givenantena-height h1 tag0) 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p2-3 tag1) (Givenantena-height h1 tag1))(KNot tag0 tag1)))
:effect 
(and 
	
	(when (Givengood r2 tag0) (Givengood-rocks-in-range tag0))
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r2 tag1))(Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r2 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r2 tag1)))(not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p2-3-h1-KW-tag1
:parameters ()
:precondition 
(and 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p2-3 tag0) (Givenantena-height h1 tag0))(KNot tag0 tag1))(not (KNot tag1 tag1)) (Givenagent-at p2-3 tag1) (Givenantena-height h1 tag1))
:effect 
(and 
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r2 tag0))(Givengood-rocks-in-range tag0))
	
	(when (Givengood r2 tag1) (Givengood-rocks-in-range tag1))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r2 tag0)))(not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r2 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p2-5-h1-KW-tag0
:parameters ()
:precondition 
(and (not (KNot tag0 tag0)) (Givenagent-at p2-5 tag0) (Givenantena-height h1 tag0) 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p2-5 tag1) (Givenantena-height h1 tag1))(KNot tag0 tag1)))
:effect 
(and 
	
	(when (Givengood r5 tag0) (Givengood-rocks-in-range tag0))
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r5 tag1))(Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r5 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r5 tag1)))(not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p2-5-h1-KW-tag1
:parameters ()
:precondition 
(and 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p2-5 tag0) (Givenantena-height h1 tag0))(KNot tag0 tag1))(not (KNot tag1 tag1)) (Givenagent-at p2-5 tag1) (Givenantena-height h1 tag1))
:effect 
(and 
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r5 tag0))(Givengood-rocks-in-range tag0))
	
	(when (Givengood r5 tag1) (Givengood-rocks-in-range tag1))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r5 tag0)))(not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r5 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p2-7-h1-KW-tag0
:parameters ()
:precondition 
(and (not (KNot tag0 tag0)) (Givenagent-at p2-7 tag0) (Givenantena-height h1 tag0) 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p2-7 tag1) (Givenantena-height h1 tag1))(KNot tag0 tag1)))
:effect 
(and 
	
	(when (Givengood r1 tag0) (Givengood-rocks-in-range tag0))
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r1 tag1))(Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r1 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r1 tag1)))(not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p2-7-h1-KW-tag1
:parameters ()
:precondition 
(and 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p2-7 tag0) (Givenantena-height h1 tag0))(KNot tag0 tag1))(not (KNot tag1 tag1)) (Givenagent-at p2-7 tag1) (Givenantena-height h1 tag1))
:effect 
(and 
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r1 tag0))(Givengood-rocks-in-range tag0))
	
	(when (Givengood r1 tag1) (Givengood-rocks-in-range tag1))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r1 tag0)))(not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r1 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p2-8-h0-KW-tag0
:parameters ()
:precondition 
(and (not (KNot tag0 tag0)) (Givenagent-at p2-8 tag0) (Givenantena-height h0 tag0) 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p2-8 tag1) (Givenantena-height h0 tag1))(KNot tag0 tag1)))
:effect 
(and 
	
	(when (Givengood r1 tag0) (Givengood-rocks-in-range tag0))
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r1 tag1))(Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r1 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r1 tag1)))(not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p2-8-h0-KW-tag1
:parameters ()
:precondition 
(and 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p2-8 tag0) (Givenantena-height h0 tag0))(KNot tag0 tag1))(not (KNot tag1 tag1)) (Givenagent-at p2-8 tag1) (Givenantena-height h0 tag1))
:effect 
(and 
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r1 tag0))(Givengood-rocks-in-range tag0))
	
	(when (Givengood r1 tag1) (Givengood-rocks-in-range tag1))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r1 tag0)))(not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r1 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p2-8-h1-KW-tag0
:parameters ()
:precondition 
(and (not (KNot tag0 tag0)) (Givenagent-at p2-8 tag0) (Givenantena-height h1 tag0) 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p2-8 tag1) (Givenantena-height h1 tag1))(KNot tag0 tag1)))
:effect 
(and 
	
	(when (Givengood r1 tag0) (Givengood-rocks-in-range tag0))
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r1 tag1))(Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r1 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r1 tag1)))(not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p2-8-h1-KW-tag1
:parameters ()
:precondition 
(and 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p2-8 tag0) (Givenantena-height h1 tag0))(KNot tag0 tag1))(not (KNot tag1 tag1)) (Givenagent-at p2-8 tag1) (Givenantena-height h1 tag1))
:effect 
(and 
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r1 tag0))(Givengood-rocks-in-range tag0))
	
	(when (Givengood r1 tag1) (Givengood-rocks-in-range tag1))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r1 tag0)))(not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r1 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p3-1-h1-KW-tag0
:parameters ()
:precondition 
(and (not (KNot tag0 tag0)) (Givenagent-at p3-1 tag0) (Givenantena-height h1 tag0) 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p3-1 tag1) (Givenantena-height h1 tag1))(KNot tag0 tag1)))
:effect 
(and 
	
	(when (Givengood r3 tag0) (Givengood-rocks-in-range tag0))
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r3 tag1))(Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r3 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r3 tag1)))(not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p3-1-h1-KW-tag1
:parameters ()
:precondition 
(and 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p3-1 tag0) (Givenantena-height h1 tag0))(KNot tag0 tag1))(not (KNot tag1 tag1)) (Givenagent-at p3-1 tag1) (Givenantena-height h1 tag1))
:effect 
(and 
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r3 tag0))(Givengood-rocks-in-range tag0))
	
	(when (Givengood r3 tag1) (Givengood-rocks-in-range tag1))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r3 tag0)))(not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r3 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p3-3-h1-KW-tag0
:parameters ()
:precondition 
(and (not (KNot tag0 tag0)) (Givenagent-at p3-3 tag0) (Givenantena-height h1 tag0) 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p3-3 tag1) (Givenantena-height h1 tag1))(KNot tag0 tag1)))
:effect 
(and 
	
	(when (Givengood r6 tag0) (Givengood-rocks-in-range tag0))
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r6 tag1))(Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r6 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r6 tag1)))(not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p3-3-h1-KW-tag1
:parameters ()
:precondition 
(and 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p3-3 tag0) (Givenantena-height h1 tag0))(KNot tag0 tag1))(not (KNot tag1 tag1)) (Givenagent-at p3-3 tag1) (Givenantena-height h1 tag1))
:effect 
(and 
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r6 tag0))(Givengood-rocks-in-range tag0))
	
	(when (Givengood r6 tag1) (Givengood-rocks-in-range tag1))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r6 tag0)))(not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r6 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p3-8-h1-KW-tag0
:parameters ()
:precondition 
(and (not (KNot tag0 tag0)) (Givenagent-at p3-8 tag0) (Givenantena-height h1 tag0) 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p3-8 tag1) (Givenantena-height h1 tag1))(KNot tag0 tag1)))
:effect 
(and 
	
	(when (Givengood r1 tag0) (Givengood-rocks-in-range tag0))
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r1 tag1))(Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r1 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r1 tag1)))(not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p3-8-h1-KW-tag1
:parameters ()
:precondition 
(and 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p3-8 tag0) (Givenantena-height h1 tag0))(KNot tag0 tag1))(not (KNot tag1 tag1)) (Givenagent-at p3-8 tag1) (Givenantena-height h1 tag1))
:effect 
(and 
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r1 tag0))(Givengood-rocks-in-range tag0))
	
	(when (Givengood r1 tag1) (Givengood-rocks-in-range tag1))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r1 tag0)))(not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r1 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p4-2-h1-KW-tag0
:parameters ()
:precondition 
(and (not (KNot tag0 tag0)) (Givenagent-at p4-2 tag0) (Givenantena-height h1 tag0) 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p4-2 tag1) (Givenantena-height h1 tag1))(KNot tag0 tag1)))
:effect 
(and 
	
	(when (Givengood r6 tag0) (Givengood-rocks-in-range tag0))
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r6 tag1))(Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r6 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r6 tag1)))(not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p4-2-h1-KW-tag1
:parameters ()
:precondition 
(and 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p4-2 tag0) (Givenantena-height h1 tag0))(KNot tag0 tag1))(not (KNot tag1 tag1)) (Givenagent-at p4-2 tag1) (Givenantena-height h1 tag1))
:effect 
(and 
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r6 tag0))(Givengood-rocks-in-range tag0))
	
	(when (Givengood r6 tag1) (Givengood-rocks-in-range tag1))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r6 tag0)))(not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r6 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p4-3-h0-KW-tag0
:parameters ()
:precondition 
(and (not (KNot tag0 tag0)) (Givenagent-at p4-3 tag0) (Givenantena-height h0 tag0) 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p4-3 tag1) (Givenantena-height h0 tag1))(KNot tag0 tag1)))
:effect 
(and 
	
	(when (Givengood r6 tag0) (Givengood-rocks-in-range tag0))
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r6 tag1))(Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r6 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r6 tag1)))(not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p4-3-h0-KW-tag1
:parameters ()
:precondition 
(and 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p4-3 tag0) (Givenantena-height h0 tag0))(KNot tag0 tag1))(not (KNot tag1 tag1)) (Givenagent-at p4-3 tag1) (Givenantena-height h0 tag1))
:effect 
(and 
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r6 tag0))(Givengood-rocks-in-range tag0))
	
	(when (Givengood r6 tag1) (Givengood-rocks-in-range tag1))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r6 tag0)))(not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r6 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p4-3-h1-KW-tag0
:parameters ()
:precondition 
(and (not (KNot tag0 tag0)) (Givenagent-at p4-3 tag0) (Givenantena-height h1 tag0) 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p4-3 tag1) (Givenantena-height h1 tag1))(KNot tag0 tag1)))
:effect 
(and 
	
	(when (Givengood r6 tag0) (Givengood-rocks-in-range tag0))
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r6 tag1))(Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r6 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r6 tag1)))(not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p4-3-h1-KW-tag1
:parameters ()
:precondition 
(and 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p4-3 tag0) (Givenantena-height h1 tag0))(KNot tag0 tag1))(not (KNot tag1 tag1)) (Givenagent-at p4-3 tag1) (Givenantena-height h1 tag1))
:effect 
(and 
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r6 tag0))(Givengood-rocks-in-range tag0))
	
	(when (Givengood r6 tag1) (Givengood-rocks-in-range tag1))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r6 tag0)))(not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r6 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p4-4-h1-KW-tag0
:parameters ()
:precondition 
(and (not (KNot tag0 tag0)) (Givenagent-at p4-4 tag0) (Givenantena-height h1 tag0) 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p4-4 tag1) (Givenantena-height h1 tag1))(KNot tag0 tag1)))
:effect 
(and 
	
	(when (Givengood r6 tag0) (Givengood-rocks-in-range tag0))
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r6 tag1))(Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r6 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r6 tag1)))(not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p4-4-h1-KW-tag1
:parameters ()
:precondition 
(and 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p4-4 tag0) (Givenantena-height h1 tag0))(KNot tag0 tag1))(not (KNot tag1 tag1)) (Givenagent-at p4-4 tag1) (Givenantena-height h1 tag1))
:effect 
(and 
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r6 tag0))(Givengood-rocks-in-range tag0))
	
	(when (Givengood r6 tag1) (Givengood-rocks-in-range tag1))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r6 tag0)))(not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r6 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p5-1-h1-KW-tag0
:parameters ()
:precondition 
(and (not (KNot tag0 tag0)) (Givenagent-at p5-1 tag0) (Givenantena-height h1 tag0) 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p5-1 tag1) (Givenantena-height h1 tag1))(KNot tag0 tag1)))
:effect 
(and 
	
	(when (Givengood r8 tag0) (Givengood-rocks-in-range tag0))
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r8 tag1))(Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r8 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r8 tag1)))(not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p5-1-h1-KW-tag1
:parameters ()
:precondition 
(and 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p5-1 tag0) (Givenantena-height h1 tag0))(KNot tag0 tag1))(not (KNot tag1 tag1)) (Givenagent-at p5-1 tag1) (Givenantena-height h1 tag1))
:effect 
(and 
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r8 tag0))(Givengood-rocks-in-range tag0))
	
	(when (Givengood r8 tag1) (Givengood-rocks-in-range tag1))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r8 tag0)))(not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r8 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p5-2-h1-KW-tag0
:parameters ()
:precondition 
(and (not (KNot tag0 tag0)) (Givenagent-at p5-2 tag0) (Givenantena-height h1 tag0) 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p5-2 tag1) (Givenantena-height h1 tag1))(KNot tag0 tag1)))
:effect 
(and 
	
	(when (Givengood r7 tag0) (Givengood-rocks-in-range tag0))
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r7 tag1))(Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r7 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r7 tag1)))(not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p5-2-h1-KW-tag1
:parameters ()
:precondition 
(and 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p5-2 tag0) (Givenantena-height h1 tag0))(KNot tag0 tag1))(not (KNot tag1 tag1)) (Givenagent-at p5-2 tag1) (Givenantena-height h1 tag1))
:effect 
(and 
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r7 tag0))(Givengood-rocks-in-range tag0))
	
	(when (Givengood r7 tag1) (Givengood-rocks-in-range tag1))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r7 tag0)))(not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r7 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p5-3-h1-KW-tag0
:parameters ()
:precondition 
(and (not (KNot tag0 tag0)) (Givenagent-at p5-3 tag0) (Givenantena-height h1 tag0) 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p5-3 tag1) (Givenantena-height h1 tag1))(KNot tag0 tag1)))
:effect 
(and 
	
	(when (Givengood r6 tag0) (Givengood-rocks-in-range tag0))
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r6 tag1))(Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r6 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r6 tag1)))(not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p5-3-h1-KW-tag1
:parameters ()
:precondition 
(and 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p5-3 tag0) (Givenantena-height h1 tag0))(KNot tag0 tag1))(not (KNot tag1 tag1)) (Givenagent-at p5-3 tag1) (Givenantena-height h1 tag1))
:effect 
(and 
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r6 tag0))(Givengood-rocks-in-range tag0))
	
	(when (Givengood r6 tag1) (Givengood-rocks-in-range tag1))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r6 tag0)))(not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r6 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p6-1-h0-KW-tag0
:parameters ()
:precondition 
(and (not (KNot tag0 tag0)) (Givenagent-at p6-1 tag0) (Givenantena-height h0 tag0) 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p6-1 tag1) (Givenantena-height h0 tag1))(KNot tag0 tag1)))
:effect 
(and 
	
	(when (Givengood r8 tag0) (Givengood-rocks-in-range tag0))
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r8 tag1))(Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r8 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r8 tag1)))(not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p6-1-h0-KW-tag1
:parameters ()
:precondition 
(and 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p6-1 tag0) (Givenantena-height h0 tag0))(KNot tag0 tag1))(not (KNot tag1 tag1)) (Givenagent-at p6-1 tag1) (Givenantena-height h0 tag1))
:effect 
(and 
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r8 tag0))(Givengood-rocks-in-range tag0))
	
	(when (Givengood r8 tag1) (Givengood-rocks-in-range tag1))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r8 tag0)))(not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r8 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p6-1-h1-KW-tag0
:parameters ()
:precondition 
(and (not (KNot tag0 tag0)) (Givenagent-at p6-1 tag0) (Givenantena-height h1 tag0) 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p6-1 tag1) (Givenantena-height h1 tag1))(KNot tag0 tag1)))
:effect 
(and 
	
	(when 
		(and (Givengood r4 tag0) (Givengood r7 tag0) (Givengood r8 tag0))(Givengood-rocks-in-range tag0))
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r4 tag1) (Givengood r7 tag1) (Givengood r8 tag1))(Givengood-rocks-in-range tag1))
	
	(when 
		(and (not (Givengood r4 tag0)) (not (Givengood r7 tag0)) (not (Givengood r8 tag0)))(not (Givengood-rocks-in-range tag0)))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r4 tag1)) (not (Givengood r7 tag1)) (not (Givengood r8 tag1)))(not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p6-1-h1-KW-tag1
:parameters ()
:precondition 
(and 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p6-1 tag0) (Givenantena-height h1 tag0))(KNot tag0 tag1))(not (KNot tag1 tag1)) (Givenagent-at p6-1 tag1) (Givenantena-height h1 tag1))
:effect 
(and 
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r4 tag0) (Givengood r7 tag0) (Givengood r8 tag0))(Givengood-rocks-in-range tag0))
	
	(when 
		(and (Givengood r4 tag1) (Givengood r7 tag1) (Givengood r8 tag1))(Givengood-rocks-in-range tag1))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r4 tag0)) (not (Givengood r7 tag0)) (not (Givengood r8 tag0)))(not (Givengood-rocks-in-range tag0)))
	
	(when 
		(and (not (Givengood r4 tag1)) (not (Givengood r7 tag1)) (not (Givengood r8 tag1)))(not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p6-2-h0-KW-tag0
:parameters ()
:precondition 
(and (not (KNot tag0 tag0)) (Givenagent-at p6-2 tag0) (Givenantena-height h0 tag0) 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p6-2 tag1) (Givenantena-height h0 tag1))(KNot tag0 tag1)))
:effect 
(and 
	
	(when (Givengood r7 tag0) (Givengood-rocks-in-range tag0))
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r7 tag1))(Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r7 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r7 tag1)))(not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p6-2-h0-KW-tag1
:parameters ()
:precondition 
(and 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p6-2 tag0) (Givenantena-height h0 tag0))(KNot tag0 tag1))(not (KNot tag1 tag1)) (Givenagent-at p6-2 tag1) (Givenantena-height h0 tag1))
:effect 
(and 
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r7 tag0))(Givengood-rocks-in-range tag0))
	
	(when (Givengood r7 tag1) (Givengood-rocks-in-range tag1))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r7 tag0)))(not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r7 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p6-2-h1-KW-tag0
:parameters ()
:precondition 
(and (not (KNot tag0 tag0)) (Givenagent-at p6-2 tag0) (Givenantena-height h1 tag0) 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p6-2 tag1) (Givenantena-height h1 tag1))(KNot tag0 tag1)))
:effect 
(and 
	
	(when 
		(and (Givengood r7 tag0) (Givengood r8 tag0))(Givengood-rocks-in-range tag0))
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r7 tag1) (Givengood r8 tag1))(Givengood-rocks-in-range tag1))
	
	(when 
		(and (not (Givengood r7 tag0)) (not (Givengood r8 tag0)))(not (Givengood-rocks-in-range tag0)))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r7 tag1)) (not (Givengood r8 tag1)))(not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p6-2-h1-KW-tag1
:parameters ()
:precondition 
(and 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p6-2 tag0) (Givenantena-height h1 tag0))(KNot tag0 tag1))(not (KNot tag1 tag1)) (Givenagent-at p6-2 tag1) (Givenantena-height h1 tag1))
:effect 
(and 
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r7 tag0) (Givengood r8 tag0))(Givengood-rocks-in-range tag0))
	
	(when 
		(and (Givengood r7 tag1) (Givengood r8 tag1))(Givengood-rocks-in-range tag1))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r7 tag0)) (not (Givengood r8 tag0)))(not (Givengood-rocks-in-range tag0)))
	
	(when 
		(and (not (Givengood r7 tag1)) (not (Givengood r8 tag1)))(not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p6-3-h1-KW-tag0
:parameters ()
:precondition 
(and (not (KNot tag0 tag0)) (Givenagent-at p6-3 tag0) (Givenantena-height h1 tag0) 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p6-3 tag1) (Givenantena-height h1 tag1))(KNot tag0 tag1)))
:effect 
(and 
	
	(when (Givengood r7 tag0) (Givengood-rocks-in-range tag0))
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r7 tag1))(Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r7 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r7 tag1)))(not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p6-3-h1-KW-tag1
:parameters ()
:precondition 
(and 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p6-3 tag0) (Givenantena-height h1 tag0))(KNot tag0 tag1))(not (KNot tag1 tag1)) (Givenagent-at p6-3 tag1) (Givenantena-height h1 tag1))
:effect 
(and 
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r7 tag0))(Givengood-rocks-in-range tag0))
	
	(when (Givengood r7 tag1) (Givengood-rocks-in-range tag1))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r7 tag0)))(not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r7 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p6-4-h1-KW-tag0
:parameters ()
:precondition 
(and (not (KNot tag0 tag0)) (Givenagent-at p6-4 tag0) (Givenantena-height h1 tag0) 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p6-4 tag1) (Givenantena-height h1 tag1))(KNot tag0 tag1)))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r0 tag1))(Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r0 tag1)))(not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p6-4-h1-KW-tag1
:parameters ()
:precondition 
(and 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p6-4 tag0) (Givenantena-height h1 tag0))(KNot tag0 tag1))(not (KNot tag1 tag1)) (Givenagent-at p6-4 tag1) (Givenantena-height h1 tag1))
:effect 
(and 
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r0 tag0))(Givengood-rocks-in-range tag0))
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r0 tag0)))(not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p7-1-h0-KW-tag0
:parameters ()
:precondition 
(and (not (KNot tag0 tag0)) (Givenagent-at p7-1 tag0) (Givenantena-height h0 tag0) 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p7-1 tag1) (Givenantena-height h0 tag1))(KNot tag0 tag1)))
:effect 
(and 
	
	(when (Givengood r4 tag0) (Givengood-rocks-in-range tag0))
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r4 tag1))(Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r4 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r4 tag1)))(not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p7-1-h0-KW-tag1
:parameters ()
:precondition 
(and 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p7-1 tag0) (Givenantena-height h0 tag0))(KNot tag0 tag1))(not (KNot tag1 tag1)) (Givenagent-at p7-1 tag1) (Givenantena-height h0 tag1))
:effect 
(and 
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r4 tag0))(Givengood-rocks-in-range tag0))
	
	(when (Givengood r4 tag1) (Givengood-rocks-in-range tag1))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r4 tag0)))(not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r4 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p7-1-h1-KW-tag0
:parameters ()
:precondition 
(and (not (KNot tag0 tag0)) (Givenagent-at p7-1 tag0) (Givenantena-height h1 tag0) 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p7-1 tag1) (Givenantena-height h1 tag1))(KNot tag0 tag1)))
:effect 
(and 
	
	(when 
		(and (Givengood r4 tag0) (Givengood r8 tag0))(Givengood-rocks-in-range tag0))
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r4 tag1) (Givengood r8 tag1))(Givengood-rocks-in-range tag1))
	
	(when 
		(and (not (Givengood r4 tag0)) (not (Givengood r8 tag0)))(not (Givengood-rocks-in-range tag0)))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r4 tag1)) (not (Givengood r8 tag1)))(not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p7-1-h1-KW-tag1
:parameters ()
:precondition 
(and 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p7-1 tag0) (Givenantena-height h1 tag0))(KNot tag0 tag1))(not (KNot tag1 tag1)) (Givenagent-at p7-1 tag1) (Givenantena-height h1 tag1))
:effect 
(and 
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r4 tag0) (Givengood r8 tag0))(Givengood-rocks-in-range tag0))
	
	(when 
		(and (Givengood r4 tag1) (Givengood r8 tag1))(Givengood-rocks-in-range tag1))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r4 tag0)) (not (Givengood r8 tag0)))(not (Givengood-rocks-in-range tag0)))
	
	(when 
		(and (not (Givengood r4 tag1)) (not (Givengood r8 tag1)))(not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p7-2-h1-KW-tag0
:parameters ()
:precondition 
(and (not (KNot tag0 tag0)) (Givenagent-at p7-2 tag0) (Givenantena-height h1 tag0) 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p7-2 tag1) (Givenantena-height h1 tag1))(KNot tag0 tag1)))
:effect 
(and 
	
	(when 
		(and (Givengood r4 tag0) (Givengood r7 tag0))(Givengood-rocks-in-range tag0))
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r4 tag1) (Givengood r7 tag1))(Givengood-rocks-in-range tag1))
	
	(when 
		(and (not (Givengood r4 tag0)) (not (Givengood r7 tag0)))(not (Givengood-rocks-in-range tag0)))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r4 tag1)) (not (Givengood r7 tag1)))(not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p7-2-h1-KW-tag1
:parameters ()
:precondition 
(and 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p7-2 tag0) (Givenantena-height h1 tag0))(KNot tag0 tag1))(not (KNot tag1 tag1)) (Givenagent-at p7-2 tag1) (Givenantena-height h1 tag1))
:effect 
(and 
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r4 tag0) (Givengood r7 tag0))(Givengood-rocks-in-range tag0))
	
	(when 
		(and (Givengood r4 tag1) (Givengood r7 tag1))(Givengood-rocks-in-range tag1))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r4 tag0)) (not (Givengood r7 tag0)))(not (Givengood-rocks-in-range tag0)))
	
	(when 
		(and (not (Givengood r4 tag1)) (not (Givengood r7 tag1)))(not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p7-3-h1-KW-tag0
:parameters ()
:precondition 
(and (not (KNot tag0 tag0)) (Givenagent-at p7-3 tag0) (Givenantena-height h1 tag0) 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p7-3 tag1) (Givenantena-height h1 tag1))(KNot tag0 tag1)))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r0 tag1))(Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r0 tag1)))(not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p7-3-h1-KW-tag1
:parameters ()
:precondition 
(and 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p7-3 tag0) (Givenantena-height h1 tag0))(KNot tag0 tag1))(not (KNot tag1 tag1)) (Givenagent-at p7-3 tag1) (Givenantena-height h1 tag1))
:effect 
(and 
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r0 tag0))(Givengood-rocks-in-range tag0))
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r0 tag0)))(not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p7-4-h0-KW-tag0
:parameters ()
:precondition 
(and (not (KNot tag0 tag0)) (Givenagent-at p7-4 tag0) (Givenantena-height h0 tag0) 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p7-4 tag1) (Givenantena-height h0 tag1))(KNot tag0 tag1)))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r0 tag1))(Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r0 tag1)))(not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p7-4-h0-KW-tag1
:parameters ()
:precondition 
(and 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p7-4 tag0) (Givenantena-height h0 tag0))(KNot tag0 tag1))(not (KNot tag1 tag1)) (Givenagent-at p7-4 tag1) (Givenantena-height h0 tag1))
:effect 
(and 
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r0 tag0))(Givengood-rocks-in-range tag0))
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r0 tag0)))(not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p7-4-h1-KW-tag0
:parameters ()
:precondition 
(and (not (KNot tag0 tag0)) (Givenagent-at p7-4 tag0) (Givenantena-height h1 tag0) 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p7-4 tag1) (Givenantena-height h1 tag1))(KNot tag0 tag1)))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r0 tag1))(Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r0 tag1)))(not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p7-4-h1-KW-tag1
:parameters ()
:precondition 
(and 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p7-4 tag0) (Givenantena-height h1 tag0))(KNot tag0 tag1))(not (KNot tag1 tag1)) (Givenagent-at p7-4 tag1) (Givenantena-height h1 tag1))
:effect 
(and 
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r0 tag0))(Givengood-rocks-in-range tag0))
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r0 tag0)))(not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p7-5-h1-KW-tag0
:parameters ()
:precondition 
(and (not (KNot tag0 tag0)) (Givenagent-at p7-5 tag0) (Givenantena-height h1 tag0) 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p7-5 tag1) (Givenantena-height h1 tag1))(KNot tag0 tag1)))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r0 tag1))(Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r0 tag1)))(not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p7-5-h1-KW-tag1
:parameters ()
:precondition 
(and 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p7-5 tag0) (Givenantena-height h1 tag0))(KNot tag0 tag1))(not (KNot tag1 tag1)) (Givenagent-at p7-5 tag1) (Givenantena-height h1 tag1))
:effect 
(and 
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r0 tag0))(Givengood-rocks-in-range tag0))
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r0 tag0)))(not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p8-1-h1-KW-tag0
:parameters ()
:precondition 
(and (not (KNot tag0 tag0)) (Givenagent-at p8-1 tag0) (Givenantena-height h1 tag0) 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p8-1 tag1) (Givenantena-height h1 tag1))(KNot tag0 tag1)))
:effect 
(and 
	
	(when (Givengood r4 tag0) (Givengood-rocks-in-range tag0))
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r4 tag1))(Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r4 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r4 tag1)))(not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p8-1-h1-KW-tag1
:parameters ()
:precondition 
(and 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p8-1 tag0) (Givenantena-height h1 tag0))(KNot tag0 tag1))(not (KNot tag1 tag1)) (Givenagent-at p8-1 tag1) (Givenantena-height h1 tag1))
:effect 
(and 
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r4 tag0))(Givengood-rocks-in-range tag0))
	
	(when (Givengood r4 tag1) (Givengood-rocks-in-range tag1))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r4 tag0)))(not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r4 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p8-4-h1-KW-tag0
:parameters ()
:precondition 
(and (not (KNot tag0 tag0)) (Givenagent-at p8-4 tag0) (Givenantena-height h1 tag0) 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p8-4 tag1) (Givenantena-height h1 tag1))(KNot tag0 tag1)))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r0 tag1))(Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r0 tag1)))(not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p8-4-h1-KW-tag1
:parameters ()
:precondition 
(and 
	(or 
		(and (not (KNot tag0 tag1)) (Givenagent-at p8-4 tag0) (Givenantena-height h1 tag0))(KNot tag0 tag1))(not (KNot tag1 tag1)) (Givenagent-at p8-4 tag1) (Givenantena-height h1 tag1))
:effect 
(and 
	
	(when 
		(and (not (KNot tag0 tag1)) (Givengood r0 tag0))(Givengood-rocks-in-range tag0))
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when 
		(and (not (KNot tag0 tag1)) (not (Givengood r0 tag0)))(not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action observe-sensor-KW-tag0
:parameters ()
:effect 
(and 
	
	(when 
		(and (Givengood-rocks-in-range tag1) (not (Givengood-rocks-in-range tag0)))(KNot tag0 tag1))
	
	(when 
		(and (not (Givengood-rocks-in-range tag1)) (Givengood-rocks-in-range tag0))(KNot tag0 tag1)))
)
(:action observe-sensor-KW-tag1
:parameters ()
:effect 
(and 
	
	(when 
		(and (Givengood-rocks-in-range tag0) (not (Givengood-rocks-in-range tag1)))(KNot tag0 tag1))
	
	(when 
		(and (not (Givengood-rocks-in-range tag0)) (Givengood-rocks-in-range tag1))(KNot tag0 tag1)))
)
)
