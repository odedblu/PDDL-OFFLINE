(define (problem Kbox-3)
(:domain Kbox-3-a2)
;;SingleStateK
(:init
(init-3ya_obs-a0g-a1-a2-a3_a3 )
(not (observe-joint-push-a0g ))
(not (c-p-joint-push-a0g ))
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
(not (pre-3ya_obs-a0g-a1-a2-a3_a3 ))
(not (done-goal ))
(not (box-at b0 p1-1))
(box-at b0 p1-2)
(not (box-at b1 p2-1))
(box-at b1 p2-2)
(not (box-at b2 p3-1))
(box-at b2 p3-2)
)
(:goal (done-goal ))
)
