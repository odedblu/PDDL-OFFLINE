(define (domain Kbox-2-a1)
(:requirements :strips :typing)
(:types pos agent box push TAG_TYPE VALUE_TYPE)
(:constants
 p1-1 - pos
 p1-2 - pos
 b0 - box
 a1 - agent
 tag0 - TAG_TYPE ; (box-at b0 p1-1) (not (box-at b0 p1-2))
 tag1 - TAG_TYPE ; (not (box-at b0 p1-1)) (box-at b0 p1-2)
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
(init-jqe_observe-box_a2_p1-2_b0)
(Kinit-jqe_observe-box_a2_p1-2_b0 ?AGENT_PARAM - AGENT ?V_PARAM - VALUE_TYPE)
(KGiveninit-jqe_observe-box_a2_p1-2_b0 ?TAG_PARAM - TAG_TYPE ?AGENT_PARAM - AGENT ?V_PARAM - VALUE_TYPE)
(immediate-dummy-jqe_observe-box_a2_p1-2_b0)
(Kimmediate-dummy-jqe_observe-box_a2_p1-2_b0 ?AGENT_PARAM - AGENT ?V_PARAM - VALUE_TYPE)
(KGivenimmediate-dummy-jqe_observe-box_a2_p1-2_b0 ?TAG_PARAM - TAG_TYPE ?AGENT_PARAM - AGENT ?V_PARAM - VALUE_TYPE)
(dummy-left-jqe_observe-box_a2_p1-2_b0)
(Kdummy-left-jqe_observe-box_a2_p1-2_b0 ?AGENT_PARAM - AGENT ?V_PARAM - VALUE_TYPE)
(KGivendummy-left-jqe_observe-box_a2_p1-2_b0 ?TAG_PARAM - TAG_TYPE ?AGENT_PARAM - AGENT ?V_PARAM - VALUE_TYPE)
(immediate-dummy-91g_observe-box_a1_p1-1_b0)
(Kimmediate-dummy-91g_observe-box_a1_p1-1_b0 ?AGENT_PARAM - AGENT ?V_PARAM - VALUE_TYPE)
(KGivenimmediate-dummy-91g_observe-box_a1_p1-1_b0 ?TAG_PARAM - TAG_TYPE ?AGENT_PARAM - AGENT ?V_PARAM - VALUE_TYPE)
(dummy-right-91g_observe-box_a1_p1-1_b0)
(Kdummy-right-91g_observe-box_a1_p1-1_b0 ?AGENT_PARAM - AGENT ?V_PARAM - VALUE_TYPE)
(KGivendummy-right-91g_observe-box_a1_p1-1_b0 ?TAG_PARAM - TAG_TYPE ?AGENT_PARAM - AGENT ?V_PARAM - VALUE_TYPE)
(pre-g1e_joint-push_p1-1_p1-2_b0_a1_a2)
(Kpre-g1e_joint-push_p1-1_p1-2_b0_a1_a2 ?AGENT_PARAM - AGENT ?V_PARAM - VALUE_TYPE)
(KGivenpre-g1e_joint-push_p1-1_p1-2_b0_a1_a2 ?TAG_PARAM - TAG_TYPE ?AGENT_PARAM - AGENT ?V_PARAM - VALUE_TYPE)
(done-goal)
(Kdone-goal ?AGENT_PARAM - AGENT ?V_PARAM - VALUE_TYPE)
(KGivendone-goal ?TAG_PARAM - TAG_TYPE ?AGENT_PARAM - AGENT ?V_PARAM - VALUE_TYPE)
(dummy-right-jqe_observe-box_a2_p1-2_b0)
(Kdummy-right-jqe_observe-box_a2_p1-2_b0 ?AGENT_PARAM - AGENT ?V_PARAM - VALUE_TYPE)
(KGivendummy-right-jqe_observe-box_a2_p1-2_b0 ?TAG_PARAM - TAG_TYPE ?AGENT_PARAM - AGENT ?V_PARAM - VALUE_TYPE)
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
(:action act-jqe_observe-box_a2_p1-2_b0-T
:precondition 
(and (init-jqe_observe-box_a2_p1-2_b0 ) (immediate-dummy-jqe_observe-box_a2_p1-2_b0 ) (agent-at a1 p1-2) (box-at b0 p1-2))
:effect 
(and )
)
(:action act-jqe_observe-box_a2_p1-2_b0-F
:precondition 
(and (init-jqe_observe-box_a2_p1-2_b0 ) (immediate-dummy-jqe_observe-box_a2_p1-2_b0 ) (agent-at a1 p1-2) (not (box-at b0 p1-2)))
:effect 
(and )
)
(:action act-dummy-jqe_observe-box_a2_p1-2_b0
:precondition 
(and (init-jqe_observe-box_a2_p1-2_b0 ))
:effect 
(and (immediate-dummy-jqe_observe-box_a2_p1-2_b0 ))
)
(:action dummy-left-jqe_observe-box_a2_p1-2_b0
:precondition 
(and (init-jqe_observe-box_a2_p1-2_b0 ) (agent-at a1 p1-2) (not (box-at b0 p1-2)) (immediate-dummy-jqe_observe-box_a2_p1-2_b0 ))
:effect 
(and (not (init-jqe_observe-box_a2_p1-2_b0 )) (not (immediate-dummy-jqe_observe-box_a2_p1-2_b0 )) (dummy-left-jqe_observe-box_a2_p1-2_b0 ))
)
(:action dummy-right-jqe_observe-box_a2_p1-2_b0
:precondition 
(and (init-jqe_observe-box_a2_p1-2_b0 ) (agent-at a1 p1-2) (box-at b0 p1-2) (immediate-dummy-jqe_observe-box_a2_p1-2_b0 ))
:effect 
(and (not (init-jqe_observe-box_a2_p1-2_b0 )) (not (immediate-dummy-jqe_observe-box_a2_p1-2_b0 )) (dummy-right-jqe_observe-box_a2_p1-2_b0 ))
)
(:action act-91g_observe-box_a1_p1-1_b0-T
:precondition 
(and (dummy-left-jqe_observe-box_a2_p1-2_b0 ) (immediate-dummy-91g_observe-box_a1_p1-1_b0 ) (not (box-at b0 p1-2)) (agent-at a1 p1-1) (box-at b0 p1-1))
:effect 
(and )
)
(:action act-91g_observe-box_a1_p1-1_b0-F
:precondition 
(and (dummy-left-jqe_observe-box_a2_p1-2_b0 ) (immediate-dummy-91g_observe-box_a1_p1-1_b0 ) (not (box-at b0 p1-2)) (agent-at a1 p1-1) (not (box-at b0 p1-1)))
:effect 
(and )
)
(:action act-dummy-91g_observe-box_a1_p1-1_b0
:precondition 
(and (dummy-left-jqe_observe-box_a2_p1-2_b0 ) (not (box-at b0 p1-2)) (agent-at a1 p1-1))
:effect 
(and (immediate-dummy-91g_observe-box_a1_p1-1_b0 ))
)
(:action dummy-right-91g_observe-box_a1_p1-1_b0
:precondition 
(and (dummy-left-jqe_observe-box_a2_p1-2_b0 ) (not (box-at b0 p1-2)) (agent-at a1 p1-1) (box-at b0 p1-1) (immediate-dummy-91g_observe-box_a1_p1-1_b0 ))
:effect 
(and (not (immediate-dummy-91g_observe-box_a1_p1-1_b0 )) (dummy-right-91g_observe-box_a1_p1-1_b0 ))
)
(:action act-g1e_joint-push_p1-1_p1-2_b0_a1_a2
:precondition 
(and (dummy-right-91g_observe-box_a1_p1-1_b0 ) (box-at b0 p1-1) (not (box-at b0 p1-2)) (agent-at a1 p1-1))
:effect 
(and (pre-g1e_joint-push_p1-1_p1-2_b0_a1_a2 ) (not (box-at b0 p1-1)) (box-at b0 p1-2))
)
(:action goal-achieve-g1e_joint-push_p1-1_p1-2_b0_a1_a2
:precondition 
(and (pre-g1e_joint-push_p1-1_p1-2_b0_a1_a2 ))
:effect 
(and (done-goal ))
)
(:action goal-achieve-right-jqe_observe-box_a2_p1-2_b0
:precondition 
(and (dummy-right-jqe_observe-box_a2_p1-2_b0 ) (box-at b0 p1-2))
:effect 
(and (done-goal ))
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
