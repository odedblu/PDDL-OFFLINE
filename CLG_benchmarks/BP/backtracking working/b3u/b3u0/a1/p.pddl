(define 
(problem box-3)
(:domain box-3-a1)
(:goal (and (done-goal)))
(:init (and 
	(init-sc5_observe-box-a1_p1-1_b0)
	(not (observe-joint-push-dn6 ))
	(not (c-p-joint-push-dn6 ))
	(agent-at a1 p1-1)
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
	(heavy b1)
	(not (heavy b0))
	(not (agent-at a1 p1-2))
	(not (agent-at a1 p2-1))
	(not (agent-at a1 p2-2))
	(not (agent-at a1 p3-1))
	(not (agent-at a1 p3-2))
	(not (box-at b0 p2-1))
	(not (box-at b0 p2-2))
	(not (box-at b0 p3-1))
	(not (box-at b0 p3-2))
	(not (box-at b1 p1-1))
	(not (box-at b1 p1-2))
	(not (box-at b1 p3-1))
	(not (box-at b1 p3-2))
	
(oneof (box-at b0 p1-1) (box-at b0 p1-2))
	
(oneof (box-at b1 p2-1) (box-at b1 p2-2))
) )
)