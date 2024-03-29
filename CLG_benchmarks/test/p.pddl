(define (problem unix-2)
   (:domain unix)
   (:objects d1 d2 d3 d4 - DOOR)
   (:init
     (at d1)
	 (open d3)
     (not (at-home))
	 (near d1 d2)
	 (near d2 d3)
     (unknown (open d1))
     (unknown (open d2))
     (or
        (open d1)
        (open d2)
	   (open d4)
        )
     )
   (:goal (at-home))
)
