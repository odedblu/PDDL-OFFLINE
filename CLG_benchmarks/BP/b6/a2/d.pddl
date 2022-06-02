(define (domain box-4-a2)
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
	a2 - agent
)
(:predicates 
	(adj ?i - pos ?j - pos )
	(agent-at ?a - agent ?i - pos )
	(box-at ?b - box ?i - pos )
	(heavy ?b - box )
	(init-n3s_observe-box_p5-1_a2_b2)
	(immediate-dummy-n3s_observe-box_p5-1_a2_b2)
	(dummy-left-n3s_observe-box_p5-1_a2_b2)
	(done-goal)
	(dummy-right-n3s_observe-box_p5-1_a2_b2)
	(pre-xw6_joint-push_p5-1_p5-2_b2_a2_a3)
)

(:action move
	:parameters ( ?start - pos ?end - pos ?a - agent)
	:precondition (and (adj ?start ?end) (agent-at ?a ?start) )
	:effect (and (not (agent-at ?a ?start)) (agent-at ?a ?end) )
)
(:action act-n3s_observe-box_p5-1_a2_b2
	:parameters ( ?a - agent )
	:precondition (and (init-n3s_observe-box_p5-1_a2_b2)(immediate-dummy-n3s_observe-box_p5-1_a2_b2)(agent-at a2 p5-1))
	:observe (box-at b2 p5-1)
)
(:action act-dummy-n3s_observe-box_p5-1_a2_b2
	:parameters ( ?a - agent )
	:precondition (and (init-n3s_observe-box_p5-1_a2_b2))
	:effect (and (immediate-dummy-n3s_observe-box_p5-1_a2_b2) )
)
(:action dummy-left-n3s_observe-box_p5-1_a2_b2
	:parameters ( ?a - agent )
	:precondition (and (init-n3s_observe-box_p5-1_a2_b2)(immediate-dummy-n3s_observe-box_p5-1_a2_b2)(agent-at a2 p5-1)(not (box-at b2 p5-1)))
	:effect (and (not (init-n3s_observe-box_p5-1_a2_b2))(not (immediate-dummy-n3s_observe-box_p5-1_a2_b2))(dummy-left-n3s_observe-box_p5-1_a2_b2))
)
(:action dummy-right-n3s_observe-box_p5-1_a2_b2
	:parameters ( ?a - agent )
	:precondition (and (init-n3s_observe-box_p5-1_a2_b2)(immediate-dummy-n3s_observe-box_p5-1_a2_b2)(agent-at a2 p5-1)(box-at b2 p5-1))
	:effect (and (not (init-n3s_observe-box_p5-1_a2_b2))(not (immediate-dummy-n3s_observe-box_p5-1_a2_b2))(dummy-right-n3s_observe-box_p5-1_a2_b2))
)
(:action goal-achieve-left-n3s_observe-box_p5-1_a2_b2
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-n3s_observe-box_p5-1_a2_b2)(not (box-at b2 p5-1)))
	:effect (and (done-goal))
)
(:action act-xw6_joint-push_p5-1_p5-2_b2_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-n3s_observe-box_p5-1_a2_b2)(box-at b2 p5-1)(adj p5-1 p5-2)(agent-at a2 p5-1)(box-at b2 p5-1)(heavy b2))
	:effect (and (pre-xw6_joint-push_p5-1_p5-2_b2_a2_a3)(not (box-at b2 p5-1))(box-at b2 p5-2))
)
(:action goal-achieve-xw6_joint-push_p5-1_p5-2_b2_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-xw6_joint-push_p5-1_p5-2_b2_a2_a3))
	:effect (and (done-goal))
)
)