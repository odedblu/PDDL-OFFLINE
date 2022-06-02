(define (domain box-3-a2)
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
	a2 - agent
)
(:predicates 
	(adj ?i - pos ?j - pos )
	(agent-at ?a - agent ?i - pos )
	(box-at ?b - box ?i - pos )
	(heavy ?b - box )
	(dummy-left-2m4_observe-box-a3_p2-2_b1)
	(pre-a0g_joint-push_p2-1_p2-2_b1_a2_a3)
	(done-goal)
	(dummy-right-2m4_observe-box-a3_p2-2_b1)
	(dummy-right-cwv_observe-box-a3_p3-1_b2)
	(pre-znz_joint-push_p3-1_p3-2_b2_a2_a3)
	(dummy-left-z7i_observe-box-a3_p2-2_b1)
	(pre-iso_joint-push_p2-1_p2-2_b1_a2_a3)
	(dummy-right-z7i_observe-box-a3_p2-2_b1)
)

(:action move
	:parameters ( ?start - pos ?end - pos ?a - agent)
	:precondition (and (adj ?start ?end) (agent-at ?a ?start) )
	:effect (and (not (agent-at ?a ?start)) (agent-at ?a ?end) )
)
(:action act-a0g_joint-push_p2-1_p2-2_b1_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-2m4_observe-box-a3_p2-2_b1)(not (box-at b1 p2-2))(not (box-at b2 p3-1))(adj p2-1 p2-2)(agent-at a2 p2-1)(box-at b1 p2-1)(heavy b1))
	:effect (and (pre-a0g_joint-push_p2-1_p2-2_b1_a2_a3)(not (box-at b1 p2-1))(box-at b1 p2-2))
)
(:action goal-achieve-a0g_joint-push_p2-1_p2-2_b1_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-a0g_joint-push_p2-1_p2-2_b1_a2_a3))
	:effect (and (done-goal))
)
(:action goal-achieve-right-2m4_observe-box-a3_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-2m4_observe-box-a3_p2-2_b1)(box-at b1 p2-2)(not (box-at b2 p3-1)))
	:effect (and (done-goal))
)
(:action act-znz_joint-push_p3-1_p3-2_b2_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-cwv_observe-box-a3_p3-1_b2)(box-at b2 p3-1)(adj p3-1 p3-2)(agent-at a2 p3-1)(box-at b2 p3-1)(heavy b2))
	:effect (and (pre-znz_joint-push_p3-1_p3-2_b2_a2_a3)(not (box-at b2 p3-1))(box-at b2 p3-2))
)
(:action act-iso_joint-push_p2-1_p2-2_b1_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-z7i_observe-box-a3_p2-2_b1)(not (box-at b1 p2-2))(adj p2-1 p2-2)(agent-at a2 p2-1)(box-at b1 p2-1)(heavy b1))
	:effect (and (pre-iso_joint-push_p2-1_p2-2_b1_a2_a3)(not (box-at b1 p2-1))(box-at b1 p2-2))
)
(:action goal-achieve-iso_joint-push_p2-1_p2-2_b1_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-iso_joint-push_p2-1_p2-2_b1_a2_a3))
	:effect (and (done-goal))
)
(:action goal-achieve-right-z7i_observe-box-a3_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-z7i_observe-box-a3_p2-2_b1)(box-at b1 p2-2))
	:effect (and (done-goal))
)
)