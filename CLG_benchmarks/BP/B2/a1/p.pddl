(define 
(problem box-2)
(:domain box-2-a1)
(:goal (and (done-goal)))
(:init (and 
	(init-2r0_observe-box_a1_p1-2_b0)
	(agent-at a1 p1-2)
	(adj p1-1 p1-2)
	(adj p1-2 p1-1)
	(heavy b0)
	(not (agent-at a1 p1-1))
	
(oneof (box-at b0 p1-1) (box-at b0 p1-2))
) )
)