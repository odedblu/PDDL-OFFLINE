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
	b2 - box
	a1 - agent
)
(:predicates 
	(adj ?i - pos ?j - pos )
	(agent-at ?a - agent ?i - pos )
	(box-at ?b - box ?i - pos )
	(heavy ?b - box )
	(init-ht2_observe-box_p1-1_a1_b0)
	(immediate-dummy-ht2_observe-box_p1-1_a1_b0)
	(dummy-left-ht2_observe-box_p1-1_a1_b0)
	(done-goal)
	(dummy-right-ht2_observe-box_p1-1_a1_b0)
	(pre-c8e_joint-push_p1-1_p1-2_b0_a1_a2)
)

(:action move
	:parameters ( ?start - pos ?end - pos ?a - agent)
	:precondition (and (adj ?start ?end) (agent-at ?a ?start) )
	:effect (and (not (agent-at ?a ?start)) (agent-at ?a ?end) )
)
(:action act-ht2_observe-box_p1-1_a1_b0
	:parameters ( ?a - agent )
	:precondition (and (init-ht2_observe-box_p1-1_a1_b0)(immediate-dummy-ht2_observe-box_p1-1_a1_b0)(agent-at a1 p1-1))
	:observe (box-at b0 p1-1)
)
(:action act-dummy-ht2_observe-box_p1-1_a1_b0
	:parameters ( ?a - agent )
	:precondition (and (init-ht2_observe-box_p1-1_a1_b0))
	:effect (and (immediate-dummy-ht2_observe-box_p1-1_a1_b0) )
)
(:action dummy-left-ht2_observe-box_p1-1_a1_b0
	:parameters ( ?a - agent )
	:precondition (and (init-ht2_observe-box_p1-1_a1_b0)(agent-at a1 p1-1)(not (box-at b0 p1-1))(immediate-dummy-ht2_observe-box_p1-1_a1_b0))
	:effect (and (not (init-ht2_observe-box_p1-1_a1_b0))(not (immediate-dummy-ht2_observe-box_p1-1_a1_b0))(dummy-left-ht2_observe-box_p1-1_a1_b0))
)
(:action dummy-right-ht2_observe-box_p1-1_a1_b0
	:parameters ( ?a - agent )
	:precondition (and (init-ht2_observe-box_p1-1_a1_b0)(agent-at a1 p1-1)(box-at b0 p1-1)(immediate-dummy-ht2_observe-box_p1-1_a1_b0))
	:effect (and (not (init-ht2_observe-box_p1-1_a1_b0))(not (immediate-dummy-ht2_observe-box_p1-1_a1_b0))(dummy-right-ht2_observe-box_p1-1_a1_b0))
)
(:action goal-achieve-left-ht2_observe-box_p1-1_a1_b0
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-ht2_observe-box_p1-1_a1_b0)(not (box-at b0 p1-1)))
	:effect (and (done-goal))
)
(:action act-c8e_joint-push_p1-1_p1-2_b0_a1_a2
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-ht2_observe-box_p1-1_a1_b0)(box-at b0 p1-1)(adj p1-1 p1-2)(agent-at a1 p1-1)(box-at b0 p1-1)(heavy b0))
	:effect (and (pre-c8e_joint-push_p1-1_p1-2_b0_a1_a2)(not (box-at b0 p1-1))(box-at b0 p1-2))
)
(:action goal-achieve-c8e_joint-push_p1-1_p1-2_b0_a1_a2
	:parameters ( ?a - agent )
	:precondition (and (pre-c8e_joint-push_p1-1_p1-2_b0_a1_a2))
	:effect (and (done-goal))
)
)