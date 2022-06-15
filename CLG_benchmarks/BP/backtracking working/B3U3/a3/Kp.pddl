(define (problem Kbox-3)
(:domain Kbox-3-a3)
;;SingleStateK
(:init
(not (init-mx3_observe-box-a3_p3-1_b2 ))
(not (agent-at a3 p3-1))
(adj p1-1 p1-2)
(adj p2-1 p2-2)
(adj p3-1 p3-2)
(adj p1-2 p1-1)
(adj p2-2 p2-1)
(adj p3-2 p3-1)
(adj p1-1 p2-1)
(adj p2-1 p3-1)
(adj p2-1 p1-1)
(adj p3-1 p2-1)
(heavy b2)
(heavy b1)
(not (heavy b0))
(not (agent-at a3 p1-1))
(not (agent-at a3 p1-2))
(not (agent-at a3 p2-1))
(agent-at a3 p2-2)
(not (agent-at a3 p3-2))
(not (box-at b0 p2-1))
(KNbox-at b0 p2-1)
(not (box-at b0 p2-2))
(KNbox-at b0 p2-2)
(not (box-at b0 p3-1))
(KNbox-at b0 p3-1)
(not (box-at b0 p3-2))
(KNbox-at b0 p3-2)
(not (box-at b1 p1-1))
(KNbox-at b1 p1-1)
(not (box-at b1 p1-2))
(KNbox-at b1 p1-2)
(not (box-at b1 p3-1))
(KNbox-at b1 p3-1)
(not (box-at b1 p3-2))
(KNbox-at b1 p3-2)
(not (box-at b2 p1-1))
(KNbox-at b2 p1-1)
(not (box-at b2 p1-2))
(KNbox-at b2 p1-2)
(not (box-at b2 p2-1))
(KNbox-at b2 p2-1)
(not (box-at b2 p2-2))
(KNbox-at b2 p2-2)
(not (immediate-dummy-mx3_observe-box-a3_p3-1_b2 ))
(dummy-left-mx3_observe-box-a3_p3-1_b2 )
(immediate-dummy-jc9_observe-box-a3_p2-2_b1 )
(not (dummy-left-jc9_observe-box-a3_p2-2_b1 ))
(not (pre-8lh_joint-push_p2-1_p2-2_b1_a2_a3 ))
(not (done-goal ))
(not (dummy-right-jc9_observe-box-a3_p2-2_b1 ))
(not (dummy-right-mx3_observe-box-a3_p3-1_b2 ))
(not (pre-09n_joint-push_p3-1_p3-2_b2_a2_a3 ))
(not (immediate-dummy-hxs_observe-box-a3_p2-2_b1 ))
(not (dummy-left-hxs_observe-box-a3_p2-2_b1 ))
(not (pre-p3o_joint-push_p2-1_p2-2_b1_a2_a3 ))
(not (dummy-right-hxs_observe-box-a3_p2-2_b1 ))
(not (box-at b2 p3-1))
(KNbox-at b2 p3-1)
(box-at b2 p3-2)
(Kbox-at b2 p3-2)
(not (box-at b1 p2-2))
(KNbox-at b1 p2-2)
(box-at b1 p2-1)
(Kbox-at b1 p2-1)
(box-at b0 p1-1)
(not (box-at b0 p1-2))
)
(:goal (done-goal ))
)