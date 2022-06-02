(define (problem Defender) (:domain myWorld)
(:objects 
		;z=0
		G000 G100 G200 - Grid
		G010 G110 G210 - Grid
		G020 G120 G220 - Grid
		;z=1
		G001 G101 G201 - Grid
		G011 G111 G211 - Grid
		G021 G121 G221 - Grid
		;z=2
		G002 G102 G202 - Grid
		G012 G112 G212 - Grid
		G022 G122 G222 - Grid
		blown - Blow)

(:init  (turnA ) 
		;z=0 --> z=1
		(adj G000 G011) (adj G000 G101) 
		(adj G010 G001) (adj G010 G111) (adj G010 G021) 
		(adj G020 G011) (adj G020 G121) 
		(adj G100 G001) (adj G100 G111) (adj G100 G201) 
		(adj G110 G101) (adj G110 G011) (adj G110 G121) (adj G110 G211) 
		(adj G120 G021) (adj G120 G111) (adj G120 G221) 
		(adj G200 G101) (adj G200 G211) 
		(adj G210 G201) (adj G210 G221) (adj G210 G111) 
		(adj G220 G211) (adj G220 G121)
		;z=1 --> z=2
		(adj G001 G012) (adj G001 G102) 
		(adj G011 G002) (adj G011 G112) (adj G011 G022) 
		(adj G021 G012) (adj G021 G122) 
		(adj G101 G002) (adj G101 G112) (adj G101 G202) 
		(adj G111 G102) (adj G111 G012) (adj G111 G122) (adj G111 G212) 
		(adj G121 G022) (adj G121 G112) (adj G121 G222) 
		(adj G201 G102) (adj G201 G212) 
		(adj G211 G202) (adj G211 G222) (adj G211 G112) 
		(adj G221 G212) (adj G221 G122)
		;z=2 --> z=1
		(adj G002 G011) (adj G002 G101) 
		(adj G012 G001) (adj G012 G111) (adj G012 G021) 
		(adj G022 G011) (adj G022 G121) 
		(adj G102 G001) (adj G102 G111) (adj G102 G201) 
		(adj G112 G101) (adj G112 G011) (adj G112 G121) (adj G112 G211) 
		(adj G122 G021) (adj G122 G111) (adj G122 G221) 
		(adj G202 G101) (adj G202 G211) 
		(adj G212 G201) (adj G212 G221) (adj G212 G111) 
		(adj G222 G211) (adj G222 G121)
		;z=1 --> z=0
		(adj G001 G010) (adj G001 G100) 
		(adj G011 G000) (adj G011 G110) (adj G011 G020) 
		(adj G021 G010) (adj G021 G120) 
		(adj G101 G000) (adj G101 G110) (adj G101 G200) 
		(adj G111 G100) (adj G111 G010) (adj G111 G120) (adj G111 G210) 
		(adj G121 G020) (adj G121 G110) (adj G121 G220) 
		(adj G201 G100) (adj G201 G210) 
		(adj G211 G200) (adj G211 G220) (adj G211 G110) 
		(adj G221 G210) (adj G221 G120)
		;z=0
		(adj G000 G010) (adj G000 G100) 
		(adj G010 G000) (adj G010 G110) (adj G010 G020) 
		(adj G020 G010) (adj G020 G120) 
		(adj G100 G000) (adj G100 G110) (adj G100 G200) 
		(adj G110 G100) (adj G110 G010) (adj G110 G120) (adj G110 G210) 
		(adj G120 G020) (adj G120 G110) (adj G120 G220) 
		(adj G200 G100) (adj G200 G210) 
		(adj G210 G200) (adj G210 G220) (adj G210 G110) 
		(adj G220 G210) (adj G220 G120)
		;z=1
		(adj G001 G011) (adj G001 G101) 
		(adj G011 G001) (adj G011 G111) (adj G011 G021) 
		(adj G021 G011) (adj G021 G121) 
		(adj G101 G001) (adj G101 G111) (adj G101 G201) 
		(adj G111 G101) (adj G111 G011) (adj G111 G121) (adj G111 G211) 
		(adj G121 G021) (adj G121 G111) (adj G121 G221) 
		(adj G201 G101) (adj G201 G211) 
		(adj G211 G201) (adj G211 G221) (adj G211 G111) 
		(adj G221 G211) (adj G221 G121)
		;z=2
		(adj G002 G012) (adj G002 G102) 
		(adj G012 G002) (adj G012 G112) (adj G012 G022) 
		(adj G022 G012) (adj G022 G122) 
		(adj G102 G002) (adj G102 G112) (adj G102 G202) 
		(adj G112 G102) (adj G112 G012) (adj G112 G122) (adj G112 G212) 
		(adj G122 G022) (adj G122 G112) (adj G122 G222) 
		(adj G202 G102) (adj G202 G212) 
		(adj G212 G202) (adj G212 G222) (adj G212 G112) 
		(adj G222 G212) (adj G222 G122)
		;other
		 (launchDFrom G200) (launchDFrom G010) 
		(oneof (pathA1) (pathA2))
		)
(:goal (isBlown blown)))


