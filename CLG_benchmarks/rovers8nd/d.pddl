(define (domain Rover)
(:types rover waypoint camera mode lander objective)

(:predicates (at ?x - rover ?y - waypoint) 
             (at_lander ?x - lander ?y - waypoint)
             (can_traverse ?r - rover ?x - waypoint ?y - waypoint)
             (equipped_for_imaging ?r - rover)
	     (calibrated ?c - camera ?r - rover ?w - waypoint ?o - objective) 
	     (supports ?c - camera ?m - mode)
             (available ?r - rover)
             (visible ?w - waypoint ?p - waypoint)
             (have_image ?r - rover ?o - objective ?m - mode)
             (good_image ?o - objective ?m - mode)
             (communicated_image_data ?o - objective ?m - mode)
   	     (visible_from ?o - objective ?w - waypoint)
	     (calibration_target ?i - camera ?o - objective)
	     (on_board ?i - camera ?r - rover)
	     (channel_free ?l - lander)
)

(:action sense_vis
 :parameters (?x - rover ?t - objective ?z - waypoint )
 :precondition (at ?x ?z)
 :observe (visible_from ?t ?z))

	
(:action navigate
:parameters (?x - rover ?y - waypoint ?z - waypoint ?c - camera ?p - objective) 
:precondition (and (can_traverse ?x ?y ?z) (available ?x) (at ?x ?y) 
	    )
:effect (and (not (at ?x ?y)) (at ?x ?z)
(not (calibrated ?c ?x ?z ?p))
		)
	
)


(:action calibrate
 :parameters (?r - rover ?i - camera ?t - objective ?w - waypoint)
 :precondition 
(and 
	(equipped_for_imaging ?r)
	(calibration_target ?i ?t) 
	(at ?r ?w) 
	(on_board ?i ?r))
 :effect 
(calibrated ?i ?r ?w ?t)
)


(:action take_image
 :parameters (?r - rover ?p - waypoint ?o - objective ?i - camera ?m - mode)
 :precondition (and (calibrated ?i ?r ?p ?o)
			 (on_board ?i ?r)
                      (equipped_for_imaging ?r)
                      (supports ?i ?m)
					  (visible_from ?o ?p)
                     (at ?r ?p)
               )
 :effect (and (have_image ?r ?o ?m)
				(not (communicated_image_data ?o ?m))
              (not (calibrated ?i ?r ?p ?o)) 
			  (oneof (good_image ?o ?m) (not (good_image ?o ?m)))

         )
		
)



(:action communicate_image_data
 :parameters (?r - rover ?l - lander ?o - objective ?m - mode ?x - waypoint ?y - waypoint)
 :precondition (and (at ?r ?x)
                    (at_lander ?l ?y)
	            (have_image ?r ?o ?m)
                    (visible ?x ?y)
               )
 :effect (and 
			(communicated_image_data ?o ?m)
			(not (have_image ?r ?o ?m))
          )
)

(:action wait-response
 :parameters (?r - rover ?l - lander ?o - objective ?m - mode ?x - waypoint ?y - waypoint)
 :precondition (and (at ?r ?x)
                    (at_lander ?l ?y)
					(communicated_image_data ?o ?m)
                    (visible ?x ?y)
               )
 :observe (good_image ?o ?m)
)

)
