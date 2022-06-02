(define (problem roverprob1234) (:domain Rover)
(:objects
        general - lander
        colour high_res low_res - mode
        rover0 - rover
        rover0store - store

        waypoint0 waypoint1 waypoint2 waypoint3 waypoint4 waypoint5 waypoint6 waypoint7 - waypoint
        camera0 - camera
        objective1 objective2 - objective
        )
(:init

	 (visible waypoint1 waypoint0) 
	 (visible waypoint3 waypoint0)
	 (visible waypoint7 waypoint0)

        (at_lander general waypoint0)

        (channel_free general)
        (at rover0 waypoint3)

     (available rover0)
        (equipped_for_imaging rover0)
        (can_traverse rover0 waypoint3 waypoint0)
        (can_traverse rover0 waypoint0 waypoint3)
        (can_traverse rover0 waypoint3 waypoint1)
        (can_traverse rover0 waypoint1 waypoint3)
        (can_traverse rover0 waypoint1 waypoint2)
        (can_traverse rover0 waypoint2 waypoint1)

        (can_traverse rover0 waypoint7 waypoint0)
        (can_traverse rover0 waypoint0 waypoint7)
        (can_traverse rover0 waypoint5 waypoint1)
        (can_traverse rover0 waypoint1 waypoint5)
        (can_traverse rover0 waypoint6 waypoint2)
        (can_traverse rover0 waypoint2 waypoint6)
        (can_traverse rover0 waypoint3 waypoint4)
        (can_traverse rover0 waypoint4 waypoint3)




      (on_board camera0 rover0)
        (calibration_target camera0 objective1)
        (calibration_target camera0 objective2)
        (supports camera0 colour)
        (supports camera0 high_res)



	(oneof
         (visible_from objective1 waypoint1)
         (visible_from objective1 waypoint2)

	)

	(oneof
         (visible_from objective2 waypoint4)
         (visible_from objective2 waypoint5)
         (visible_from objective2 waypoint6)
         (visible_from objective2 waypoint7)
	)


)

(:goal
(and
(communicated_image_data objective1 high_res)
(good_image objective1 high_res)
(communicated_image_data objective2 high_res)
(good_image objective2 high_res)
)
)
)

