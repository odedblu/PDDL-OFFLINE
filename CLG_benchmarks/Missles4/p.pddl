(define (problem Defender) (:domain myWorld)

(:init    
		 (oneof (pathSelected A1) (pathSelected A2))
		(turn a) 
		(blurLocation a) (blurLocation d) 
		(D_launchFromX d1 n2) (D_launchFromY d1 n0) (D_launchFromZ d1 n0) 
		(D_launchFromX d2 n0) (D_launchFromY d2 n1) (D_launchFromZ d2 n0)  
		(adj n1 n2) (adj n2 n1) (adj n2 n3) (adj n3 n2) (adj n3 n4) (adj n4 n3) (adj n4 n5) (adj n5 n4) (adj n5 n6) (adj n6 n5) (adj n6 n7) (adj n7 n6)
		(adj n7 n8) (adj n8 n7) (adj n8 n9) (adj n9 n10) (adj n9 n8) (adj n10 n11) (adj n10 n9) (adj n11 n10) (adj n11 n12) (adj n12 n11) (adj n12 n13)
		(adj n13 n14) (adj n13 n12) (adj n14 n13) (adj n0 n1) (adj n1 n0)
		(adj n1 n1) (adj n2 n2) (adj n3 n3) (adj n4 n4) (adj n5 n5) (adj n6 n6) (adj n7 n7) (adj n8 n8) (adj n9 n9) (adj n10 n10) (adj n11 n11) (adj n12 n12)
		(adj n13 n13) (adj n14 n14) (adj n0 n0)
		(eq n1 n1) (eq n2 n2) (eq n3 n3) (eq n4 n4) (eq n5 n5) (eq n6 n6) (eq n7 n7) (eq n8 n8) (eq n9 n9) (eq n10 n10) (eq n11 n11) (eq n12 n12)
		(eq n13 n13) (eq n14 n14) (eq n0 n0)
		
		
)
(:goal (isBlown blown)))




