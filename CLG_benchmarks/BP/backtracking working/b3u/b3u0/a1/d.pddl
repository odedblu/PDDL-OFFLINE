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
	(c-p-joint-push-dn6 )
	(observe-joint-push-dn6 )
	(init-sc5_observe-box-a1_p1-1_b0)
	(immediate-dummy-sc5_observe-box-a1_p1-1_b0)
	(dummy-left-sc5_observe-box-a1_p1-1_b0)
	(immediate-dummy-4xf_observe-box-a1_p2-2_b1)
	(dummy-left-4xf_observe-box-a1_p2-2_b1)
	(pre-buz_joint-push_p2-1_p2-2_b1_a1_a3)
	(done-goal)
	(dummy-right-4xf_observe-box-a1_p2-2_b1)
	(dummy-right-sc5_observe-box-a1_p1-1_b0)
	(pre-bfb_push_p1-1_p1-2_b0_a1)
	(immediate-dummy-dc7_observe-box-a1_p2-2_b1)
	(dummy-left-dc7_observe-box-a1_p2-2_b1)
	(pre-qcd_joint-push_p2-1_p2-2_b1_a1_a3)
	(dummy-right-dc7_observe-box-a1_p2-2_b1)
)

(:action move
	:parameters ( ?start - pos ?end - pos ?a - agent)
	:precondition (and (adj ?start ?end) (agent-at ?a ?start) )
	:effect (and (not (agent-at ?a ?start)) (agent-at ?a ?end) )
)
(:action act-sc5_observe-box-a1_p1-1_b0
	:parameters ( ?a - agent )
	:precondition (and (init-sc5_observe-box-a1_p1-1_b0)(immediate-dummy-sc5_observe-box-a1_p1-1_b0)(agent-at a1 p1-1))
	:observe (box-at b0 p1-1)
)
(:action act-dummy-sc5_observe-box-a1_p1-1_b0
	:parameters ( ?a - agent )
	:precondition (and (init-sc5_observe-box-a1_p1-1_b0))
	:effect (and (immediate-dummy-sc5_observe-box-a1_p1-1_b0) )
)
(:action dummy-left-sc5_observe-box-a1_p1-1_b0
	:parameters ( ?a - agent )
	:precondition (and (init-sc5_observe-box-a1_p1-1_b0)(agent-at a1 p1-1)(not (box-at b0 p1-1))(immediate-dummy-sc5_observe-box-a1_p1-1_b0))
	:effect (and (not (init-sc5_observe-box-a1_p1-1_b0))(not (immediate-dummy-sc5_observe-box-a1_p1-1_b0))(dummy-left-sc5_observe-box-a1_p1-1_b0))
)
(:action dummy-right-sc5_observe-box-a1_p1-1_b0
	:parameters ( ?a - agent )
	:precondition (and (init-sc5_observe-box-a1_p1-1_b0)(agent-at a1 p1-1)(box-at b0 p1-1)(immediate-dummy-sc5_observe-box-a1_p1-1_b0))
	:effect (and (not (init-sc5_observe-box-a1_p1-1_b0))(not (immediate-dummy-sc5_observe-box-a1_p1-1_b0))(dummy-right-sc5_observe-box-a1_p1-1_b0))
)
(:action act-4xf_observe-box-a1_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-sc5_observe-box-a1_p1-1_b0)(immediate-dummy-4xf_observe-box-a1_p2-2_b1)(not (box-at b0 p1-1))(agent-at a1 p2-2))
	:observe (box-at b1 p2-2)
)
(:action act-dummy-4xf_observe-box-a1_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-sc5_observe-box-a1_p1-1_b0)(not (box-at b0 p1-1))(agent-at a1 p2-2))
	:effect (and (immediate-dummy-4xf_observe-box-a1_p2-2_b1) )
)
(:action dummy-left-4xf_observe-box-a1_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-sc5_observe-box-a1_p1-1_b0)(not (box-at b0 p1-1))(agent-at a1 p2-2)(not (box-at b1 p2-2))(immediate-dummy-4xf_observe-box-a1_p2-2_b1))
	:effect (and (not (immediate-dummy-4xf_observe-box-a1_p2-2_b1))(dummy-left-4xf_observe-box-a1_p2-2_b1))
)
(:action dummy-right-4xf_observe-box-a1_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-sc5_observe-box-a1_p1-1_b0)(not (box-at b0 p1-1))(agent-at a1 p2-2)(box-at b1 p2-2)(immediate-dummy-4xf_observe-box-a1_p2-2_b1))
	:effect (and (not (immediate-dummy-4xf_observe-box-a1_p2-2_b1))(dummy-right-4xf_observe-box-a1_p2-2_b1))
)
(:action act-buz_joint-push_p2-1_p2-2_b1_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-4xf_observe-box-a1_p2-2_b1)(not (box-at b1 p2-2))(not (box-at b0 p1-1))(adj p2-1 p2-2)(agent-at a1 p2-1)(box-at b1 p2-1)(heavy b1))
	:effect (and (pre-buz_joint-push_p2-1_p2-2_b1_a1_a3)(not (box-at b1 p2-1))(box-at b1 p2-2))
)
(:action goal-achieve-buz_joint-push_p2-1_p2-2_b1_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-buz_joint-push_p2-1_p2-2_b1_a1_a3))
	:effect (and (done-goal))
)
(:action goal-achieve-right-4xf_observe-box-a1_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-4xf_observe-box-a1_p2-2_b1)(box-at b1 p2-2)(not (box-at b0 p1-1)))
	:effect (and (done-goal))
)
(:action act-bfb_push_p1-1_p1-2_b0_a1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-sc5_observe-box-a1_p1-1_b0)(box-at b0 p1-1)(adj p1-1 p1-2)(agent-at a1 p1-1)(box-at b0 p1-1)(not (heavy b0)))
	:effect (and (pre-bfb_push_p1-1_p1-2_b0_a1)(not (box-at b0 p1-1))(box-at b0 p1-2))
)
(:action act-dc7_observe-box-a1_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (pre-bfb_push_p1-1_p1-2_b0_a1)(immediate-dummy-dc7_observe-box-a1_p2-2_b1)(agent-at a1 p2-2))
	:observe (box-at b1 p2-2)
)
(:action act-dummy-dc7_observe-box-a1_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (pre-bfb_push_p1-1_p1-2_b0_a1)(pre-bfb_push_p1-1_p1-2_b0_a1)(agent-at a1 p2-2))
	:effect (and (immediate-dummy-dc7_observe-box-a1_p2-2_b1) )
)
(:action dummy-left-dc7_observe-box-a1_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (pre-bfb_push_p1-1_p1-2_b0_a1)(agent-at a1 p2-2)(not (box-at b1 p2-2))(immediate-dummy-dc7_observe-box-a1_p2-2_b1))
	:effect (and (not (immediate-dummy-dc7_observe-box-a1_p2-2_b1))(dummy-left-dc7_observe-box-a1_p2-2_b1))
)
(:action dummy-right-dc7_observe-box-a1_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (pre-bfb_push_p1-1_p1-2_b0_a1)(agent-at a1 p2-2)(box-at b1 p2-2)(immediate-dummy-dc7_observe-box-a1_p2-2_b1))
	:effect (and (not (immediate-dummy-dc7_observe-box-a1_p2-2_b1))(dummy-right-dc7_observe-box-a1_p2-2_b1))
)
(:action act-qcd_joint-push_p2-1_p2-2_b1_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-dc7_observe-box-a1_p2-2_b1)(not (box-at b1 p2-2))(adj p2-1 p2-2)(agent-at a1 p2-1)(box-at b1 p2-1)(heavy b1))
	:effect (and (pre-qcd_joint-push_p2-1_p2-2_b1_a1_a3)(not (box-at b1 p2-1))(box-at b1 p2-2))
)
(:action goal-achieve-qcd_joint-push_p2-1_p2-2_b1_a1_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-qcd_joint-push_p2-1_p2-2_b1_a1_a3))
	:effect (and (done-goal))
)
(:action goal-achieve-right-dc7_observe-box-a1_p2-2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-dc7_observe-box-a1_p2-2_b1)(box-at b1 p2-2))
	:effect (and (done-goal))
)
)