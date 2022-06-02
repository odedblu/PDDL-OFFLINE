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
	(init-4ry_observe-box-a3_p2-1_b1)
	(immediate-dummy-4ry_observe-box-a3_p2-1_b1)
	(dummy-left-4ry_observe-box-a3_p2-1_b1)
	(done-goal)
	(dummy-right-4ry_observe-box-a3_p2-1_b1)
	(pre-a11_joint-push_p2-1_p2-2_b1_a2_a3)
)

(:action move
	:parameters ( ?start - pos ?end - pos ?a - agent)
	:precondition (and (adj ?start ?end) (agent-at ?a ?start) )
	:effect (and (not (agent-at ?a ?start)) (agent-at ?a ?end) )
)
(:action act-4ry_observe-box-a3_p2-1_b1
	:parameters ( ?a - agent )
	:precondition (and (init-4ry_observe-box-a3_p2-1_b1)(immediate-dummy-4ry_observe-box-a3_p2-1_b1)(agent-at a3 p2-1))
	:observe (box-at b1 p2-1)
)
(:action act-dummy-4ry_observe-box-a3_p2-1_b1
	:parameters ( ?a - agent )
	:precondition (and (init-4ry_observe-box-a3_p2-1_b1))
	:effect (and (immediate-dummy-4ry_observe-box-a3_p2-1_b1) )
)
(:action dummy-left-4ry_observe-box-a3_p2-1_b1
	:parameters ( ?a - agent )
	:precondition (and (init-4ry_observe-box-a3_p2-1_b1)(agent-at a3 p2-1)(not (box-at b1 p2-1))(immediate-dummy-4ry_observe-box-a3_p2-1_b1))
	:effect (and (not (init-4ry_observe-box-a3_p2-1_b1))(not (immediate-dummy-4ry_observe-box-a3_p2-1_b1))(dummy-left-4ry_observe-box-a3_p2-1_b1))
)
(:action dummy-right-4ry_observe-box-a3_p2-1_b1
	:parameters ( ?a - agent )
	:precondition (and (init-4ry_observe-box-a3_p2-1_b1)(agent-at a3 p2-1)(box-at b1 p2-1)(immediate-dummy-4ry_observe-box-a3_p2-1_b1))
	:effect (and (not (init-4ry_observe-box-a3_p2-1_b1))(not (immediate-dummy-4ry_observe-box-a3_p2-1_b1))(dummy-right-4ry_observe-box-a3_p2-1_b1))
)
(:action goal-achieve-left-4ry_observe-box-a3_p2-1_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-4ry_observe-box-a3_p2-1_b1)(not (box-at b1 p2-1)))
	:effect (and (done-goal))
)
(:action act-a11_joint-push_p2-1_p2-2_b1_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-4ry_observe-box-a3_p2-1_b1)(box-at b1 p2-1)(adj p2-1 p2-2)(agent-at a3 p2-1)(box-at b1 p2-1)(heavy b1))
	:effect (and (pre-a11_joint-push_p2-1_p2-2_b1_a2_a3)(not (box-at b1 p2-1))(box-at b1 p2-2))
)
(:action goal-achieve-a11_joint-push_p2-1_p2-2_b1_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-a11_joint-push_p2-1_p2-2_b1_a2_a3))
	:effect (and (done-goal))
)
)