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
	(init-1ps_observe-box-a1_p1-1_b0)
	(immediate-dummy-1ps_observe-box-a1_p1-1_b0)
	(dummy-left-1ps_observe-box-a1_p1-1_b0)
	(done-goal)
	(dummy-right-1ps_observe-box-a1_p1-1_b0)
	(pre-bv1_push_p1-1_p1-2_b0_a1)
)

(:action move
	:parameters ( ?start - pos ?end - pos ?a - agent)
	:precondition (and (adj ?start ?end) (agent-at ?a ?start) )
	:effect (and (not (agent-at ?a ?start)) (agent-at ?a ?end) )
)
(:action act-1ps_observe-box-a1_p1-1_b0
	:parameters ( ?a - agent )
	:precondition (and (init-1ps_observe-box-a1_p1-1_b0)(immediate-dummy-1ps_observe-box-a1_p1-1_b0)(agent-at a1 p1-1))
	:observe (box-at b0 p1-1)
)
(:action act-dummy-1ps_observe-box-a1_p1-1_b0
	:parameters ( ?a - agent )
	:precondition (and (init-1ps_observe-box-a1_p1-1_b0))
	:effect (and (immediate-dummy-1ps_observe-box-a1_p1-1_b0) )
)
(:action dummy-left-1ps_observe-box-a1_p1-1_b0
	:parameters ( ?a - agent )
	:precondition (and (init-1ps_observe-box-a1_p1-1_b0)(agent-at a1 p1-1)(not (box-at b0 p1-1))(immediate-dummy-1ps_observe-box-a1_p1-1_b0))
	:effect (and (not (init-1ps_observe-box-a1_p1-1_b0))(not (immediate-dummy-1ps_observe-box-a1_p1-1_b0))(dummy-left-1ps_observe-box-a1_p1-1_b0))
)
(:action dummy-right-1ps_observe-box-a1_p1-1_b0
	:parameters ( ?a - agent )
	:precondition (and (init-1ps_observe-box-a1_p1-1_b0)(agent-at a1 p1-1)(box-at b0 p1-1)(immediate-dummy-1ps_observe-box-a1_p1-1_b0))
	:effect (and (not (init-1ps_observe-box-a1_p1-1_b0))(not (immediate-dummy-1ps_observe-box-a1_p1-1_b0))(dummy-right-1ps_observe-box-a1_p1-1_b0))
)
(:action goal-achieve-left-1ps_observe-box-a1_p1-1_b0
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-1ps_observe-box-a1_p1-1_b0)(not (box-at b0 p1-1)))
	:effect (and (done-goal))
)
(:action act-bv1_push_p1-1_p1-2_b0_a1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-1ps_observe-box-a1_p1-1_b0)(box-at b0 p1-1)(adj p1-1 p1-2)(agent-at a1 p1-1)(box-at b0 p1-1)(not (heavy b0)))
	:effect (and (pre-bv1_push_p1-1_p1-2_b0_a1)(not (box-at b0 p1-1))(box-at b0 p1-2))
)
(:action goal-achieve-bv1_push_p1-1_p1-2_b0_a1
	:parameters ( ?a - agent )
	:precondition (and (pre-bv1_push_p1-1_p1-2_b0_a1))
	:effect (and (done-goal))
)
)