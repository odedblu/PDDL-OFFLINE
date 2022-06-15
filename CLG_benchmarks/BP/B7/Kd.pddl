(define (domain Kbox-4)
(:requirements :strips :typing)
(:types pos agent box push TAG_TYPE VALUE_TYPE)
(:constants
 p1-1 - pos
 p1-2 - pos
 p2-1 - pos
 p2-2 - pos
 p3-1 - pos
 p3-2 - pos
 p4-1 - pos
 p4-2 - pos
 p5-1 - pos
 p5-2 - pos
 b0 - box
 b1 - box
 b2 - box
 a1 - agent
 a2 - agent
 a3 - agent
 tag0 - TAG_TYPE ; (box-at b0 p1-1) (not (box-at b0 p1-2)) (box-at b2 p5-2) (not (box-at b2 p5-1)) (not (box-at b1 p3-1)) (box-at b1 p3-2)
 tag1 - TAG_TYPE ; (not (box-at b0 p1-1)) (box-at b0 p1-2) (not (box-at b2 p5-2)) (box-at b2 p5-1) (box-at b1 p3-1) (not (box-at b1 p3-2))
 V_TRUE - VALUE_TYPE
 V_FALSE - VALUE_TYPE
)

(:predicates
(adj ?i - pos ?j - pos)
(agent-at ?a - agent ?i - pos)
(Kagent-at ?a - agent ?i - pos ?AGENT_PARAM - AGENT ?V_PARAM - VALUE_TYPE)
(KGivenagent-at ?a - agent ?i - pos ?TAG_PARAM - TAG_TYPE ?AGENT_PARAM - AGENT ?V_PARAM - VALUE_TYPE)
(box-at ?b - box ?i - pos)
(Kbox-at ?b - box ?i - pos ?AGENT_PARAM - AGENT ?V_PARAM - VALUE_TYPE)
(KGivenbox-at ?b - box ?i - pos ?TAG_PARAM - TAG_TYPE ?AGENT_PARAM - AGENT ?V_PARAM - VALUE_TYPE)
(heavy ?b - box)
(same-agent ?a1 - agent ?a2 - agent)
(KNot ?TAG_PARAM - TAG_TYPE ?AGENT_PARAM - AGENT)
(Observed ?AGENT_PARAM - AGENT)
)

(:action move
:parameters ( ?start - pos ?end - pos ?a - agent)
:precondition 
(and (adj ?start ?end) (agent-at ?a ?start))
:effect 
(and (not (agent-at ?a ?start)) (agent-at ?a ?end))
)
(:action push
:parameters ( ?start - pos ?end - pos ?b - box ?a - agent)
:precondition 
(and (adj ?start ?end) (agent-at ?a ?start) (box-at ?b ?start) (not (heavy ?b)) (Kbox-at ?b ?start ?a V_TRUE))
:effect 
(and (not (box-at ?b ?start)) (box-at ?b ?end) (Kbox-at ?b ?start ?a V_FALSE) (not (Kbox-at ?b ?start ?a V_TRUE)) (Kbox-at ?b ?end ?a V_TRUE) (not (Kbox-at ?b ?end ?a V_FALSE)))
)
(:action joint-push
:parameters ( ?start - pos ?end - pos ?b - box ?a1 - agent ?a2 - agent)
:precondition 
(and (adj ?start ?end) (agent-at ?a1 ?start) (agent-at ?a2 ?start) (box-at ?b ?start) (heavy ?b) (not (same-agent ?a1 ?a2)) (Kbox-at ?b ?start ?a1 V_TRUE) (Kbox-at ?b ?start ?a2 V_TRUE))
:effect 
(and (not (box-at ?b ?start)) (box-at ?b ?end) (Kbox-at ?b ?start ?a1 V_FALSE) (not (Kbox-at ?b ?start ?a1 V_TRUE)) (Kbox-at ?b ?start ?a2 V_FALSE) (not (Kbox-at ?b ?start ?a2 V_TRUE)) (Kbox-at ?b ?end ?a1 V_TRUE) (not (Kbox-at ?b ?end ?a1 V_FALSE)) (Kbox-at ?b ?end ?a2 V_TRUE) (not (Kbox-at ?b ?end ?a2 V_FALSE)))
)
(:action observe-box-T
:parameters ( ?i - pos ?a - agent ?b - box)
:precondition 
(and (agent-at ?a ?i) (box-at ?b ?i) (not (Kbox-at ?b ?i ?a V_TRUE)) (not (Kbox-at ?b ?i ?a V_FALSE)))
:effect 
(and (Kbox-at ?b ?i ?a V_TRUE) (Observed ?a))
)
(:action observe-box-F
:parameters ( ?i - pos ?a - agent ?b - box)
:precondition 
(and (agent-at ?a ?i) (not (box-at ?b ?i)) (not (Kbox-at ?b ?i ?a V_TRUE)) (not (Kbox-at ?b ?i ?a V_FALSE)))
:effect 
(and (Kbox-at ?b ?i ?a V_FALSE) (Observed ?a))
)
(:action Merge-box-at
:parameters ( ?b - box ?i - pos ?V_PARAM - VALUE_TYPE ?AGENT_PARAM - AGENT)
:precondition 
(and (not (Kbox-at ?b ?i ?AGENT_PARAM ?V_PARAM)) (Observed ?AGENT_PARAM) 
	(or (KGivenbox-at ?b ?i tag0 ?AGENT_PARAM ?V_PARAM) (KNot tag0 ?AGENT_PARAM))
	(or (KGivenbox-at ?b ?i tag1 ?AGENT_PARAM ?V_PARAM) (KNot tag1 ?AGENT_PARAM)))
:effect 
(and (Kbox-at ?b ?i ?AGENT_PARAM ?V_PARAM))
)

(:action RefuteT-box-at
:parameters ( ?b - box ?i - pos ?TAG_PARAM - TAG_TYPE ?AGENT_PARAM - AGENT)
:precondition 
(and (Observed ?AGENT_PARAM) (not (KNot ?TAG_PARAM ?AGENT_PARAM)) (KGivenbox-at ?b ?i ?TAG_PARAM ?AGENT_PARAM V_TRUE) (Kbox-at ?b ?i ?AGENT_PARAM V_FALSE) (not (box-at ?b ?i)))
:effect 
(and (KNot ?TAG_PARAM ?AGENT_PARAM))
)

(:action RefuteF-box-at
:parameters ( ?b - box ?i - pos ?TAG_PARAM - TAG_TYPE ?AGENT_PARAM - AGENT)
:precondition 
(and (Observed ?AGENT_PARAM) (not (KNot ?TAG_PARAM ?AGENT_PARAM)) (KGivenbox-at ?b ?i ?TAG_PARAM ?AGENT_PARAM V_FALSE) (Kbox-at ?b ?i ?AGENT_PARAM V_TRUE) (box-at ?b ?i))
:effect 
(and (KNot ?TAG_PARAM ?AGENT_PARAM))
)

)