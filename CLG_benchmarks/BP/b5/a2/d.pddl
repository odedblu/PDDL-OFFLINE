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
	(init-43x_observe-box_p3-1_a2_b2)
	(immediate-dummy-43x_observe-box_p3-1_a2_b2)
	(dummy-left-43x_observe-box_p3-1_a2_b2)
	(immediate-dummy-lla_observe-box_p1-1_a1_b0)
	(dummy-left-lla_observe-box_p1-1_a1_b0)
	(immediate-dummy-yvl_observe-box_p2-2_a3_b1)
	(dummy-left-yvl_observe-box_p2-2_a3_b1)
	(pre-bz9_joint-push_p2-1_p2-2_b1_a2_a3)
	(done-goal)
	(dummy-right-yvl_observe-box_p2-2_a3_b1)
	(dummy-right-lla_observe-box_p1-1_a1_b0)
	(immediate-dummy-zx6_observe-box_p2-1_a2_b1)
	(dummy-left-zx6_observe-box_p2-1_a2_b1)
	(dummy-right-zx6_observe-box_p2-1_a2_b1)
	(pre-vj0_joint-push_p2-1_p2-2_b1_a2_a3)
	(dummy-right-43x_observe-box_p3-1_a2_b2)
	(pre-9u9_push_p3-1_p3-2_b2_a2)
	(immediate-dummy-6tg_observe-box_p1-1_a1_b0)
	(dummy-left-6tg_observe-box_p1-1_a1_b0)
	(immediate-dummy-fjf_observe-box_p2-2_a3_b1)
	(dummy-left-fjf_observe-box_p2-2_a3_b1)
	(pre-i8w_joint-push_p2-1_p2-2_b1_a2_a3)
	(dummy-right-fjf_observe-box_p2-2_a3_b1)
	(dummy-right-6tg_observe-box_p1-1_a1_b0)
	(immediate-dummy-dll_observe-box_p2-1_a2_b1)
	(dummy-left-dll_observe-box_p2-1_a2_b1)
	(dummy-right-dll_observe-box_p2-1_a2_b1)
	(pre-s8i_joint-push_p2-1_p2-2_b1_a2_a3)
)

(:action move
	:parameters ( ?start - pos ?end - pos ?a - agent)
	:precondition (and (adj ?start ?end) (agent-at ?a ?start) )
	:effect (and (not (agent-at ?a ?start)) (agent-at ?a ?end) )
)
(:action act-43x_observe-box_p3-1_a2_b2
	:parameters ( ?a - agent )
	:precondition (and (init-43x_observe-box_p3-1_a2_b2)(immediate-dummy-43x_observe-box_p3-1_a2_b2)(agent-at a2 p3-1))
	:observe (box-at b2 p3-1)
)
(:action act-dummy-43x_observe-box_p3-1_a2_b2
	:parameters ( ?a - agent )
	:precondition (and (init-43x_observe-box_p3-1_a2_b2))
	:effect (and (immediate-dummy-43x_observe-box_p3-1_a2_b2) )
)
(:action dummy-left-43x_observe-box_p3-1_a2_b2
	:parameters ( ?a - agent )
	:precondition (and (init-43x_observe-box_p3-1_a2_b2)(agent-at a2 p3-1)(not (box-at b2 p3-1))(immediate-dummy-43x_observe-box_p3-1_a2_b2))
	:effect (and (not (init-43x_observe-box_p3-1_a2_b2))(not (immediate-dummy-43x_observe-box_p3-1_a2_b2))(dummy-left-43x_observe-box_p3-1_a2_b2))
)
(:action dummy-right-43x_observe-box_p3-1_a2_b2
	:parameters ( ?a - agent )
	:precondition (and (init-43x_observe-box_p3-1_a2_b2)(agent-at a2 p3-1)(box-at b2 p3-1)(immediate-dummy-43x_observe-box_p3-1_a2_b2))
	:effect (and (not (init-43x_observe-box_p3-1_a2_b2))(not (immediate-dummy-43x_observe-box_p3-1_a2_b2))(dummy-right-43x_observe-box_p3-1_a2_b2))
)
(:action act-lla_observe-box_p1-1_a1_b0
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-43x_observe-box_p3-1_a2_b2)(immediate-dummy-lla_observe-box_p1-1_a1_b0)(not (box-at b2 p3-1))(agent-at a2 p1-1))
	:observe (box-at b0 p1-1)
)
(:action act-dummy-lla_observe-box_p1-1_a1_b0
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-43x_observe-box_p3-1_a2_b2)(not (box-at b2 p3-1))(agent-at a2 p1-1))
	:effect (and (immediate-dummy-lla_observe-box_p1-1_a1_b0) )
)
(:action dummy-left-lla_observe-box_p1-1_a1_b0
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-43x_observe-box_p3-1_a2_b2)(not (box-at b2 p3-1))(agent-at a2 p1-1)(not (box-at b0 p1-1))(immediate-dummy-lla_observe-box_p1-1_a1_b0))
	:effect (and (not (immediate-dummy-lla_observe-box_p1-1_a1_b0))(dummy-left-lla_observe-box_p1-1_a1_b0))
)
(:action dummy-right-lla_observe-box_p1-1_a1_b0
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-43x_observe-box_p3-1_a2_b2)(not (box-at b2 p3-1))(agent-at a2 p1-1)(box-at b0 p1-1)(immediate-dummy-lla_observe-box_p1-1_a1_b0))
	:effect (and (not (immediate-dummy-lla_observe-box_p1-1_a1_b0))(dummy-right-lla_observe-box_p1-1_a1_b0))
)
(:action act-yvl_observe-box_p2-2_a3_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-lla_observe-box_p1-1_a1_b0)(immediate-dummy-yvl_observe-box_p2-2_a3_b1)(not (box-at b0 p1-1))(not (box-at b2 p3-1))(agent-at a2 p2-2))
	:observe (box-at b1 p2-2)
)
(:action act-dummy-yvl_observe-box_p2-2_a3_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-lla_observe-box_p1-1_a1_b0)(not (box-at b0 p1-1))(not (box-at b2 p3-1))(agent-at a2 p2-2))
	:effect (and (immediate-dummy-yvl_observe-box_p2-2_a3_b1) )
)
(:action dummy-left-yvl_observe-box_p2-2_a3_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-lla_observe-box_p1-1_a1_b0)(not (box-at b0 p1-1))(not (box-at b2 p3-1))(agent-at a2 p2-2)(not (box-at b1 p2-2))(immediate-dummy-yvl_observe-box_p2-2_a3_b1))
	:effect (and (not (immediate-dummy-yvl_observe-box_p2-2_a3_b1))(dummy-left-yvl_observe-box_p2-2_a3_b1))
)
(:action dummy-right-yvl_observe-box_p2-2_a3_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-lla_observe-box_p1-1_a1_b0)(not (box-at b0 p1-1))(not (box-at b2 p3-1))(agent-at a2 p2-2)(box-at b1 p2-2)(immediate-dummy-yvl_observe-box_p2-2_a3_b1))
	:effect (and (not (immediate-dummy-yvl_observe-box_p2-2_a3_b1))(dummy-right-yvl_observe-box_p2-2_a3_b1))
)
(:action act-bz9_joint-push_p2-1_p2-2_b1_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-yvl_observe-box_p2-2_a3_b1)(not (box-at b1 p2-2))(not (box-at b0 p1-1))(not (box-at b2 p3-1))(adj p2-1 p2-2)(agent-at a2 p2-1)(box-at b1 p2-1)(heavy b1))
	:effect (and (pre-bz9_joint-push_p2-1_p2-2_b1_a2_a3)(not (box-at b1 p2-1))(box-at b1 p2-2))
)
(:action goal-achieve-bz9_joint-push_p2-1_p2-2_b1_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-bz9_joint-push_p2-1_p2-2_b1_a2_a3))
	:effect (and (done-goal))
)
(:action goal-achieve-right-yvl_observe-box_p2-2_a3_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-yvl_observe-box_p2-2_a3_b1)(box-at b1 p2-2)(not (box-at b0 p1-1))(not (box-at b2 p3-1)))
	:effect (and (done-goal))
)
(:action act-zx6_observe-box_p2-1_a2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-lla_observe-box_p1-1_a1_b0)(immediate-dummy-zx6_observe-box_p2-1_a2_b1)(box-at b0 p1-1)(not (box-at b2 p3-1))(agent-at a2 p2-1))
	:observe (box-at b1 p2-1)
)
(:action act-dummy-zx6_observe-box_p2-1_a2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-lla_observe-box_p1-1_a1_b0)(box-at b0 p1-1)(not (box-at b2 p3-1))(agent-at a2 p2-1))
	:effect (and (immediate-dummy-zx6_observe-box_p2-1_a2_b1) )
)
(:action dummy-left-zx6_observe-box_p2-1_a2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-lla_observe-box_p1-1_a1_b0)(box-at b0 p1-1)(not (box-at b2 p3-1))(agent-at a2 p2-1)(not (box-at b1 p2-1))(immediate-dummy-zx6_observe-box_p2-1_a2_b1))
	:effect (and (not (immediate-dummy-zx6_observe-box_p2-1_a2_b1))(dummy-left-zx6_observe-box_p2-1_a2_b1))
)
(:action dummy-right-zx6_observe-box_p2-1_a2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-lla_observe-box_p1-1_a1_b0)(box-at b0 p1-1)(not (box-at b2 p3-1))(agent-at a2 p2-1)(box-at b1 p2-1)(immediate-dummy-zx6_observe-box_p2-1_a2_b1))
	:effect (and (not (immediate-dummy-zx6_observe-box_p2-1_a2_b1))(dummy-right-zx6_observe-box_p2-1_a2_b1))
)
(:action goal-achieve-left-zx6_observe-box_p2-1_a2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-zx6_observe-box_p2-1_a2_b1)(not (box-at b1 p2-1))(box-at b0 p1-1)(not (box-at b2 p3-1)))
	:effect (and (done-goal))
)
(:action act-vj0_joint-push_p2-1_p2-2_b1_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-zx6_observe-box_p2-1_a2_b1)(box-at b1 p2-1)(box-at b0 p1-1)(not (box-at b2 p3-1))(adj p2-1 p2-2)(agent-at a2 p2-1)(box-at b1 p2-1)(heavy b1))
	:effect (and (pre-vj0_joint-push_p2-1_p2-2_b1_a2_a3)(not (box-at b1 p2-1))(box-at b1 p2-2))
)
(:action goal-achieve-vj0_joint-push_p2-1_p2-2_b1_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-vj0_joint-push_p2-1_p2-2_b1_a2_a3))
	:effect (and (done-goal))
)
(:action act-9u9_push_p3-1_p3-2_b2_a2
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-43x_observe-box_p3-1_a2_b2)(box-at b2 p3-1)(adj p3-1 p3-2)(agent-at a2 p3-1)(box-at b2 p3-1)(not (heavy b2)))
	:effect (and (pre-9u9_push_p3-1_p3-2_b2_a2)(not (box-at b2 p3-1))(box-at b2 p3-2))
)
(:action act-6tg_observe-box_p1-1_a1_b0
	:parameters ( ?a - agent )
	:precondition (and (pre-9u9_push_p3-1_p3-2_b2_a2)(immediate-dummy-6tg_observe-box_p1-1_a1_b0)(agent-at a2 p1-1))
	:observe (box-at b0 p1-1)
)
(:action act-dummy-6tg_observe-box_p1-1_a1_b0
	:parameters ( ?a - agent )
	:precondition (and (pre-9u9_push_p3-1_p3-2_b2_a2)(pre-9u9_push_p3-1_p3-2_b2_a2)(agent-at a2 p1-1))
	:effect (and (immediate-dummy-6tg_observe-box_p1-1_a1_b0) )
)
(:action dummy-left-6tg_observe-box_p1-1_a1_b0
	:parameters ( ?a - agent )
	:precondition (and (pre-9u9_push_p3-1_p3-2_b2_a2)(agent-at a2 p1-1)(not (box-at b0 p1-1))(immediate-dummy-6tg_observe-box_p1-1_a1_b0))
	:effect (and (not (immediate-dummy-6tg_observe-box_p1-1_a1_b0))(dummy-left-6tg_observe-box_p1-1_a1_b0))
)
(:action dummy-right-6tg_observe-box_p1-1_a1_b0
	:parameters ( ?a - agent )
	:precondition (and (pre-9u9_push_p3-1_p3-2_b2_a2)(agent-at a2 p1-1)(box-at b0 p1-1)(immediate-dummy-6tg_observe-box_p1-1_a1_b0))
	:effect (and (not (immediate-dummy-6tg_observe-box_p1-1_a1_b0))(dummy-right-6tg_observe-box_p1-1_a1_b0))
)
(:action act-fjf_observe-box_p2-2_a3_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-6tg_observe-box_p1-1_a1_b0)(immediate-dummy-fjf_observe-box_p2-2_a3_b1)(not (box-at b0 p1-1))(agent-at a2 p2-2))
	:observe (box-at b1 p2-2)
)
(:action act-dummy-fjf_observe-box_p2-2_a3_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-6tg_observe-box_p1-1_a1_b0)(not (box-at b0 p1-1))(agent-at a2 p2-2))
	:effect (and (immediate-dummy-fjf_observe-box_p2-2_a3_b1) )
)
(:action dummy-left-fjf_observe-box_p2-2_a3_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-6tg_observe-box_p1-1_a1_b0)(not (box-at b0 p1-1))(agent-at a2 p2-2)(not (box-at b1 p2-2))(immediate-dummy-fjf_observe-box_p2-2_a3_b1))
	:effect (and (not (immediate-dummy-fjf_observe-box_p2-2_a3_b1))(dummy-left-fjf_observe-box_p2-2_a3_b1))
)
(:action dummy-right-fjf_observe-box_p2-2_a3_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-6tg_observe-box_p1-1_a1_b0)(not (box-at b0 p1-1))(agent-at a2 p2-2)(box-at b1 p2-2)(immediate-dummy-fjf_observe-box_p2-2_a3_b1))
	:effect (and (not (immediate-dummy-fjf_observe-box_p2-2_a3_b1))(dummy-right-fjf_observe-box_p2-2_a3_b1))
)
(:action act-i8w_joint-push_p2-1_p2-2_b1_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-fjf_observe-box_p2-2_a3_b1)(not (box-at b1 p2-2))(not (box-at b0 p1-1))(adj p2-1 p2-2)(agent-at a2 p2-1)(box-at b1 p2-1)(heavy b1))
	:effect (and (pre-i8w_joint-push_p2-1_p2-2_b1_a2_a3)(not (box-at b1 p2-1))(box-at b1 p2-2))
)
(:action goal-achieve-i8w_joint-push_p2-1_p2-2_b1_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-i8w_joint-push_p2-1_p2-2_b1_a2_a3))
	:effect (and (done-goal))
)
(:action goal-achieve-right-fjf_observe-box_p2-2_a3_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-fjf_observe-box_p2-2_a3_b1)(box-at b1 p2-2)(not (box-at b0 p1-1)))
	:effect (and (done-goal))
)
(:action act-dll_observe-box_p2-1_a2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-6tg_observe-box_p1-1_a1_b0)(immediate-dummy-dll_observe-box_p2-1_a2_b1)(box-at b0 p1-1)(agent-at a2 p2-1))
	:observe (box-at b1 p2-1)
)
(:action act-dummy-dll_observe-box_p2-1_a2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-6tg_observe-box_p1-1_a1_b0)(box-at b0 p1-1)(agent-at a2 p2-1))
	:effect (and (immediate-dummy-dll_observe-box_p2-1_a2_b1) )
)
(:action dummy-left-dll_observe-box_p2-1_a2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-6tg_observe-box_p1-1_a1_b0)(box-at b0 p1-1)(agent-at a2 p2-1)(not (box-at b1 p2-1))(immediate-dummy-dll_observe-box_p2-1_a2_b1))
	:effect (and (not (immediate-dummy-dll_observe-box_p2-1_a2_b1))(dummy-left-dll_observe-box_p2-1_a2_b1))
)
(:action dummy-right-dll_observe-box_p2-1_a2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-6tg_observe-box_p1-1_a1_b0)(box-at b0 p1-1)(agent-at a2 p2-1)(box-at b1 p2-1)(immediate-dummy-dll_observe-box_p2-1_a2_b1))
	:effect (and (not (immediate-dummy-dll_observe-box_p2-1_a2_b1))(dummy-right-dll_observe-box_p2-1_a2_b1))
)
(:action goal-achieve-left-dll_observe-box_p2-1_a2_b1
	:parameters ( ?a - agent )
	:precondition (and (dummy-left-dll_observe-box_p2-1_a2_b1)(not (box-at b1 p2-1))(box-at b0 p1-1))
	:effect (and (done-goal))
)
(:action act-s8i_joint-push_p2-1_p2-2_b1_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (dummy-right-dll_observe-box_p2-1_a2_b1)(box-at b1 p2-1)(box-at b0 p1-1)(adj p2-1 p2-2)(agent-at a2 p2-1)(box-at b1 p2-1)(heavy b1))
	:effect (and (pre-s8i_joint-push_p2-1_p2-2_b1_a2_a3)(not (box-at b1 p2-1))(box-at b1 p2-2))
)
(:action goal-achieve-s8i_joint-push_p2-1_p2-2_b1_a2_a3
	:parameters ( ?a - agent )
	:precondition (and (pre-s8i_joint-push_p2-1_p2-2_b1_a2_a3))
	:effect (and (done-goal))
)
)