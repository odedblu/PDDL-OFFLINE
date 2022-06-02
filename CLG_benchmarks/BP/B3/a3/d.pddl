(define (domain box-3-a3)
(:types pos agent box push )
(:constants 
	p1-1 - pos
	p1-2 - pos
	p2-1 - pos
	p2-2 - pos
	p3-1 - pos
	p3-2 - pos
	b0 - box
	b1 - box
	b2 - box
	a3 - agent
)
(:predicates 
	(adj ?i - pos ?j - pos )
	(agent-at ?a - agent ?i - pos )
	(box-at ?b - box ?i - pos )
	(heavy ?b - box )
	(init-spo_observe-box_p3-1_a3_b2)
	(immediate-dummy-spo_observe-box_p3-1_a3_b2)
	(dummy-left-spo_observe-box_p3-1_a3_b2)
	(immediate-dummy-diw_observe-box_p2-2_a3_b1)
	(dummy-left-diw_observe-box_p2-2_a3_b1)
	(pre-t52_joint-push_p2-1_p2-2_b1_a2_a3)
	(done-goal)
	(dummy-right-diw_observe-box_p2-2_a3_b1)
	(dummy-right-spo_observe-box_p3-1_a3_b2)
	(immediate-dummy-dd7_observe-box_p2-2_a2_b1)
	(dummy-left-dd7_observe-box_p2-2_a2_b1)
	(pre-kcy_joint-push_p2-1_p2-2_b1_a2_a3)
	(pre-g5a_joint-push_p3-1_p3-2_b2_a2_a3)
	(dummy-right-dd7_observe-box_p2-2_a2_b1)
	(pre-kvj_joint-push_p3-1_p3-2_b2_a2_a3)
)

(:action move
	:parameters ( ?start - pos ?end - pos ?a - agent)
	:precondition (and (adj ?start ?end) (agent-at ?a ?start) )
	:effect (and (not (agent-at ?a ?start)) (agent-at ?a ?end) )
)
(:action act-spo_observe-box_p3-1_a3_b2
	:parameters ( ?a - agent )
	:precondition (and (init-spo_observe-box_p3-1_a3_b2)(immediate-dummy-spo_observe-box_p3-1_a3_b2)(agent-at a3 p3-1))
	:observe (box-at b2 p3-1)
)
(:action act-dummy-spo_observe-box_p3-1_a3_b2
	:parameters ( ?a - agent )
	:precondition (and (init-spo_observe-box_p3-1_a3_b2))
	:effect (and (immediate-dummy-spo_observe-box_p3-1_a3_b2) )
)
(:action dummy-left-spo_observe-box_p3-1_a3_b2
	:parameters ( ?a - agent )
	:precondition (and (init-spo_observe-box_p3-1_a3_b2)(agent-at a3 p3-1)(not (box-at b2 p3-1))(immediate-dummy-spo_observe-box_p3-1_a3_b2))
	:effect (and (not (init-spo_observe-box_p3-1_a3_b2))(not (immediate-dummy-spo_observe-box_p3-1_a3_b2))(dummy-left-spo_observe-box_p3-1_a3_b2))
)
(:action dummy-right-spo_observe-box_p3-1_a3_b2
	:parameters ( ?a - agent )
	:precondition (and (init-spo_observe-box_p3-1_a3_b2)(agent-at a3 p3-1)(box-at b2 p3-1)(immediate-dummy-spo_observe-box_p3-1_a3_b2))
	:effect (and (not (init-spo_observe-box_p3-1_a3_b2))(not (immediate-dummy-spo_observe-box_p3-1_a3_b2))(dummy-right-spo_observe-box_p3-1_a3_b2))
)
(:action act-diw_observe-box_p2-2_a3_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-spo_observe-box_p3-1_a3_b2)(immediate-dummy-diw_observe-box_p2-2_a3_b1)(not (box-at b2 p3-1))(agent-at a3 p2-2))
	:observe (box-at b1 p2-2)
)
(:action act-dummy-diw_observe-box_p2-2_a3_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-spo_observe-box_p3-1_a3_b2)(not (box-at b2 p3-1))(agent-at a3 p2-2))
	:effect (and (immediate-dummy-diw_observe-box_p2-2_a3_b1) )
)
(:action dummy-left-diw_observe-box_p2-2_a3_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-spo_observe-box_p3-1_a3_b2)(not (box-at b2 p3-1))(agent-at a3 p2-2)(not (box-at b1 p2-2))(immediate-dummy-diw_observe-box_p2-2_a3_b1))
	:effect (and (not (immediate-dummy-diw_observe-box_p2-2_a3_b1))(dummy-left-diw_observe-box_p2-2_a3_b1))
)
(:action dummy-right-diw_observe-box_p2-2_a3_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-spo_observe-box_p3-1_a3_b2)(not (box-at b2 p3-1))(agent-at a3 p2-2)(box-at b1 p2-2)(immediate-dummy-diw_observe-box_p2-2_a3_b1))
	:effect (and (not (immediate-dummy-diw_observe-box_p2-2_a3_b1))(dummy-right-diw_observe-box_p2-2_a3_b1))
)
(:action act-t52_joint-push_p2-1_p2-2_b1_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-diw_observe-box_p2-2_a3_b1)(not (box-at b1 p2-2))(not (box-at b2 p3-1))(adj p2-1 p2-2)(agent-at a3 p2-1)(box-at b1 p2-1)(heavy b1))
	:effect (and (pre-t52_joint-push_p2-1_p2-2_b1_a2_a3)(not (box-at b1 p2-1))(box-at b1 p2-2))
)
(:action goal-achieve-t52_joint-push_p2-1_p2-2_b1_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-t52_joint-push_p2-1_p2-2_b1_a2_a3))
	:effect (and (done-goal))
)
(:action goal-achieve-right-diw_observe-box_p2-2_a3_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-diw_observe-box_p2-2_a3_b1)(box-at b1 p2-2)(not (box-at b2 p3-1)))
	:effect (and (done-goal))
)
(:action act-dd7_observe-box_p2-2_a2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-spo_observe-box_p3-1_a3_b2)(immediate-dummy-dd7_observe-box_p2-2_a2_b1)(box-at b2 p3-1)(agent-at a3 p2-2))
	:observe (box-at b1 p2-2)
)
(:action act-dummy-dd7_observe-box_p2-2_a2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-spo_observe-box_p3-1_a3_b2)(box-at b2 p3-1)(agent-at a3 p2-2))
	:effect (and (immediate-dummy-dd7_observe-box_p2-2_a2_b1) )
)
(:action dummy-left-dd7_observe-box_p2-2_a2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-spo_observe-box_p3-1_a3_b2)(box-at b2 p3-1)(agent-at a3 p2-2)(not (box-at b1 p2-2))(immediate-dummy-dd7_observe-box_p2-2_a2_b1))
	:effect (and (not (immediate-dummy-dd7_observe-box_p2-2_a2_b1))(dummy-left-dd7_observe-box_p2-2_a2_b1))
)
(:action dummy-right-dd7_observe-box_p2-2_a2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-spo_observe-box_p3-1_a3_b2)(box-at b2 p3-1)(agent-at a3 p2-2)(box-at b1 p2-2)(immediate-dummy-dd7_observe-box_p2-2_a2_b1))
	:effect (and (not (immediate-dummy-dd7_observe-box_p2-2_a2_b1))(dummy-right-dd7_observe-box_p2-2_a2_b1))
)
(:action act-kcy_joint-push_p2-1_p2-2_b1_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-dd7_observe-box_p2-2_a2_b1)(not (box-at b1 p2-2))(box-at b2 p3-1)(adj p2-1 p2-2)(agent-at a3 p2-1)(box-at b1 p2-1)(heavy b1))
	:effect (and (pre-kcy_joint-push_p2-1_p2-2_b1_a2_a3)(not (box-at b1 p2-1))(box-at b1 p2-2))
)
(:action act-g5a_joint-push_p3-1_p3-2_b2_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-kcy_joint-push_p2-1_p2-2_b1_a2_a3)(adj p3-1 p3-2)(agent-at a3 p3-1)(box-at b2 p3-1)(heavy b2))
	:effect (and (pre-g5a_joint-push_p3-1_p3-2_b2_a2_a3)(not (box-at b2 p3-1))(box-at b2 p3-2))
)
(:action goal-achieve-g5a_joint-push_p3-1_p3-2_b2_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-g5a_joint-push_p3-1_p3-2_b2_a2_a3))
	:effect (and (done-goal))
)
(:action act-kvj_joint-push_p3-1_p3-2_b2_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-dd7_observe-box_p2-2_a2_b1)(box-at b1 p2-2)(box-at b2 p3-1)(adj p3-1 p3-2)(agent-at a3 p3-1)(box-at b2 p3-1)(heavy b2))
	:effect (and (pre-kvj_joint-push_p3-1_p3-2_b2_a2_a3)(not (box-at b2 p3-1))(box-at b2 p3-2))
)
(:action goal-achieve-kvj_joint-push_p3-1_p3-2_b2_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-kvj_joint-push_p3-1_p3-2_b2_a2_a3))
	:effect (and (done-goal))
)
)