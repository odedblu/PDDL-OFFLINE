(define (problem Kbox-3)
(:domain Kbox-3-a2)
;;SingleStateK
(:init
(init-cwv_observe-box-a3_p3-1_b2 )
(Kinit-cwv_observe-box-a3_p3-1_b2)
(agent-at a2 p2-1)
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
(not (agent-at a2 p1-1))
(not (agent-at a2 p1-2))
(not (agent-at a2 p2-2))
(not (agent-at a2 p3-1))
(not (agent-at a2 p3-2))
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
(not (pre-a0g_joint-push_p2-1_p2-2_b1_a2_a3 ))
(not (done-goal ))
(not (pre-znz_joint-push_p3-1_p3-2_b2_a2_a3 ))
(not (pre-iso_joint-push_p2-1_p2-2_b1_a2_a3 ))
(not (box-at b0 p1-1))
(box-at b0 p1-2)
(not (box-at b1 p2-1))
(box-at b1 p2-2)
(not (box-at b2 p3-1))
(box-at b2 p3-2)
)
(:goal (done-goal ))
)
