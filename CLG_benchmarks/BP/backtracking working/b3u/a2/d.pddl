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
	a2 - agent
)
(:predicates 
	(adj ?i - pos ?j - pos )
	(agent-at ?a - agent ?i - pos )
	(box-at ?b - box ?i - pos )
	(heavy ?b - box )
	(dummy-left-9kp_observe-box-a3_p2-1_b1)
	(done-goal)
	(dummy-right-9kp_observe-box-a3_p2-1_b1)
	(pre-dn6_joint-push_p2-1_p2-2_b1_a2_a3)
)

(:action move
	:parameters ( ?start - pos ?end - pos ?a - agent)
	:precondition (and (adj ?start ?end) (agent-at ?a ?start) )
	:effect (and (not (agent-at ?a ?start)) (agent-at ?a ?end) )
)
(:action goal-achieve-left-9kp_observe-box-a3_p2-1_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-9kp_observe-box-a3_p2-1_b1)(not (box-at b1 p2-1)))
	:effect (and (done-goal))
)
(:action act-dn6_joint-push_p2-1_p2-2_b1_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-9kp_observe-box-a3_p2-1_b1)(box-at b1 p2-1)(adj p2-1 p2-2)(agent-at a2 p2-1)(box-at b1 p2-1)(heavy b1))
	:effect (and (pre-dn6_joint-push_p2-1_p2-2_b1_a2_a3)(not (box-at b1 p2-1))(box-at b1 p2-2))
)
(:action goal-achieve-dn6_joint-push_p2-1_p2-2_b1_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-dn6_joint-push_p2-1_p2-2_b1_a2_a3))
	:effect (and (done-goal))
)
)