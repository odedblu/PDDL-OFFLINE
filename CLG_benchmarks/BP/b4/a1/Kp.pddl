(define (problem Kbox-4)
(:domain Kbox-4-a1)
;;SingleStateK
(:init
(init-snx_observe-box_p1-1_a1_b0 )
(agent-at a1 p1-1)
(adj p1-1 p1-2)
(adj p2-1 p2-2)
(adj p3-1 p3-2)
(adj p4-1 p4-2)
(adj p5-1 p5-2)
(adj p1-2 p1-1)
(adj p2-2 p2-1)
(adj p3-2 p3-1)
(adj p4-2 p4-1)
(adj p5-2 p5-1)
(adj p1-1 p2-1)
(adj p2-1 p3-1)
(adj p3-1 p4-1)
(adj p4-1 p5-1)
(adj p2-1 p1-1)
(adj p3-1 p2-1)
(adj p4-1 p3-1)
(adj p5-1 p4-1)
(not (heavy b0))
(heavy b1)
(heavy b2)
(not (agent-at a1 p1-2))
(not (agent-at a1 p2-1))
(not (agent-at a1 p2-2))
(not (agent-at a1 p3-1))
(not (agent-at a1 p3-2))
(not (agent-at a1 p4-1))
(not (agent-at a1 p4-2))
(not (agent-at a1 p5-1))
(not (agent-at a1 p5-2))
(not (box-at b0 p2-1))
(KNbox-at b0 p2-1)
(not (box-at b0 p2-2))
(KNbox-at b0 p2-2)
(not (box-at b0 p3-1))
(KNbox-at b0 p3-1)
(not (box-at b0 p3-2))
(KNbox-at b0 p3-2)
(not (box-at b0 p4-1))
(KNbox-at b0 p4-1)
(not (box-at b0 p4-2))
(KNbox-at b0 p4-2)
(not (box-at b0 p5-1))
(KNbox-at b0 p5-1)
(not (box-at b0 p5-2))
(KNbox-at b0 p5-2)
(not (box-at b1 p1-1))
(KNbox-at b1 p1-1)
(not (box-at b1 p1-2))
(KNbox-at b1 p1-2)
(not (box-at b1 p2-1))
(KNbox-at b1 p2-1)
(not (box-at b1 p2-2))
(KNbox-at b1 p2-2)
(not (box-at b1 p4-1))
(KNbox-at b1 p4-1)
(not (box-at b1 p4-2))
(KNbox-at b1 p4-2)
(not (box-at b1 p5-1))
(KNbox-at b1 p5-1)
(not (box-at b1 p5-2))
(KNbox-at b1 p5-2)
(not (box-at b2 p1-1))
(KNbox-at b2 p1-1)
(not (box-at b2 p1-2))
(KNbox-at b2 p1-2)
(not (box-at b2 p2-1))
(KNbox-at b2 p2-1)
(not (box-at b2 p2-2))
(KNbox-at b2 p2-2)
(not (box-at b2 p3-1))
(KNbox-at b2 p3-1)
(not (box-at b2 p3-2))
(KNbox-at b2 p3-2)
(not (box-at b2 p4-1))
(KNbox-at b2 p4-1)
(not (box-at b2 p4-2))
(KNbox-at b2 p4-2)
(immediate-dummy-snx_observe-box_p1-1_a1_b0 )
(not (dummy-left-snx_observe-box_p1-1_a1_b0 ))
(not (done-goal ))
(not (dummy-right-snx_observe-box_p1-1_a1_b0 ))
(not (pre-bne_push_p1-1_p1-2_b0_a1 ))
(box-at b0 p1-1)
(Kbox-at b0 p1-1)
(not (box-at b0 p1-2))
(KNbox-at b0 p1-2)
(not (box-at b1 p3-1))
(box-at b1 p3-2)
(not (box-at b2 p5-1))
(box-at b2 p5-2)
)
(:goal (done-goal ))
)
