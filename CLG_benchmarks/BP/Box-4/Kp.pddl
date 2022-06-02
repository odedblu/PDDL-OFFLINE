(define 
(problem Box-4)
(:domain kbox-4)
(:init
(kagent-at a2 p1-3 a1 v_true)
(kagent-at a2 p1-3 a2 v_true)
(agent-at a2 p1-3)
(kagent-at a1 p3-3 a1 v_true)
(kagent-at a1 p3-3 a2 v_true)
(agent-at a1 p3-3)
(heavy b1)(adj p3-1 p2-1)
(adj p3-2 p2-2)(adj p3-3 p2-3)(adj p1-2 p1-1)(adj p1-3 p1-2)(adj p1-1 p1-2)(adj p1-2 p1-3)(adj p3-2 p3-1)(adj p3-3 p3-2)(adj p3-1 p3-2)(adj p3-2 p3-3)(adj p1-1 p2-1)(adj p1-2 p2-2)(adj p1-3 p2-3)(adj p2-1 p1-1)(adj p2-2 p1-2)(adj p2-3 p1-3)(adj p2-2 p2-1)(adj p2-3 p2-2)(adj p2-1 p2-2)(adj p2-2 p2-3)(adj p2-1 p3-1)(adj p2-2 p3-2)(adj p2-3 p3-3)(box-at b2 p3-2)(box-at b1 p2-2)(box-at b0 p1-2)

(kbox-at b0 p1-3 a1 v_false)(kbox-at b0 p1-3 a2 v_false)(kbox-at b0 p2-1 a1 v_false)(kbox-at b0 p2-1 a2 v_false)(kbox-at b0 p2-2 a1 v_false)(kbox-at b0 p2-2 a2 v_false)(kbox-at b0 p2-3 a1 v_false)(kbox-at b0 p2-3 a2 v_false)(kbox-at b0 p3-1 a1 v_false)(kbox-at b0 p3-1 a2 v_false)(kbox-at b0 p3-2 a1 v_false)(kbox-at b0 p3-2 a2 v_false)(kbox-at b0 p3-3 a1 v_false)(kbox-at b0 p3-3 a2 v_false)(kbox-at b1 p1-1 a1 v_false)(kbox-at b1 p1-1 a2 v_false)(kbox-at b1 p1-2 a1 v_false)(kbox-at b1 p1-2 a2 v_false)(kbox-at b1 p1-3 a1 v_false)(kbox-at b1 p1-3 a2 v_false)(kbox-at b1 p2-3 a1 v_false)(kbox-at b1 p2-3 a2 v_false)(kbox-at b1 p3-1 a1 v_false)(kbox-at b1 p3-1 a2 v_false)(kbox-at b1 p3-2 a1 v_false)(kbox-at b1 p3-2 a2 v_false)(kbox-at b1 p3-3 a1 v_false)(kbox-at b1 p3-3 a2 v_false)(kbox-at b2 p1-1 a1 v_false)(kbox-at b2 p1-1 a2 v_false)(kbox-at b2 p1-2 a1 v_false)(kbox-at b2 p1-2 a2 v_false)(kbox-at b2 p1-3 a1 v_false)(kbox-at b2 p1-3 a2 v_false)(kbox-at b2 p2-1 a1 v_false)
(kbox-at b2 p2-1 a2 v_false)
(kbox-at b2 p2-2 a1 v_false)
(kbox-at b2 p2-2 a2 v_false)
(kbox-at b2 p2-3 a1 v_false)
(kbox-at b2 p2-3 a2 v_false)
(kbox-at b2 p3-3 a1 v_false)
(kbox-at b2 p3-3 a2 v_false)
(kgivenbox-at b0 p1-1 tag0 a1 v_false)
(kgivenbox-at b0 p1-1 tag0 a2 v_false)
(kgivenbox-at b2 p3-1 tag0 a1 v_false)
(kgivenbox-at b2 p3-1 tag0 a2 v_false)
(kgivenbox-at b1 p2-1 tag0 a1 v_false)
(kgivenbox-at b1 p2-1 tag0 a2 v_false)
(kgivenbox-at b2 p3-2 tag0 a1 v_true)
(kgivenbox-at b2 p3-2 tag0 a2 v_true)
(kgivenbox-at b1 p2-2 tag0 a1 v_true)
(kgivenbox-at b1 p2-2 tag0 a2 v_true)
(kgivenbox-at b0 p1-2 tag0 a1 v_true)
(kgivenbox-at b0 p1-2 tag0 a2 v_true)
(kgivenbox-at b1 p2-2 tag1 a1 v_false)
(kgivenbox-at b1 p2-2 tag1 a2 v_false)
(kgivenbox-at b0 p1-2 tag1 a1 v_false)
(kgivenbox-at b0 p1-2 tag1 a2 v_false)
(kgivenbox-at b2 p3-2 tag1 a1 v_false)
(kgivenbox-at b2 p3-2 tag1 a2 v_false)
(kgivenbox-at b2 p3-1 tag1 a1 v_true)
(kgivenbox-at b2 p3-1 tag1 a2 v_true)
(kgivenbox-at b1 p2-1 tag1 a1 v_true)
(kgivenbox-at b1 p2-1 tag1 a2 v_true)
(kgivenbox-at b0 p1-1 tag1 a1 v_true)
(kgivenbox-at b0 p1-1 tag1 a2 v_true)
)

(:goal 
(and (box-at b0 p1-1) (box-at b1 p2-1) (box-at b2 p3-1) (kbox-at b0 p1-1 a1 v_true) (kbox-at b0 p1-1 a2 v_true) (kbox-at b1 p2-1 a1 v_true) (kbox-at b1 p2-1 a2 v_true) (kbox-at b2 p3-1 a1 v_true) (kbox-at b2 p3-1 a2 v_true) (knot tag1 a1) (knot tag1 a2))
)
)