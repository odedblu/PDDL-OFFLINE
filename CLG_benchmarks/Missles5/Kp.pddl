(define (problem Kdefender)
(:domain Kmyworld)
(:init
	(d_launchfromx d1 n11)
	(d_launchfromy d1 n4)
	(d_launchfromz d1 n3)
	(d_launchfromx d2 n8)
	(d_launchfromy d2 n7)
	(d_launchfromz d2 n1)
	(d_launchfromx d3 n0)
	(d_launchfromy d3 n2)
	(d_launchfromz d3 n4)
	(up n0 n1)
	(up n1 n2)
	(up n2 n3)
	(up n3 n4)
	(up n4 n5)
	(up n5 n6)
	(up n6 n7)
	(up n7 n8)
	(up n8 n9)
	(up n9 n10)
	(up n10 n11)
	(up n11 n12)
	(up n12 n13)
	(up n13 n14)
	(down n14 n13)
	(down n13 n12)
	(down n12 n11)
	(down n11 n10)
	(down n10 n9)
	(down n9 n8)
	(down n8 n7)
	(down n7 n6)
	(down n6 n5)
	(down n5 n4)
	(down n4 n3)
	(down n3 n2)
	(down n2 n1)
	(down n1 n0)
	(atx a n2)
	(atx d n2)
	(atx d n11)
	(aty a n1)
	(aty d n4)
	(atz a n1)
	(atz d n3)
	(turn sensor)
	(initlocation a)
	(initlocation d)
	(pathselected a2)
)
(:goal (isblown blown))
)
