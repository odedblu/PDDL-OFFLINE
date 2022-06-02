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
	(c-p-a-124 )
	(observe-124 )
	(init-jxt_observe-box-a1_p1-1_b0)
	(immediate-dummy-jxt_observe-box-a1_p1-1_b0)
	(dummy-left-jxt_observe-box-a1_p1-1_b0)
	(immediate-dummy-sdn_observe-box-a1_p2-2_b1)
	(dummy-left-sdn_observe-box-a1_p2-2_b1)
	(pre-o2u_joint-push_p2-1_p2-2_b1_a1_a3)
	(done-goal)
	(dummy-right-sdn_observe-box-a1_p2-2_b1)
	(dummy-right-jxt_observe-box-a1_p1-1_b0)
	(pre-ktb_push_p1-1_p1-2_b0_a1)
	(immediate-dummy-b5x_observe-box-a1_p2-2_b1)
	(dummy-left-b5x_observe-box-a1_p2-2_b1)
	(pre-evu_joint-push_p2-1_p2-2_b1_a1_a3)
	(dummy-right-b5x_observe-box-a1_p2-2_b1)
)

(:action move
	:parameters ( ?start - pos ?end - pos ?a - agent)
	:precondition (and (adj ?start ?end) (agent-at ?a ?start) )
	:effect (and (not (agent-at ?a ?start)) (agent-at ?a ?end) )
)
(:action commit-box-at-location
	:parameters ( ?a - agent)
	:precondition (and (not (observe-124 )) )
	:effect (and (c-p-a-124 ) )
)
(:action act-jxt_observe-box-a1_p1-1_b0
	:parameters ( ?a - agent )
	:precondition (and (init-jxt_observe-box-a1_p1-1_b0)(immediate-dummy-jxt_observe-box-a1_p1-1_b0)(agent-at a1 p1-1))
	:observe (box-at b0 p1-1)
)
(:action act-dummy-jxt_observe-box-a1_p1-1_b0
	:parameters ( ?a - agent )
	:precondition (and (init-jxt_observe-box-a1_p1-1_b0))
	:effect (and (immediate-dummy-jxt_observe-box-a1_p1-1_b0) )
)
(:action dummy-left-jxt_observe-box-a1_p1-1_b0
	:parameters ( ?a - agent )
	:precondition (and (init-jxt_observe-box-a1_p1-1_b0)(agent-at a1 p1-1)(not (box-at b0 p1-1))(immediate-dummy-jxt_observe-box-a1_p1-1_b0))
	:effect (and (not (init-jxt_observe-box-a1_p1-1_b0))(not (immediate-dummy-jxt_observe-box-a1_p1-1_b0))(dummy-left-jxt_observe-box-a1_p1-1_b0))
)
(:action dummy-right-jxt_observe-box-a1_p1-1_b0
	:parameters ( ?a - agent )
	:precondition (and (init-jxt_observe-box-a1_p1-1_b0)(agent-at a1 p1-1)(box-at b0 p1-1)(immediate-dummy-jxt_observe-box-a1_p1-1_b0))
	:effect (and (not (init-jxt_observe-box-a1_p1-1_b0))(not (immediate-dummy-jxt_observe-box-a1_p1-1_b0))(dummy-right-jxt_observe-box-a1_p1-1_b0))
)
(:action act-sdn_observe-box-a1_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-jxt_observe-box-a1_p1-1_b0)(immediate-dummy-sdn_observe-box-a1_p2-2_b1)(not (box-at b0 p1-1))(agent-at a1 p2-2))
	:observe (box-at b1 p2-2)
)
(:action act-dummy-sdn_observe-box-a1_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-jxt_observe-box-a1_p1-1_b0)(not (box-at b0 p1-1))(agent-at a1 p2-2))
	:effect (and (immediate-dummy-sdn_observe-box-a1_p2-2_b1) )
)
(:action dummy-left-sdn_observe-box-a1_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-jxt_observe-box-a1_p1-1_b0)(not (box-at b0 p1-1))(agent-at a1 p2-2)(not (box-at b1 p2-2))(immediate-dummy-sdn_observe-box-a1_p2-2_b1))
	:effect (and (not (immediate-dummy-sdn_observe-box-a1_p2-2_b1))(dummy-left-sdn_observe-box-a1_p2-2_b1))
)
(:action dummy-right-sdn_observe-box-a1_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-jxt_observe-box-a1_p1-1_b0)(not (box-at b0 p1-1))(agent-at a1 p2-2)(box-at b1 p2-2)(immediate-dummy-sdn_observe-box-a1_p2-2_b1))
	:effect (and (not (immediate-dummy-sdn_observe-box-a1_p2-2_b1))(dummy-right-sdn_observe-box-a1_p2-2_b1))
)
(:action act-o2u_joint-push_p2-1_p2-2_b1_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-sdn_observe-box-a1_p2-2_b1)(not (box-at b1 p2-2))(not (box-at b0 p1-1))(adj p2-1 p2-2)(agent-at a1 p2-1)(box-at b1 p2-1)(heavy b1))
	:effect (and (pre-o2u_joint-push_p2-1_p2-2_b1_a1_a3)(not (box-at b1 p2-1))(box-at b1 p2-2))
)
(:action goal-achieve-o2u_joint-push_p2-1_p2-2_b1_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-o2u_joint-push_p2-1_p2-2_b1_a1_a3))
	:effect (and (done-goal))
)
(:action goal-achieve-right-sdn_observe-box-a1_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-sdn_observe-box-a1_p2-2_b1)(box-at b1 p2-2)(not (box-at b0 p1-1)))
	:effect (and (done-goal))
)
(:action act-ktb_push_p1-1_p1-2_b0_a1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-jxt_observe-box-a1_p1-1_b0)(box-at b0 p1-1)(adj p1-1 p1-2)(agent-at a1 p1-1)(box-at b0 p1-1)(not (heavy b0)))
	:effect (and (pre-ktb_push_p1-1_p1-2_b0_a1)(not (box-at b0 p1-1))(box-at b0 p1-2))
)
(:action act-b5x_observe-box-a1_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (pre-ktb_push_p1-1_p1-2_b0_a1)(immediate-dummy-b5x_observe-box-a1_p2-2_b1)(agent-at a1 p2-2))
	:observe (box-at b1 p2-2)
)
(:action act-dummy-b5x_observe-box-a1_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (pre-ktb_push_p1-1_p1-2_b0_a1)(pre-ktb_push_p1-1_p1-2_b0_a1)(agent-at a1 p2-2))
	:effect (and (immediate-dummy-b5x_observe-box-a1_p2-2_b1) )
)
(:action dummy-left-b5x_observe-box-a1_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (pre-ktb_push_p1-1_p1-2_b0_a1)(agent-at a1 p2-2)(not (box-at b1 p2-2))(immediate-dummy-b5x_observe-box-a1_p2-2_b1))
	:effect (and (not (immediate-dummy-b5x_observe-box-a1_p2-2_b1))(dummy-left-b5x_observe-box-a1_p2-2_b1))
)
(:action dummy-right-b5x_observe-box-a1_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (pre-ktb_push_p1-1_p1-2_b0_a1)(agent-at a1 p2-2)(box-at b1 p2-2)(immediate-dummy-b5x_observe-box-a1_p2-2_b1))
	:effect (and (not (immediate-dummy-b5x_observe-box-a1_p2-2_b1))(dummy-right-b5x_observe-box-a1_p2-2_b1))
)
(:action act-evu_joint-push_p2-1_p2-2_b1_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-b5x_observe-box-a1_p2-2_b1)(not (box-at b1 p2-2))(adj p2-1 p2-2)(agent-at a1 p2-1)(box-at b1 p2-1)(heavy b1))
	:effect (and (pre-evu_joint-push_p2-1_p2-2_b1_a1_a3)(not (box-at b1 p2-1))(box-at b1 p2-2))
)
(:action goal-achieve-evu_joint-push_p2-1_p2-2_b1_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-evu_joint-push_p2-1_p2-2_b1_a1_a3))
	:effect (and (done-goal))
)
(:action goal-achieve-right-b5x_observe-box-a1_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-b5x_observe-box-a1_p2-2_b1)(box-at b1 p2-2))
	:effect (and (done-goal))
)
)