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
	(init-mx3_observe-box-a3_p3-1_b2)
	(immediate-dummy-mx3_observe-box-a3_p3-1_b2)
	(dummy-left-mx3_observe-box-a3_p3-1_b2)
	(immediate-dummy-jc9_observe-box-a3_p2-2_b1)
	(dummy-left-jc9_observe-box-a3_p2-2_b1)
	(pre-8lh_joint-push_p2-1_p2-2_b1_a2_a3)
	(done-goal)
	(dummy-right-jc9_observe-box-a3_p2-2_b1)
	(dummy-right-mx3_observe-box-a3_p3-1_b2)
	(pre-09n_joint-push_p3-1_p3-2_b2_a2_a3)
	(immediate-dummy-hxs_observe-box-a3_p2-2_b1)
	(dummy-left-hxs_observe-box-a3_p2-2_b1)
	(pre-p3o_joint-push_p2-1_p2-2_b1_a2_a3)
	(dummy-right-hxs_observe-box-a3_p2-2_b1)
)

(:action move
	:parameters ( ?start - pos ?end - pos ?a - agent)
	:precondition (and (adj ?start ?end) (agent-at ?a ?start) )
	:effect (and (not (agent-at ?a ?start)) (agent-at ?a ?end) )
)
(:action act-mx3_observe-box-a3_p3-1_b2
	:parameters ( ?a - agent )
	:precondition (and (init-mx3_observe-box-a3_p3-1_b2)(immediate-dummy-mx3_observe-box-a3_p3-1_b2)(agent-at a3 p3-1))
	:observe (box-at b2 p3-1)
)
(:action act-dummy-mx3_observe-box-a3_p3-1_b2
	:parameters ( ?a - agent )
	:precondition (and (init-mx3_observe-box-a3_p3-1_b2))
	:effect (and (immediate-dummy-mx3_observe-box-a3_p3-1_b2) )
)
(:action dummy-left-mx3_observe-box-a3_p3-1_b2
	:parameters ( ?a - agent )
	:precondition (and (init-mx3_observe-box-a3_p3-1_b2)(agent-at a3 p3-1)(not (box-at b2 p3-1))(immediate-dummy-mx3_observe-box-a3_p3-1_b2))
	:effect (and (not (init-mx3_observe-box-a3_p3-1_b2))(not (immediate-dummy-mx3_observe-box-a3_p3-1_b2))(dummy-left-mx3_observe-box-a3_p3-1_b2))
)
(:action dummy-right-mx3_observe-box-a3_p3-1_b2
	:parameters ( ?a - agent )
	:precondition (and (init-mx3_observe-box-a3_p3-1_b2)(agent-at a3 p3-1)(box-at b2 p3-1)(immediate-dummy-mx3_observe-box-a3_p3-1_b2))
	:effect (and (not (init-mx3_observe-box-a3_p3-1_b2))(not (immediate-dummy-mx3_observe-box-a3_p3-1_b2))(dummy-right-mx3_observe-box-a3_p3-1_b2))
)
(:action act-jc9_observe-box-a3_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-mx3_observe-box-a3_p3-1_b2)(immediate-dummy-jc9_observe-box-a3_p2-2_b1)(not (box-at b2 p3-1))(agent-at a3 p2-2))
	:observe (box-at b1 p2-2)
)
(:action act-dummy-jc9_observe-box-a3_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-mx3_observe-box-a3_p3-1_b2)(not (box-at b2 p3-1))(agent-at a3 p2-2))
	:effect (and (immediate-dummy-jc9_observe-box-a3_p2-2_b1) )
)
(:action dummy-left-jc9_observe-box-a3_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-mx3_observe-box-a3_p3-1_b2)(not (box-at b2 p3-1))(agent-at a3 p2-2)(not (box-at b1 p2-2))(immediate-dummy-jc9_observe-box-a3_p2-2_b1))
	:effect (and (not (immediate-dummy-jc9_observe-box-a3_p2-2_b1))(dummy-left-jc9_observe-box-a3_p2-2_b1))
)
(:action dummy-right-jc9_observe-box-a3_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-mx3_observe-box-a3_p3-1_b2)(not (box-at b2 p3-1))(agent-at a3 p2-2)(box-at b1 p2-2)(immediate-dummy-jc9_observe-box-a3_p2-2_b1))
	:effect (and (not (immediate-dummy-jc9_observe-box-a3_p2-2_b1))(dummy-right-jc9_observe-box-a3_p2-2_b1))
)
(:action act-8lh_joint-push_p2-1_p2-2_b1_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-jc9_observe-box-a3_p2-2_b1)(not (box-at b1 p2-2))(not (box-at b2 p3-1))(adj p2-1 p2-2)(agent-at a3 p2-1)(box-at b1 p2-1)(heavy b1))
	:effect (and (pre-8lh_joint-push_p2-1_p2-2_b1_a2_a3)(not (box-at b1 p2-1))(box-at b1 p2-2))
)
(:action goal-achieve-8lh_joint-push_p2-1_p2-2_b1_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-8lh_joint-push_p2-1_p2-2_b1_a2_a3))
	:effect (and (done-goal))
)
(:action goal-achieve-right-jc9_observe-box-a3_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-jc9_observe-box-a3_p2-2_b1)(box-at b1 p2-2)(not (box-at b2 p3-1)))
	:effect (and (done-goal))
)
(:action act-09n_joint-push_p3-1_p3-2_b2_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-mx3_observe-box-a3_p3-1_b2)(box-at b2 p3-1)(adj p3-1 p3-2)(agent-at a3 p3-1)(box-at b2 p3-1)(heavy b2))
	:effect (and (pre-09n_joint-push_p3-1_p3-2_b2_a2_a3)(not (box-at b2 p3-1))(box-at b2 p3-2))
)
(:action act-hxs_observe-box-a3_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (pre-09n_joint-push_p3-1_p3-2_b2_a2_a3)(immediate-dummy-hxs_observe-box-a3_p2-2_b1)(agent-at a3 p2-2))
	:observe (box-at b1 p2-2)
)
(:action act-dummy-hxs_observe-box-a3_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (pre-09n_joint-push_p3-1_p3-2_b2_a2_a3)(pre-09n_joint-push_p3-1_p3-2_b2_a2_a3)(agent-at a3 p2-2))
	:effect (and (immediate-dummy-hxs_observe-box-a3_p2-2_b1) )
)
(:action dummy-left-hxs_observe-box-a3_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (pre-09n_joint-push_p3-1_p3-2_b2_a2_a3)(agent-at a3 p2-2)(not (box-at b1 p2-2))(immediate-dummy-hxs_observe-box-a3_p2-2_b1))
	:effect (and (not (immediate-dummy-hxs_observe-box-a3_p2-2_b1))(dummy-left-hxs_observe-box-a3_p2-2_b1))
)
(:action dummy-right-hxs_observe-box-a3_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (pre-09n_joint-push_p3-1_p3-2_b2_a2_a3)(agent-at a3 p2-2)(box-at b1 p2-2)(immediate-dummy-hxs_observe-box-a3_p2-2_b1))
	:effect (and (not (immediate-dummy-hxs_observe-box-a3_p2-2_b1))(dummy-right-hxs_observe-box-a3_p2-2_b1))
)
(:action act-p3o_joint-push_p2-1_p2-2_b1_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-hxs_observe-box-a3_p2-2_b1)(not (box-at b1 p2-2))(adj p2-1 p2-2)(agent-at a3 p2-1)(box-at b1 p2-1)(heavy b1))
	:effect (and (pre-p3o_joint-push_p2-1_p2-2_b1_a2_a3)(not (box-at b1 p2-1))(box-at b1 p2-2))
)
(:action goal-achieve-p3o_joint-push_p2-1_p2-2_b1_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-p3o_joint-push_p2-1_p2-2_b1_a2_a3))
	:effect (and (done-goal))
)
(:action goal-achieve-right-hxs_observe-box-a3_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-hxs_observe-box-a3_p2-2_b1)(box-at b1 p2-2))
	:effect (and (done-goal))
)
)