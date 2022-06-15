(define (problem Kroverprob1234)
(:domain Krover)
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
(can_traverse rover0 waypoint7 waypoint8)
(can_traverse rover0 waypoint8 waypoint7)
(can_traverse rover0 waypoint1 waypoint9)
(can_traverse rover0 waypoint9 waypoint1)
(can_traverse rover0 waypoint6 waypoint11)
(can_traverse rover0 waypoint11 waypoint6)
(can_traverse rover0 waypoint12 waypoint11)
(can_traverse rover0 waypoint11 waypoint12)
(can_traverse rover0 waypoint3 waypoint10)
(can_traverse rover0 waypoint10 waypoint3)
(can_traverse rover0 waypoint13 waypoint4)
(can_traverse rover0 waypoint4 waypoint13)
(can_traverse rover0 waypoint13 waypoint15)
(can_traverse rover0 waypoint15 waypoint13)
(can_traverse rover0 waypoint14 waypoint0)
(can_traverse rover0 waypoint0 waypoint14)
(on_board camera0 rover0)
(calibration_target camera0 objective1)
(calibration_target camera0 objective2)
(calibration_target camera0 objective3)
(supports camera0 colour)
(supports camera0 high_res)
(Kvisible_from objective3 waypoint14)
(visible_from objective3 waypoint14)
(KNgood_image objective1 colour)
(Kgood_image objective1 high_res)
(good_image objective1 high_res)
(KNgood_image objective1 low_res)
(KNgood_image objective2 colour)
(Kgood_image objective2 high_res)
(good_image objective2 high_res)
(KNgood_image objective2 low_res)
(KNgood_image objective3 colour)
(KNgood_image objective3 high_res)
(KNgood_image objective3 low_res)
(communicated_image_data objective1 high_res)
(communicated_image_data objective2 high_res)
(communicated_image_data objective3 high_res)
(KNvisible_from objective1 waypoint0)
(KNvisible_from objective1 waypoint1)
(KNvisible_from objective1 waypoint2)
(KNvisible_from objective1 waypoint3)
(KNvisible_from objective1 waypoint4)
(KNvisible_from objective1 waypoint6)
(KNvisible_from objective1 waypoint7)
(KNvisible_from objective1 waypoint8)
(KNvisible_from objective1 waypoint9)
(KNvisible_from objective1 waypoint10)
(KNvisible_from objective1 waypoint11)
(KNvisible_from objective1 waypoint15)
(KNvisible_from objective2 waypoint0)
(KNvisible_from objective2 waypoint1)
(KNvisible_from objective2 waypoint2)
(KNvisible_from objective2 waypoint3)
(KNvisible_from objective2 waypoint4)
(KNvisible_from objective2 waypoint6)
(KNvisible_from objective2 waypoint7)
(KNvisible_from objective2 waypoint10)
(KNvisible_from objective2 waypoint11)
(KNvisible_from objective2 waypoint12)
(KNvisible_from objective2 waypoint13)
(KNvisible_from objective2 waypoint15)
(KNvisible_from objective3 waypoint0)
(KNvisible_from objective3 waypoint1)
(KNvisible_from objective3 waypoint2)
(KNvisible_from objective3 waypoint3)
(KNvisible_from objective3 waypoint4)
(KNvisible_from objective3 waypoint5)
(KNvisible_from objective3 waypoint6)
(KNvisible_from objective3 waypoint7)
(KNvisible_from objective3 waypoint8)
(KNvisible_from objective3 waypoint9)
(KNvisible_from objective3 waypoint10)
(KNvisible_from objective3 waypoint11)
(KNvisible_from objective3 waypoint12)
(KNvisible_from objective3 waypoint13)
(KNvisible_from objective3 waypoint15)
(Kvisible_from objective2 waypoint9)
(visible_from objective2 waypoint9)
(KNvisible_from objective2 waypoint8)
(KNvisible_from objective2 waypoint14)
(KNvisible_from objective2 waypoint5)
(Kvisible_from objective1 waypoint12)
(visible_from objective1 waypoint12)
(KNvisible_from objective1 waypoint13)
(KNvisible_from objective1 waypoint14)
(KNvisible_from objective1 waypoint5)
(option opt0)
(KGivenoption opt0 tag0 V_TRUE)
(KGivenoption opt1 tag0 V_FALSE)
(KGivenoption opt0 tag1 V_FALSE)
(KGivenoption opt1 tag1 V_TRUE)
)
(:goal 
(and (communicated_image_data objective1 high_res) (good_image objective1 high_res) (communicated_image_data objective2 high_res) (good_image objective2 high_res) (communicated_image_data objective3 high_res) (good_image objective3 high_res) (Kgood_image objective1 high_res) (Kgood_image objective2 high_res) (Kgood_image objective3 high_res)))
)