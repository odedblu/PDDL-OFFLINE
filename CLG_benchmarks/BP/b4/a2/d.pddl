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
	(init-916_observe-box_p3-1_a3_b1)
	(immediate-dummy-916_observe-box_p3-1_a3_b1)
	(dummy-left-916_observe-box_p3-1_a3_b1)
	(immediate-dummy-bho_observe-box_p5-1_a2_b2)
	(dummy-left-bho_observe-box_p5-1_a2_b2)
	(done-goal)
	(dummy-right-bho_observe-box_p5-1_a2_b2)
	(pre-q8r_joint-push_p5-1_p5-2_b2_a2_a3)
	(dummy-right-916_observe-box_p3-1_a3_b1)
	(immediate-dummy-so5_observe-box_p5-1_a2_b2)
	(dummy-left-so5_observe-box_p5-1_a2_b2)
	(pre-bpb_joint-push_p3-1_p3-2_b1_a2_a3)
	(dummy-right-so5_observe-box_p5-1_a2_b2)
	(pre-lo7_joint-push_p3-1_p3-2_b1_a2_a3)
	(pre-7vi_joint-push_p5-1_p5-2_b2_a2_a3)
)

(:action move
	:parameters ( ?start - pos ?end - pos ?a - agent)
	:precondition (and (adj ?start ?end) (agent-at ?a ?start) )
	:effect (and (not (agent-at ?a ?start)) (agent-at ?a ?end) )
)
(:action act-916_observe-box_p3-1_a3_b1
	:parameters ( ?a - agent )
	:precondition (and (init-916_observe-box_p3-1_a3_b1)(immediate-dummy-916_observe-box_p3-1_a3_b1)(agent-at a2 p3-1))
	:observe (box-at b1 p3-1)
)
(:action act-dummy-916_observe-box_p3-1_a3_b1
	:parameters ( ?a - agent )
	:precondition (and (init-916_observe-box_p3-1_a3_b1))
	:effect (and (immediate-dummy-916_observe-box_p3-1_a3_b1) )
)
(:action dummy-left-916_observe-box_p3-1_a3_b1
	:parameters ( ?a - agent )
	:precondition (and (init-916_observe-box_p3-1_a3_b1)(agent-at a2 p3-1)(not (box-at b1 p3-1))(immediate-dummy-916_observe-box_p3-1_a3_b1))
	:effect (and (not (init-916_observe-box_p3-1_a3_b1))(not (immediate-dummy-916_observe-box_p3-1_a3_b1))(dummy-left-916_observe-box_p3-1_a3_b1))
)
(:action dummy-right-916_observe-box_p3-1_a3_b1
	:parameters ( ?a - agent )
	:precondition (and (init-916_observe-box_p3-1_a3_b1)(agent-at a2 p3-1)(box-at b1 p3-1)(immediate-dummy-916_observe-box_p3-1_a3_b1))
	:effect (and (not (init-916_observe-box_p3-1_a3_b1))(not (immediate-dummy-916_observe-box_p3-1_a3_b1))(dummy-right-916_observe-box_p3-1_a3_b1))
)
(:action act-bho_observe-box_p5-1_a2_b2
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-916_observe-box_p3-1_a3_b1)(immediate-dummy-bho_observe-box_p5-1_a2_b2)(not (box-at b1 p3-1))(agent-at a2 p5-1))
	:observe (box-at b2 p5-1)
)
(:action act-dummy-bho_observe-box_p5-1_a2_b2
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-916_observe-box_p3-1_a3_b1)(not (box-at b1 p3-1))(agent-at a2 p5-1))
	:effect (and (immediate-dummy-bho_observe-box_p5-1_a2_b2) )
)
(:action dummy-left-bho_observe-box_p5-1_a2_b2
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-916_observe-box_p3-1_a3_b1)(not (box-at b1 p3-1))(agent-at a2 p5-1)(not (box-at b2 p5-1))(immediate-dummy-bho_observe-box_p5-1_a2_b2))
	:effect (and (not (immediate-dummy-bho_observe-box_p5-1_a2_b2))(dummy-left-bho_observe-box_p5-1_a2_b2))
)
(:action dummy-right-bho_observe-box_p5-1_a2_b2
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-916_observe-box_p3-1_a3_b1)(not (box-at b1 p3-1))(agent-at a2 p5-1)(box-at b2 p5-1)(immediate-dummy-bho_observe-box_p5-1_a2_b2))
	:effect (and (not (immediate-dummy-bho_observe-box_p5-1_a2_b2))(dummy-right-bho_observe-box_p5-1_a2_b2))
)
(:action goal-achieve-left-bho_observe-box_p5-1_a2_b2
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-bho_observe-box_p5-1_a2_b2)(not (box-at b2 p5-1))(not (box-at b1 p3-1)))
	:effect (and (done-goal))
)
(:action act-q8r_joint-push_p5-1_p5-2_b2_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-bho_observe-box_p5-1_a2_b2)(box-at b2 p5-1)(not (box-at b1 p3-1))(adj p5-1 p5-2)(agent-at a2 p5-1)(box-at b2 p5-1)(heavy b2))
	:effect (and (pre-q8r_joint-push_p5-1_p5-2_b2_a2_a3)(not (box-at b2 p5-1))(box-at b2 p5-2))
)
(:action goal-achieve-q8r_joint-push_p5-1_p5-2_b2_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-q8r_joint-push_p5-1_p5-2_b2_a2_a3))
	:effect (and (done-goal))
)
(:action act-so5_observe-box_p5-1_a2_b2
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-916_observe-box_p3-1_a3_b1)(immediate-dummy-so5_observe-box_p5-1_a2_b2)(box-at b1 p3-1)(agent-at a2 p5-1))
	:observe (box-at b2 p5-1)
)
(:action act-dummy-so5_observe-box_p5-1_a2_b2
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-916_observe-box_p3-1_a3_b1)(box-at b1 p3-1)(agent-at a2 p5-1))
	:effect (and (immediate-dummy-so5_observe-box_p5-1_a2_b2) )
)
(:action dummy-left-so5_observe-box_p5-1_a2_b2
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-916_observe-box_p3-1_a3_b1)(box-at b1 p3-1)(agent-at a2 p5-1)(not (box-at b2 p5-1))(immediate-dummy-so5_observe-box_p5-1_a2_b2))
	:effect (and (not (immediate-dummy-so5_observe-box_p5-1_a2_b2))(dummy-left-so5_observe-box_p5-1_a2_b2))
)
(:action dummy-right-so5_observe-box_p5-1_a2_b2
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-916_observe-box_p3-1_a3_b1)(box-at b1 p3-1)(agent-at a2 p5-1)(box-at b2 p5-1)(immediate-dummy-so5_observe-box_p5-1_a2_b2))
	:effect (and (not (immediate-dummy-so5_observe-box_p5-1_a2_b2))(dummy-right-so5_observe-box_p5-1_a2_b2))
)
(:action act-bpb_joint-push_p3-1_p3-2_b1_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-so5_observe-box_p5-1_a2_b2)(not (box-at b2 p5-1))(box-at b1 p3-1)(adj p3-1 p3-2)(agent-at a2 p3-1)(box-at b1 p3-1)(heavy b1))
	:effect (and (pre-bpb_joint-push_p3-1_p3-2_b1_a2_a3)(not (box-at b1 p3-1))(box-at b1 p3-2))
)
(:action goal-achieve-bpb_joint-push_p3-1_p3-2_b1_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-bpb_joint-push_p3-1_p3-2_b1_a2_a3))
	:effect (and (done-goal))
)
(:action act-lo7_joint-push_p3-1_p3-2_b1_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-so5_observe-box_p5-1_a2_b2)(box-at b2 p5-1)(box-at b1 p3-1)(adj p3-1 p3-2)(agent-at a2 p3-1)(box-at b1 p3-1)(heavy b1))
	:effect (and (pre-lo7_joint-push_p3-1_p3-2_b1_a2_a3)(not (box-at b1 p3-1))(box-at b1 p3-2))
)
(:action act-7vi_joint-push_p5-1_p5-2_b2_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-lo7_joint-push_p3-1_p3-2_b1_a2_a3)(adj p5-1 p5-2)(agent-at a2 p5-1)(box-at b2 p5-1)(heavy b2))
	:effect (and (pre-7vi_joint-push_p5-1_p5-2_b2_a2_a3)(not (box-at b2 p5-1))(box-at b2 p5-2))
)
(:action goal-achieve-7vi_joint-push_p5-1_p5-2_b2_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-7vi_joint-push_p5-1_p5-2_b2_a2_a3))
	:effect (and (done-goal))
)
)