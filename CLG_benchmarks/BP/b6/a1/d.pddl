(define (domain box-4-a1)
(:types pos agent box push )
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
)
(:predicates 
	(adj ?i - pos ?j - pos )
	(agent-at ?a - agent ?i - pos )
	(box-at ?b - box ?i - pos )
	(heavy ?b - box )
	(init-ism_observe-box_p1-1_a1_b0)
	(immediate-dummy-ism_observe-box_p1-1_a1_b0)
	(dummy-left-ism_observe-box_p1-1_a1_b0)
	(done-goal)
	(dummy-right-ism_observe-box_p1-1_a1_b0)
	(pre-by7_push_p1-1_p1-2_b0_a1)
)

(:action move
	:parameters ( ?start - pos ?end - pos ?a - agent)
	:precondition (and (adj ?start ?end) (agent-at ?a ?start) )
	:effect (and (not (agent-at ?a ?start)) (agent-at ?a ?end) )
)
(:action act-ism_observe-box_p1-1_a1_b0
	:parameters ( ?a - agent )
	:precondition (and (init-ism_observe-box_p1-1_a1_b0)(immediate-dummy-ism_observe-box_p1-1_a1_b0)(agent-at a1 p1-1))
	:observe (box-at b0 p1-1)
)
(:action act-dummy-ism_observe-box_p1-1_a1_b0
	:parameters ( ?a - agent )
	:precondition (and (init-ism_observe-box_p1-1_a1_b0))
	:effect (and (immediate-dummy-ism_observe-box_p1-1_a1_b0) )
)
(:action dummy-left-ism_observe-box_p1-1_a1_b0
	:parameters ( ?a - agent )
	:precondition (and (init-ism_observe-box_p1-1_a1_b0)(immediate-dummy-ism_observe-box_p1-1_a1_b0)(agent-at a1 p1-1)(not (box-at b0 p1-1)))
	:effect (and (not (init-ism_observe-box_p1-1_a1_b0))(not (immediate-dummy-ism_observe-box_p1-1_a1_b0))(dummy-left-ism_observe-box_p1-1_a1_b0))
)
(:action dummy-right-ism_observe-box_p1-1_a1_b0
	:parameters ( ?a - agent )
	:precondition (and (init-ism_observe-box_p1-1_a1_b0)(immediate-dummy-ism_observe-box_p1-1_a1_b0)(agent-at a1 p1-1)(box-at b0 p1-1))
	:effect (and (not (init-ism_observe-box_p1-1_a1_b0))(not (immediate-dummy-ism_observe-box_p1-1_a1_b0))(dummy-right-ism_observe-box_p1-1_a1_b0))
)
(:action goal-achieve-left-ism_observe-box_p1-1_a1_b0
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-ism_observe-box_p1-1_a1_b0)(not (box-at b0 p1-1)))
	:effect (and (done-goal))
)
(:action act-by7_push_p1-1_p1-2_b0_a1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-ism_observe-box_p1-1_a1_b0)(box-at b0 p1-1)(adj p1-1 p1-2)(agent-at a1 p1-1)(box-at b0 p1-1)(not (heavy b0)))
	:effect (and (pre-by7_push_p1-1_p1-2_b0_a1)(not (box-at b0 p1-1))(box-at b0 p1-2))
)
(:action goal-achieve-by7_push_p1-1_p1-2_b0_a1
	:parameters ( ?a - agent )
	:precondition (and (pre-by7_push_p1-1_p1-2_b0_a1))
	:effect (and (done-goal))
)
)