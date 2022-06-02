(define (domain Kunix)
(:requirements :strips :typing)
;;BestCase
(:types FILE DIR)
(:constants
 root - DIR
 sub1 - DIR
 sub2 - DIR
 sub11 - DIR
 sub12 - DIR
 sub21 - DIR
 sub22 - DIR
 sub111 - DIR
 sub112 - DIR
 sub121 - DIR
 sub122 - DIR
 sub211 - DIR
 sub212 - DIR
 sub221 - DIR
 sub222 - DIR
 my_file - FILE
)

(:predicates
(Kfile_in_dir ?file - FILE ?dir - DIR)
(KNfile_in_dir ?file - FILE ?dir - DIR)
(sub_dir ?par_dir - DIR ?child_dir - DIR)
(is_cur_dir ?d - DIR)
)

(:action cd_down
 :parameters (?cur_dir - DIR ?child_dir - DIR )
 :precondition 
(and (is_cur_dir ?cur_dir) (sub_dir ?cur_dir ?child_dir))
 :effect 
(and (is_cur_dir ?child_dir) (not (is_cur_dir ?cur_dir)))
)
(:action cd_up
 :parameters (?cur_dir - DIR ?par_dir - DIR )
 :precondition 
(and (is_cur_dir ?cur_dir) (sub_dir ?par_dir ?cur_dir))
 :effect 
(and (is_cur_dir ?par_dir) (not (is_cur_dir ?cur_dir)))
)
(:action lsT
 :parameters (?cur_dir - DIR ?file - FILE )
 :precondition 
(and (is_cur_dir ?cur_dir) (not (Kfile_in_dir ?file ?cur_dir)) (not (KNfile_in_dir ?file ?cur_dir)))
 :effect 
(and (Kfile_in_dir ?file ?cur_dir))
)
(:action lsF
 :parameters (?cur_dir - DIR ?file - FILE )
 :precondition 
(and (is_cur_dir ?cur_dir) (not (Kfile_in_dir ?file ?cur_dir)) (not (KNfile_in_dir ?file ?cur_dir)))
 :effect 
(and (KNfile_in_dir ?file ?cur_dir))
)
(:action mv
 :parameters (?file - FILE ?cur_dir - DIR ?target_dir - DIR )
 :precondition 
(and (is_cur_dir ?cur_dir) (Kfile_in_dir ?file ?cur_dir))
 :effect 
(and (KNfile_in_dir ?file ?cur_dir) (Kfile_in_dir ?file ?target_dir))
)
(:action R0
:precondition (and(Kfile_in_dir my_file sub11))
:effect (and(KNfile_in_dir my_file sub21)(KNfile_in_dir my_file sub12)(KNfile_in_dir my_file sub22)(KNfile_in_dir my_file sub111)(KNfile_in_dir my_file sub211)(KNfile_in_dir my_file sub121)(KNfile_in_dir my_file sub221)(KNfile_in_dir my_file sub112)(KNfile_in_dir my_file sub212)(KNfile_in_dir my_file sub122)(KNfile_in_dir my_file sub222))
)
(:action R1
:precondition (and(KNfile_in_dir my_file sub21)(KNfile_in_dir my_file sub12)(KNfile_in_dir my_file sub22)(KNfile_in_dir my_file sub111)(KNfile_in_dir my_file sub211)(KNfile_in_dir my_file sub121)(KNfile_in_dir my_file sub221)(KNfile_in_dir my_file sub112)(KNfile_in_dir my_file sub212)(KNfile_in_dir my_file sub122)(KNfile_in_dir my_file sub222)(not (Kfile_in_dir my_file sub11)))
:effect (and(Kfile_in_dir my_file sub11))
)
(:action R2
:precondition (and(Kfile_in_dir my_file sub21))
:effect (and(KNfile_in_dir my_file sub11)(KNfile_in_dir my_file sub12)(KNfile_in_dir my_file sub22)(KNfile_in_dir my_file sub111)(KNfile_in_dir my_file sub211)(KNfile_in_dir my_file sub121)(KNfile_in_dir my_file sub221)(KNfile_in_dir my_file sub112)(KNfile_in_dir my_file sub212)(KNfile_in_dir my_file sub122)(KNfile_in_dir my_file sub222))
)
(:action R3
:precondition (and(KNfile_in_dir my_file sub11)(KNfile_in_dir my_file sub12)(KNfile_in_dir my_file sub22)(KNfile_in_dir my_file sub111)(KNfile_in_dir my_file sub211)(KNfile_in_dir my_file sub121)(KNfile_in_dir my_file sub221)(KNfile_in_dir my_file sub112)(KNfile_in_dir my_file sub212)(KNfile_in_dir my_file sub122)(KNfile_in_dir my_file sub222)(not (Kfile_in_dir my_file sub21)))
:effect (and(Kfile_in_dir my_file sub21))
)
(:action R4
:precondition (and(Kfile_in_dir my_file sub12))
:effect (and(KNfile_in_dir my_file sub11)(KNfile_in_dir my_file sub21)(KNfile_in_dir my_file sub22)(KNfile_in_dir my_file sub111)(KNfile_in_dir my_file sub211)(KNfile_in_dir my_file sub121)(KNfile_in_dir my_file sub221)(KNfile_in_dir my_file sub112)(KNfile_in_dir my_file sub212)(KNfile_in_dir my_file sub122)(KNfile_in_dir my_file sub222))
)
(:action R5
:precondition (and(KNfile_in_dir my_file sub11)(KNfile_in_dir my_file sub21)(KNfile_in_dir my_file sub22)(KNfile_in_dir my_file sub111)(KNfile_in_dir my_file sub211)(KNfile_in_dir my_file sub121)(KNfile_in_dir my_file sub221)(KNfile_in_dir my_file sub112)(KNfile_in_dir my_file sub212)(KNfile_in_dir my_file sub122)(KNfile_in_dir my_file sub222)(not (Kfile_in_dir my_file sub12)))
:effect (and(Kfile_in_dir my_file sub12))
)
(:action R6
:precondition (and(Kfile_in_dir my_file sub22))
:effect (and(KNfile_in_dir my_file sub11)(KNfile_in_dir my_file sub21)(KNfile_in_dir my_file sub12)(KNfile_in_dir my_file sub111)(KNfile_in_dir my_file sub211)(KNfile_in_dir my_file sub121)(KNfile_in_dir my_file sub221)(KNfile_in_dir my_file sub112)(KNfile_in_dir my_file sub212)(KNfile_in_dir my_file sub122)(KNfile_in_dir my_file sub222))
)
(:action R7
:precondition (and(KNfile_in_dir my_file sub11)(KNfile_in_dir my_file sub21)(KNfile_in_dir my_file sub12)(KNfile_in_dir my_file sub111)(KNfile_in_dir my_file sub211)(KNfile_in_dir my_file sub121)(KNfile_in_dir my_file sub221)(KNfile_in_dir my_file sub112)(KNfile_in_dir my_file sub212)(KNfile_in_dir my_file sub122)(KNfile_in_dir my_file sub222)(not (Kfile_in_dir my_file sub22)))
:effect (and(Kfile_in_dir my_file sub22))
)
(:action R8
:precondition (and(Kfile_in_dir my_file sub111))
:effect (and(KNfile_in_dir my_file sub11)(KNfile_in_dir my_file sub21)(KNfile_in_dir my_file sub12)(KNfile_in_dir my_file sub22)(KNfile_in_dir my_file sub211)(KNfile_in_dir my_file sub121)(KNfile_in_dir my_file sub221)(KNfile_in_dir my_file sub112)(KNfile_in_dir my_file sub212)(KNfile_in_dir my_file sub122)(KNfile_in_dir my_file sub222))
)
(:action R9
:precondition (and(KNfile_in_dir my_file sub11)(KNfile_in_dir my_file sub21)(KNfile_in_dir my_file sub12)(KNfile_in_dir my_file sub22)(KNfile_in_dir my_file sub211)(KNfile_in_dir my_file sub121)(KNfile_in_dir my_file sub221)(KNfile_in_dir my_file sub112)(KNfile_in_dir my_file sub212)(KNfile_in_dir my_file sub122)(KNfile_in_dir my_file sub222)(not (Kfile_in_dir my_file sub111)))
:effect (and(Kfile_in_dir my_file sub111))
)
(:action R10
:precondition (and(Kfile_in_dir my_file sub211))
:effect (and(KNfile_in_dir my_file sub11)(KNfile_in_dir my_file sub21)(KNfile_in_dir my_file sub12)(KNfile_in_dir my_file sub22)(KNfile_in_dir my_file sub111)(KNfile_in_dir my_file sub121)(KNfile_in_dir my_file sub221)(KNfile_in_dir my_file sub112)(KNfile_in_dir my_file sub212)(KNfile_in_dir my_file sub122)(KNfile_in_dir my_file sub222))
)
(:action R11
:precondition (and(KNfile_in_dir my_file sub11)(KNfile_in_dir my_file sub21)(KNfile_in_dir my_file sub12)(KNfile_in_dir my_file sub22)(KNfile_in_dir my_file sub111)(KNfile_in_dir my_file sub121)(KNfile_in_dir my_file sub221)(KNfile_in_dir my_file sub112)(KNfile_in_dir my_file sub212)(KNfile_in_dir my_file sub122)(KNfile_in_dir my_file sub222)(not (Kfile_in_dir my_file sub211)))
:effect (and(Kfile_in_dir my_file sub211))
)
(:action R12
:precondition (and(Kfile_in_dir my_file sub121))
:effect (and(KNfile_in_dir my_file sub11)(KNfile_in_dir my_file sub21)(KNfile_in_dir my_file sub12)(KNfile_in_dir my_file sub22)(KNfile_in_dir my_file sub111)(KNfile_in_dir my_file sub211)(KNfile_in_dir my_file sub221)(KNfile_in_dir my_file sub112)(KNfile_in_dir my_file sub212)(KNfile_in_dir my_file sub122)(KNfile_in_dir my_file sub222))
)
(:action R13
:precondition (and(KNfile_in_dir my_file sub11)(KNfile_in_dir my_file sub21)(KNfile_in_dir my_file sub12)(KNfile_in_dir my_file sub22)(KNfile_in_dir my_file sub111)(KNfile_in_dir my_file sub211)(KNfile_in_dir my_file sub221)(KNfile_in_dir my_file sub112)(KNfile_in_dir my_file sub212)(KNfile_in_dir my_file sub122)(KNfile_in_dir my_file sub222)(not (Kfile_in_dir my_file sub121)))
:effect (and(Kfile_in_dir my_file sub121))
)
(:action R14
:precondition (and(Kfile_in_dir my_file sub221))
:effect (and(KNfile_in_dir my_file sub11)(KNfile_in_dir my_file sub21)(KNfile_in_dir my_file sub12)(KNfile_in_dir my_file sub22)(KNfile_in_dir my_file sub111)(KNfile_in_dir my_file sub211)(KNfile_in_dir my_file sub121)(KNfile_in_dir my_file sub112)(KNfile_in_dir my_file sub212)(KNfile_in_dir my_file sub122)(KNfile_in_dir my_file sub222))
)
(:action R15
:precondition (and(KNfile_in_dir my_file sub11)(KNfile_in_dir my_file sub21)(KNfile_in_dir my_file sub12)(KNfile_in_dir my_file sub22)(KNfile_in_dir my_file sub111)(KNfile_in_dir my_file sub211)(KNfile_in_dir my_file sub121)(KNfile_in_dir my_file sub112)(KNfile_in_dir my_file sub212)(KNfile_in_dir my_file sub122)(KNfile_in_dir my_file sub222)(not (Kfile_in_dir my_file sub221)))
:effect (and(Kfile_in_dir my_file sub221))
)
(:action R16
:precondition (and(Kfile_in_dir my_file sub112))
:effect (and(KNfile_in_dir my_file sub11)(KNfile_in_dir my_file sub21)(KNfile_in_dir my_file sub12)(KNfile_in_dir my_file sub22)(KNfile_in_dir my_file sub111)(KNfile_in_dir my_file sub211)(KNfile_in_dir my_file sub121)(KNfile_in_dir my_file sub221)(KNfile_in_dir my_file sub212)(KNfile_in_dir my_file sub122)(KNfile_in_dir my_file sub222))
)
(:action R17
:precondition (and(KNfile_in_dir my_file sub11)(KNfile_in_dir my_file sub21)(KNfile_in_dir my_file sub12)(KNfile_in_dir my_file sub22)(KNfile_in_dir my_file sub111)(KNfile_in_dir my_file sub211)(KNfile_in_dir my_file sub121)(KNfile_in_dir my_file sub221)(KNfile_in_dir my_file sub212)(KNfile_in_dir my_file sub122)(KNfile_in_dir my_file sub222)(not (Kfile_in_dir my_file sub112)))
:effect (and(Kfile_in_dir my_file sub112))
)
(:action R18
:precondition (and(Kfile_in_dir my_file sub212))
:effect (and(KNfile_in_dir my_file sub11)(KNfile_in_dir my_file sub21)(KNfile_in_dir my_file sub12)(KNfile_in_dir my_file sub22)(KNfile_in_dir my_file sub111)(KNfile_in_dir my_file sub211)(KNfile_in_dir my_file sub121)(KNfile_in_dir my_file sub221)(KNfile_in_dir my_file sub112)(KNfile_in_dir my_file sub122)(KNfile_in_dir my_file sub222))
)
(:action R19
:precondition (and(KNfile_in_dir my_file sub11)(KNfile_in_dir my_file sub21)(KNfile_in_dir my_file sub12)(KNfile_in_dir my_file sub22)(KNfile_in_dir my_file sub111)(KNfile_in_dir my_file sub211)(KNfile_in_dir my_file sub121)(KNfile_in_dir my_file sub221)(KNfile_in_dir my_file sub112)(KNfile_in_dir my_file sub122)(KNfile_in_dir my_file sub222)(not (Kfile_in_dir my_file sub212)))
:effect (and(Kfile_in_dir my_file sub212))
)
(:action R20
:precondition (and(Kfile_in_dir my_file sub122))
:effect (and(KNfile_in_dir my_file sub11)(KNfile_in_dir my_file sub21)(KNfile_in_dir my_file sub12)(KNfile_in_dir my_file sub22)(KNfile_in_dir my_file sub111)(KNfile_in_dir my_file sub211)(KNfile_in_dir my_file sub121)(KNfile_in_dir my_file sub221)(KNfile_in_dir my_file sub112)(KNfile_in_dir my_file sub212)(KNfile_in_dir my_file sub222))
)
(:action R21
:precondition (and(KNfile_in_dir my_file sub11)(KNfile_in_dir my_file sub21)(KNfile_in_dir my_file sub12)(KNfile_in_dir my_file sub22)(KNfile_in_dir my_file sub111)(KNfile_in_dir my_file sub211)(KNfile_in_dir my_file sub121)(KNfile_in_dir my_file sub221)(KNfile_in_dir my_file sub112)(KNfile_in_dir my_file sub212)(KNfile_in_dir my_file sub222)(not (Kfile_in_dir my_file sub122)))
:effect (and(Kfile_in_dir my_file sub122))
)
(:action R22
:precondition (and(Kfile_in_dir my_file sub222))
:effect (and(KNfile_in_dir my_file sub11)(KNfile_in_dir my_file sub21)(KNfile_in_dir my_file sub12)(KNfile_in_dir my_file sub22)(KNfile_in_dir my_file sub111)(KNfile_in_dir my_file sub211)(KNfile_in_dir my_file sub121)(KNfile_in_dir my_file sub221)(KNfile_in_dir my_file sub112)(KNfile_in_dir my_file sub212)(KNfile_in_dir my_file sub122))
)
(:action R23
:precondition (and(KNfile_in_dir my_file sub11)(KNfile_in_dir my_file sub21)(KNfile_in_dir my_file sub12)(KNfile_in_dir my_file sub22)(KNfile_in_dir my_file sub111)(KNfile_in_dir my_file sub211)(KNfile_in_dir my_file sub121)(KNfile_in_dir my_file sub221)(KNfile_in_dir my_file sub112)(KNfile_in_dir my_file sub212)(KNfile_in_dir my_file sub122)(not (Kfile_in_dir my_file sub222)))
:effect (and(Kfile_in_dir my_file sub222))
)
)
