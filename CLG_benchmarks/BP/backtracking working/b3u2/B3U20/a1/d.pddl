(define (domain box-3-a1)
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
	a1 - agent
)
(:predicates 
	(adj ?i - pos ?j - pos )
	(agent-at ?a - agent ?i - pos )
	(box-at ?b - box ?i - pos )
	(heavy ?b - box )
	(c-p-joint-push-gpw )
	(observe-joint-push-gpw )
	(init-4oo_observe-box-a1_p1-1_b0)
	(immediate-dummy-4oo_observe-box-a1_p1-1_b0)
	(dummy-left-4oo_observe-box-a1_p1-1_b0)
	(immediate-dummy-q89_observe-box-a1_p2-1_b1)
	(dummy-left-q89_observe-box-a1_p2-1_b1)
	(done-goal)
	(dummy-right-q89_observe-box-a1_p2-1_b1)
	(pre-l5f_joint-push_p2-1_p2-2_b1_a1_a3)
	(dummy-right-4oo_observe-box-a1_p1-1_b0)
	(pre-a0y_push_p1-1_p1-2_b0_a1)
	(immediate-dummy-xtm_observe-box-a1_p2-1_b1)
	(dummy-left-xtm_observe-box-a1_p2-1_b1)
	(dummy-right-xtm_observe-box-a1_p2-1_b1)
	(pre-cqm_joint-push_p2-1_p2-2_b1_a1_a3)
)

(:action move
	:parameters ( ?start - pos ?end - pos ?a - agent)
	:precondition (and (adj ?start ?end) (agent-at ?a ?start) )
	:effect (and (not (agent-at ?a ?start)) (agent-at ?a ?end) )
)
(:action act-4oo_observe-box-a1_p1-1_b0
	:parameters ( ?a - agent )
	:precondition (and (init-4oo_observe-box-a1_p1-1_b0)(immediate-dummy-4oo_observe-box-a1_p1-1_b0)(agent-at a1 p1-1))
	:observe (box-at b0 p1-1)
)
(:action act-dummy-4oo_observe-box-a1_p1-1_b0
	:parameters ( ?a - agent )
	:precondition (and (init-4oo_observe-box-a1_p1-1_b0))
	:effect (and (immediate-dummy-4oo_observe-box-a1_p1-1_b0) )
)
(:action dummy-left-4oo_observe-box-a1_p1-1_b0
	:parameters ( ?a - agent )
	:precondition (and (init-4oo_observe-box-a1_p1-1_b0)(agent-at a1 p1-1)(not (box-at b0 p1-1))(immediate-dummy-4oo_observe-box-a1_p1-1_b0))
	:effect (and (not (init-4oo_observe-box-a1_p1-1_b0))(not (immediate-dummy-4oo_observe-box-a1_p1-1_b0))(dummy-left-4oo_observe-box-a1_p1-1_b0))
)
(:action dummy-right-4oo_observe-box-a1_p1-1_b0
	:parameters ( ?a - agent )
	:precondition (and (init-4oo_observe-box-a1_p1-1_b0)(agent-at a1 p1-1)(box-at b0 p1-1)(immediate-dummy-4oo_observe-box-a1_p1-1_b0))
	:effect (and (not (init-4oo_observe-box-a1_p1-1_b0))(not (immediate-dummy-4oo_observe-box-a1_p1-1_b0))(dummy-right-4oo_observe-box-a1_p1-1_b0))
)
(:action act-q89_observe-box-a1_p2-1_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-4oo_observe-box-a1_p1-1_b0)(immediate-dummy-q89_observe-box-a1_p2-1_b1)(not (box-at b0 p1-1))(agent-at a1 p2-1))
	:observe (box-at b1 p2-1)
)
(:action act-dummy-q89_observe-box-a1_p2-1_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-4oo_observe-box-a1_p1-1_b0)(not (box-at b0 p1-1))(agent-at a1 p2-1))
	:effect (and (immediate-dummy-q89_observe-box-a1_p2-1_b1) )
)
(:action dummy-left-q89_observe-box-a1_p2-1_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-4oo_observe-box-a1_p1-1_b0)(not (box-at b0 p1-1))(agent-at a1 p2-1)(not (box-at b1 p2-1))(immediate-dummy-q89_observe-box-a1_p2-1_b1))
	:effect (and (not (immediate-dummy-q89_observe-box-a1_p2-1_b1))(dummy-left-q89_observe-box-a1_p2-1_b1))
)
(:action dummy-right-q89_observe-box-a1_p2-1_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-4oo_observe-box-a1_p1-1_b0)(not (box-at b0 p1-1))(agent-at a1 p2-1)(box-at b1 p2-1)(immediate-dummy-q89_observe-box-a1_p2-1_b1))
	:effect (and (not (immediate-dummy-q89_observe-box-a1_p2-1_b1))(dummy-right-q89_observe-box-a1_p2-1_b1))
)
(:action goal-achieve-left-q89_observe-box-a1_p2-1_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-q89_observe-box-a1_p2-1_b1)(not (box-at b1 p2-1))(not (box-at b0 p1-1)))
	:effect (and (done-goal))
)
(:action act-l5f_joint-push_p2-1_p2-2_b1_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-q89_observe-box-a1_p2-1_b1)(box-at b1 p2-1)(not (box-at b0 p1-1))(adj p2-1 p2-2)(agent-at a1 p2-1)(box-at b1 p2-1)(heavy b1))
	:effect (and (pre-l5f_joint-push_p2-1_p2-2_b1_a1_a3)(not (box-at b1 p2-1))(box-at b1 p2-2))
)
(:action goal-achieve-l5f_joint-push_p2-1_p2-2_b1_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-l5f_joint-push_p2-1_p2-2_b1_a1_a3))
	:effect (and (done-goal))
)
(:action act-a0y_push_p1-1_p1-2_b0_a1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-4oo_observe-box-a1_p1-1_b0)(box-at b0 p1-1)(adj p1-1 p1-2)(agent-at a1 p1-1)(box-at b0 p1-1)(not (heavy b0)))
	:effect (and (pre-a0y_push_p1-1_p1-2_b0_a1)(not (box-at b0 p1-1))(box-at b0 p1-2))
)
(:action act-xtm_observe-box-a1_p2-1_b1
	:parameters ( ?a - agent )
	:precondition (and (pre-a0y_push_p1-1_p1-2_b0_a1)(immediate-dummy-xtm_observe-box-a1_p2-1_b1)(agent-at a1 p2-1))
	:observe (box-at b1 p2-1)
)
(:action act-dummy-xtm_observe-box-a1_p2-1_b1
	:parameters ( ?a - agent )
	:precondition (and (pre-a0y_push_p1-1_p1-2_b0_a1)(pre-a0y_push_p1-1_p1-2_b0_a1)(agent-at a1 p2-1))
	:effect (and (immediate-dummy-xtm_observe-box-a1_p2-1_b1) )
)
(:action dummy-left-xtm_observe-box-a1_p2-1_b1
	:parameters ( ?a - agent )
	:precondition (and (pre-a0y_push_p1-1_p1-2_b0_a1)(agent-at a1 p2-1)(not (box-at b1 p2-1))(immediate-dummy-xtm_observe-box-a1_p2-1_b1))
	:effect (and (not (immediate-dummy-xtm_observe-box-a1_p2-1_b1))(dummy-left-xtm_observe-box-a1_p2-1_b1))
)
(:action dummy-right-xtm_observe-box-a1_p2-1_b1
	:parameters ( ?a - agent )
	:precondition (and (pre-a0y_push_p1-1_p1-2_b0_a1)(agent-at a1 p2-1)(box-at b1 p2-1)(immediate-dummy-xtm_observe-box-a1_p2-1_b1))
	:effect (and (not (immediate-dummy-xtm_observe-box-a1_p2-1_b1))(dummy-right-xtm_observe-box-a1_p2-1_b1))
)
(:action goal-achieve-left-xtm_observe-box-a1_p2-1_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-xtm_observe-box-a1_p2-1_b1)(not (box-at b1 p2-1)))
	:effect (and (done-goal))
)
(:action act-cqm_joint-push_p2-1_p2-2_b1_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-xtm_observe-box-a1_p2-1_b1)(box-at b1 p2-1)(adj p2-1 p2-2)(agent-at a1 p2-1)(box-at b1 p2-1)(heavy b1))
	:effect (and (pre-cqm_joint-push_p2-1_p2-2_b1_a1_a3)(not (box-at b1 p2-1))(box-at b1 p2-2))
)
(:action goal-achieve-cqm_joint-push_p2-1_p2-2_b1_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-cqm_joint-push_p2-1_p2-2_b1_a1_a3))
	:effect (and (done-goal))
)
)