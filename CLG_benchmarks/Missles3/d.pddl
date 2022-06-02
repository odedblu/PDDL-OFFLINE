(define (domain myWorld)

;(:requirements :typing :adl :equality)

(:types Grid Blow Rocket PathA)

(:predicates                  
				     (atX ?r - Rocket ?x - Number) 
				     (atX ?r - Rocket ?y - Number) 
				     (atX ?r - Rocket ?z - Number) 
				     (turn ?r - Rocket) 
					 (adj ?n1 - Number ?n2 - Number) 
					 (isBlown ?x - Blow) 
					 (launchDFrom ?x - Number ?y - Number ?z - Number)
					(blurLocation ?r - Rocket)
					(initLocation ?r - Rocket)	
					(blurPath ?r - Rocket)
					(pathSelected ?p - PathA)
									
					
)

(:constants 
		
		turn - Turn 
		blown - Blow
		a d - Rocket
		A1 A2 A3 A4 A5 - pathA
		n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12 n13 n14 n15 - Number
		)
		
		

(:action launchD											
	:parameters (?x - Number ?y - Number ?z - Number)
	:precondition (and (turn d) (launchDFrom ?x ?y ?z) (blurLocation d))
	:effect (and (atX d ?x) (atY d ?y) (atZ d ?z) (not (blurLocation d)))
				
)

(:action waitBeforeLaunchD										
	:precondition (and (turn d) (blurLocation d))
	:effect (and (not (turn d)) (turn a))
)

(:action moveD 
	:parameters (?x - Grid ?y - Grid)
	:precondition (and (at d ?x) (turn d) (adj ?x ?y))
	:effect (and (at d ?y) (not (at d ?x)) (not (turn d)) (turn a))
)

(:action observe
	:parameters (?x - pathA)
	:precondition (turn a)	
	:observe (pathSelected ?x)
)



(:action moveA_G-x1-y0-z0___G-x1-y0-z1___1 
	:precondition (and (turn a) (initlocation a) (at a G-x1-y0-z0) (pathSelected A1))
	:effect (and (not (turn a)) (turn d) (not (at a G-x1-y0-z0)) (at a G-x1-y0-z1))
)

(:action moveA_G-x1-y0-z1___G-x1-y1-z1___1 
	:precondition (and (turn a) (initlocation a) (at a G-x1-y0-z1) (pathSelected A1))
	:effect (and (not (turn a)) (turn d) (not (at a G-x1-y0-z1)) (at a G-x1-y1-z1))
)

(:action moveA_G-x1-y1-z1___G-x1-y1-z2___1 
	:precondition (and (turn a) (initlocation a) (at a G-x1-y1-z1) (pathSelected A1))
	:effect (and (not (turn a)) (turn d) (not (at a G-x1-y1-z1)) (at a G-x1-y1-z2))
)


(:action moveA_G-x1-y1-z2___G-x1-y2-z2___1 
	:precondition (and (turn a) (initlocation a) (at a G-x1-y1-z2) (pathSelected A1))
	:effect (and (not (turn a)) (turn d) (not (at a G-x1-y1-z2)) (at a G-x1-y2-z2))
)

(:action moveA_G-x1-y2-z2___G-x1-y2-z3___1  
	:precondition (and (turn a) (initlocation a) (at a G-x1-y2-z2) (pathSelected A1))
	:effect (and (not (turn a)) (turn d) (not (at a G-x1-y2-z2)) (at a G-x1-y2-z3))
)

(:action moveA_G-x1-y2-z3___G-x1-y2-z4___1  
	:precondition (and (turn a) (initlocation a) (at a G-x1-y2-z3) (pathSelected A1))
	:effect (and (not (turn a)) (turn d) (not (at a G-x1-y2-z3)) (at a G-x1-y2-z4))
)

(:action moveA_G-x1-y2-z4___G-x1-y3-z4___1  
	:precondition (and (turn a) (initlocation a) (at a G-x1-y2-z4) (pathSelected A1))
	:effect (and (not (turn a)) (turn d) (not (at a G-x1-y2-z4)) (at a G-x1-y3-z4))
)

(:action moveA_G-x1-y3-z4___G-x1-y3-z5___1  
	:precondition (and (turn a) (initlocation a) (at a G-x1-y3-z4) (pathSelected A1))
	:effect (and (not (turn a)) (turn d) (not (at a G-x1-y3-z4)) (at a G-x1-y3-z5))
)

(:action moveA_G-x1-y3-z5___G-x1-y4-z5___1  
	:precondition (and (turn a) (initlocation a) (at a G-x1-y3-z5) (pathSelected A1))
	:effect (and (not (turn a)) (turn d) (not (at a G-x1-y3-z5)) (at a G-x1-y4-z5))
)

(:action moveA_G-x1-y4-z5___G-x1-y4-z6___1  
	:precondition (and (turn a) (initlocation a) (at a G-x1-y4-z5) (pathSelected A1))
	:effect (and (not (turn a)) (turn d) (not (at a G-x1-y4-z5)) (at a G-x1-y4-z6))
)

(:action moveA_G-x1-y4-z6___G-x1-y5-z6__1 
	:precondition (and (turn a) (initlocation a) (at a G-x1-y4-z6) (pathSelected A1))
	:effect (and (not (turn a)) (turn d) (not (at a G-x1-y4-z6)) (at a G-x1-y5-z6))) 

(:action moveA_G-x1-y5-z6___G-x1-y5-z7__1 
	:precondition (and (turn a) (initlocation a) (at a G-x1-y5-z6) (pathSelected A1))
	:effect (and (not (turn a)) (turn d) (not (at a G-x1-y5-z6)) (at a G-x1-y5-z7))) 

(:action moveA_G-x1-y5-z7___G-x1-y6-z7__1 
	:precondition (and (turn a) (initlocation a) (at a G-x1-y5-z7) (pathSelected A1))
	:effect (and (not (turn a)) (turn d) (not (at a G-x1-y5-z7)) (at a G-x1-y6-z7))) 

(:action moveA_G-x1-y6-z7___G-x1-y7-z7__1 
	:precondition (and (turn a) (initlocation a) (at a G-x1-y6-z7) (pathSelected A1))
	:effect (and (not (turn a)) (turn d) (not (at a G-x1-y6-z7)) (at a G-x1-y7-z7))) 

(:action moveA_G-x1-y7-z7___G-x1-y7-z8__1 
	:precondition (and (turn a) (initlocation a) (at a G-x1-y7-z7) (pathSelected A1))
	:effect (and (not (turn a)) (turn d) (not (at a G-x1-y7-z7)) (at a G-x1-y7-z8))) 

(:action moveA_G-x1-y7-z8___G-x1-y8-z8__1 
	:precondition (and (turn a) (initlocation a) (at a G-x1-y7-z8) (pathSelected A1))
	:effect (and (not (turn a)) (turn d) (not (at a G-x1-y7-z8)) (at a G-x1-y8-z8))) 

(:action moveA_G-x1-y8-z8___G-x1-y8-z9__1 
	:precondition (and (turn a) (initlocation a) (at a G-x1-y8-z8) (pathSelected A1))
	:effect (and (not (turn a)) (turn d) (not (at a G-x1-y8-z8)) (at a G-x1-y8-z9))) 

(:action moveA_G-x1-y8-z9___G-x1-y9-z9__1 
	:precondition (and (turn a) (initlocation a) (at a G-x1-y8-z9) (pathSelected A1))
	:effect (and (not (turn a)) (turn d) (not (at a G-x1-y8-z9)) (at a G-x1-y9-z9))) 

(:action moveA_G-x1-y9-z9___G-x1-y9-z10__1 
	:precondition (and (turn a) (initlocation a) (at a G-x1-y9-z9) (pathSelected A1))
	:effect (and (not (turn a)) (turn d) (not (at a G-x1-y9-z9)) (at a G-x1-y9-z10))) 

(:action moveA_G-x1-y9-z10___G-x1-y9-z11__1 
	:precondition (and (turn a) (initlocation a) (at a G-x1-y9-z10) (pathSelected A1))
	:effect (and (not (turn a)) (turn d) (not (at a G-x1-y9-z10)) (at a G-x1-y9-z11))) 

(:action moveA_G-x1-y9-z11___G-x1-y9-z12__1 
	:precondition (and (turn a) (initlocation a) (at a G-x1-y9-z11) (pathSelected A1))
	:effect (and (not (turn a)) (turn d) (not (at a G-x1-y9-z11)) (at a G-x1-y9-z12))) 

(:action moveA_G-x1-y9-z12___G-x1-y10-z12__1 
	:precondition (and (turn a) (initlocation a) (at a G-x1-y9-z12) (pathSelected A1))
	:effect (and (not (turn a)) (turn d) (not (at a G-x1-y9-z12)) (at a G-x1-y10-z12))) 

(:action moveA_G-x1-y10-z12___G-x1-y10-z13__1 
	:precondition (and (turn a) (initlocation a) (at a G-x1-y10-z12) (pathSelected A1))
	:effect (and (not (turn a)) (turn d) (not (at a G-x1-y10-z12)) (at a G-x1-y10-z13))) 

(:action moveA_G-x1-y10-z13___G-x1-y11-z13__1 
	:precondition (and (turn a) (initlocation a) (at a G-x1-y10-z13) (pathSelected A1))
	:effect (and (not (turn a)) (turn d) (not (at a G-x1-y10-z13)) (at a G-x1-y11-z13))) 

(:action moveA_G-x1-y11-z13___G-x1-y11-z14__1 
	:precondition (and (turn a) (initlocation a) (at a G-x1-y11-z13) (pathSelected A1))
	:effect (and (not (turn a)) (turn d) (not (at a G-x1-y11-z13)) (at a G-x1-y11-z14))) 

(:action moveA_G-x1-y11-z14___G-x1-y11-z15__1 
	:precondition (and (turn a) (initlocation a) (at a G-x1-y11-z14) (pathSelected A1))
	:effect (and (not (turn a)) (turn d) (not (at a G-x1-y11-z14)) (at a G-x1-y11-z15))) 

(:action moveA_G-x1-y11-z15___G-x1-y11-z14__1 
	:precondition (and (turn a) (initlocation a) (at a G-x1-y11-z15) (pathSelected A1))
	:effect (and (not (turn a)) (turn d) (not (at a G-x1-y11-z15)) (at a G-x1-y11-z14))) 

(:action moveA_G-x1-y11-z14___G-x1-y12-z14__1 
	:precondition (and (turn a) (initlocation a) (at a G-x1-y11-z14) (pathSelected A1))
	:effect (and (not (turn a)) (turn d) (not (at a G-x1-y11-z14)) (at a G-x1-y12-z14))) 

(:action moveA_G-x1-y12-z14___G-x1-y13-z14__1 
	:precondition (and (turn a) (initlocation a) (at a G-x1-y12-z14) (pathSelected A1))
	:effect (and (not (turn a)) (turn d) (not (at a G-x1-y12-z14)) (at a G-x1-y13-z14))) 

(:action moveA_G-x1-y13-z14___G-x1-y13-z13__1 
	:precondition (and (turn a) (initlocation a) (at a G-x1-y13-z14) (pathSelected A1))
	:effect (and (not (turn a)) (turn d) (not (at a G-x1-y13-z14)) (at a G-x1-y13-z13))) 

(:action moveA_G-x1-y13-z13___G-x1-y13-z12__1 
	:precondition (and (turn a) (initlocation a) (at a G-x1-y13-z13) (pathSelected A1))
	:effect (and (not (turn a)) (turn d) (not (at a G-x1-y13-z13)) (at a G-x1-y13-z12))) 

(:action moveA_G-x1-y13-z12___G-x2-y13-z12__1 
	:precondition (and (turn a) (initlocation a) (at a G-x1-y13-z12) (pathSelected A1))
	:effect (and (not (turn a)) (turn d) (not (at a G-x1-y13-z12)) (at a G-x2-y13-z12))) 

(:action moveA_G-x2-y13-z12___G-x2-y13-z11__1 
	:precondition (and (turn a) (initlocation a) (at a G-x2-y13-z12) (pathSelected A1))
	:effect (and (not (turn a)) (turn d) (not (at a G-x2-y13-z12)) (at a G-x2-y13-z11))) 

(:action moveA_G-x2-y13-z11___G-x2-y13-z10__1 
	:precondition (and (turn a) (initlocation a) (at a G-x2-y13-z11) (pathSelected A1))
	:effect (and (not (turn a)) (turn d) (not (at a G-x2-y13-z11)) (at a G-x2-y13-z10))) 

(:action moveA_G-x2-y13-z10___G-x3-y13-z10__1 
	:precondition (and (turn a) (initlocation a) (at a G-x2-y13-z10) (pathSelected A1))
	:effect (and (not (turn a)) (turn d) (not (at a G-x2-y13-z10)) (at a G-x3-y13-z10))) 

(:action moveA_G-x3-y13-z10___G-x3-y13-z9__1 
	:precondition (and (turn a) (initlocation a) (at a G-x3-y13-z10) (pathSelected A1))
	:effect (and (not (turn a)) (turn d) (not (at a G-x3-y13-z10)) (at a G-x3-y13-z9))) 

(:action moveA_G-x3-y13-z9___G-x3-y13-z8__1 
	:precondition (and (turn a) (initlocation a) (at a G-x3-y13-z9) (pathSelected A1))
	:effect (and (not (turn a)) (turn d) (not (at a G-x3-y13-z9)) (at a G-x3-y13-z8))) 






(:action moveA_G-x1-y0-z0___G-x1-y0-z1___2 
	:precondition (and (turn a) (initlocation a) (at a G-x1-y0-z0) (pathSelected A2))
	:effect (and (not (turn a)) (turn d) (not (at a G-x1-y0-z0)) (at a G-x1-y0-z1))
)

(:action moveA_G-x1-y0-z1___G-x1-y1-z1___2 
	:precondition (and (turn a) (initlocation a) (at a G-x1-y0-z1) (pathSelected A2))
	:effect (and (not (turn a)) (turn d) (not (at a G-x1-y0-z1)) (at a G-x1-y1-z1))
)

(:action moveA_G-x1-y1-z1___G-x1-y1-z2___2 
	:precondition (and (turn a) (initlocation a) (at a G-x1-y1-z1) (pathSelected A2))
	:effect (and (not (turn a)) (turn d) (not (at a G-x1-y1-z1)) (at a G-x1-y1-z2))
)


(:action moveA_G-x1-y1-z2___G-x1-y2-z2___2 
	:precondition (and (turn a) (initlocation a) (at a G-x1-y1-z2) (pathSelected A2))
	:effect (and (not (turn a)) (turn d) (not (at a G-x1-y1-z2)) (at a G-x1-y2-z2))
)

(:action moveA_G-x1-y2-z2___G-x1-y2-z3___2  
	:precondition (and (turn a) (initlocation a) (at a G-x1-y2-z2) (pathSelected A2))
	:effect (and (not (turn a)) (turn d) (not (at a G-x1-y2-z2)) (at a G-x1-y2-z3))
)

(:action moveA_G-x1-y2-z3___G-x1-y2-z4___2  
	:precondition (and (turn a) (initlocation a) (at a G-x1-y2-z3) (pathSelected A2))
	:effect (and (not (turn a)) (turn d) (not (at a G-x1-y2-z3)) (at a G-x1-y2-z4))
)

(:action moveA_G-x1-y2-z4___G-x1-y3-z4___2  
	:precondition (and (turn a) (initlocation a) (at a G-x1-y2-z4) (pathSelected A2))
	:effect (and (not (turn a)) (turn d) (not (at a G-x1-y2-z4)) (at a G-x1-y3-z4))
)

(:action moveA_G-x1-y3-z4___G-x1-y3-z5___2  
	:precondition (and (turn a) (initlocation a) (at a G-x1-y3-z4) (pathSelected A2))
	:effect (and (not (turn a)) (turn d) (not (at a G-x1-y3-z4)) (at a G-x1-y3-z5))
)

(:action moveA_G-x1-y3-z5___G-x1-y4-z5___2  
	:precondition (and (turn a) (initlocation a) (at a G-x1-y3-z5) (pathSelected A2))
	:effect (and (not (turn a)) (turn d) (not (at a G-x1-y3-z5)) (at a G-x1-y4-z5))
)

(:action moveA_G-x1-y4-z5___G-x1-y4-z6___2  
	:precondition (and (turn a) (initlocation a) (at a G-x1-y4-z5) (pathSelected A2))
	:effect (and (not (turn a)) (turn d) (not (at a G-x1-y4-z5)) (at a G-x1-y4-z6))
)


(:action moveA_G-x1-y4-z6___G-x1-y4-z7__2 
	:precondition (and (turn a) (initlocation a) (at a G-x1-y4-z6) (pathSelected A2))
	:effect (and (not (turn a)) (turn d) (not (at a G-x1-y4-z6)) (at a G-x1-y4-z7))) 

(:action moveA_G-x1-y4-z7___G-x2-y4-z7__2 
	:precondition (and (turn a) (initlocation a) (at a G-x1-y4-z7) (pathSelected A2))
	:effect (and (not (turn a)) (turn d) (not (at a G-x1-y4-z7)) (at a G-x2-y4-z7))) 

(:action moveA_G-x2-y4-z7___G-x2-y4-z8__2 
	:precondition (and (turn a) (initlocation a) (at a G-x2-y4-z7) (pathSelected A2))
	:effect (and (not (turn a)) (turn d) (not (at a G-x2-y4-z7)) (at a G-x2-y4-z8))) 

(:action moveA_G-x2-y4-z8___G-x2-y5-z8__2 
	:precondition (and (turn a) (initlocation a) (at a G-x2-y4-z8) (pathSelected A2))
	:effect (and (not (turn a)) (turn d) (not (at a G-x2-y4-z8)) (at a G-x2-y5-z8))) 

(:action moveA_G-x2-y5-z8___G-x3-y5-z8__2 
	:precondition (and (turn a) (initlocation a) (at a G-x2-y5-z8) (pathSelected A2))
	:effect (and (not (turn a)) (turn d) (not (at a G-x2-y5-z8)) (at a G-x3-y5-z8))) 

(:action moveA_G-x3-y5-z8___G-x3-y5-z9__2 
	:precondition (and (turn a) (initlocation a) (at a G-x3-y5-z8) (pathSelected A2))
	:effect (and (not (turn a)) (turn d) (not (at a G-x3-y5-z8)) (at a G-x3-y5-z9))) 

(:action moveA_G-x3-y5-z9___G-x3-y5-z10__2 
	:precondition (and (turn a) (initlocation a) (at a G-x3-y5-z9) (pathSelected A2))
	:effect (and (not (turn a)) (turn d) (not (at a G-x3-y5-z9)) (at a G-x3-y5-z10))) 

(:action moveA_G-x3-y5-z10___G-x3-y4-z10__2 
	:precondition (and (turn a) (initlocation a) (at a G-x3-y5-z10) (pathSelected A2))
	:effect (and (not (turn a)) (turn d) (not (at a G-x3-y5-z10)) (at a G-x3-y4-z10))) 

(:action moveA_G-x3-y4-z10___G-x3-y4-z9__2 
	:precondition (and (turn a) (initlocation a) (at a G-x3-y4-z10) (pathSelected A2))
	:effect (and (not (turn a)) (turn d) (not (at a G-x3-y4-z10)) (at a G-x3-y4-z9))) 

(:action moveA_G-x3-y4-z9___G-x4-y4-z9__2 
	:precondition (and (turn a) (initlocation a) (at a G-x3-y4-z9) (pathSelected A2))
	:effect (and (not (turn a)) (turn d) (not (at a G-x3-y4-z9)) (at a G-x4-y4-z9))) 

(:action moveA_G-x4-y4-z9___G-x4-y4-z8__2 
	:precondition (and (turn a) (initlocation a) (at a G-x4-y4-z9) (pathSelected A2))
	:effect (and (not (turn a)) (turn d) (not (at a G-x4-y4-z9)) (at a G-x4-y4-z8))) 

(:action moveA_G-x4-y4-z8___G-x4-y4-z7__2 
	:precondition (and (turn a) (initlocation a) (at a G-x4-y4-z8) (pathSelected A2))
	:effect (and (not (turn a)) (turn d) (not (at a G-x4-y4-z8)) (at a G-x4-y4-z7))) 

(:action moveA_G-x4-y4-z7___G-x4-y4-z6__2 
	:precondition (and (turn a) (initlocation a) (at a G-x4-y4-z7) (pathSelected A2))
	:effect (and (not (turn a)) (turn d) (not (at a G-x4-y4-z7)) (at a G-x4-y4-z6))) 

(:action moveA_G-x4-y4-z6___G-x3-y4-z6__2 
	:precondition (and (turn a) (initlocation a) (at a G-x4-y4-z6) (pathSelected A2))
	:effect (and (not (turn a)) (turn d) (not (at a G-x4-y4-z6)) (at a G-x3-y4-z6))) 

(:action moveA_G-x3-y4-z6___G-x3-y4-z5__2 
	:precondition (and (turn a) (initlocation a) (at a G-x3-y4-z6) (pathSelected A2))
	:effect (and (not (turn a)) (turn d) (not (at a G-x3-y4-z6)) (at a G-x3-y4-z5))) 

(:action moveA_G-x3-y4-z5___G-x2-y4-z5__2 
	:precondition (and (turn a) (initlocation a) (at a G-x3-y4-z5) (pathSelected A2))
	:effect (and (not (turn a)) (turn d) (not (at a G-x3-y4-z5)) (at a G-x2-y4-z5))) 

(:action moveA_G-x2-y4-z5___G-x2-y4-z4__2 
	:precondition (and (turn a) (initlocation a) (at a G-x2-y4-z5) (pathSelected A2))
	:effect (and (not (turn a)) (turn d) (not (at a G-x2-y4-z5)) (at a G-x2-y4-z4))) 

(:action moveA_G-x2-y4-z4___G-x2-y4-z3__2 
	:precondition (and (turn a) (initlocation a) (at a G-x2-y4-z4) (pathSelected A2))
	:effect (and (not (turn a)) (turn d) (not (at a G-x2-y4-z4)) (at a G-x2-y4-z3))) 



(:action launchA
	:precondition (and (turn a) (blurLocation a))
	:effect (and (when (pathSelected A1) (and (at a G-x4-y0-z0) (initlocation a) (not (blurLocation a))))
		     (when (pathSelected A2) (and (at a G-x1-y5-z0) (initlocation a) (not (blurLocation a)))))
)

(:action blowUp 
	:parameters (?x - Grid ?b - Blow)
	:precondition (and (at a ?x) (at d ?x))
	:effect (isBlown ?b)
)


	)
