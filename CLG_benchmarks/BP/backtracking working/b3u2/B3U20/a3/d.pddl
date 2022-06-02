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
	a3 - agent
)
(:predicates 
	(adj ?i - pos ?j - pos )
	(agent-at ?a - agent ?i - pos )
	(box-at ?b - box ?i - pos )
	(heavy ?b - box )
	(c-p-joint-push-gpw )
	(observe-joint-push-gpw )
	(init-kgn_observe-box-a1_p2-1_b1)
	(immediate-dummy-kgn_observe-box-a1_p2-1_b1)
	(dummy-left-kgn_observe-box-a1_p2-1_b1)
	(done-goal)
	(dummy-right-kgn_observe-box-a1_p2-1_b1)
	(pre-ynz_joint-push_p2-1_p2-2_b1_a1_a3)
)

(:action move
	:parameters ( ?start - pos ?end - pos ?a - agent)
	:precondition (and (adj ?start ?end) (agent-at ?a ?start) )
	:effect (and (not (agent-at ?a ?start)) (agent-at ?a ?end) )
)
(:action act-kgn_observe-box-a1_p2-1_b1
	:parameters ( ?a - agent )
	:precondition (and (init-kgn_observe-box-a1_p2-1_b1)(immediate-dummy-kgn_observe-box-a1_p2-1_b1)(agent-at a3 p2-1))
	:observe (box-at b1 p2-1)
)
(:action act-dummy-kgn_observe-box-a1_p2-1_b1
	:parameters ( ?a - agent )
	:precondition (and (init-kgn_observe-box-a1_p2-1_b1))
	:effect (and (immediate-dummy-kgn_observe-box-a1_p2-1_b1) )
)
(:action dummy-left-kgn_observe-box-a1_p2-1_b1
	:parameters ( ?a - agent )
	:precondition (and (init-kgn_observe-box-a1_p2-1_b1)(agent-at a3 p2-1)(not (box-at b1 p2-1))(immediate-dummy-kgn_observe-box-a1_p2-1_b1))
	:effect (and (not (init-kgn_observe-box-a1_p2-1_b1))(not (immediate-dummy-kgn_observe-box-a1_p2-1_b1))(dummy-left-kgn_observe-box-a1_p2-1_b1))
)
(:action dummy-right-kgn_observe-box-a1_p2-1_b1
	:parameters ( ?a - agent )
	:precondition (and (init-kgn_observe-box-a1_p2-1_b1)(agent-at a3 p2-1)(box-at b1 p2-1)(immediate-dummy-kgn_observe-box-a1_p2-1_b1))
	:effect (and (not (init-kgn_observe-box-a1_p2-1_b1))(not (immediate-dummy-kgn_observe-box-a1_p2-1_b1))(dummy-right-kgn_observe-box-a1_p2-1_b1))
)
(:action goal-achieve-left-kgn_observe-box-a1_p2-1_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-kgn_observe-box-a1_p2-1_b1)(not (box-at b1 p2-1)))
	:effect (and (done-goal))
)
(:action act-ynz_joint-push_p2-1_p2-2_b1_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-kgn_observe-box-a1_p2-1_b1)(box-at b1 p2-1)(adj p2-1 p2-2)(agent-at a3 p2-1)(box-at b1 p2-1)(heavy b1))
	:effect (and (pre-ynz_joint-push_p2-1_p2-2_b1_a1_a3)(not (box-at b1 p2-1))(box-at b1 p2-2))
)
(:action goal-achieve-ynz_joint-push_p2-1_p2-2_b1_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-ynz_joint-push_p2-1_p2-2_b1_a1_a3))
	:effect (and (done-goal))
)
)