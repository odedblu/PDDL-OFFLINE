(define (domain KRockSample8-2)
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
 h0 - HEIGHT
 h1 - HEIGHT
 tag0 - TAG_TYPE ; (good r0) (not (good r1))
 tag1 - TAG_TYPE ; (not (good r0)) (good r1)
 tag2 - TAG_TYPE ; (good r1) (good r0)
 tag3 - TAG_TYPE ; (not (good r1)) (not (good r0))
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

(:action move-tag0-tag1-tag2-tag3
:parameters ( ?pSource - LOCATION ?pTarget - LOCATION)
:precondition 
(and (adj ?pSource ?pTarget) (Givenagent-at ?pSource tag0) (Givenantena-height h0 tag0) (Givenagent-at ?pSource tag1) (Givenantena-height h0 tag1) (Givenagent-at ?pSource tag2) (Givenantena-height h0 tag2) (Givenagent-at ?pSource tag3) (Givenantena-height h0 tag3) (not (KNot tag0 tag1)) (not (KNot tag0 tag2)) (not (KNot tag0 tag3)) (not (KNot tag1 tag2)) (not (KNot tag1 tag3)) (not (KNot tag2 tag3)) (NotInAction ))
:effect 
(and (Givenagent-at ?pTarget tag0) (not (Givenagent-at ?pSource tag0)) (not (Givengood-rocks-in-range tag0)) (Givenagent-at ?pTarget tag1) (not (Givenagent-at ?pSource tag1)) (not (Givengood-rocks-in-range tag1)) (Givenagent-at ?pTarget tag2) (not (Givenagent-at ?pSource tag2)) (not (Givengood-rocks-in-range tag2)) (Givenagent-at ?pTarget tag3) (not (Givenagent-at ?pSource tag3)) (not (Givengood-rocks-in-range tag3)))
)
(:action move-tag0-tag1-tag2
:parameters ( ?pSource - LOCATION ?pTarget - LOCATION)
:precondition 
(and (adj ?pSource ?pTarget) (Givenagent-at ?pSource tag0) (Givenantena-height h0 tag0) (Givenagent-at ?pSource tag1) (Givenantena-height h0 tag1) (Givenagent-at ?pSource tag2) (Givenantena-height h0 tag2) (not (KNot tag0 tag1)) (not (KNot tag0 tag2)) (not (KNot tag1 tag2)) (KNot tag0 tag3) (KNot tag1 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and (Givenagent-at ?pTarget tag0) (not (Givenagent-at ?pSource tag0)) (not (Givengood-rocks-in-range tag0)) (Givenagent-at ?pTarget tag1) (not (Givenagent-at ?pSource tag1)) (not (Givengood-rocks-in-range tag1)) (Givenagent-at ?pTarget tag2) (not (Givenagent-at ?pSource tag2)) (not (Givengood-rocks-in-range tag2)))
)
(:action move-tag0-tag1-tag3
:parameters ( ?pSource - LOCATION ?pTarget - LOCATION)
:precondition 
(and (adj ?pSource ?pTarget) (Givenagent-at ?pSource tag0) (Givenantena-height h0 tag0) (Givenagent-at ?pSource tag1) (Givenantena-height h0 tag1) (Givenagent-at ?pSource tag3) (Givenantena-height h0 tag3) (not (KNot tag0 tag1)) (not (KNot tag0 tag3)) (not (KNot tag1 tag3)) (KNot tag0 tag2) (KNot tag1 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and (Givenagent-at ?pTarget tag0) (not (Givenagent-at ?pSource tag0)) (not (Givengood-rocks-in-range tag0)) (Givenagent-at ?pTarget tag1) (not (Givenagent-at ?pSource tag1)) (not (Givengood-rocks-in-range tag1)) (Givenagent-at ?pTarget tag3) (not (Givenagent-at ?pSource tag3)) (not (Givengood-rocks-in-range tag3)))
)
(:action move-tag0-tag1
:parameters ( ?pSource - LOCATION ?pTarget - LOCATION)
:precondition 
(and (adj ?pSource ?pTarget) (Givenagent-at ?pSource tag0) (Givenantena-height h0 tag0) (Givenagent-at ?pSource tag1) (Givenantena-height h0 tag1) (not (KNot tag0 tag1)) (KNot tag0 tag2) (KNot tag0 tag3) (KNot tag1 tag2) (KNot tag1 tag3) (NotInAction ))
:effect 
(and (Givenagent-at ?pTarget tag0) (not (Givenagent-at ?pSource tag0)) (not (Givengood-rocks-in-range tag0)) (Givenagent-at ?pTarget tag1) (not (Givenagent-at ?pSource tag1)) (not (Givengood-rocks-in-range tag1)))
)
(:action move-tag0-tag2-tag3
:parameters ( ?pSource - LOCATION ?pTarget - LOCATION)
:precondition 
(and (adj ?pSource ?pTarget) (Givenagent-at ?pSource tag0) (Givenantena-height h0 tag0) (Givenagent-at ?pSource tag2) (Givenantena-height h0 tag2) (Givenagent-at ?pSource tag3) (Givenantena-height h0 tag3) (not (KNot tag0 tag2)) (not (KNot tag0 tag3)) (not (KNot tag2 tag3)) (KNot tag0 tag1) (KNot tag1 tag2) (KNot tag1 tag3) (NotInAction ))
:effect 
(and (Givenagent-at ?pTarget tag0) (not (Givenagent-at ?pSource tag0)) (not (Givengood-rocks-in-range tag0)) (Givenagent-at ?pTarget tag2) (not (Givenagent-at ?pSource tag2)) (not (Givengood-rocks-in-range tag2)) (Givenagent-at ?pTarget tag3) (not (Givenagent-at ?pSource tag3)) (not (Givengood-rocks-in-range tag3)))
)
(:action move-tag0-tag2
:parameters ( ?pSource - LOCATION ?pTarget - LOCATION)
:precondition 
(and (adj ?pSource ?pTarget) (Givenagent-at ?pSource tag0) (Givenantena-height h0 tag0) (Givenagent-at ?pSource tag2) (Givenantena-height h0 tag2) (not (KNot tag0 tag2)) (KNot tag0 tag1) (KNot tag0 tag3) (KNot tag1 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and (Givenagent-at ?pTarget tag0) (not (Givenagent-at ?pSource tag0)) (not (Givengood-rocks-in-range tag0)) (Givenagent-at ?pTarget tag2) (not (Givenagent-at ?pSource tag2)) (not (Givengood-rocks-in-range tag2)))
)
(:action move-tag0-tag3
:parameters ( ?pSource - LOCATION ?pTarget - LOCATION)
:precondition 
(and (adj ?pSource ?pTarget) (Givenagent-at ?pSource tag0) (Givenantena-height h0 tag0) (Givenagent-at ?pSource tag3) (Givenantena-height h0 tag3) (not (KNot tag0 tag3)) (KNot tag0 tag1) (KNot tag0 tag2) (KNot tag1 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and (Givenagent-at ?pTarget tag0) (not (Givenagent-at ?pSource tag0)) (not (Givengood-rocks-in-range tag0)) (Givenagent-at ?pTarget tag3) (not (Givenagent-at ?pSource tag3)) (not (Givengood-rocks-in-range tag3)))
)
(:action move-tag0
:parameters ( ?pSource - LOCATION ?pTarget - LOCATION)
:precondition 
(and (adj ?pSource ?pTarget) (Givenagent-at ?pSource tag0) (Givenantena-height h0 tag0) (KNot tag0 tag1) (KNot tag0 tag2) (KNot tag0 tag3) (NotInAction ))
:effect 
(and (Givenagent-at ?pTarget tag0) (not (Givenagent-at ?pSource tag0)) (not (Givengood-rocks-in-range tag0)))
)
(:action move-tag1-tag2-tag3
:parameters ( ?pSource - LOCATION ?pTarget - LOCATION)
:precondition 
(and (adj ?pSource ?pTarget) (Givenagent-at ?pSource tag1) (Givenantena-height h0 tag1) (Givenagent-at ?pSource tag2) (Givenantena-height h0 tag2) (Givenagent-at ?pSource tag3) (Givenantena-height h0 tag3) (not (KNot tag1 tag2)) (not (KNot tag1 tag3)) (not (KNot tag2 tag3)) (KNot tag0 tag1) (KNot tag0 tag2) (KNot tag0 tag3) (NotInAction ))
:effect 
(and (Givenagent-at ?pTarget tag1) (not (Givenagent-at ?pSource tag1)) (not (Givengood-rocks-in-range tag1)) (Givenagent-at ?pTarget tag2) (not (Givenagent-at ?pSource tag2)) (not (Givengood-rocks-in-range tag2)) (Givenagent-at ?pTarget tag3) (not (Givenagent-at ?pSource tag3)) (not (Givengood-rocks-in-range tag3)))
)
(:action move-tag1-tag2
:parameters ( ?pSource - LOCATION ?pTarget - LOCATION)
:precondition 
(and (adj ?pSource ?pTarget) (Givenagent-at ?pSource tag1) (Givenantena-height h0 tag1) (Givenagent-at ?pSource tag2) (Givenantena-height h0 tag2) (not (KNot tag1 tag2)) (KNot tag0 tag1) (KNot tag1 tag3) (KNot tag0 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and (Givenagent-at ?pTarget tag1) (not (Givenagent-at ?pSource tag1)) (not (Givengood-rocks-in-range tag1)) (Givenagent-at ?pTarget tag2) (not (Givenagent-at ?pSource tag2)) (not (Givengood-rocks-in-range tag2)))
)
(:action move-tag1-tag3
:parameters ( ?pSource - LOCATION ?pTarget - LOCATION)
:precondition 
(and (adj ?pSource ?pTarget) (Givenagent-at ?pSource tag1) (Givenantena-height h0 tag1) (Givenagent-at ?pSource tag3) (Givenantena-height h0 tag3) (not (KNot tag1 tag3)) (KNot tag0 tag1) (KNot tag1 tag2) (KNot tag0 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and (Givenagent-at ?pTarget tag1) (not (Givenagent-at ?pSource tag1)) (not (Givengood-rocks-in-range tag1)) (Givenagent-at ?pTarget tag3) (not (Givenagent-at ?pSource tag3)) (not (Givengood-rocks-in-range tag3)))
)
(:action move-tag1
:parameters ( ?pSource - LOCATION ?pTarget - LOCATION)
:precondition 
(and (adj ?pSource ?pTarget) (Givenagent-at ?pSource tag1) (Givenantena-height h0 tag1) (KNot tag0 tag1) (KNot tag1 tag2) (KNot tag1 tag3) (NotInAction ))
:effect 
(and (Givenagent-at ?pTarget tag1) (not (Givenagent-at ?pSource tag1)) (not (Givengood-rocks-in-range tag1)))
)
(:action move-tag2-tag3
:parameters ( ?pSource - LOCATION ?pTarget - LOCATION)
:precondition 
(and (adj ?pSource ?pTarget) (Givenagent-at ?pSource tag2) (Givenantena-height h0 tag2) (Givenagent-at ?pSource tag3) (Givenantena-height h0 tag3) (not (KNot tag2 tag3)) (KNot tag0 tag2) (KNot tag1 tag2) (KNot tag0 tag3) (KNot tag1 tag3) (NotInAction ))
:effect 
(and (Givenagent-at ?pTarget tag2) (not (Givenagent-at ?pSource tag2)) (not (Givengood-rocks-in-range tag2)) (Givenagent-at ?pTarget tag3) (not (Givenagent-at ?pSource tag3)) (not (Givengood-rocks-in-range tag3)))
)
(:action move-tag2
:parameters ( ?pSource - LOCATION ?pTarget - LOCATION)
:precondition 
(and (adj ?pSource ?pTarget) (Givenagent-at ?pSource tag2) (Givenantena-height h0 tag2) (KNot tag0 tag2) (KNot tag1 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and (Givenagent-at ?pTarget tag2) (not (Givenagent-at ?pSource tag2)) (not (Givengood-rocks-in-range tag2)))
)
(:action move-tag3
:parameters ( ?pSource - LOCATION ?pTarget - LOCATION)
:precondition 
(and (adj ?pSource ?pTarget) (Givenagent-at ?pSource tag3) (Givenantena-height h0 tag3) (KNot tag0 tag3) (KNot tag1 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and (Givenagent-at ?pTarget tag3) (not (Givenagent-at ?pSource tag3)) (not (Givengood-rocks-in-range tag3)))
)
(:action sample-tag0-tag1-tag2-tag3
:parameters ( ?r - ROCK ?p - LOCATION)
:precondition 
(and (rock-at ?r ?p) (Givenagent-at ?p tag0) (Givengood ?r tag0) (Givenagent-at ?p tag1) (Givengood ?r tag1) (Givenagent-at ?p tag2) (Givengood ?r tag2) (Givenagent-at ?p tag3) (Givengood ?r tag3) (not (KNot tag0 tag1)) (not (KNot tag0 tag2)) (not (KNot tag0 tag3)) (not (KNot tag1 tag2)) (not (KNot tag1 tag3)) (not (KNot tag2 tag3)) (NotInAction ))
:effect 
(and (not (Givengood ?r tag0)) (not (Givengood ?r tag1)) (not (Givengood ?r tag2)) (not (Givengood ?r tag3)))
)
(:action sample-tag0-tag1-tag2
:parameters ( ?r - ROCK ?p - LOCATION)
:precondition 
(and (rock-at ?r ?p) (Givenagent-at ?p tag0) (Givengood ?r tag0) (Givenagent-at ?p tag1) (Givengood ?r tag1) (Givenagent-at ?p tag2) (Givengood ?r tag2) (not (KNot tag0 tag1)) (not (KNot tag0 tag2)) (not (KNot tag1 tag2)) (KNot tag0 tag3) (KNot tag1 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and (not (Givengood ?r tag0)) (not (Givengood ?r tag1)) (not (Givengood ?r tag2)))
)
(:action sample-tag0-tag1-tag3
:parameters ( ?r - ROCK ?p - LOCATION)
:precondition 
(and (rock-at ?r ?p) (Givenagent-at ?p tag0) (Givengood ?r tag0) (Givenagent-at ?p tag1) (Givengood ?r tag1) (Givenagent-at ?p tag3) (Givengood ?r tag3) (not (KNot tag0 tag1)) (not (KNot tag0 tag3)) (not (KNot tag1 tag3)) (KNot tag0 tag2) (KNot tag1 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and (not (Givengood ?r tag0)) (not (Givengood ?r tag1)) (not (Givengood ?r tag3)))
)
(:action sample-tag0-tag1
:parameters ( ?r - ROCK ?p - LOCATION)
:precondition 
(and (rock-at ?r ?p) (Givenagent-at ?p tag0) (Givengood ?r tag0) (Givenagent-at ?p tag1) (Givengood ?r tag1) (not (KNot tag0 tag1)) (KNot tag0 tag2) (KNot tag0 tag3) (KNot tag1 tag2) (KNot tag1 tag3) (NotInAction ))
:effect 
(and (not (Givengood ?r tag0)) (not (Givengood ?r tag1)))
)
(:action sample-tag0-tag2-tag3
:parameters ( ?r - ROCK ?p - LOCATION)
:precondition 
(and (rock-at ?r ?p) (Givenagent-at ?p tag0) (Givengood ?r tag0) (Givenagent-at ?p tag2) (Givengood ?r tag2) (Givenagent-at ?p tag3) (Givengood ?r tag3) (not (KNot tag0 tag2)) (not (KNot tag0 tag3)) (not (KNot tag2 tag3)) (KNot tag0 tag1) (KNot tag1 tag2) (KNot tag1 tag3) (NotInAction ))
:effect 
(and (not (Givengood ?r tag0)) (not (Givengood ?r tag2)) (not (Givengood ?r tag3)))
)
(:action sample-tag0-tag2
:parameters ( ?r - ROCK ?p - LOCATION)
:precondition 
(and (rock-at ?r ?p) (Givenagent-at ?p tag0) (Givengood ?r tag0) (Givenagent-at ?p tag2) (Givengood ?r tag2) (not (KNot tag0 tag2)) (KNot tag0 tag1) (KNot tag0 tag3) (KNot tag1 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and (not (Givengood ?r tag0)) (not (Givengood ?r tag2)))
)
(:action sample-tag0-tag3
:parameters ( ?r - ROCK ?p - LOCATION)
:precondition 
(and (rock-at ?r ?p) (Givenagent-at ?p tag0) (Givengood ?r tag0) (Givenagent-at ?p tag3) (Givengood ?r tag3) (not (KNot tag0 tag3)) (KNot tag0 tag1) (KNot tag0 tag2) (KNot tag1 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and (not (Givengood ?r tag0)) (not (Givengood ?r tag3)))
)
(:action sample-tag0
:parameters ( ?r - ROCK ?p - LOCATION)
:precondition 
(and (rock-at ?r ?p) (Givenagent-at ?p tag0) (Givengood ?r tag0) (KNot tag0 tag1) (KNot tag0 tag2) (KNot tag0 tag3) (NotInAction ))
:effect (not (Givengood ?r tag0))
)
(:action sample-tag1-tag2-tag3
:parameters ( ?r - ROCK ?p - LOCATION)
:precondition 
(and (rock-at ?r ?p) (Givenagent-at ?p tag1) (Givengood ?r tag1) (Givenagent-at ?p tag2) (Givengood ?r tag2) (Givenagent-at ?p tag3) (Givengood ?r tag3) (not (KNot tag1 tag2)) (not (KNot tag1 tag3)) (not (KNot tag2 tag3)) (KNot tag0 tag1) (KNot tag0 tag2) (KNot tag0 tag3) (NotInAction ))
:effect 
(and (not (Givengood ?r tag1)) (not (Givengood ?r tag2)) (not (Givengood ?r tag3)))
)
(:action sample-tag1-tag2
:parameters ( ?r - ROCK ?p - LOCATION)
:precondition 
(and (rock-at ?r ?p) (Givenagent-at ?p tag1) (Givengood ?r tag1) (Givenagent-at ?p tag2) (Givengood ?r tag2) (not (KNot tag1 tag2)) (KNot tag0 tag1) (KNot tag1 tag3) (KNot tag0 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and (not (Givengood ?r tag1)) (not (Givengood ?r tag2)))
)
(:action sample-tag1-tag3
:parameters ( ?r - ROCK ?p - LOCATION)
:precondition 
(and (rock-at ?r ?p) (Givenagent-at ?p tag1) (Givengood ?r tag1) (Givenagent-at ?p tag3) (Givengood ?r tag3) (not (KNot tag1 tag3)) (KNot tag0 tag1) (KNot tag1 tag2) (KNot tag0 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and (not (Givengood ?r tag1)) (not (Givengood ?r tag3)))
)
(:action sample-tag1
:parameters ( ?r - ROCK ?p - LOCATION)
:precondition 
(and (rock-at ?r ?p) (Givenagent-at ?p tag1) (Givengood ?r tag1) (KNot tag0 tag1) (KNot tag1 tag2) (KNot tag1 tag3) (NotInAction ))
:effect (not (Givengood ?r tag1))
)
(:action sample-tag2-tag3
:parameters ( ?r - ROCK ?p - LOCATION)
:precondition 
(and (rock-at ?r ?p) (Givenagent-at ?p tag2) (Givengood ?r tag2) (Givenagent-at ?p tag3) (Givengood ?r tag3) (not (KNot tag2 tag3)) (KNot tag0 tag2) (KNot tag1 tag2) (KNot tag0 tag3) (KNot tag1 tag3) (NotInAction ))
:effect 
(and (not (Givengood ?r tag2)) (not (Givengood ?r tag3)))
)
(:action sample-tag2
:parameters ( ?r - ROCK ?p - LOCATION)
:precondition 
(and (rock-at ?r ?p) (Givenagent-at ?p tag2) (Givengood ?r tag2) (KNot tag0 tag2) (KNot tag1 tag2) (KNot tag2 tag3) (NotInAction ))
:effect (not (Givengood ?r tag2))
)
(:action sample-tag3
:parameters ( ?r - ROCK ?p - LOCATION)
:precondition 
(and (rock-at ?r ?p) (Givenagent-at ?p tag3) (Givengood ?r tag3) (KNot tag0 tag3) (KNot tag1 tag3) (KNot tag2 tag3) (NotInAction ))
:effect (not (Givengood ?r tag3))
)
(:action raise-antena-tag0-tag1-tag2-tag3
:parameters ()
:precondition 
(and (not (KNot tag0 tag1)) (not (KNot tag0 tag2)) (not (KNot tag0 tag3)) (not (KNot tag1 tag2)) (not (KNot tag1 tag3)) (not (KNot tag2 tag3)) (NotInAction ))
:effect 
(and (Givenantena-height h1 tag0) (not (Givenantena-height h0 tag0)) (Givenantena-height h1 tag1) (not (Givenantena-height h0 tag1)) (Givenantena-height h1 tag2) (not (Givenantena-height h0 tag2)) (Givenantena-height h1 tag3) (not (Givenantena-height h0 tag3)))
)
(:action raise-antena-tag0-tag1-tag2
:parameters ()
:precondition 
(and (not (KNot tag0 tag1)) (not (KNot tag0 tag2)) (not (KNot tag1 tag2)) (KNot tag0 tag3) (KNot tag1 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and (Givenantena-height h1 tag0) (not (Givenantena-height h0 tag0)) (Givenantena-height h1 tag1) (not (Givenantena-height h0 tag1)) (Givenantena-height h1 tag2) (not (Givenantena-height h0 tag2)))
)
(:action raise-antena-tag0-tag1-tag3
:parameters ()
:precondition 
(and (not (KNot tag0 tag1)) (not (KNot tag0 tag3)) (not (KNot tag1 tag3)) (KNot tag0 tag2) (KNot tag1 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and (Givenantena-height h1 tag0) (not (Givenantena-height h0 tag0)) (Givenantena-height h1 tag1) (not (Givenantena-height h0 tag1)) (Givenantena-height h1 tag3) (not (Givenantena-height h0 tag3)))
)
(:action raise-antena-tag0-tag1
:parameters ()
:precondition 
(and (not (KNot tag0 tag1)) (KNot tag0 tag2) (KNot tag0 tag3) (KNot tag1 tag2) (KNot tag1 tag3) (NotInAction ))
:effect 
(and (Givenantena-height h1 tag0) (not (Givenantena-height h0 tag0)) (Givenantena-height h1 tag1) (not (Givenantena-height h0 tag1)))
)
(:action raise-antena-tag0-tag2-tag3
:parameters ()
:precondition 
(and (not (KNot tag0 tag2)) (not (KNot tag0 tag3)) (not (KNot tag2 tag3)) (KNot tag0 tag1) (KNot tag1 tag2) (KNot tag1 tag3) (NotInAction ))
:effect 
(and (Givenantena-height h1 tag0) (not (Givenantena-height h0 tag0)) (Givenantena-height h1 tag2) (not (Givenantena-height h0 tag2)) (Givenantena-height h1 tag3) (not (Givenantena-height h0 tag3)))
)
(:action raise-antena-tag0-tag2
:parameters ()
:precondition 
(and (not (KNot tag0 tag2)) (KNot tag0 tag1) (KNot tag0 tag3) (KNot tag1 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and (Givenantena-height h1 tag0) (not (Givenantena-height h0 tag0)) (Givenantena-height h1 tag2) (not (Givenantena-height h0 tag2)))
)
(:action raise-antena-tag0-tag3
:parameters ()
:precondition 
(and (not (KNot tag0 tag3)) (KNot tag0 tag1) (KNot tag0 tag2) (KNot tag1 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and (Givenantena-height h1 tag0) (not (Givenantena-height h0 tag0)) (Givenantena-height h1 tag3) (not (Givenantena-height h0 tag3)))
)
(:action raise-antena-tag0
:parameters ()
:precondition 
(and (KNot tag0 tag1) (KNot tag0 tag2) (KNot tag0 tag3) (NotInAction ))
:effect 
(and (Givenantena-height h1 tag0) (not (Givenantena-height h0 tag0)))
)
(:action raise-antena-tag1-tag2-tag3
:parameters ()
:precondition 
(and (not (KNot tag1 tag2)) (not (KNot tag1 tag3)) (not (KNot tag2 tag3)) (KNot tag0 tag1) (KNot tag0 tag2) (KNot tag0 tag3) (NotInAction ))
:effect 
(and (Givenantena-height h1 tag1) (not (Givenantena-height h0 tag1)) (Givenantena-height h1 tag2) (not (Givenantena-height h0 tag2)) (Givenantena-height h1 tag3) (not (Givenantena-height h0 tag3)))
)
(:action raise-antena-tag1-tag2
:parameters ()
:precondition 
(and (not (KNot tag1 tag2)) (KNot tag0 tag1) (KNot tag1 tag3) (KNot tag0 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and (Givenantena-height h1 tag1) (not (Givenantena-height h0 tag1)) (Givenantena-height h1 tag2) (not (Givenantena-height h0 tag2)))
)
(:action raise-antena-tag1-tag3
:parameters ()
:precondition 
(and (not (KNot tag1 tag3)) (KNot tag0 tag1) (KNot tag1 tag2) (KNot tag0 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and (Givenantena-height h1 tag1) (not (Givenantena-height h0 tag1)) (Givenantena-height h1 tag3) (not (Givenantena-height h0 tag3)))
)
(:action raise-antena-tag1
:parameters ()
:precondition 
(and (KNot tag0 tag1) (KNot tag1 tag2) (KNot tag1 tag3) (NotInAction ))
:effect 
(and (Givenantena-height h1 tag1) (not (Givenantena-height h0 tag1)))
)
(:action raise-antena-tag2-tag3
:parameters ()
:precondition 
(and (not (KNot tag2 tag3)) (KNot tag0 tag2) (KNot tag1 tag2) (KNot tag0 tag3) (KNot tag1 tag3) (NotInAction ))
:effect 
(and (Givenantena-height h1 tag2) (not (Givenantena-height h0 tag2)) (Givenantena-height h1 tag3) (not (Givenantena-height h0 tag3)))
)
(:action raise-antena-tag2
:parameters ()
:precondition 
(and (KNot tag0 tag2) (KNot tag1 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and (Givenantena-height h1 tag2) (not (Givenantena-height h0 tag2)))
)
(:action raise-antena-tag3
:parameters ()
:precondition 
(and (KNot tag0 tag3) (KNot tag1 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and (Givenantena-height h1 tag3) (not (Givenantena-height h0 tag3)))
)
(:action lower-antena-tag0-tag1-tag2-tag3
:parameters ()
:precondition 
(and (not (KNot tag0 tag1)) (not (KNot tag0 tag2)) (not (KNot tag0 tag3)) (not (KNot tag1 tag2)) (not (KNot tag1 tag3)) (not (KNot tag2 tag3)) (NotInAction ))
:effect 
(and (not (Givenantena-height h1 tag0)) (Givenantena-height h0 tag0) (not (Givenantena-height h1 tag1)) (Givenantena-height h0 tag1) (not (Givenantena-height h1 tag2)) (Givenantena-height h0 tag2) (not (Givenantena-height h1 tag3)) (Givenantena-height h0 tag3))
)
(:action lower-antena-tag0-tag1-tag2
:parameters ()
:precondition 
(and (not (KNot tag0 tag1)) (not (KNot tag0 tag2)) (not (KNot tag1 tag2)) (KNot tag0 tag3) (KNot tag1 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and (not (Givenantena-height h1 tag0)) (Givenantena-height h0 tag0) (not (Givenantena-height h1 tag1)) (Givenantena-height h0 tag1) (not (Givenantena-height h1 tag2)) (Givenantena-height h0 tag2))
)
(:action lower-antena-tag0-tag1-tag3
:parameters ()
:precondition 
(and (not (KNot tag0 tag1)) (not (KNot tag0 tag3)) (not (KNot tag1 tag3)) (KNot tag0 tag2) (KNot tag1 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and (not (Givenantena-height h1 tag0)) (Givenantena-height h0 tag0) (not (Givenantena-height h1 tag1)) (Givenantena-height h0 tag1) (not (Givenantena-height h1 tag3)) (Givenantena-height h0 tag3))
)
(:action lower-antena-tag0-tag1
:parameters ()
:precondition 
(and (not (KNot tag0 tag1)) (KNot tag0 tag2) (KNot tag0 tag3) (KNot tag1 tag2) (KNot tag1 tag3) (NotInAction ))
:effect 
(and (not (Givenantena-height h1 tag0)) (Givenantena-height h0 tag0) (not (Givenantena-height h1 tag1)) (Givenantena-height h0 tag1))
)
(:action lower-antena-tag0-tag2-tag3
:parameters ()
:precondition 
(and (not (KNot tag0 tag2)) (not (KNot tag0 tag3)) (not (KNot tag2 tag3)) (KNot tag0 tag1) (KNot tag1 tag2) (KNot tag1 tag3) (NotInAction ))
:effect 
(and (not (Givenantena-height h1 tag0)) (Givenantena-height h0 tag0) (not (Givenantena-height h1 tag2)) (Givenantena-height h0 tag2) (not (Givenantena-height h1 tag3)) (Givenantena-height h0 tag3))
)
(:action lower-antena-tag0-tag2
:parameters ()
:precondition 
(and (not (KNot tag0 tag2)) (KNot tag0 tag1) (KNot tag0 tag3) (KNot tag1 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and (not (Givenantena-height h1 tag0)) (Givenantena-height h0 tag0) (not (Givenantena-height h1 tag2)) (Givenantena-height h0 tag2))
)
(:action lower-antena-tag0-tag3
:parameters ()
:precondition 
(and (not (KNot tag0 tag3)) (KNot tag0 tag1) (KNot tag0 tag2) (KNot tag1 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and (not (Givenantena-height h1 tag0)) (Givenantena-height h0 tag0) (not (Givenantena-height h1 tag3)) (Givenantena-height h0 tag3))
)
(:action lower-antena-tag0
:parameters ()
:precondition 
(and (KNot tag0 tag1) (KNot tag0 tag2) (KNot tag0 tag3) (NotInAction ))
:effect 
(and (not (Givenantena-height h1 tag0)) (Givenantena-height h0 tag0))
)
(:action lower-antena-tag1-tag2-tag3
:parameters ()
:precondition 
(and (not (KNot tag1 tag2)) (not (KNot tag1 tag3)) (not (KNot tag2 tag3)) (KNot tag0 tag1) (KNot tag0 tag2) (KNot tag0 tag3) (NotInAction ))
:effect 
(and (not (Givenantena-height h1 tag1)) (Givenantena-height h0 tag1) (not (Givenantena-height h1 tag2)) (Givenantena-height h0 tag2) (not (Givenantena-height h1 tag3)) (Givenantena-height h0 tag3))
)
(:action lower-antena-tag1-tag2
:parameters ()
:precondition 
(and (not (KNot tag1 tag2)) (KNot tag0 tag1) (KNot tag1 tag3) (KNot tag0 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and (not (Givenantena-height h1 tag1)) (Givenantena-height h0 tag1) (not (Givenantena-height h1 tag2)) (Givenantena-height h0 tag2))
)
(:action lower-antena-tag1-tag3
:parameters ()
:precondition 
(and (not (KNot tag1 tag3)) (KNot tag0 tag1) (KNot tag1 tag2) (KNot tag0 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and (not (Givenantena-height h1 tag1)) (Givenantena-height h0 tag1) (not (Givenantena-height h1 tag3)) (Givenantena-height h0 tag3))
)
(:action lower-antena-tag1
:parameters ()
:precondition 
(and (KNot tag0 tag1) (KNot tag1 tag2) (KNot tag1 tag3) (NotInAction ))
:effect 
(and (not (Givenantena-height h1 tag1)) (Givenantena-height h0 tag1))
)
(:action lower-antena-tag2-tag3
:parameters ()
:precondition 
(and (not (KNot tag2 tag3)) (KNot tag0 tag2) (KNot tag1 tag2) (KNot tag0 tag3) (KNot tag1 tag3) (NotInAction ))
:effect 
(and (not (Givenantena-height h1 tag2)) (Givenantena-height h0 tag2) (not (Givenantena-height h1 tag3)) (Givenantena-height h0 tag3))
)
(:action lower-antena-tag2
:parameters ()
:precondition 
(and (KNot tag0 tag2) (KNot tag1 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and (not (Givenantena-height h1 tag2)) (Givenantena-height h0 tag2))
)
(:action lower-antena-tag3
:parameters ()
:precondition 
(and (KNot tag0 tag3) (KNot tag1 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and (not (Givenantena-height h1 tag3)) (Givenantena-height h0 tag3))
)
(:action activate-sensor-at-p1-8-h1-tag0-tag1-tag2-tag3
:parameters ()
:precondition 
(and (Givenagent-at p1-8 tag0) (Givenantena-height h1 tag0) (Givenagent-at p1-8 tag1) (Givenantena-height h1 tag1) (Givenagent-at p1-8 tag2) (Givenantena-height h1 tag2) (Givenagent-at p1-8 tag3) (Givenantena-height h1 tag3) (not (KNot tag0 tag1)) (not (KNot tag0 tag2)) (not (KNot tag0 tag3)) (not (KNot tag1 tag2)) (not (KNot tag1 tag3)) (not (KNot tag2 tag3)) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r1 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r1 tag2) (Givengood-rocks-in-range tag2))
	
	(when (Givengood r1 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r1 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r1 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r1 tag2)) (not (Givengood-rocks-in-range tag2)))
	
	(when (not (Givengood r1 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p1-8-h1-tag0-tag1-tag2
:parameters ()
:precondition 
(and (Givenagent-at p1-8 tag0) (Givenantena-height h1 tag0) (Givenagent-at p1-8 tag1) (Givenantena-height h1 tag1) (Givenagent-at p1-8 tag2) (Givenantena-height h1 tag2) (not (KNot tag0 tag1)) (not (KNot tag0 tag2)) (not (KNot tag1 tag2)) (KNot tag0 tag3) (KNot tag1 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r1 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r1 tag2) (Givengood-rocks-in-range tag2))
	
	(when (not (Givengood r1 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r1 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r1 tag2)) (not (Givengood-rocks-in-range tag2))))
)
(:action activate-sensor-at-p1-8-h1-tag0-tag1-tag3
:parameters ()
:precondition 
(and (Givenagent-at p1-8 tag0) (Givenantena-height h1 tag0) (Givenagent-at p1-8 tag1) (Givenantena-height h1 tag1) (Givenagent-at p1-8 tag3) (Givenantena-height h1 tag3) (not (KNot tag0 tag1)) (not (KNot tag0 tag3)) (not (KNot tag1 tag3)) (KNot tag0 tag2) (KNot tag1 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r1 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r1 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r1 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r1 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r1 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p1-8-h1-tag0-tag1
:parameters ()
:precondition 
(and (Givenagent-at p1-8 tag0) (Givenantena-height h1 tag0) (Givenagent-at p1-8 tag1) (Givenantena-height h1 tag1) (not (KNot tag0 tag1)) (KNot tag0 tag2) (KNot tag0 tag3) (KNot tag1 tag2) (KNot tag1 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r1 tag1) (Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r1 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r1 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p1-8-h1-tag0-tag2-tag3
:parameters ()
:precondition 
(and (Givenagent-at p1-8 tag0) (Givenantena-height h1 tag0) (Givenagent-at p1-8 tag2) (Givenantena-height h1 tag2) (Givenagent-at p1-8 tag3) (Givenantena-height h1 tag3) (not (KNot tag0 tag2)) (not (KNot tag0 tag3)) (not (KNot tag2 tag3)) (KNot tag0 tag1) (KNot tag1 tag2) (KNot tag1 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r1 tag2) (Givengood-rocks-in-range tag2))
	
	(when (Givengood r1 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r1 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r1 tag2)) (not (Givengood-rocks-in-range tag2)))
	
	(when (not (Givengood r1 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p1-8-h1-tag0-tag2
:parameters ()
:precondition 
(and (Givenagent-at p1-8 tag0) (Givenantena-height h1 tag0) (Givenagent-at p1-8 tag2) (Givenantena-height h1 tag2) (not (KNot tag0 tag2)) (KNot tag0 tag1) (KNot tag0 tag3) (KNot tag1 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r1 tag2) (Givengood-rocks-in-range tag2))
	
	(when (not (Givengood r1 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r1 tag2)) (not (Givengood-rocks-in-range tag2))))
)
(:action activate-sensor-at-p1-8-h1-tag0-tag3
:parameters ()
:precondition 
(and (Givenagent-at p1-8 tag0) (Givenantena-height h1 tag0) (Givenagent-at p1-8 tag3) (Givenantena-height h1 tag3) (not (KNot tag0 tag3)) (KNot tag0 tag1) (KNot tag0 tag2) (KNot tag1 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r1 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r1 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r1 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p1-8-h1-tag0
:parameters ()
:precondition 
(and (Givenagent-at p1-8 tag0) (Givenantena-height h1 tag0) (KNot tag0 tag1) (KNot tag0 tag2) (KNot tag0 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag0) (Givengood-rocks-in-range tag0))
	
	(when (not (Givengood r1 tag0)) (not (Givengood-rocks-in-range tag0))))
)
(:action activate-sensor-at-p1-8-h1-tag1-tag2-tag3
:parameters ()
:precondition 
(and (Givenagent-at p1-8 tag1) (Givenantena-height h1 tag1) (Givenagent-at p1-8 tag2) (Givenantena-height h1 tag2) (Givenagent-at p1-8 tag3) (Givenantena-height h1 tag3) (not (KNot tag1 tag2)) (not (KNot tag1 tag3)) (not (KNot tag2 tag3)) (KNot tag0 tag1) (KNot tag0 tag2) (KNot tag0 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r1 tag2) (Givengood-rocks-in-range tag2))
	
	(when (Givengood r1 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r1 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r1 tag2)) (not (Givengood-rocks-in-range tag2)))
	
	(when (not (Givengood r1 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p1-8-h1-tag1-tag2
:parameters ()
:precondition 
(and (Givenagent-at p1-8 tag1) (Givenantena-height h1 tag1) (Givenagent-at p1-8 tag2) (Givenantena-height h1 tag2) (not (KNot tag1 tag2)) (KNot tag0 tag1) (KNot tag1 tag3) (KNot tag0 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r1 tag2) (Givengood-rocks-in-range tag2))
	
	(when (not (Givengood r1 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r1 tag2)) (not (Givengood-rocks-in-range tag2))))
)
(:action activate-sensor-at-p1-8-h1-tag1-tag3
:parameters ()
:precondition 
(and (Givenagent-at p1-8 tag1) (Givenantena-height h1 tag1) (Givenagent-at p1-8 tag3) (Givenantena-height h1 tag3) (not (KNot tag1 tag3)) (KNot tag0 tag1) (KNot tag1 tag2) (KNot tag0 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r1 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r1 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r1 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p1-8-h1-tag1
:parameters ()
:precondition 
(and (Givenagent-at p1-8 tag1) (Givenantena-height h1 tag1) (KNot tag0 tag1) (KNot tag1 tag2) (KNot tag1 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag1) (Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r1 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p1-8-h1-tag2-tag3
:parameters ()
:precondition 
(and (Givenagent-at p1-8 tag2) (Givenantena-height h1 tag2) (Givenagent-at p1-8 tag3) (Givenantena-height h1 tag3) (not (KNot tag2 tag3)) (KNot tag0 tag2) (KNot tag1 tag2) (KNot tag0 tag3) (KNot tag1 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag2) (Givengood-rocks-in-range tag2))
	
	(when (Givengood r1 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r1 tag2)) (not (Givengood-rocks-in-range tag2)))
	
	(when (not (Givengood r1 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p1-8-h1-tag2
:parameters ()
:precondition 
(and (Givenagent-at p1-8 tag2) (Givenantena-height h1 tag2) (KNot tag0 tag2) (KNot tag1 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag2) (Givengood-rocks-in-range tag2))
	
	(when (not (Givengood r1 tag2)) (not (Givengood-rocks-in-range tag2))))
)
(:action activate-sensor-at-p1-8-h1-tag3
:parameters ()
:precondition 
(and (Givenagent-at p1-8 tag3) (Givenantena-height h1 tag3) (KNot tag0 tag3) (KNot tag1 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r1 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p2-7-h1-tag0-tag1-tag2-tag3
:parameters ()
:precondition 
(and (Givenagent-at p2-7 tag0) (Givenantena-height h1 tag0) (Givenagent-at p2-7 tag1) (Givenantena-height h1 tag1) (Givenagent-at p2-7 tag2) (Givenantena-height h1 tag2) (Givenagent-at p2-7 tag3) (Givenantena-height h1 tag3) (not (KNot tag0 tag1)) (not (KNot tag0 tag2)) (not (KNot tag0 tag3)) (not (KNot tag1 tag2)) (not (KNot tag1 tag3)) (not (KNot tag2 tag3)) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r1 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r1 tag2) (Givengood-rocks-in-range tag2))
	
	(when (Givengood r1 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r1 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r1 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r1 tag2)) (not (Givengood-rocks-in-range tag2)))
	
	(when (not (Givengood r1 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p2-7-h1-tag0-tag1-tag2
:parameters ()
:precondition 
(and (Givenagent-at p2-7 tag0) (Givenantena-height h1 tag0) (Givenagent-at p2-7 tag1) (Givenantena-height h1 tag1) (Givenagent-at p2-7 tag2) (Givenantena-height h1 tag2) (not (KNot tag0 tag1)) (not (KNot tag0 tag2)) (not (KNot tag1 tag2)) (KNot tag0 tag3) (KNot tag1 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r1 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r1 tag2) (Givengood-rocks-in-range tag2))
	
	(when (not (Givengood r1 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r1 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r1 tag2)) (not (Givengood-rocks-in-range tag2))))
)
(:action activate-sensor-at-p2-7-h1-tag0-tag1-tag3
:parameters ()
:precondition 
(and (Givenagent-at p2-7 tag0) (Givenantena-height h1 tag0) (Givenagent-at p2-7 tag1) (Givenantena-height h1 tag1) (Givenagent-at p2-7 tag3) (Givenantena-height h1 tag3) (not (KNot tag0 tag1)) (not (KNot tag0 tag3)) (not (KNot tag1 tag3)) (KNot tag0 tag2) (KNot tag1 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r1 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r1 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r1 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r1 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r1 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p2-7-h1-tag0-tag1
:parameters ()
:precondition 
(and (Givenagent-at p2-7 tag0) (Givenantena-height h1 tag0) (Givenagent-at p2-7 tag1) (Givenantena-height h1 tag1) (not (KNot tag0 tag1)) (KNot tag0 tag2) (KNot tag0 tag3) (KNot tag1 tag2) (KNot tag1 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r1 tag1) (Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r1 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r1 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p2-7-h1-tag0-tag2-tag3
:parameters ()
:precondition 
(and (Givenagent-at p2-7 tag0) (Givenantena-height h1 tag0) (Givenagent-at p2-7 tag2) (Givenantena-height h1 tag2) (Givenagent-at p2-7 tag3) (Givenantena-height h1 tag3) (not (KNot tag0 tag2)) (not (KNot tag0 tag3)) (not (KNot tag2 tag3)) (KNot tag0 tag1) (KNot tag1 tag2) (KNot tag1 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r1 tag2) (Givengood-rocks-in-range tag2))
	
	(when (Givengood r1 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r1 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r1 tag2)) (not (Givengood-rocks-in-range tag2)))
	
	(when (not (Givengood r1 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p2-7-h1-tag0-tag2
:parameters ()
:precondition 
(and (Givenagent-at p2-7 tag0) (Givenantena-height h1 tag0) (Givenagent-at p2-7 tag2) (Givenantena-height h1 tag2) (not (KNot tag0 tag2)) (KNot tag0 tag1) (KNot tag0 tag3) (KNot tag1 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r1 tag2) (Givengood-rocks-in-range tag2))
	
	(when (not (Givengood r1 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r1 tag2)) (not (Givengood-rocks-in-range tag2))))
)
(:action activate-sensor-at-p2-7-h1-tag0-tag3
:parameters ()
:precondition 
(and (Givenagent-at p2-7 tag0) (Givenantena-height h1 tag0) (Givenagent-at p2-7 tag3) (Givenantena-height h1 tag3) (not (KNot tag0 tag3)) (KNot tag0 tag1) (KNot tag0 tag2) (KNot tag1 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r1 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r1 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r1 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p2-7-h1-tag0
:parameters ()
:precondition 
(and (Givenagent-at p2-7 tag0) (Givenantena-height h1 tag0) (KNot tag0 tag1) (KNot tag0 tag2) (KNot tag0 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag0) (Givengood-rocks-in-range tag0))
	
	(when (not (Givengood r1 tag0)) (not (Givengood-rocks-in-range tag0))))
)
(:action activate-sensor-at-p2-7-h1-tag1-tag2-tag3
:parameters ()
:precondition 
(and (Givenagent-at p2-7 tag1) (Givenantena-height h1 tag1) (Givenagent-at p2-7 tag2) (Givenantena-height h1 tag2) (Givenagent-at p2-7 tag3) (Givenantena-height h1 tag3) (not (KNot tag1 tag2)) (not (KNot tag1 tag3)) (not (KNot tag2 tag3)) (KNot tag0 tag1) (KNot tag0 tag2) (KNot tag0 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r1 tag2) (Givengood-rocks-in-range tag2))
	
	(when (Givengood r1 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r1 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r1 tag2)) (not (Givengood-rocks-in-range tag2)))
	
	(when (not (Givengood r1 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p2-7-h1-tag1-tag2
:parameters ()
:precondition 
(and (Givenagent-at p2-7 tag1) (Givenantena-height h1 tag1) (Givenagent-at p2-7 tag2) (Givenantena-height h1 tag2) (not (KNot tag1 tag2)) (KNot tag0 tag1) (KNot tag1 tag3) (KNot tag0 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r1 tag2) (Givengood-rocks-in-range tag2))
	
	(when (not (Givengood r1 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r1 tag2)) (not (Givengood-rocks-in-range tag2))))
)
(:action activate-sensor-at-p2-7-h1-tag1-tag3
:parameters ()
:precondition 
(and (Givenagent-at p2-7 tag1) (Givenantena-height h1 tag1) (Givenagent-at p2-7 tag3) (Givenantena-height h1 tag3) (not (KNot tag1 tag3)) (KNot tag0 tag1) (KNot tag1 tag2) (KNot tag0 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r1 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r1 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r1 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p2-7-h1-tag1
:parameters ()
:precondition 
(and (Givenagent-at p2-7 tag1) (Givenantena-height h1 tag1) (KNot tag0 tag1) (KNot tag1 tag2) (KNot tag1 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag1) (Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r1 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p2-7-h1-tag2-tag3
:parameters ()
:precondition 
(and (Givenagent-at p2-7 tag2) (Givenantena-height h1 tag2) (Givenagent-at p2-7 tag3) (Givenantena-height h1 tag3) (not (KNot tag2 tag3)) (KNot tag0 tag2) (KNot tag1 tag2) (KNot tag0 tag3) (KNot tag1 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag2) (Givengood-rocks-in-range tag2))
	
	(when (Givengood r1 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r1 tag2)) (not (Givengood-rocks-in-range tag2)))
	
	(when (not (Givengood r1 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p2-7-h1-tag2
:parameters ()
:precondition 
(and (Givenagent-at p2-7 tag2) (Givenantena-height h1 tag2) (KNot tag0 tag2) (KNot tag1 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag2) (Givengood-rocks-in-range tag2))
	
	(when (not (Givengood r1 tag2)) (not (Givengood-rocks-in-range tag2))))
)
(:action activate-sensor-at-p2-7-h1-tag3
:parameters ()
:precondition 
(and (Givenagent-at p2-7 tag3) (Givenantena-height h1 tag3) (KNot tag0 tag3) (KNot tag1 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r1 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p2-8-h0-tag0-tag1-tag2-tag3
:parameters ()
:precondition 
(and (Givenagent-at p2-8 tag0) (Givenantena-height h0 tag0) (Givenagent-at p2-8 tag1) (Givenantena-height h0 tag1) (Givenagent-at p2-8 tag2) (Givenantena-height h0 tag2) (Givenagent-at p2-8 tag3) (Givenantena-height h0 tag3) (not (KNot tag0 tag1)) (not (KNot tag0 tag2)) (not (KNot tag0 tag3)) (not (KNot tag1 tag2)) (not (KNot tag1 tag3)) (not (KNot tag2 tag3)) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r1 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r1 tag2) (Givengood-rocks-in-range tag2))
	
	(when (Givengood r1 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r1 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r1 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r1 tag2)) (not (Givengood-rocks-in-range tag2)))
	
	(when (not (Givengood r1 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p2-8-h0-tag0-tag1-tag2
:parameters ()
:precondition 
(and (Givenagent-at p2-8 tag0) (Givenantena-height h0 tag0) (Givenagent-at p2-8 tag1) (Givenantena-height h0 tag1) (Givenagent-at p2-8 tag2) (Givenantena-height h0 tag2) (not (KNot tag0 tag1)) (not (KNot tag0 tag2)) (not (KNot tag1 tag2)) (KNot tag0 tag3) (KNot tag1 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r1 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r1 tag2) (Givengood-rocks-in-range tag2))
	
	(when (not (Givengood r1 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r1 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r1 tag2)) (not (Givengood-rocks-in-range tag2))))
)
(:action activate-sensor-at-p2-8-h0-tag0-tag1-tag3
:parameters ()
:precondition 
(and (Givenagent-at p2-8 tag0) (Givenantena-height h0 tag0) (Givenagent-at p2-8 tag1) (Givenantena-height h0 tag1) (Givenagent-at p2-8 tag3) (Givenantena-height h0 tag3) (not (KNot tag0 tag1)) (not (KNot tag0 tag3)) (not (KNot tag1 tag3)) (KNot tag0 tag2) (KNot tag1 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r1 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r1 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r1 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r1 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r1 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p2-8-h0-tag0-tag1
:parameters ()
:precondition 
(and (Givenagent-at p2-8 tag0) (Givenantena-height h0 tag0) (Givenagent-at p2-8 tag1) (Givenantena-height h0 tag1) (not (KNot tag0 tag1)) (KNot tag0 tag2) (KNot tag0 tag3) (KNot tag1 tag2) (KNot tag1 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r1 tag1) (Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r1 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r1 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p2-8-h0-tag0-tag2-tag3
:parameters ()
:precondition 
(and (Givenagent-at p2-8 tag0) (Givenantena-height h0 tag0) (Givenagent-at p2-8 tag2) (Givenantena-height h0 tag2) (Givenagent-at p2-8 tag3) (Givenantena-height h0 tag3) (not (KNot tag0 tag2)) (not (KNot tag0 tag3)) (not (KNot tag2 tag3)) (KNot tag0 tag1) (KNot tag1 tag2) (KNot tag1 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r1 tag2) (Givengood-rocks-in-range tag2))
	
	(when (Givengood r1 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r1 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r1 tag2)) (not (Givengood-rocks-in-range tag2)))
	
	(when (not (Givengood r1 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p2-8-h0-tag0-tag2
:parameters ()
:precondition 
(and (Givenagent-at p2-8 tag0) (Givenantena-height h0 tag0) (Givenagent-at p2-8 tag2) (Givenantena-height h0 tag2) (not (KNot tag0 tag2)) (KNot tag0 tag1) (KNot tag0 tag3) (KNot tag1 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r1 tag2) (Givengood-rocks-in-range tag2))
	
	(when (not (Givengood r1 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r1 tag2)) (not (Givengood-rocks-in-range tag2))))
)
(:action activate-sensor-at-p2-8-h0-tag0-tag3
:parameters ()
:precondition 
(and (Givenagent-at p2-8 tag0) (Givenantena-height h0 tag0) (Givenagent-at p2-8 tag3) (Givenantena-height h0 tag3) (not (KNot tag0 tag3)) (KNot tag0 tag1) (KNot tag0 tag2) (KNot tag1 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r1 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r1 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r1 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p2-8-h0-tag0
:parameters ()
:precondition 
(and (Givenagent-at p2-8 tag0) (Givenantena-height h0 tag0) (KNot tag0 tag1) (KNot tag0 tag2) (KNot tag0 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag0) (Givengood-rocks-in-range tag0))
	
	(when (not (Givengood r1 tag0)) (not (Givengood-rocks-in-range tag0))))
)
(:action activate-sensor-at-p2-8-h0-tag1-tag2-tag3
:parameters ()
:precondition 
(and (Givenagent-at p2-8 tag1) (Givenantena-height h0 tag1) (Givenagent-at p2-8 tag2) (Givenantena-height h0 tag2) (Givenagent-at p2-8 tag3) (Givenantena-height h0 tag3) (not (KNot tag1 tag2)) (not (KNot tag1 tag3)) (not (KNot tag2 tag3)) (KNot tag0 tag1) (KNot tag0 tag2) (KNot tag0 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r1 tag2) (Givengood-rocks-in-range tag2))
	
	(when (Givengood r1 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r1 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r1 tag2)) (not (Givengood-rocks-in-range tag2)))
	
	(when (not (Givengood r1 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p2-8-h0-tag1-tag2
:parameters ()
:precondition 
(and (Givenagent-at p2-8 tag1) (Givenantena-height h0 tag1) (Givenagent-at p2-8 tag2) (Givenantena-height h0 tag2) (not (KNot tag1 tag2)) (KNot tag0 tag1) (KNot tag1 tag3) (KNot tag0 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r1 tag2) (Givengood-rocks-in-range tag2))
	
	(when (not (Givengood r1 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r1 tag2)) (not (Givengood-rocks-in-range tag2))))
)
(:action activate-sensor-at-p2-8-h0-tag1-tag3
:parameters ()
:precondition 
(and (Givenagent-at p2-8 tag1) (Givenantena-height h0 tag1) (Givenagent-at p2-8 tag3) (Givenantena-height h0 tag3) (not (KNot tag1 tag3)) (KNot tag0 tag1) (KNot tag1 tag2) (KNot tag0 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r1 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r1 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r1 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p2-8-h0-tag1
:parameters ()
:precondition 
(and (Givenagent-at p2-8 tag1) (Givenantena-height h0 tag1) (KNot tag0 tag1) (KNot tag1 tag2) (KNot tag1 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag1) (Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r1 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p2-8-h0-tag2-tag3
:parameters ()
:precondition 
(and (Givenagent-at p2-8 tag2) (Givenantena-height h0 tag2) (Givenagent-at p2-8 tag3) (Givenantena-height h0 tag3) (not (KNot tag2 tag3)) (KNot tag0 tag2) (KNot tag1 tag2) (KNot tag0 tag3) (KNot tag1 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag2) (Givengood-rocks-in-range tag2))
	
	(when (Givengood r1 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r1 tag2)) (not (Givengood-rocks-in-range tag2)))
	
	(when (not (Givengood r1 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p2-8-h0-tag2
:parameters ()
:precondition 
(and (Givenagent-at p2-8 tag2) (Givenantena-height h0 tag2) (KNot tag0 tag2) (KNot tag1 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag2) (Givengood-rocks-in-range tag2))
	
	(when (not (Givengood r1 tag2)) (not (Givengood-rocks-in-range tag2))))
)
(:action activate-sensor-at-p2-8-h0-tag3
:parameters ()
:precondition 
(and (Givenagent-at p2-8 tag3) (Givenantena-height h0 tag3) (KNot tag0 tag3) (KNot tag1 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r1 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p2-8-h1-tag0-tag1-tag2-tag3
:parameters ()
:precondition 
(and (Givenagent-at p2-8 tag0) (Givenantena-height h1 tag0) (Givenagent-at p2-8 tag1) (Givenantena-height h1 tag1) (Givenagent-at p2-8 tag2) (Givenantena-height h1 tag2) (Givenagent-at p2-8 tag3) (Givenantena-height h1 tag3) (not (KNot tag0 tag1)) (not (KNot tag0 tag2)) (not (KNot tag0 tag3)) (not (KNot tag1 tag2)) (not (KNot tag1 tag3)) (not (KNot tag2 tag3)) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r1 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r1 tag2) (Givengood-rocks-in-range tag2))
	
	(when (Givengood r1 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r1 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r1 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r1 tag2)) (not (Givengood-rocks-in-range tag2)))
	
	(when (not (Givengood r1 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p2-8-h1-tag0-tag1-tag2
:parameters ()
:precondition 
(and (Givenagent-at p2-8 tag0) (Givenantena-height h1 tag0) (Givenagent-at p2-8 tag1) (Givenantena-height h1 tag1) (Givenagent-at p2-8 tag2) (Givenantena-height h1 tag2) (not (KNot tag0 tag1)) (not (KNot tag0 tag2)) (not (KNot tag1 tag2)) (KNot tag0 tag3) (KNot tag1 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r1 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r1 tag2) (Givengood-rocks-in-range tag2))
	
	(when (not (Givengood r1 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r1 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r1 tag2)) (not (Givengood-rocks-in-range tag2))))
)
(:action activate-sensor-at-p2-8-h1-tag0-tag1-tag3
:parameters ()
:precondition 
(and (Givenagent-at p2-8 tag0) (Givenantena-height h1 tag0) (Givenagent-at p2-8 tag1) (Givenantena-height h1 tag1) (Givenagent-at p2-8 tag3) (Givenantena-height h1 tag3) (not (KNot tag0 tag1)) (not (KNot tag0 tag3)) (not (KNot tag1 tag3)) (KNot tag0 tag2) (KNot tag1 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r1 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r1 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r1 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r1 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r1 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p2-8-h1-tag0-tag1
:parameters ()
:precondition 
(and (Givenagent-at p2-8 tag0) (Givenantena-height h1 tag0) (Givenagent-at p2-8 tag1) (Givenantena-height h1 tag1) (not (KNot tag0 tag1)) (KNot tag0 tag2) (KNot tag0 tag3) (KNot tag1 tag2) (KNot tag1 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r1 tag1) (Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r1 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r1 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p2-8-h1-tag0-tag2-tag3
:parameters ()
:precondition 
(and (Givenagent-at p2-8 tag0) (Givenantena-height h1 tag0) (Givenagent-at p2-8 tag2) (Givenantena-height h1 tag2) (Givenagent-at p2-8 tag3) (Givenantena-height h1 tag3) (not (KNot tag0 tag2)) (not (KNot tag0 tag3)) (not (KNot tag2 tag3)) (KNot tag0 tag1) (KNot tag1 tag2) (KNot tag1 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r1 tag2) (Givengood-rocks-in-range tag2))
	
	(when (Givengood r1 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r1 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r1 tag2)) (not (Givengood-rocks-in-range tag2)))
	
	(when (not (Givengood r1 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p2-8-h1-tag0-tag2
:parameters ()
:precondition 
(and (Givenagent-at p2-8 tag0) (Givenantena-height h1 tag0) (Givenagent-at p2-8 tag2) (Givenantena-height h1 tag2) (not (KNot tag0 tag2)) (KNot tag0 tag1) (KNot tag0 tag3) (KNot tag1 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r1 tag2) (Givengood-rocks-in-range tag2))
	
	(when (not (Givengood r1 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r1 tag2)) (not (Givengood-rocks-in-range tag2))))
)
(:action activate-sensor-at-p2-8-h1-tag0-tag3
:parameters ()
:precondition 
(and (Givenagent-at p2-8 tag0) (Givenantena-height h1 tag0) (Givenagent-at p2-8 tag3) (Givenantena-height h1 tag3) (not (KNot tag0 tag3)) (KNot tag0 tag1) (KNot tag0 tag2) (KNot tag1 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r1 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r1 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r1 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p2-8-h1-tag0
:parameters ()
:precondition 
(and (Givenagent-at p2-8 tag0) (Givenantena-height h1 tag0) (KNot tag0 tag1) (KNot tag0 tag2) (KNot tag0 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag0) (Givengood-rocks-in-range tag0))
	
	(when (not (Givengood r1 tag0)) (not (Givengood-rocks-in-range tag0))))
)
(:action activate-sensor-at-p2-8-h1-tag1-tag2-tag3
:parameters ()
:precondition 
(and (Givenagent-at p2-8 tag1) (Givenantena-height h1 tag1) (Givenagent-at p2-8 tag2) (Givenantena-height h1 tag2) (Givenagent-at p2-8 tag3) (Givenantena-height h1 tag3) (not (KNot tag1 tag2)) (not (KNot tag1 tag3)) (not (KNot tag2 tag3)) (KNot tag0 tag1) (KNot tag0 tag2) (KNot tag0 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r1 tag2) (Givengood-rocks-in-range tag2))
	
	(when (Givengood r1 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r1 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r1 tag2)) (not (Givengood-rocks-in-range tag2)))
	
	(when (not (Givengood r1 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p2-8-h1-tag1-tag2
:parameters ()
:precondition 
(and (Givenagent-at p2-8 tag1) (Givenantena-height h1 tag1) (Givenagent-at p2-8 tag2) (Givenantena-height h1 tag2) (not (KNot tag1 tag2)) (KNot tag0 tag1) (KNot tag1 tag3) (KNot tag0 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r1 tag2) (Givengood-rocks-in-range tag2))
	
	(when (not (Givengood r1 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r1 tag2)) (not (Givengood-rocks-in-range tag2))))
)
(:action activate-sensor-at-p2-8-h1-tag1-tag3
:parameters ()
:precondition 
(and (Givenagent-at p2-8 tag1) (Givenantena-height h1 tag1) (Givenagent-at p2-8 tag3) (Givenantena-height h1 tag3) (not (KNot tag1 tag3)) (KNot tag0 tag1) (KNot tag1 tag2) (KNot tag0 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r1 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r1 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r1 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p2-8-h1-tag1
:parameters ()
:precondition 
(and (Givenagent-at p2-8 tag1) (Givenantena-height h1 tag1) (KNot tag0 tag1) (KNot tag1 tag2) (KNot tag1 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag1) (Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r1 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p2-8-h1-tag2-tag3
:parameters ()
:precondition 
(and (Givenagent-at p2-8 tag2) (Givenantena-height h1 tag2) (Givenagent-at p2-8 tag3) (Givenantena-height h1 tag3) (not (KNot tag2 tag3)) (KNot tag0 tag2) (KNot tag1 tag2) (KNot tag0 tag3) (KNot tag1 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag2) (Givengood-rocks-in-range tag2))
	
	(when (Givengood r1 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r1 tag2)) (not (Givengood-rocks-in-range tag2)))
	
	(when (not (Givengood r1 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p2-8-h1-tag2
:parameters ()
:precondition 
(and (Givenagent-at p2-8 tag2) (Givenantena-height h1 tag2) (KNot tag0 tag2) (KNot tag1 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag2) (Givengood-rocks-in-range tag2))
	
	(when (not (Givengood r1 tag2)) (not (Givengood-rocks-in-range tag2))))
)
(:action activate-sensor-at-p2-8-h1-tag3
:parameters ()
:precondition 
(and (Givenagent-at p2-8 tag3) (Givenantena-height h1 tag3) (KNot tag0 tag3) (KNot tag1 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r1 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p3-8-h1-tag0-tag1-tag2-tag3
:parameters ()
:precondition 
(and (Givenagent-at p3-8 tag0) (Givenantena-height h1 tag0) (Givenagent-at p3-8 tag1) (Givenantena-height h1 tag1) (Givenagent-at p3-8 tag2) (Givenantena-height h1 tag2) (Givenagent-at p3-8 tag3) (Givenantena-height h1 tag3) (not (KNot tag0 tag1)) (not (KNot tag0 tag2)) (not (KNot tag0 tag3)) (not (KNot tag1 tag2)) (not (KNot tag1 tag3)) (not (KNot tag2 tag3)) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r1 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r1 tag2) (Givengood-rocks-in-range tag2))
	
	(when (Givengood r1 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r1 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r1 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r1 tag2)) (not (Givengood-rocks-in-range tag2)))
	
	(when (not (Givengood r1 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p3-8-h1-tag0-tag1-tag2
:parameters ()
:precondition 
(and (Givenagent-at p3-8 tag0) (Givenantena-height h1 tag0) (Givenagent-at p3-8 tag1) (Givenantena-height h1 tag1) (Givenagent-at p3-8 tag2) (Givenantena-height h1 tag2) (not (KNot tag0 tag1)) (not (KNot tag0 tag2)) (not (KNot tag1 tag2)) (KNot tag0 tag3) (KNot tag1 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r1 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r1 tag2) (Givengood-rocks-in-range tag2))
	
	(when (not (Givengood r1 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r1 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r1 tag2)) (not (Givengood-rocks-in-range tag2))))
)
(:action activate-sensor-at-p3-8-h1-tag0-tag1-tag3
:parameters ()
:precondition 
(and (Givenagent-at p3-8 tag0) (Givenantena-height h1 tag0) (Givenagent-at p3-8 tag1) (Givenantena-height h1 tag1) (Givenagent-at p3-8 tag3) (Givenantena-height h1 tag3) (not (KNot tag0 tag1)) (not (KNot tag0 tag3)) (not (KNot tag1 tag3)) (KNot tag0 tag2) (KNot tag1 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r1 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r1 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r1 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r1 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r1 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p3-8-h1-tag0-tag1
:parameters ()
:precondition 
(and (Givenagent-at p3-8 tag0) (Givenantena-height h1 tag0) (Givenagent-at p3-8 tag1) (Givenantena-height h1 tag1) (not (KNot tag0 tag1)) (KNot tag0 tag2) (KNot tag0 tag3) (KNot tag1 tag2) (KNot tag1 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r1 tag1) (Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r1 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r1 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p3-8-h1-tag0-tag2-tag3
:parameters ()
:precondition 
(and (Givenagent-at p3-8 tag0) (Givenantena-height h1 tag0) (Givenagent-at p3-8 tag2) (Givenantena-height h1 tag2) (Givenagent-at p3-8 tag3) (Givenantena-height h1 tag3) (not (KNot tag0 tag2)) (not (KNot tag0 tag3)) (not (KNot tag2 tag3)) (KNot tag0 tag1) (KNot tag1 tag2) (KNot tag1 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r1 tag2) (Givengood-rocks-in-range tag2))
	
	(when (Givengood r1 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r1 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r1 tag2)) (not (Givengood-rocks-in-range tag2)))
	
	(when (not (Givengood r1 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p3-8-h1-tag0-tag2
:parameters ()
:precondition 
(and (Givenagent-at p3-8 tag0) (Givenantena-height h1 tag0) (Givenagent-at p3-8 tag2) (Givenantena-height h1 tag2) (not (KNot tag0 tag2)) (KNot tag0 tag1) (KNot tag0 tag3) (KNot tag1 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r1 tag2) (Givengood-rocks-in-range tag2))
	
	(when (not (Givengood r1 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r1 tag2)) (not (Givengood-rocks-in-range tag2))))
)
(:action activate-sensor-at-p3-8-h1-tag0-tag3
:parameters ()
:precondition 
(and (Givenagent-at p3-8 tag0) (Givenantena-height h1 tag0) (Givenagent-at p3-8 tag3) (Givenantena-height h1 tag3) (not (KNot tag0 tag3)) (KNot tag0 tag1) (KNot tag0 tag2) (KNot tag1 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r1 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r1 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r1 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p3-8-h1-tag0
:parameters ()
:precondition 
(and (Givenagent-at p3-8 tag0) (Givenantena-height h1 tag0) (KNot tag0 tag1) (KNot tag0 tag2) (KNot tag0 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag0) (Givengood-rocks-in-range tag0))
	
	(when (not (Givengood r1 tag0)) (not (Givengood-rocks-in-range tag0))))
)
(:action activate-sensor-at-p3-8-h1-tag1-tag2-tag3
:parameters ()
:precondition 
(and (Givenagent-at p3-8 tag1) (Givenantena-height h1 tag1) (Givenagent-at p3-8 tag2) (Givenantena-height h1 tag2) (Givenagent-at p3-8 tag3) (Givenantena-height h1 tag3) (not (KNot tag1 tag2)) (not (KNot tag1 tag3)) (not (KNot tag2 tag3)) (KNot tag0 tag1) (KNot tag0 tag2) (KNot tag0 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r1 tag2) (Givengood-rocks-in-range tag2))
	
	(when (Givengood r1 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r1 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r1 tag2)) (not (Givengood-rocks-in-range tag2)))
	
	(when (not (Givengood r1 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p3-8-h1-tag1-tag2
:parameters ()
:precondition 
(and (Givenagent-at p3-8 tag1) (Givenantena-height h1 tag1) (Givenagent-at p3-8 tag2) (Givenantena-height h1 tag2) (not (KNot tag1 tag2)) (KNot tag0 tag1) (KNot tag1 tag3) (KNot tag0 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r1 tag2) (Givengood-rocks-in-range tag2))
	
	(when (not (Givengood r1 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r1 tag2)) (not (Givengood-rocks-in-range tag2))))
)
(:action activate-sensor-at-p3-8-h1-tag1-tag3
:parameters ()
:precondition 
(and (Givenagent-at p3-8 tag1) (Givenantena-height h1 tag1) (Givenagent-at p3-8 tag3) (Givenantena-height h1 tag3) (not (KNot tag1 tag3)) (KNot tag0 tag1) (KNot tag1 tag2) (KNot tag0 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r1 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r1 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r1 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p3-8-h1-tag1
:parameters ()
:precondition 
(and (Givenagent-at p3-8 tag1) (Givenantena-height h1 tag1) (KNot tag0 tag1) (KNot tag1 tag2) (KNot tag1 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag1) (Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r1 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p3-8-h1-tag2-tag3
:parameters ()
:precondition 
(and (Givenagent-at p3-8 tag2) (Givenantena-height h1 tag2) (Givenagent-at p3-8 tag3) (Givenantena-height h1 tag3) (not (KNot tag2 tag3)) (KNot tag0 tag2) (KNot tag1 tag2) (KNot tag0 tag3) (KNot tag1 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag2) (Givengood-rocks-in-range tag2))
	
	(when (Givengood r1 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r1 tag2)) (not (Givengood-rocks-in-range tag2)))
	
	(when (not (Givengood r1 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p3-8-h1-tag2
:parameters ()
:precondition 
(and (Givenagent-at p3-8 tag2) (Givenantena-height h1 tag2) (KNot tag0 tag2) (KNot tag1 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag2) (Givengood-rocks-in-range tag2))
	
	(when (not (Givengood r1 tag2)) (not (Givengood-rocks-in-range tag2))))
)
(:action activate-sensor-at-p3-8-h1-tag3
:parameters ()
:precondition 
(and (Givenagent-at p3-8 tag3) (Givenantena-height h1 tag3) (KNot tag0 tag3) (KNot tag1 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r1 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r1 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p6-4-h1-tag0-tag1-tag2-tag3
:parameters ()
:precondition 
(and (Givenagent-at p6-4 tag0) (Givenantena-height h1 tag0) (Givenagent-at p6-4 tag1) (Givenantena-height h1 tag1) (Givenagent-at p6-4 tag2) (Givenantena-height h1 tag2) (Givenagent-at p6-4 tag3) (Givenantena-height h1 tag3) (not (KNot tag0 tag1)) (not (KNot tag0 tag2)) (not (KNot tag0 tag3)) (not (KNot tag1 tag2)) (not (KNot tag1 tag3)) (not (KNot tag2 tag3)) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r0 tag2) (Givengood-rocks-in-range tag2))
	
	(when (Givengood r0 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r0 tag2)) (not (Givengood-rocks-in-range tag2)))
	
	(when (not (Givengood r0 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p6-4-h1-tag0-tag1-tag2
:parameters ()
:precondition 
(and (Givenagent-at p6-4 tag0) (Givenantena-height h1 tag0) (Givenagent-at p6-4 tag1) (Givenantena-height h1 tag1) (Givenagent-at p6-4 tag2) (Givenantena-height h1 tag2) (not (KNot tag0 tag1)) (not (KNot tag0 tag2)) (not (KNot tag1 tag2)) (KNot tag0 tag3) (KNot tag1 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r0 tag2) (Givengood-rocks-in-range tag2))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r0 tag2)) (not (Givengood-rocks-in-range tag2))))
)
(:action activate-sensor-at-p6-4-h1-tag0-tag1-tag3
:parameters ()
:precondition 
(and (Givenagent-at p6-4 tag0) (Givenantena-height h1 tag0) (Givenagent-at p6-4 tag1) (Givenantena-height h1 tag1) (Givenagent-at p6-4 tag3) (Givenantena-height h1 tag3) (not (KNot tag0 tag1)) (not (KNot tag0 tag3)) (not (KNot tag1 tag3)) (KNot tag0 tag2) (KNot tag1 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r0 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r0 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p6-4-h1-tag0-tag1
:parameters ()
:precondition 
(and (Givenagent-at p6-4 tag0) (Givenantena-height h1 tag0) (Givenagent-at p6-4 tag1) (Givenantena-height h1 tag1) (not (KNot tag0 tag1)) (KNot tag0 tag2) (KNot tag0 tag3) (KNot tag1 tag2) (KNot tag1 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p6-4-h1-tag0-tag2-tag3
:parameters ()
:precondition 
(and (Givenagent-at p6-4 tag0) (Givenantena-height h1 tag0) (Givenagent-at p6-4 tag2) (Givenantena-height h1 tag2) (Givenagent-at p6-4 tag3) (Givenantena-height h1 tag3) (not (KNot tag0 tag2)) (not (KNot tag0 tag3)) (not (KNot tag2 tag3)) (KNot tag0 tag1) (KNot tag1 tag2) (KNot tag1 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r0 tag2) (Givengood-rocks-in-range tag2))
	
	(when (Givengood r0 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r0 tag2)) (not (Givengood-rocks-in-range tag2)))
	
	(when (not (Givengood r0 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p6-4-h1-tag0-tag2
:parameters ()
:precondition 
(and (Givenagent-at p6-4 tag0) (Givenantena-height h1 tag0) (Givenagent-at p6-4 tag2) (Givenantena-height h1 tag2) (not (KNot tag0 tag2)) (KNot tag0 tag1) (KNot tag0 tag3) (KNot tag1 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r0 tag2) (Givengood-rocks-in-range tag2))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r0 tag2)) (not (Givengood-rocks-in-range tag2))))
)
(:action activate-sensor-at-p6-4-h1-tag0-tag3
:parameters ()
:precondition 
(and (Givenagent-at p6-4 tag0) (Givenantena-height h1 tag0) (Givenagent-at p6-4 tag3) (Givenantena-height h1 tag3) (not (KNot tag0 tag3)) (KNot tag0 tag1) (KNot tag0 tag2) (KNot tag1 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r0 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r0 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p6-4-h1-tag0
:parameters ()
:precondition 
(and (Givenagent-at p6-4 tag0) (Givenantena-height h1 tag0) (KNot tag0 tag1) (KNot tag0 tag2) (KNot tag0 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0))))
)
(:action activate-sensor-at-p6-4-h1-tag1-tag2-tag3
:parameters ()
:precondition 
(and (Givenagent-at p6-4 tag1) (Givenantena-height h1 tag1) (Givenagent-at p6-4 tag2) (Givenantena-height h1 tag2) (Givenagent-at p6-4 tag3) (Givenantena-height h1 tag3) (not (KNot tag1 tag2)) (not (KNot tag1 tag3)) (not (KNot tag2 tag3)) (KNot tag0 tag1) (KNot tag0 tag2) (KNot tag0 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r0 tag2) (Givengood-rocks-in-range tag2))
	
	(when (Givengood r0 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r0 tag2)) (not (Givengood-rocks-in-range tag2)))
	
	(when (not (Givengood r0 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p6-4-h1-tag1-tag2
:parameters ()
:precondition 
(and (Givenagent-at p6-4 tag1) (Givenantena-height h1 tag1) (Givenagent-at p6-4 tag2) (Givenantena-height h1 tag2) (not (KNot tag1 tag2)) (KNot tag0 tag1) (KNot tag1 tag3) (KNot tag0 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r0 tag2) (Givengood-rocks-in-range tag2))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r0 tag2)) (not (Givengood-rocks-in-range tag2))))
)
(:action activate-sensor-at-p6-4-h1-tag1-tag3
:parameters ()
:precondition 
(and (Givenagent-at p6-4 tag1) (Givenantena-height h1 tag1) (Givenagent-at p6-4 tag3) (Givenantena-height h1 tag3) (not (KNot tag1 tag3)) (KNot tag0 tag1) (KNot tag1 tag2) (KNot tag0 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r0 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r0 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p6-4-h1-tag1
:parameters ()
:precondition 
(and (Givenagent-at p6-4 tag1) (Givenantena-height h1 tag1) (KNot tag0 tag1) (KNot tag1 tag2) (KNot tag1 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p6-4-h1-tag2-tag3
:parameters ()
:precondition 
(and (Givenagent-at p6-4 tag2) (Givenantena-height h1 tag2) (Givenagent-at p6-4 tag3) (Givenantena-height h1 tag3) (not (KNot tag2 tag3)) (KNot tag0 tag2) (KNot tag1 tag2) (KNot tag0 tag3) (KNot tag1 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag2) (Givengood-rocks-in-range tag2))
	
	(when (Givengood r0 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r0 tag2)) (not (Givengood-rocks-in-range tag2)))
	
	(when (not (Givengood r0 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p6-4-h1-tag2
:parameters ()
:precondition 
(and (Givenagent-at p6-4 tag2) (Givenantena-height h1 tag2) (KNot tag0 tag2) (KNot tag1 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag2) (Givengood-rocks-in-range tag2))
	
	(when (not (Givengood r0 tag2)) (not (Givengood-rocks-in-range tag2))))
)
(:action activate-sensor-at-p6-4-h1-tag3
:parameters ()
:precondition 
(and (Givenagent-at p6-4 tag3) (Givenantena-height h1 tag3) (KNot tag0 tag3) (KNot tag1 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r0 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p7-3-h1-tag0-tag1-tag2-tag3
:parameters ()
:precondition 
(and (Givenagent-at p7-3 tag0) (Givenantena-height h1 tag0) (Givenagent-at p7-3 tag1) (Givenantena-height h1 tag1) (Givenagent-at p7-3 tag2) (Givenantena-height h1 tag2) (Givenagent-at p7-3 tag3) (Givenantena-height h1 tag3) (not (KNot tag0 tag1)) (not (KNot tag0 tag2)) (not (KNot tag0 tag3)) (not (KNot tag1 tag2)) (not (KNot tag1 tag3)) (not (KNot tag2 tag3)) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r0 tag2) (Givengood-rocks-in-range tag2))
	
	(when (Givengood r0 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r0 tag2)) (not (Givengood-rocks-in-range tag2)))
	
	(when (not (Givengood r0 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p7-3-h1-tag0-tag1-tag2
:parameters ()
:precondition 
(and (Givenagent-at p7-3 tag0) (Givenantena-height h1 tag0) (Givenagent-at p7-3 tag1) (Givenantena-height h1 tag1) (Givenagent-at p7-3 tag2) (Givenantena-height h1 tag2) (not (KNot tag0 tag1)) (not (KNot tag0 tag2)) (not (KNot tag1 tag2)) (KNot tag0 tag3) (KNot tag1 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r0 tag2) (Givengood-rocks-in-range tag2))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r0 tag2)) (not (Givengood-rocks-in-range tag2))))
)
(:action activate-sensor-at-p7-3-h1-tag0-tag1-tag3
:parameters ()
:precondition 
(and (Givenagent-at p7-3 tag0) (Givenantena-height h1 tag0) (Givenagent-at p7-3 tag1) (Givenantena-height h1 tag1) (Givenagent-at p7-3 tag3) (Givenantena-height h1 tag3) (not (KNot tag0 tag1)) (not (KNot tag0 tag3)) (not (KNot tag1 tag3)) (KNot tag0 tag2) (KNot tag1 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r0 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r0 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p7-3-h1-tag0-tag1
:parameters ()
:precondition 
(and (Givenagent-at p7-3 tag0) (Givenantena-height h1 tag0) (Givenagent-at p7-3 tag1) (Givenantena-height h1 tag1) (not (KNot tag0 tag1)) (KNot tag0 tag2) (KNot tag0 tag3) (KNot tag1 tag2) (KNot tag1 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p7-3-h1-tag0-tag2-tag3
:parameters ()
:precondition 
(and (Givenagent-at p7-3 tag0) (Givenantena-height h1 tag0) (Givenagent-at p7-3 tag2) (Givenantena-height h1 tag2) (Givenagent-at p7-3 tag3) (Givenantena-height h1 tag3) (not (KNot tag0 tag2)) (not (KNot tag0 tag3)) (not (KNot tag2 tag3)) (KNot tag0 tag1) (KNot tag1 tag2) (KNot tag1 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r0 tag2) (Givengood-rocks-in-range tag2))
	
	(when (Givengood r0 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r0 tag2)) (not (Givengood-rocks-in-range tag2)))
	
	(when (not (Givengood r0 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p7-3-h1-tag0-tag2
:parameters ()
:precondition 
(and (Givenagent-at p7-3 tag0) (Givenantena-height h1 tag0) (Givenagent-at p7-3 tag2) (Givenantena-height h1 tag2) (not (KNot tag0 tag2)) (KNot tag0 tag1) (KNot tag0 tag3) (KNot tag1 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r0 tag2) (Givengood-rocks-in-range tag2))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r0 tag2)) (not (Givengood-rocks-in-range tag2))))
)
(:action activate-sensor-at-p7-3-h1-tag0-tag3
:parameters ()
:precondition 
(and (Givenagent-at p7-3 tag0) (Givenantena-height h1 tag0) (Givenagent-at p7-3 tag3) (Givenantena-height h1 tag3) (not (KNot tag0 tag3)) (KNot tag0 tag1) (KNot tag0 tag2) (KNot tag1 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r0 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r0 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p7-3-h1-tag0
:parameters ()
:precondition 
(and (Givenagent-at p7-3 tag0) (Givenantena-height h1 tag0) (KNot tag0 tag1) (KNot tag0 tag2) (KNot tag0 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0))))
)
(:action activate-sensor-at-p7-3-h1-tag1-tag2-tag3
:parameters ()
:precondition 
(and (Givenagent-at p7-3 tag1) (Givenantena-height h1 tag1) (Givenagent-at p7-3 tag2) (Givenantena-height h1 tag2) (Givenagent-at p7-3 tag3) (Givenantena-height h1 tag3) (not (KNot tag1 tag2)) (not (KNot tag1 tag3)) (not (KNot tag2 tag3)) (KNot tag0 tag1) (KNot tag0 tag2) (KNot tag0 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r0 tag2) (Givengood-rocks-in-range tag2))
	
	(when (Givengood r0 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r0 tag2)) (not (Givengood-rocks-in-range tag2)))
	
	(when (not (Givengood r0 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p7-3-h1-tag1-tag2
:parameters ()
:precondition 
(and (Givenagent-at p7-3 tag1) (Givenantena-height h1 tag1) (Givenagent-at p7-3 tag2) (Givenantena-height h1 tag2) (not (KNot tag1 tag2)) (KNot tag0 tag1) (KNot tag1 tag3) (KNot tag0 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r0 tag2) (Givengood-rocks-in-range tag2))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r0 tag2)) (not (Givengood-rocks-in-range tag2))))
)
(:action activate-sensor-at-p7-3-h1-tag1-tag3
:parameters ()
:precondition 
(and (Givenagent-at p7-3 tag1) (Givenantena-height h1 tag1) (Givenagent-at p7-3 tag3) (Givenantena-height h1 tag3) (not (KNot tag1 tag3)) (KNot tag0 tag1) (KNot tag1 tag2) (KNot tag0 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r0 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r0 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p7-3-h1-tag1
:parameters ()
:precondition 
(and (Givenagent-at p7-3 tag1) (Givenantena-height h1 tag1) (KNot tag0 tag1) (KNot tag1 tag2) (KNot tag1 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p7-3-h1-tag2-tag3
:parameters ()
:precondition 
(and (Givenagent-at p7-3 tag2) (Givenantena-height h1 tag2) (Givenagent-at p7-3 tag3) (Givenantena-height h1 tag3) (not (KNot tag2 tag3)) (KNot tag0 tag2) (KNot tag1 tag2) (KNot tag0 tag3) (KNot tag1 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag2) (Givengood-rocks-in-range tag2))
	
	(when (Givengood r0 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r0 tag2)) (not (Givengood-rocks-in-range tag2)))
	
	(when (not (Givengood r0 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p7-3-h1-tag2
:parameters ()
:precondition 
(and (Givenagent-at p7-3 tag2) (Givenantena-height h1 tag2) (KNot tag0 tag2) (KNot tag1 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag2) (Givengood-rocks-in-range tag2))
	
	(when (not (Givengood r0 tag2)) (not (Givengood-rocks-in-range tag2))))
)
(:action activate-sensor-at-p7-3-h1-tag3
:parameters ()
:precondition 
(and (Givenagent-at p7-3 tag3) (Givenantena-height h1 tag3) (KNot tag0 tag3) (KNot tag1 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r0 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p7-4-h0-tag0-tag1-tag2-tag3
:parameters ()
:precondition 
(and (Givenagent-at p7-4 tag0) (Givenantena-height h0 tag0) (Givenagent-at p7-4 tag1) (Givenantena-height h0 tag1) (Givenagent-at p7-4 tag2) (Givenantena-height h0 tag2) (Givenagent-at p7-4 tag3) (Givenantena-height h0 tag3) (not (KNot tag0 tag1)) (not (KNot tag0 tag2)) (not (KNot tag0 tag3)) (not (KNot tag1 tag2)) (not (KNot tag1 tag3)) (not (KNot tag2 tag3)) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r0 tag2) (Givengood-rocks-in-range tag2))
	
	(when (Givengood r0 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r0 tag2)) (not (Givengood-rocks-in-range tag2)))
	
	(when (not (Givengood r0 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p7-4-h0-tag0-tag1-tag2
:parameters ()
:precondition 
(and (Givenagent-at p7-4 tag0) (Givenantena-height h0 tag0) (Givenagent-at p7-4 tag1) (Givenantena-height h0 tag1) (Givenagent-at p7-4 tag2) (Givenantena-height h0 tag2) (not (KNot tag0 tag1)) (not (KNot tag0 tag2)) (not (KNot tag1 tag2)) (KNot tag0 tag3) (KNot tag1 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r0 tag2) (Givengood-rocks-in-range tag2))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r0 tag2)) (not (Givengood-rocks-in-range tag2))))
)
(:action activate-sensor-at-p7-4-h0-tag0-tag1-tag3
:parameters ()
:precondition 
(and (Givenagent-at p7-4 tag0) (Givenantena-height h0 tag0) (Givenagent-at p7-4 tag1) (Givenantena-height h0 tag1) (Givenagent-at p7-4 tag3) (Givenantena-height h0 tag3) (not (KNot tag0 tag1)) (not (KNot tag0 tag3)) (not (KNot tag1 tag3)) (KNot tag0 tag2) (KNot tag1 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r0 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r0 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p7-4-h0-tag0-tag1
:parameters ()
:precondition 
(and (Givenagent-at p7-4 tag0) (Givenantena-height h0 tag0) (Givenagent-at p7-4 tag1) (Givenantena-height h0 tag1) (not (KNot tag0 tag1)) (KNot tag0 tag2) (KNot tag0 tag3) (KNot tag1 tag2) (KNot tag1 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p7-4-h0-tag0-tag2-tag3
:parameters ()
:precondition 
(and (Givenagent-at p7-4 tag0) (Givenantena-height h0 tag0) (Givenagent-at p7-4 tag2) (Givenantena-height h0 tag2) (Givenagent-at p7-4 tag3) (Givenantena-height h0 tag3) (not (KNot tag0 tag2)) (not (KNot tag0 tag3)) (not (KNot tag2 tag3)) (KNot tag0 tag1) (KNot tag1 tag2) (KNot tag1 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r0 tag2) (Givengood-rocks-in-range tag2))
	
	(when (Givengood r0 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r0 tag2)) (not (Givengood-rocks-in-range tag2)))
	
	(when (not (Givengood r0 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p7-4-h0-tag0-tag2
:parameters ()
:precondition 
(and (Givenagent-at p7-4 tag0) (Givenantena-height h0 tag0) (Givenagent-at p7-4 tag2) (Givenantena-height h0 tag2) (not (KNot tag0 tag2)) (KNot tag0 tag1) (KNot tag0 tag3) (KNot tag1 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r0 tag2) (Givengood-rocks-in-range tag2))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r0 tag2)) (not (Givengood-rocks-in-range tag2))))
)
(:action activate-sensor-at-p7-4-h0-tag0-tag3
:parameters ()
:precondition 
(and (Givenagent-at p7-4 tag0) (Givenantena-height h0 tag0) (Givenagent-at p7-4 tag3) (Givenantena-height h0 tag3) (not (KNot tag0 tag3)) (KNot tag0 tag1) (KNot tag0 tag2) (KNot tag1 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r0 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r0 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p7-4-h0-tag0
:parameters ()
:precondition 
(and (Givenagent-at p7-4 tag0) (Givenantena-height h0 tag0) (KNot tag0 tag1) (KNot tag0 tag2) (KNot tag0 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0))))
)
(:action activate-sensor-at-p7-4-h0-tag1-tag2-tag3
:parameters ()
:precondition 
(and (Givenagent-at p7-4 tag1) (Givenantena-height h0 tag1) (Givenagent-at p7-4 tag2) (Givenantena-height h0 tag2) (Givenagent-at p7-4 tag3) (Givenantena-height h0 tag3) (not (KNot tag1 tag2)) (not (KNot tag1 tag3)) (not (KNot tag2 tag3)) (KNot tag0 tag1) (KNot tag0 tag2) (KNot tag0 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r0 tag2) (Givengood-rocks-in-range tag2))
	
	(when (Givengood r0 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r0 tag2)) (not (Givengood-rocks-in-range tag2)))
	
	(when (not (Givengood r0 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p7-4-h0-tag1-tag2
:parameters ()
:precondition 
(and (Givenagent-at p7-4 tag1) (Givenantena-height h0 tag1) (Givenagent-at p7-4 tag2) (Givenantena-height h0 tag2) (not (KNot tag1 tag2)) (KNot tag0 tag1) (KNot tag1 tag3) (KNot tag0 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r0 tag2) (Givengood-rocks-in-range tag2))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r0 tag2)) (not (Givengood-rocks-in-range tag2))))
)
(:action activate-sensor-at-p7-4-h0-tag1-tag3
:parameters ()
:precondition 
(and (Givenagent-at p7-4 tag1) (Givenantena-height h0 tag1) (Givenagent-at p7-4 tag3) (Givenantena-height h0 tag3) (not (KNot tag1 tag3)) (KNot tag0 tag1) (KNot tag1 tag2) (KNot tag0 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r0 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r0 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p7-4-h0-tag1
:parameters ()
:precondition 
(and (Givenagent-at p7-4 tag1) (Givenantena-height h0 tag1) (KNot tag0 tag1) (KNot tag1 tag2) (KNot tag1 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p7-4-h0-tag2-tag3
:parameters ()
:precondition 
(and (Givenagent-at p7-4 tag2) (Givenantena-height h0 tag2) (Givenagent-at p7-4 tag3) (Givenantena-height h0 tag3) (not (KNot tag2 tag3)) (KNot tag0 tag2) (KNot tag1 tag2) (KNot tag0 tag3) (KNot tag1 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag2) (Givengood-rocks-in-range tag2))
	
	(when (Givengood r0 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r0 tag2)) (not (Givengood-rocks-in-range tag2)))
	
	(when (not (Givengood r0 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p7-4-h0-tag2
:parameters ()
:precondition 
(and (Givenagent-at p7-4 tag2) (Givenantena-height h0 tag2) (KNot tag0 tag2) (KNot tag1 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag2) (Givengood-rocks-in-range tag2))
	
	(when (not (Givengood r0 tag2)) (not (Givengood-rocks-in-range tag2))))
)
(:action activate-sensor-at-p7-4-h0-tag3
:parameters ()
:precondition 
(and (Givenagent-at p7-4 tag3) (Givenantena-height h0 tag3) (KNot tag0 tag3) (KNot tag1 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r0 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p7-4-h1-tag0-tag1-tag2-tag3
:parameters ()
:precondition 
(and (Givenagent-at p7-4 tag0) (Givenantena-height h1 tag0) (Givenagent-at p7-4 tag1) (Givenantena-height h1 tag1) (Givenagent-at p7-4 tag2) (Givenantena-height h1 tag2) (Givenagent-at p7-4 tag3) (Givenantena-height h1 tag3) (not (KNot tag0 tag1)) (not (KNot tag0 tag2)) (not (KNot tag0 tag3)) (not (KNot tag1 tag2)) (not (KNot tag1 tag3)) (not (KNot tag2 tag3)) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r0 tag2) (Givengood-rocks-in-range tag2))
	
	(when (Givengood r0 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r0 tag2)) (not (Givengood-rocks-in-range tag2)))
	
	(when (not (Givengood r0 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p7-4-h1-tag0-tag1-tag2
:parameters ()
:precondition 
(and (Givenagent-at p7-4 tag0) (Givenantena-height h1 tag0) (Givenagent-at p7-4 tag1) (Givenantena-height h1 tag1) (Givenagent-at p7-4 tag2) (Givenantena-height h1 tag2) (not (KNot tag0 tag1)) (not (KNot tag0 tag2)) (not (KNot tag1 tag2)) (KNot tag0 tag3) (KNot tag1 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r0 tag2) (Givengood-rocks-in-range tag2))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r0 tag2)) (not (Givengood-rocks-in-range tag2))))
)
(:action activate-sensor-at-p7-4-h1-tag0-tag1-tag3
:parameters ()
:precondition 
(and (Givenagent-at p7-4 tag0) (Givenantena-height h1 tag0) (Givenagent-at p7-4 tag1) (Givenantena-height h1 tag1) (Givenagent-at p7-4 tag3) (Givenantena-height h1 tag3) (not (KNot tag0 tag1)) (not (KNot tag0 tag3)) (not (KNot tag1 tag3)) (KNot tag0 tag2) (KNot tag1 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r0 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r0 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p7-4-h1-tag0-tag1
:parameters ()
:precondition 
(and (Givenagent-at p7-4 tag0) (Givenantena-height h1 tag0) (Givenagent-at p7-4 tag1) (Givenantena-height h1 tag1) (not (KNot tag0 tag1)) (KNot tag0 tag2) (KNot tag0 tag3) (KNot tag1 tag2) (KNot tag1 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p7-4-h1-tag0-tag2-tag3
:parameters ()
:precondition 
(and (Givenagent-at p7-4 tag0) (Givenantena-height h1 tag0) (Givenagent-at p7-4 tag2) (Givenantena-height h1 tag2) (Givenagent-at p7-4 tag3) (Givenantena-height h1 tag3) (not (KNot tag0 tag2)) (not (KNot tag0 tag3)) (not (KNot tag2 tag3)) (KNot tag0 tag1) (KNot tag1 tag2) (KNot tag1 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r0 tag2) (Givengood-rocks-in-range tag2))
	
	(when (Givengood r0 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r0 tag2)) (not (Givengood-rocks-in-range tag2)))
	
	(when (not (Givengood r0 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p7-4-h1-tag0-tag2
:parameters ()
:precondition 
(and (Givenagent-at p7-4 tag0) (Givenantena-height h1 tag0) (Givenagent-at p7-4 tag2) (Givenantena-height h1 tag2) (not (KNot tag0 tag2)) (KNot tag0 tag1) (KNot tag0 tag3) (KNot tag1 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r0 tag2) (Givengood-rocks-in-range tag2))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r0 tag2)) (not (Givengood-rocks-in-range tag2))))
)
(:action activate-sensor-at-p7-4-h1-tag0-tag3
:parameters ()
:precondition 
(and (Givenagent-at p7-4 tag0) (Givenantena-height h1 tag0) (Givenagent-at p7-4 tag3) (Givenantena-height h1 tag3) (not (KNot tag0 tag3)) (KNot tag0 tag1) (KNot tag0 tag2) (KNot tag1 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r0 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r0 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p7-4-h1-tag0
:parameters ()
:precondition 
(and (Givenagent-at p7-4 tag0) (Givenantena-height h1 tag0) (KNot tag0 tag1) (KNot tag0 tag2) (KNot tag0 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0))))
)
(:action activate-sensor-at-p7-4-h1-tag1-tag2-tag3
:parameters ()
:precondition 
(and (Givenagent-at p7-4 tag1) (Givenantena-height h1 tag1) (Givenagent-at p7-4 tag2) (Givenantena-height h1 tag2) (Givenagent-at p7-4 tag3) (Givenantena-height h1 tag3) (not (KNot tag1 tag2)) (not (KNot tag1 tag3)) (not (KNot tag2 tag3)) (KNot tag0 tag1) (KNot tag0 tag2) (KNot tag0 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r0 tag2) (Givengood-rocks-in-range tag2))
	
	(when (Givengood r0 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r0 tag2)) (not (Givengood-rocks-in-range tag2)))
	
	(when (not (Givengood r0 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p7-4-h1-tag1-tag2
:parameters ()
:precondition 
(and (Givenagent-at p7-4 tag1) (Givenantena-height h1 tag1) (Givenagent-at p7-4 tag2) (Givenantena-height h1 tag2) (not (KNot tag1 tag2)) (KNot tag0 tag1) (KNot tag1 tag3) (KNot tag0 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r0 tag2) (Givengood-rocks-in-range tag2))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r0 tag2)) (not (Givengood-rocks-in-range tag2))))
)
(:action activate-sensor-at-p7-4-h1-tag1-tag3
:parameters ()
:precondition 
(and (Givenagent-at p7-4 tag1) (Givenantena-height h1 tag1) (Givenagent-at p7-4 tag3) (Givenantena-height h1 tag3) (not (KNot tag1 tag3)) (KNot tag0 tag1) (KNot tag1 tag2) (KNot tag0 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r0 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r0 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p7-4-h1-tag1
:parameters ()
:precondition 
(and (Givenagent-at p7-4 tag1) (Givenantena-height h1 tag1) (KNot tag0 tag1) (KNot tag1 tag2) (KNot tag1 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p7-4-h1-tag2-tag3
:parameters ()
:precondition 
(and (Givenagent-at p7-4 tag2) (Givenantena-height h1 tag2) (Givenagent-at p7-4 tag3) (Givenantena-height h1 tag3) (not (KNot tag2 tag3)) (KNot tag0 tag2) (KNot tag1 tag2) (KNot tag0 tag3) (KNot tag1 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag2) (Givengood-rocks-in-range tag2))
	
	(when (Givengood r0 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r0 tag2)) (not (Givengood-rocks-in-range tag2)))
	
	(when (not (Givengood r0 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p7-4-h1-tag2
:parameters ()
:precondition 
(and (Givenagent-at p7-4 tag2) (Givenantena-height h1 tag2) (KNot tag0 tag2) (KNot tag1 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag2) (Givengood-rocks-in-range tag2))
	
	(when (not (Givengood r0 tag2)) (not (Givengood-rocks-in-range tag2))))
)
(:action activate-sensor-at-p7-4-h1-tag3
:parameters ()
:precondition 
(and (Givenagent-at p7-4 tag3) (Givenantena-height h1 tag3) (KNot tag0 tag3) (KNot tag1 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r0 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p7-5-h1-tag0-tag1-tag2-tag3
:parameters ()
:precondition 
(and (Givenagent-at p7-5 tag0) (Givenantena-height h1 tag0) (Givenagent-at p7-5 tag1) (Givenantena-height h1 tag1) (Givenagent-at p7-5 tag2) (Givenantena-height h1 tag2) (Givenagent-at p7-5 tag3) (Givenantena-height h1 tag3) (not (KNot tag0 tag1)) (not (KNot tag0 tag2)) (not (KNot tag0 tag3)) (not (KNot tag1 tag2)) (not (KNot tag1 tag3)) (not (KNot tag2 tag3)) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r0 tag2) (Givengood-rocks-in-range tag2))
	
	(when (Givengood r0 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r0 tag2)) (not (Givengood-rocks-in-range tag2)))
	
	(when (not (Givengood r0 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p7-5-h1-tag0-tag1-tag2
:parameters ()
:precondition 
(and (Givenagent-at p7-5 tag0) (Givenantena-height h1 tag0) (Givenagent-at p7-5 tag1) (Givenantena-height h1 tag1) (Givenagent-at p7-5 tag2) (Givenantena-height h1 tag2) (not (KNot tag0 tag1)) (not (KNot tag0 tag2)) (not (KNot tag1 tag2)) (KNot tag0 tag3) (KNot tag1 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r0 tag2) (Givengood-rocks-in-range tag2))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r0 tag2)) (not (Givengood-rocks-in-range tag2))))
)
(:action activate-sensor-at-p7-5-h1-tag0-tag1-tag3
:parameters ()
:precondition 
(and (Givenagent-at p7-5 tag0) (Givenantena-height h1 tag0) (Givenagent-at p7-5 tag1) (Givenantena-height h1 tag1) (Givenagent-at p7-5 tag3) (Givenantena-height h1 tag3) (not (KNot tag0 tag1)) (not (KNot tag0 tag3)) (not (KNot tag1 tag3)) (KNot tag0 tag2) (KNot tag1 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r0 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r0 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p7-5-h1-tag0-tag1
:parameters ()
:precondition 
(and (Givenagent-at p7-5 tag0) (Givenantena-height h1 tag0) (Givenagent-at p7-5 tag1) (Givenantena-height h1 tag1) (not (KNot tag0 tag1)) (KNot tag0 tag2) (KNot tag0 tag3) (KNot tag1 tag2) (KNot tag1 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p7-5-h1-tag0-tag2-tag3
:parameters ()
:precondition 
(and (Givenagent-at p7-5 tag0) (Givenantena-height h1 tag0) (Givenagent-at p7-5 tag2) (Givenantena-height h1 tag2) (Givenagent-at p7-5 tag3) (Givenantena-height h1 tag3) (not (KNot tag0 tag2)) (not (KNot tag0 tag3)) (not (KNot tag2 tag3)) (KNot tag0 tag1) (KNot tag1 tag2) (KNot tag1 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r0 tag2) (Givengood-rocks-in-range tag2))
	
	(when (Givengood r0 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r0 tag2)) (not (Givengood-rocks-in-range tag2)))
	
	(when (not (Givengood r0 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p7-5-h1-tag0-tag2
:parameters ()
:precondition 
(and (Givenagent-at p7-5 tag0) (Givenantena-height h1 tag0) (Givenagent-at p7-5 tag2) (Givenantena-height h1 tag2) (not (KNot tag0 tag2)) (KNot tag0 tag1) (KNot tag0 tag3) (KNot tag1 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r0 tag2) (Givengood-rocks-in-range tag2))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r0 tag2)) (not (Givengood-rocks-in-range tag2))))
)
(:action activate-sensor-at-p7-5-h1-tag0-tag3
:parameters ()
:precondition 
(and (Givenagent-at p7-5 tag0) (Givenantena-height h1 tag0) (Givenagent-at p7-5 tag3) (Givenantena-height h1 tag3) (not (KNot tag0 tag3)) (KNot tag0 tag1) (KNot tag0 tag2) (KNot tag1 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r0 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r0 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p7-5-h1-tag0
:parameters ()
:precondition 
(and (Givenagent-at p7-5 tag0) (Givenantena-height h1 tag0) (KNot tag0 tag1) (KNot tag0 tag2) (KNot tag0 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0))))
)
(:action activate-sensor-at-p7-5-h1-tag1-tag2-tag3
:parameters ()
:precondition 
(and (Givenagent-at p7-5 tag1) (Givenantena-height h1 tag1) (Givenagent-at p7-5 tag2) (Givenantena-height h1 tag2) (Givenagent-at p7-5 tag3) (Givenantena-height h1 tag3) (not (KNot tag1 tag2)) (not (KNot tag1 tag3)) (not (KNot tag2 tag3)) (KNot tag0 tag1) (KNot tag0 tag2) (KNot tag0 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r0 tag2) (Givengood-rocks-in-range tag2))
	
	(when (Givengood r0 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r0 tag2)) (not (Givengood-rocks-in-range tag2)))
	
	(when (not (Givengood r0 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p7-5-h1-tag1-tag2
:parameters ()
:precondition 
(and (Givenagent-at p7-5 tag1) (Givenantena-height h1 tag1) (Givenagent-at p7-5 tag2) (Givenantena-height h1 tag2) (not (KNot tag1 tag2)) (KNot tag0 tag1) (KNot tag1 tag3) (KNot tag0 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r0 tag2) (Givengood-rocks-in-range tag2))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r0 tag2)) (not (Givengood-rocks-in-range tag2))))
)
(:action activate-sensor-at-p7-5-h1-tag1-tag3
:parameters ()
:precondition 
(and (Givenagent-at p7-5 tag1) (Givenantena-height h1 tag1) (Givenagent-at p7-5 tag3) (Givenantena-height h1 tag3) (not (KNot tag1 tag3)) (KNot tag0 tag1) (KNot tag1 tag2) (KNot tag0 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r0 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r0 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p7-5-h1-tag1
:parameters ()
:precondition 
(and (Givenagent-at p7-5 tag1) (Givenantena-height h1 tag1) (KNot tag0 tag1) (KNot tag1 tag2) (KNot tag1 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p7-5-h1-tag2-tag3
:parameters ()
:precondition 
(and (Givenagent-at p7-5 tag2) (Givenantena-height h1 tag2) (Givenagent-at p7-5 tag3) (Givenantena-height h1 tag3) (not (KNot tag2 tag3)) (KNot tag0 tag2) (KNot tag1 tag2) (KNot tag0 tag3) (KNot tag1 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag2) (Givengood-rocks-in-range tag2))
	
	(when (Givengood r0 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r0 tag2)) (not (Givengood-rocks-in-range tag2)))
	
	(when (not (Givengood r0 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p7-5-h1-tag2
:parameters ()
:precondition 
(and (Givenagent-at p7-5 tag2) (Givenantena-height h1 tag2) (KNot tag0 tag2) (KNot tag1 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag2) (Givengood-rocks-in-range tag2))
	
	(when (not (Givengood r0 tag2)) (not (Givengood-rocks-in-range tag2))))
)
(:action activate-sensor-at-p7-5-h1-tag3
:parameters ()
:precondition 
(and (Givenagent-at p7-5 tag3) (Givenantena-height h1 tag3) (KNot tag0 tag3) (KNot tag1 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r0 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p8-4-h1-tag0-tag1-tag2-tag3
:parameters ()
:precondition 
(and (Givenagent-at p8-4 tag0) (Givenantena-height h1 tag0) (Givenagent-at p8-4 tag1) (Givenantena-height h1 tag1) (Givenagent-at p8-4 tag2) (Givenantena-height h1 tag2) (Givenagent-at p8-4 tag3) (Givenantena-height h1 tag3) (not (KNot tag0 tag1)) (not (KNot tag0 tag2)) (not (KNot tag0 tag3)) (not (KNot tag1 tag2)) (not (KNot tag1 tag3)) (not (KNot tag2 tag3)) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r0 tag2) (Givengood-rocks-in-range tag2))
	
	(when (Givengood r0 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r0 tag2)) (not (Givengood-rocks-in-range tag2)))
	
	(when (not (Givengood r0 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p8-4-h1-tag0-tag1-tag2
:parameters ()
:precondition 
(and (Givenagent-at p8-4 tag0) (Givenantena-height h1 tag0) (Givenagent-at p8-4 tag1) (Givenantena-height h1 tag1) (Givenagent-at p8-4 tag2) (Givenantena-height h1 tag2) (not (KNot tag0 tag1)) (not (KNot tag0 tag2)) (not (KNot tag1 tag2)) (KNot tag0 tag3) (KNot tag1 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r0 tag2) (Givengood-rocks-in-range tag2))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r0 tag2)) (not (Givengood-rocks-in-range tag2))))
)
(:action activate-sensor-at-p8-4-h1-tag0-tag1-tag3
:parameters ()
:precondition 
(and (Givenagent-at p8-4 tag0) (Givenantena-height h1 tag0) (Givenagent-at p8-4 tag1) (Givenantena-height h1 tag1) (Givenagent-at p8-4 tag3) (Givenantena-height h1 tag3) (not (KNot tag0 tag1)) (not (KNot tag0 tag3)) (not (KNot tag1 tag3)) (KNot tag0 tag2) (KNot tag1 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r0 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r0 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p8-4-h1-tag0-tag1
:parameters ()
:precondition 
(and (Givenagent-at p8-4 tag0) (Givenantena-height h1 tag0) (Givenagent-at p8-4 tag1) (Givenantena-height h1 tag1) (not (KNot tag0 tag1)) (KNot tag0 tag2) (KNot tag0 tag3) (KNot tag1 tag2) (KNot tag1 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p8-4-h1-tag0-tag2-tag3
:parameters ()
:precondition 
(and (Givenagent-at p8-4 tag0) (Givenantena-height h1 tag0) (Givenagent-at p8-4 tag2) (Givenantena-height h1 tag2) (Givenagent-at p8-4 tag3) (Givenantena-height h1 tag3) (not (KNot tag0 tag2)) (not (KNot tag0 tag3)) (not (KNot tag2 tag3)) (KNot tag0 tag1) (KNot tag1 tag2) (KNot tag1 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r0 tag2) (Givengood-rocks-in-range tag2))
	
	(when (Givengood r0 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r0 tag2)) (not (Givengood-rocks-in-range tag2)))
	
	(when (not (Givengood r0 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p8-4-h1-tag0-tag2
:parameters ()
:precondition 
(and (Givenagent-at p8-4 tag0) (Givenantena-height h1 tag0) (Givenagent-at p8-4 tag2) (Givenantena-height h1 tag2) (not (KNot tag0 tag2)) (KNot tag0 tag1) (KNot tag0 tag3) (KNot tag1 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r0 tag2) (Givengood-rocks-in-range tag2))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r0 tag2)) (not (Givengood-rocks-in-range tag2))))
)
(:action activate-sensor-at-p8-4-h1-tag0-tag3
:parameters ()
:precondition 
(and (Givenagent-at p8-4 tag0) (Givenantena-height h1 tag0) (Givenagent-at p8-4 tag3) (Givenantena-height h1 tag3) (not (KNot tag0 tag3)) (KNot tag0 tag1) (KNot tag0 tag2) (KNot tag1 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when (Givengood r0 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0)))
	
	(when (not (Givengood r0 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p8-4-h1-tag0
:parameters ()
:precondition 
(and (Givenagent-at p8-4 tag0) (Givenantena-height h1 tag0) (KNot tag0 tag1) (KNot tag0 tag2) (KNot tag0 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag0) (Givengood-rocks-in-range tag0))
	
	(when (not (Givengood r0 tag0)) (not (Givengood-rocks-in-range tag0))))
)
(:action activate-sensor-at-p8-4-h1-tag1-tag2-tag3
:parameters ()
:precondition 
(and (Givenagent-at p8-4 tag1) (Givenantena-height h1 tag1) (Givenagent-at p8-4 tag2) (Givenantena-height h1 tag2) (Givenagent-at p8-4 tag3) (Givenantena-height h1 tag3) (not (KNot tag1 tag2)) (not (KNot tag1 tag3)) (not (KNot tag2 tag3)) (KNot tag0 tag1) (KNot tag0 tag2) (KNot tag0 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r0 tag2) (Givengood-rocks-in-range tag2))
	
	(when (Givengood r0 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r0 tag2)) (not (Givengood-rocks-in-range tag2)))
	
	(when (not (Givengood r0 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p8-4-h1-tag1-tag2
:parameters ()
:precondition 
(and (Givenagent-at p8-4 tag1) (Givenantena-height h1 tag1) (Givenagent-at p8-4 tag2) (Givenantena-height h1 tag2) (not (KNot tag1 tag2)) (KNot tag0 tag1) (KNot tag1 tag3) (KNot tag0 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r0 tag2) (Givengood-rocks-in-range tag2))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r0 tag2)) (not (Givengood-rocks-in-range tag2))))
)
(:action activate-sensor-at-p8-4-h1-tag1-tag3
:parameters ()
:precondition 
(and (Givenagent-at p8-4 tag1) (Givenantena-height h1 tag1) (Givenagent-at p8-4 tag3) (Givenantena-height h1 tag3) (not (KNot tag1 tag3)) (KNot tag0 tag1) (KNot tag1 tag2) (KNot tag0 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when (Givengood r0 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1)))
	
	(when (not (Givengood r0 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p8-4-h1-tag1
:parameters ()
:precondition 
(and (Givenagent-at p8-4 tag1) (Givenantena-height h1 tag1) (KNot tag0 tag1) (KNot tag1 tag2) (KNot tag1 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag1) (Givengood-rocks-in-range tag1))
	
	(when (not (Givengood r0 tag1)) (not (Givengood-rocks-in-range tag1))))
)
(:action activate-sensor-at-p8-4-h1-tag2-tag3
:parameters ()
:precondition 
(and (Givenagent-at p8-4 tag2) (Givenantena-height h1 tag2) (Givenagent-at p8-4 tag3) (Givenantena-height h1 tag3) (not (KNot tag2 tag3)) (KNot tag0 tag2) (KNot tag1 tag2) (KNot tag0 tag3) (KNot tag1 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag2) (Givengood-rocks-in-range tag2))
	
	(when (Givengood r0 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r0 tag2)) (not (Givengood-rocks-in-range tag2)))
	
	(when (not (Givengood r0 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action activate-sensor-at-p8-4-h1-tag2
:parameters ()
:precondition 
(and (Givenagent-at p8-4 tag2) (Givenantena-height h1 tag2) (KNot tag0 tag2) (KNot tag1 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag2) (Givengood-rocks-in-range tag2))
	
	(when (not (Givengood r0 tag2)) (not (Givengood-rocks-in-range tag2))))
)
(:action activate-sensor-at-p8-4-h1-tag3
:parameters ()
:precondition 
(and (Givenagent-at p8-4 tag3) (Givenantena-height h1 tag3) (KNot tag0 tag3) (KNot tag1 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when (Givengood r0 tag3) (Givengood-rocks-in-range tag3))
	
	(when (not (Givengood r0 tag3)) (not (Givengood-rocks-in-range tag3))))
)
(:action observe-sensor-tag0-tag1-tag2-tag3
:parameters ()
:precondition 
(and (not (KNot tag0 tag1)) (not (KNot tag0 tag2)) (not (KNot tag0 tag3)) (not (KNot tag1 tag2)) (not (KNot tag1 tag3)) (not (KNot tag2 tag3)) (NotInAction ))
:effect 
(and 
	
	(when 
		(and (Givengood-rocks-in-range tag0) (not (Givengood-rocks-in-range tag1)))(KNot tag0 tag1))
	
	(when 
		(and (not (Givengood-rocks-in-range tag0)) (Givengood-rocks-in-range tag1))(KNot tag0 tag1))
	
	(when 
		(and (Givengood-rocks-in-range tag0) (not (Givengood-rocks-in-range tag2)))(KNot tag0 tag2))
	
	(when 
		(and (not (Givengood-rocks-in-range tag0)) (Givengood-rocks-in-range tag2))(KNot tag0 tag2))
	
	(when 
		(and (Givengood-rocks-in-range tag0) (not (Givengood-rocks-in-range tag3)))(KNot tag0 tag3))
	
	(when 
		(and (not (Givengood-rocks-in-range tag0)) (Givengood-rocks-in-range tag3))(KNot tag0 tag3))
	
	(when 
		(and (Givengood-rocks-in-range tag1) (not (Givengood-rocks-in-range tag2)))(KNot tag1 tag2))
	
	(when 
		(and (not (Givengood-rocks-in-range tag1)) (Givengood-rocks-in-range tag2))(KNot tag1 tag2))
	
	(when 
		(and (Givengood-rocks-in-range tag1) (not (Givengood-rocks-in-range tag3)))(KNot tag1 tag3))
	
	(when 
		(and (not (Givengood-rocks-in-range tag1)) (Givengood-rocks-in-range tag3))(KNot tag1 tag3))
	
	(when 
		(and (Givengood-rocks-in-range tag2) (not (Givengood-rocks-in-range tag3)))(KNot tag2 tag3))
	
	(when 
		(and (not (Givengood-rocks-in-range tag2)) (Givengood-rocks-in-range tag3))(KNot tag2 tag3)))
)
(:action observe-sensor-tag0-tag1-tag2
:parameters ()
:precondition 
(and (not (KNot tag0 tag1)) (not (KNot tag0 tag2)) (not (KNot tag1 tag2)) (KNot tag0 tag3) (KNot tag1 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when 
		(and (Givengood-rocks-in-range tag0) (not (Givengood-rocks-in-range tag1)))(KNot tag0 tag1))
	
	(when 
		(and (not (Givengood-rocks-in-range tag0)) (Givengood-rocks-in-range tag1))(KNot tag0 tag1))
	
	(when 
		(and (Givengood-rocks-in-range tag0) (not (Givengood-rocks-in-range tag2)))(KNot tag0 tag2))
	
	(when 
		(and (not (Givengood-rocks-in-range tag0)) (Givengood-rocks-in-range tag2))(KNot tag0 tag2))
	
	(when 
		(and (Givengood-rocks-in-range tag1) (not (Givengood-rocks-in-range tag2)))(KNot tag1 tag2))
	
	(when 
		(and (not (Givengood-rocks-in-range tag1)) (Givengood-rocks-in-range tag2))(KNot tag1 tag2)))
)
(:action observe-sensor-tag0-tag1-tag3
:parameters ()
:precondition 
(and (not (KNot tag0 tag1)) (not (KNot tag0 tag3)) (not (KNot tag1 tag3)) (KNot tag0 tag2) (KNot tag1 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when 
		(and (Givengood-rocks-in-range tag0) (not (Givengood-rocks-in-range tag1)))(KNot tag0 tag1))
	
	(when 
		(and (not (Givengood-rocks-in-range tag0)) (Givengood-rocks-in-range tag1))(KNot tag0 tag1))
	
	(when 
		(and (Givengood-rocks-in-range tag0) (not (Givengood-rocks-in-range tag3)))(KNot tag0 tag3))
	
	(when 
		(and (not (Givengood-rocks-in-range tag0)) (Givengood-rocks-in-range tag3))(KNot tag0 tag3))
	
	(when 
		(and (Givengood-rocks-in-range tag1) (not (Givengood-rocks-in-range tag3)))(KNot tag1 tag3))
	
	(when 
		(and (not (Givengood-rocks-in-range tag1)) (Givengood-rocks-in-range tag3))(KNot tag1 tag3)))
)
(:action observe-sensor-tag0-tag1
:parameters ()
:precondition 
(and (not (KNot tag0 tag1)) (KNot tag0 tag2) (KNot tag0 tag3) (KNot tag1 tag2) (KNot tag1 tag3) (NotInAction ))
:effect 
(and 
	
	(when 
		(and (Givengood-rocks-in-range tag0) (not (Givengood-rocks-in-range tag1)))(KNot tag0 tag1))
	
	(when 
		(and (not (Givengood-rocks-in-range tag0)) (Givengood-rocks-in-range tag1))(KNot tag0 tag1)))
)
(:action observe-sensor-tag0-tag2-tag3
:parameters ()
:precondition 
(and (not (KNot tag0 tag2)) (not (KNot tag0 tag3)) (not (KNot tag2 tag3)) (KNot tag0 tag1) (KNot tag1 tag2) (KNot tag1 tag3) (NotInAction ))
:effect 
(and 
	
	(when 
		(and (Givengood-rocks-in-range tag0) (not (Givengood-rocks-in-range tag2)))(KNot tag0 tag2))
	
	(when 
		(and (not (Givengood-rocks-in-range tag0)) (Givengood-rocks-in-range tag2))(KNot tag0 tag2))
	
	(when 
		(and (Givengood-rocks-in-range tag0) (not (Givengood-rocks-in-range tag3)))(KNot tag0 tag3))
	
	(when 
		(and (not (Givengood-rocks-in-range tag0)) (Givengood-rocks-in-range tag3))(KNot tag0 tag3))
	
	(when 
		(and (Givengood-rocks-in-range tag2) (not (Givengood-rocks-in-range tag3)))(KNot tag2 tag3))
	
	(when 
		(and (not (Givengood-rocks-in-range tag2)) (Givengood-rocks-in-range tag3))(KNot tag2 tag3)))
)
(:action observe-sensor-tag0-tag2
:parameters ()
:precondition 
(and (not (KNot tag0 tag2)) (KNot tag0 tag1) (KNot tag0 tag3) (KNot tag1 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when 
		(and (Givengood-rocks-in-range tag0) (not (Givengood-rocks-in-range tag2)))(KNot tag0 tag2))
	
	(when 
		(and (not (Givengood-rocks-in-range tag0)) (Givengood-rocks-in-range tag2))(KNot tag0 tag2)))
)
(:action observe-sensor-tag0-tag3
:parameters ()
:precondition 
(and (not (KNot tag0 tag3)) (KNot tag0 tag1) (KNot tag0 tag2) (KNot tag1 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when 
		(and (Givengood-rocks-in-range tag0) (not (Givengood-rocks-in-range tag3)))(KNot tag0 tag3))
	
	(when 
		(and (not (Givengood-rocks-in-range tag0)) (Givengood-rocks-in-range tag3))(KNot tag0 tag3)))
)
(:action observe-sensor-tag1-tag2-tag3
:parameters ()
:precondition 
(and (not (KNot tag1 tag2)) (not (KNot tag1 tag3)) (not (KNot tag2 tag3)) (KNot tag0 tag1) (KNot tag0 tag2) (KNot tag0 tag3) (NotInAction ))
:effect 
(and 
	
	(when 
		(and (Givengood-rocks-in-range tag1) (not (Givengood-rocks-in-range tag2)))(KNot tag1 tag2))
	
	(when 
		(and (not (Givengood-rocks-in-range tag1)) (Givengood-rocks-in-range tag2))(KNot tag1 tag2))
	
	(when 
		(and (Givengood-rocks-in-range tag1) (not (Givengood-rocks-in-range tag3)))(KNot tag1 tag3))
	
	(when 
		(and (not (Givengood-rocks-in-range tag1)) (Givengood-rocks-in-range tag3))(KNot tag1 tag3))
	
	(when 
		(and (Givengood-rocks-in-range tag2) (not (Givengood-rocks-in-range tag3)))(KNot tag2 tag3))
	
	(when 
		(and (not (Givengood-rocks-in-range tag2)) (Givengood-rocks-in-range tag3))(KNot tag2 tag3)))
)
(:action observe-sensor-tag1-tag2
:parameters ()
:precondition 
(and (not (KNot tag1 tag2)) (KNot tag0 tag1) (KNot tag1 tag3) (KNot tag0 tag2) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when 
		(and (Givengood-rocks-in-range tag1) (not (Givengood-rocks-in-range tag2)))(KNot tag1 tag2))
	
	(when 
		(and (not (Givengood-rocks-in-range tag1)) (Givengood-rocks-in-range tag2))(KNot tag1 tag2)))
)
(:action observe-sensor-tag1-tag3
:parameters ()
:precondition 
(and (not (KNot tag1 tag3)) (KNot tag0 tag1) (KNot tag1 tag2) (KNot tag0 tag3) (KNot tag2 tag3) (NotInAction ))
:effect 
(and 
	
	(when 
		(and (Givengood-rocks-in-range tag1) (not (Givengood-rocks-in-range tag3)))(KNot tag1 tag3))
	
	(when 
		(and (not (Givengood-rocks-in-range tag1)) (Givengood-rocks-in-range tag3))(KNot tag1 tag3)))
)
(:action observe-sensor-tag2-tag3
:parameters ()
:precondition 
(and (not (KNot tag2 tag3)) (KNot tag0 tag2) (KNot tag1 tag2) (KNot tag0 tag3) (KNot tag1 tag3) (NotInAction ))
:effect 
(and 
	
	(when 
		(and (Givengood-rocks-in-range tag2) (not (Givengood-rocks-in-range tag3)))(KNot tag2 tag3))
	
	(when 
		(and (not (Givengood-rocks-in-range tag2)) (Givengood-rocks-in-range tag3))(KNot tag2 tag3)))
)
)
