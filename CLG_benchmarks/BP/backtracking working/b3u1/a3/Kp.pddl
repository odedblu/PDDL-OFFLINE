(define (problem Kbox-3)
(:domain Kbox-3-a3)
;;SingleStateK
(:init
(init-zgr_observe-box-a1_p2-2_b1 )
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
(not (observe-124 ))
(not (c-p-a-124 ))
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
(immediate-dummy-zgr_observe-box-a1_p2-2_b1 )
(not (dummy-left-zgr_observe-box-a1_p2-2_b1 ))
(not (pre-nis_joint-push_p2-1_p2-2_b1_a1_a3 ))
(not (done-goal ))
(not (dummy-right-zgr_observe-box-a1_p2-2_b1 ))
(box-at b1 p2-2)
(Kbox-at b1 p2-2)
(not (box-at b1 p2-1))
(KNbox-at b1 p2-1)
(box-at b0 p1-1)
(not (box-at b0 p1-2))
)
(:goal (done-goal ))
)
