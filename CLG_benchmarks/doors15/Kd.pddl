(define (domain Kdoors)
(:requirements :strips :typing)
(:types pos TAG_TYPE VALUE_TYPE)
(:constants
 p1-1 - pos
 p1-2 - pos
 p1-3 - pos
 p1-4 - pos
 p1-5 - pos
 p1-6 - pos
 p1-7 - pos
 p1-8 - pos
 p1-9 - pos
 p1-10 - pos
 p1-11 - pos
 p1-12 - pos
 p1-13 - pos
 p1-14 - pos
 p1-15 - pos
 p2-1 - pos
 p2-2 - pos
 p2-3 - pos
 p2-4 - pos
 p2-5 - pos
 p2-6 - pos
 p2-7 - pos
 p2-8 - pos
 p2-9 - pos
 p2-10 - pos
 p2-11 - pos
 p2-12 - pos
 p2-13 - pos
 p2-14 - pos
 p2-15 - pos
 p3-1 - pos
 p3-2 - pos
 p3-3 - pos
 p3-4 - pos
 p3-5 - pos
 p3-6 - pos
 p3-7 - pos
 p3-8 - pos
 p3-9 - pos
 p3-10 - pos
 p3-11 - pos
 p3-12 - pos
 p3-13 - pos
 p3-14 - pos
 p3-15 - pos
 p4-1 - pos
 p4-2 - pos
 p4-3 - pos
 p4-4 - pos
 p4-5 - pos
 p4-6 - pos
 p4-7 - pos
 p4-8 - pos
 p4-9 - pos
 p4-10 - pos
 p4-11 - pos
 p4-12 - pos
 p4-13 - pos
 p4-14 - pos
 p4-15 - pos
 p5-1 - pos
 p5-2 - pos
 p5-3 - pos
 p5-4 - pos
 p5-5 - pos
 p5-6 - pos
 p5-7 - pos
 p5-8 - pos
 p5-9 - pos
 p5-10 - pos
 p5-11 - pos
 p5-12 - pos
 p5-13 - pos
 p5-14 - pos
 p5-15 - pos
 p6-1 - pos
 p6-2 - pos
 p6-3 - pos
 p6-4 - pos
 p6-5 - pos
 p6-6 - pos
 p6-7 - pos
 p6-8 - pos
 p6-9 - pos
 p6-10 - pos
 p6-11 - pos
 p6-12 - pos
 p6-13 - pos
 p6-14 - pos
 p6-15 - pos
 p7-1 - pos
 p7-2 - pos
 p7-3 - pos
 p7-4 - pos
 p7-5 - pos
 p7-6 - pos
 p7-7 - pos
 p7-8 - pos
 p7-9 - pos
 p7-10 - pos
 p7-11 - pos
 p7-12 - pos
 p7-13 - pos
 p7-14 - pos
 p7-15 - pos
 p8-1 - pos
 p8-2 - pos
 p8-3 - pos
 p8-4 - pos
 p8-5 - pos
 p8-6 - pos
 p8-7 - pos
 p8-8 - pos
 p8-9 - pos
 p8-10 - pos
 p8-11 - pos
 p8-12 - pos
 p8-13 - pos
 p8-14 - pos
 p8-15 - pos
 p9-1 - pos
 p9-2 - pos
 p9-3 - pos
 p9-4 - pos
 p9-5 - pos
 p9-6 - pos
 p9-7 - pos
 p9-8 - pos
 p9-9 - pos
 p9-10 - pos
 p9-11 - pos
 p9-12 - pos
 p9-13 - pos
 p9-14 - pos
 p9-15 - pos
 p10-1 - pos
 p10-2 - pos
 p10-3 - pos
 p10-4 - pos
 p10-5 - pos
 p10-6 - pos
 p10-7 - pos
 p10-8 - pos
 p10-9 - pos
 p10-10 - pos
 p10-11 - pos
 p10-12 - pos
 p10-13 - pos
 p10-14 - pos
 p10-15 - pos
 p11-1 - pos
 p11-2 - pos
 p11-3 - pos
 p11-4 - pos
 p11-5 - pos
 p11-6 - pos
 p11-7 - pos
 p11-8 - pos
 p11-9 - pos
 p11-10 - pos
 p11-11 - pos
 p11-12 - pos
 p11-13 - pos
 p11-14 - pos
 p11-15 - pos
 p12-1 - pos
 p12-2 - pos
 p12-3 - pos
 p12-4 - pos
 p12-5 - pos
 p12-6 - pos
 p12-7 - pos
 p12-8 - pos
 p12-9 - pos
 p12-10 - pos
 p12-11 - pos
 p12-12 - pos
 p12-13 - pos
 p12-14 - pos
 p12-15 - pos
 p13-1 - pos
 p13-2 - pos
 p13-3 - pos
 p13-4 - pos
 p13-5 - pos
 p13-6 - pos
 p13-7 - pos
 p13-8 - pos
 p13-9 - pos
 p13-10 - pos
 p13-11 - pos
 p13-12 - pos
 p13-13 - pos
 p13-14 - pos
 p13-15 - pos
 p14-1 - pos
 p14-2 - pos
 p14-3 - pos
 p14-4 - pos
 p14-5 - pos
 p14-6 - pos
 p14-7 - pos
 p14-8 - pos
 p14-9 - pos
 p14-10 - pos
 p14-11 - pos
 p14-12 - pos
 p14-13 - pos
 p14-14 - pos
 p14-15 - pos
 p15-1 - pos
 p15-2 - pos
 p15-3 - pos
 p15-4 - pos
 p15-5 - pos
 p15-6 - pos
 p15-7 - pos
 p15-8 - pos
 p15-9 - pos
 p15-10 - pos
 p15-11 - pos
 p15-12 - pos
 p15-13 - pos
 p15-14 - pos
 p15-15 - pos
 tag0 - TAG_TYPE ; (opened p2-1) (not (opened p2-2)) (opened p4-1) (not (opened p4-2)) (opened p6-1) (not (opened p6-2)) (opened p8-1) (not (opened p8-2)) (opened p10-1) (not (opened p10-2)) (opened p12-1) (not (opened p12-2)) (opened p14-1) (not (opened p14-2))
 tag1 - TAG_TYPE ; (not (opened p2-1)) (not (opened p4-1)) (not (opened p6-1)) (not (opened p8-1)) (not (opened p10-1)) (not (opened p12-1)) (not (opened p14-1)) (opened p2-2) (opened p4-2) (opened p6-2) (opened p8-2) (opened p10-2) (opened p12-2) (opened p14-2)
 V_TRUE - VALUE_TYPE
 V_FALSE - VALUE_TYPE
)

(:predicates
(adj ?i - pos ?j - pos)
(at ?i - pos)
(opened ?i - pos)
(Kopened ?i - pos)
(KNopened ?i - pos)
(KGivenopened ?i - pos ?TAG_PARAM - TAG_TYPE ?V_PARAM - VALUE_TYPE)
(KNot ?TAG_PARAM - TAG_TYPE)
)

(:action sense-door-T
:parameters ( ?i - pos ?j - pos)
:precondition 
(and (at ?i) (adj ?i ?j) (opened ?j))
:effect (Kopened ?j)
)
(:action sense-door-F
:parameters ( ?i - pos ?j - pos)
:precondition 
(and (at ?i) (adj ?i ?j) (not (opened ?j)))
:effect (KNopened ?j)
)
(:action move
:parameters ( ?i - pos ?j - pos)
:precondition 
(and (adj ?i ?j) (at ?i) (opened ?j) (Kopened ?j))
:effect 
(and (not (at ?i)) (at ?j))
)
(:action Merge-opened
:parameters ( ?i - pos ?V_PARAM - VALUE_TYPE)
:precondition 
(and (not (Kopened ?i)) 
	(or (KGivenopened ?i tag0 ?V_PARAM) (KNot tag0))
	(or (KGivenopened ?i tag1 ?V_PARAM) (KNot tag1)))
:effect 
(and (Kopened ?i))
)

(:action RefuteT-opened
:parameters ( ?i - pos ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivenopened ?i ?TAG_PARAM V_TRUE) (KNopened ?i) (not (opened ?i)))
:effect 
(and (KNot ?TAG_PARAM))
)

(:action RefuteF-opened
:parameters ( ?i - pos ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivenopened ?i ?TAG_PARAM V_FALSE) (Kopened ?i) (opened ?i))
:effect 
(and (KNot ?TAG_PARAM))
)

)
