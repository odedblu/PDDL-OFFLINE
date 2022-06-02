(define (domain box-4-a3)
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
	a3 - agent
)
(:predicates 
	(adj ?i - pos ?j - pos )
	(agent-at ?a - agent ?i - pos )
	(box-at ?b - box ?i - pos )
	(heavy ?b - box )
	(init-uqg_observe-box_p3-1_a3_b1)
	(immediate-dummy-uqg_observe-box_p3-1_a3_b1)
	(dummy-left-uqg_observe-box_p3-1_a3_b1)
	(immediate-dummy-2iq_observe-box_p5-1_a2_b2)
	(dummy-left-2iq_observe-box_p5-1_a2_b2)
	(done-goal)
	(dummy-right-2iq_observe-box_p5-1_a2_b2)
	(pre-l06_joint-push_p5-1_p5-2_b2_a2_a3)
	(dummy-right-uqg_observe-box_p3-1_a3_b1)
	(pre-rgu_push_p3-1_p3-2_b1_a3)
	(immediate-dummy-dmg_observe-box_p5-1_a2_b2)
	(dummy-left-dmg_observe-box_p5-1_a2_b2)
	(dummy-right-dmg_observe-box_p5-1_a2_b2)
	(pre-g28_joint-push_p5-1_p5-2_b2_a2_a3)
)

(:action move
	:parameters ( ?start - pos ?end - pos ?a - agent)
	:precondition (and (adj ?start ?end) (agent-at ?a ?start) )
	:effect (and (not (agent-at ?a ?start)) (agent-at ?a ?end) )
)
(:action act-uqg_observe-box_p3-1_a3_b1
	:parameters ( ?a - agent )
	:precondition (and (init-uqg_observe-box_p3-1_a3_b1)(immediate-dummy-uqg_observe-box_p3-1_a3_b1)(agent-at a3 p3-1))
	:observe (box-at b1 p3-1)
)
(:action act-dummy-uqg_observe-box_p3-1_a3_b1
	:parameters ( ?a - agent )
	:precondition (and (init-uqg_observe-box_p3-1_a3_b1))
	:effect (and (immediate-dummy-uqg_observe-box_p3-1_a3_b1) )
)
(:action dummy-left-uqg_observe-box_p3-1_a3_b1
	:parameters ( ?a - agent )
	:precondition (and (init-uqg_observe-box_p3-1_a3_b1)(immediate-dummy-uqg_observe-box_p3-1_a3_b1)(agent-at a3 p3-1)(not (box-at b1 p3-1)))
	:effect (and (not (init-uqg_observe-box_p3-1_a3_b1))(not (immediate-dummy-uqg_observe-box_p3-1_a3_b1))(dummy-left-uqg_observe-box_p3-1_a3_b1))
)
(:action dummy-right-uqg_observe-box_p3-1_a3_b1
	:parameters ( ?a - agent )
	:precondition (and (init-uqg_observe-box_p3-1_a3_b1)(immediate-dummy-uqg_observe-box_p3-1_a3_b1)(agent-at a3 p3-1)(box-at b1 p3-1))
	:effect (and (not (init-uqg_observe-box_p3-1_a3_b1))(not (immediate-dummy-uqg_observe-box_p3-1_a3_b1))(dummy-right-uqg_observe-box_p3-1_a3_b1))
)
(:action act-2iq_observe-box_p5-1_a2_b2
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-uqg_observe-box_p3-1_a3_b1)(immediate-dummy-2iq_observe-box_p5-1_a2_b2)(not (box-at b1 p3-1))(agent-at a3 p5-1))
	:observe (box-at b2 p5-1)
)
(:action act-dummy-2iq_observe-box_p5-1_a2_b2
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-uqg_observe-box_p3-1_a3_b1)(not (box-at b1 p3-1))(agent-at a3 p5-1))
	:effect (and (immediate-dummy-2iq_observe-box_p5-1_a2_b2) )
)
(:action dummy-left-2iq_observe-box_p5-1_a2_b2
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-uqg_observe-box_p3-1_a3_b1)(not (box-at b1 p3-1))(agent-at a3 p5-1)(not (box-at b2 p5-1)))
	:effect (and (not (immediate-dummy-2iq_observe-box_p5-1_a2_b2))(dummy-left-2iq_observe-box_p5-1_a2_b2))
)
(:action dummy-right-2iq_observe-box_p5-1_a2_b2
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-uqg_observe-box_p3-1_a3_b1)(not (box-at b1 p3-1))(agent-at a3 p5-1)(box-at b2 p5-1))
	:effect (and (not (immediate-dummy-2iq_observe-box_p5-1_a2_b2))(dummy-right-2iq_observe-box_p5-1_a2_b2))
)
(:action goal-achieve-left-2iq_observe-box_p5-1_a2_b2
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-2iq_observe-box_p5-1_a2_b2)(not (box-at b2 p5-1))(not (box-at b1 p3-1)))
	:effect (and (done-goal))
)
(:action act-l06_joint-push_p5-1_p5-2_b2_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-2iq_observe-box_p5-1_a2_b2)(box-at b2 p5-1)(not (box-at b1 p3-1))(adj p5-1 p5-2)(agent-at a3 p5-1)(box-at b2 p5-1)(heavy b2))
	:effect (and (pre-l06_joint-push_p5-1_p5-2_b2_a2_a3)(not (box-at b2 p5-1))(box-at b2 p5-2))
)
(:action goal-achieve-l06_joint-push_p5-1_p5-2_b2_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-l06_joint-push_p5-1_p5-2_b2_a2_a3))
	:effect (and (done-goal))
)
(:action act-rgu_push_p3-1_p3-2_b1_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-uqg_observe-box_p3-1_a3_b1)(box-at b1 p3-1)(adj p3-1 p3-2)(agent-at a3 p3-1)(box-at b1 p3-1)(not (heavy b1)))
	:effect (and (pre-rgu_push_p3-1_p3-2_b1_a3)(not (box-at b1 p3-1))(box-at b1 p3-2))
)
(:action act-dmg_observe-box_p5-1_a2_b2
	:parameters ( ?a - agent )
	:precondition (and (pre-rgu_push_p3-1_p3-2_b1_a3)(immediate-dummy-dmg_observe-box_p5-1_a2_b2)(agent-at a3 p5-1))
	:observe (box-at b2 p5-1)
)
(:action act-dummy-dmg_observe-box_p5-1_a2_b2
	:parameters ( ?a - agent )
	:precondition (and (pre-rgu_push_p3-1_p3-2_b1_a3)(pre-rgu_push_p3-1_p3-2_b1_a3)(agent-at a3 p5-1))
	:effect (and (immediate-dummy-dmg_observe-box_p5-1_a2_b2) )
)
(:action dummy-left-dmg_observe-box_p5-1_a2_b2
	:parameters ( ?a - agent )
	:precondition (and (pre-rgu_push_p3-1_p3-2_b1_a3)(agent-at a3 p5-1)(not (box-at b2 p5-1)))
	:effect (and (not (immediate-dummy-dmg_observe-box_p5-1_a2_b2))(dummy-left-dmg_observe-box_p5-1_a2_b2))
)
(:action dummy-right-dmg_observe-box_p5-1_a2_b2
	:parameters ( ?a - agent )
	:precondition (and (pre-rgu_push_p3-1_p3-2_b1_a3)(agent-at a3 p5-1)(box-at b2 p5-1))
	:effect (and (not (immediate-dummy-dmg_observe-box_p5-1_a2_b2))(dummy-right-dmg_observe-box_p5-1_a2_b2))
)
(:action goal-achieve-left-dmg_observe-box_p5-1_a2_b2
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-dmg_observe-box_p5-1_a2_b2)(not (box-at b2 p5-1)))
	:effect (and (done-goal))
)
(:action act-g28_joint-push_p5-1_p5-2_b2_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-dmg_observe-box_p5-1_a2_b2)(box-at b2 p5-1)(adj p5-1 p5-2)(agent-at a3 p5-1)(box-at b2 p5-1)(heavy b2))
	:effect (and (pre-g28_joint-push_p5-1_p5-2_b2_a2_a3)(not (box-at b2 p5-1))(box-at b2 p5-2))
)
(:action goal-achieve-g28_joint-push_p5-1_p5-2_b2_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-g28_joint-push_p5-1_p5-2_b2_a2_a3))
	:effect (and (done-goal))
)
)