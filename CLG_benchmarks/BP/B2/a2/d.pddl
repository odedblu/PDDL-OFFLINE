(define (domain box-2-a2)
(:types pos agent box push )
(:constants 
	p1-1 - pos
	p1-2 - pos
	b0 - box
	a2 - agent
)
(:predicates 
	(adj ?i - pos ?j - pos )
	(agent-at ?a - agent ?i - pos )
	(box-at ?b - box ?i - pos )
	(heavy ?b - box )
	(init-2od_observe-box_a1_p1-2_b0)
	(immediate-dummy-2od_observe-box_a1_p1-2_b0)
	(dummy-left-2od_observe-box_a1_p1-2_b0)
	(pre-jqv_joint-push_p1-1_p1-2_b0_a1_a2)
	(done-goal)
	(dummy-right-2od_observe-box_a1_p1-2_b0)
)

(:action move
	:parameters ( ?start - pos ?end - pos ?a - agent)
	:precondition (and (adj ?start ?end) (agent-at ?a ?start) )
	:effect (and (not (agent-at ?a ?start)) (agent-at ?a ?end) )
)
(:action act-2od_observe-box_a1_p1-2_b0
	:parameters ( ?a - agent )
	:precondition (and (init-2od_observe-box_a1_p1-2_b0)(immediate-dummy-2od_observe-box_a1_p1-2_b0)(agent-at a2 p1-2))
	:observe (box-at b0 p1-2)
)
(:action act-dummy-2od_observe-box_a1_p1-2_b0
	:parameters ( ?a - agent )
	:precondition (and (init-2od_observe-box_a1_p1-2_b0))
	:effect (and (immediate-dummy-2od_observe-box_a1_p1-2_b0) )
)
(:action dummy-left-2od_observe-box_a1_p1-2_b0
	:parameters ( ?a - agent )
	:precondition (and (init-2od_observe-box_a1_p1-2_b0)(agent-at a2 p1-2)(not (box-at b0 p1-2))(immediate-dummy-2od_observe-box_a1_p1-2_b0))
	:effect (and (not (init-2od_observe-box_a1_p1-2_b0))(not (immediate-dummy-2od_observe-box_a1_p1-2_b0))(dummy-left-2od_observe-box_a1_p1-2_b0))
)
(:action dummy-right-2od_observe-box_a1_p1-2_b0
	:parameters ( ?a - agent )
	:precondition (and (init-2od_observe-box_a1_p1-2_b0)(agent-at a2 p1-2)(box-at b0 p1-2)(immediate-dummy-2od_observe-box_a1_p1-2_b0))
	:effect (and (not (init-2od_observe-box_a1_p1-2_b0))(not (immediate-dummy-2od_observe-box_a1_p1-2_b0))(dummy-right-2od_observe-box_a1_p1-2_b0))
)
(:action act-jqv_joint-push_p1-1_p1-2_b0_a1_a2
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-2od_observe-box_a1_p1-2_b0)(not (box-at b0 p1-2))(adj p1-1 p1-2)(agent-at a2 p1-1)(box-at b0 p1-1)(heavy b0))
	:effect (and (pre-jqv_joint-push_p1-1_p1-2_b0_a1_a2)(not (box-at b0 p1-1))(box-at b0 p1-2))
)
(:action goal-achieve-jqv_joint-push_p1-1_p1-2_b0_a1_a2
	:parameters ( ?a - agent )
	:precondition (and (pre-jqv_joint-push_p1-1_p1-2_b0_a1_a2))
	:effect (and (done-goal))
)
(:action goal-achieve-right-2od_observe-box_a1_p1-2_b0
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-2od_observe-box_a1_p1-2_b0)(box-at b0 p1-2))
	:effect (and (done-goal))
)
)