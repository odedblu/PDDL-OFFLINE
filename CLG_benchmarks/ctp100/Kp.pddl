(define (problem Kp100)
(:domain Kctp)
;;SingleStateK
(:init
(adjacent v0 e0)
(adjacent v1 e0)
(adjacent v0 e1)
(adjacent v1 e1)
(adjacent v1 e2)
(adjacent v2 e2)
(adjacent v1 e3)
(adjacent v2 e3)
(adjacent v2 e4)
(adjacent v3 e4)
(adjacent v2 e5)
(adjacent v3 e5)
(adjacent v3 e6)
(adjacent v4 e6)
(adjacent v3 e7)
(adjacent v4 e7)
(adjacent v4 e8)
(adjacent v5 e8)
(adjacent v4 e9)
(adjacent v5 e9)
(adjacent v5 e10)
(adjacent v6 e10)
(adjacent v5 e11)
(adjacent v6 e11)
(adjacent v6 e12)
(adjacent v7 e12)
(adjacent v6 e13)
(adjacent v7 e13)
(adjacent v7 e14)
(adjacent v8 e14)
(adjacent v7 e15)
(adjacent v8 e15)
(adjacent v8 e16)
(adjacent v9 e16)
(adjacent v8 e17)
(adjacent v9 e17)
(adjacent v9 e18)
(adjacent v10 e18)
(adjacent v9 e19)
(adjacent v10 e19)
(adjacent v10 e20)
(adjacent v11 e20)
(adjacent v10 e21)
(adjacent v11 e21)
(adjacent v11 e22)
(adjacent v12 e22)
(adjacent v11 e23)
(adjacent v12 e23)
(adjacent v12 e24)
(adjacent v13 e24)
(adjacent v12 e25)
(adjacent v13 e25)
(adjacent v13 e26)
(adjacent v14 e26)
(adjacent v13 e27)
(adjacent v14 e27)
(adjacent v14 e28)
(adjacent v15 e28)
(adjacent v14 e29)
(adjacent v15 e29)
(adjacent v15 e30)
(adjacent v16 e30)
(adjacent v15 e31)
(adjacent v16 e31)
(adjacent v16 e32)
(adjacent v17 e32)
(adjacent v16 e33)
(adjacent v17 e33)
(adjacent v17 e34)
(adjacent v18 e34)
(adjacent v17 e35)
(adjacent v18 e35)
(adjacent v18 e36)
(adjacent v19 e36)
(adjacent v18 e37)
(adjacent v19 e37)
(adjacent v19 e38)
(adjacent v20 e38)
(adjacent v19 e39)
(adjacent v20 e39)
(adjacent v20 e40)
(adjacent v21 e40)
(adjacent v20 e41)
(adjacent v21 e41)
(adjacent v21 e42)
(adjacent v22 e42)
(adjacent v21 e43)
(adjacent v22 e43)
(adjacent v22 e44)
(adjacent v23 e44)
(adjacent v22 e45)
(adjacent v23 e45)
(adjacent v23 e46)
(adjacent v24 e46)
(adjacent v23 e47)
(adjacent v24 e47)
(adjacent v24 e48)
(adjacent v25 e48)
(adjacent v24 e49)
(adjacent v25 e49)
(adjacent v25 e50)
(adjacent v26 e50)
(adjacent v25 e51)
(adjacent v26 e51)
(adjacent v26 e52)
(adjacent v27 e52)
(adjacent v26 e53)
(adjacent v27 e53)
(adjacent v27 e54)
(adjacent v28 e54)
(adjacent v27 e55)
(adjacent v28 e55)
(adjacent v28 e56)
(adjacent v29 e56)
(adjacent v28 e57)
(adjacent v29 e57)
(adjacent v29 e58)
(adjacent v30 e58)
(adjacent v29 e59)
(adjacent v30 e59)
(adjacent v30 e60)
(adjacent v31 e60)
(adjacent v30 e61)
(adjacent v31 e61)
(adjacent v31 e62)
(adjacent v32 e62)
(adjacent v31 e63)
(adjacent v32 e63)
(adjacent v32 e64)
(adjacent v33 e64)
(adjacent v32 e65)
(adjacent v33 e65)
(adjacent v33 e66)
(adjacent v34 e66)
(adjacent v33 e67)
(adjacent v34 e67)
(adjacent v34 e68)
(adjacent v35 e68)
(adjacent v34 e69)
(adjacent v35 e69)
(adjacent v35 e70)
(adjacent v36 e70)
(adjacent v35 e71)
(adjacent v36 e71)
(adjacent v36 e72)
(adjacent v37 e72)
(adjacent v36 e73)
(adjacent v37 e73)
(adjacent v37 e74)
(adjacent v38 e74)
(adjacent v37 e75)
(adjacent v38 e75)
(adjacent v38 e76)
(adjacent v39 e76)
(adjacent v38 e77)
(adjacent v39 e77)
(adjacent v39 e78)
(adjacent v40 e78)
(adjacent v39 e79)
(adjacent v40 e79)
(adjacent v40 e80)
(adjacent v41 e80)
(adjacent v40 e81)
(adjacent v41 e81)
(adjacent v41 e82)
(adjacent v42 e82)
(adjacent v41 e83)
(adjacent v42 e83)
(adjacent v42 e84)
(adjacent v43 e84)
(adjacent v42 e85)
(adjacent v43 e85)
(adjacent v43 e86)
(adjacent v44 e86)
(adjacent v43 e87)
(adjacent v44 e87)
(adjacent v44 e88)
(adjacent v45 e88)
(adjacent v44 e89)
(adjacent v45 e89)
(adjacent v45 e90)
(adjacent v46 e90)
(adjacent v45 e91)
(adjacent v46 e91)
(adjacent v46 e92)
(adjacent v47 e92)
(adjacent v46 e93)
(adjacent v47 e93)
(adjacent v47 e94)
(adjacent v48 e94)
(adjacent v47 e95)
(adjacent v48 e95)
(adjacent v48 e96)
(adjacent v49 e96)
(adjacent v48 e97)
(adjacent v49 e97)
(adjacent v49 e98)
(adjacent v50 e98)
(adjacent v49 e99)
(adjacent v50 e99)
(adjacent v50 e100)
(adjacent v51 e100)
(adjacent v50 e101)
(adjacent v51 e101)
(adjacent v51 e102)
(adjacent v52 e102)
(adjacent v51 e103)
(adjacent v52 e103)
(adjacent v52 e104)
(adjacent v53 e104)
(adjacent v52 e105)
(adjacent v53 e105)
(adjacent v53 e106)
(adjacent v54 e106)
(adjacent v53 e107)
(adjacent v54 e107)
(adjacent v54 e108)
(adjacent v55 e108)
(adjacent v54 e109)
(adjacent v55 e109)
(adjacent v55 e110)
(adjacent v56 e110)
(adjacent v55 e111)
(adjacent v56 e111)
(adjacent v56 e112)
(adjacent v57 e112)
(adjacent v56 e113)
(adjacent v57 e113)
(adjacent v57 e114)
(adjacent v58 e114)
(adjacent v57 e115)
(adjacent v58 e115)
(adjacent v58 e116)
(adjacent v59 e116)
(adjacent v58 e117)
(adjacent v59 e117)
(adjacent v59 e118)
(adjacent v60 e118)
(adjacent v59 e119)
(adjacent v60 e119)
(adjacent v60 e120)
(adjacent v61 e120)
(adjacent v60 e121)
(adjacent v61 e121)
(adjacent v61 e122)
(adjacent v62 e122)
(adjacent v61 e123)
(adjacent v62 e123)
(adjacent v62 e124)
(adjacent v63 e124)
(adjacent v62 e125)
(adjacent v63 e125)
(adjacent v63 e126)
(adjacent v64 e126)
(adjacent v63 e127)
(adjacent v64 e127)
(adjacent v64 e128)
(adjacent v65 e128)
(adjacent v64 e129)
(adjacent v65 e129)
(adjacent v65 e130)
(adjacent v66 e130)
(adjacent v65 e131)
(adjacent v66 e131)
(adjacent v66 e132)
(adjacent v67 e132)
(adjacent v66 e133)
(adjacent v67 e133)
(adjacent v67 e134)
(adjacent v68 e134)
(adjacent v67 e135)
(adjacent v68 e135)
(adjacent v68 e136)
(adjacent v69 e136)
(adjacent v68 e137)
(adjacent v69 e137)
(adjacent v69 e138)
(adjacent v70 e138)
(adjacent v69 e139)
(adjacent v70 e139)
(adjacent v70 e140)
(adjacent v71 e140)
(adjacent v70 e141)
(adjacent v71 e141)
(adjacent v71 e142)
(adjacent v72 e142)
(adjacent v71 e143)
(adjacent v72 e143)
(adjacent v72 e144)
(adjacent v73 e144)
(adjacent v72 e145)
(adjacent v73 e145)
(adjacent v73 e146)
(adjacent v74 e146)
(adjacent v73 e147)
(adjacent v74 e147)
(adjacent v74 e148)
(adjacent v75 e148)
(adjacent v74 e149)
(adjacent v75 e149)
(adjacent v75 e150)
(adjacent v76 e150)
(adjacent v75 e151)
(adjacent v76 e151)
(adjacent v76 e152)
(adjacent v77 e152)
(adjacent v76 e153)
(adjacent v77 e153)
(adjacent v77 e154)
(adjacent v78 e154)
(adjacent v77 e155)
(adjacent v78 e155)
(adjacent v78 e156)
(adjacent v79 e156)
(adjacent v78 e157)
(adjacent v79 e157)
(adjacent v79 e158)
(adjacent v80 e158)
(adjacent v79 e159)
(adjacent v80 e159)
(adjacent v80 e160)
(adjacent v81 e160)
(adjacent v80 e161)
(adjacent v81 e161)
(adjacent v81 e162)
(adjacent v82 e162)
(adjacent v81 e163)
(adjacent v82 e163)
(adjacent v82 e164)
(adjacent v83 e164)
(adjacent v82 e165)
(adjacent v83 e165)
(adjacent v83 e166)
(adjacent v84 e166)
(adjacent v83 e167)
(adjacent v84 e167)
(adjacent v84 e168)
(adjacent v85 e168)
(adjacent v84 e169)
(adjacent v85 e169)
(adjacent v85 e170)
(adjacent v86 e170)
(adjacent v85 e171)
(adjacent v86 e171)
(adjacent v86 e172)
(adjacent v87 e172)
(adjacent v86 e173)
(adjacent v87 e173)
(adjacent v87 e174)
(adjacent v88 e174)
(adjacent v87 e175)
(adjacent v88 e175)
(adjacent v88 e176)
(adjacent v89 e176)
(adjacent v88 e177)
(adjacent v89 e177)
(adjacent v89 e178)
(adjacent v90 e178)
(adjacent v89 e179)
(adjacent v90 e179)
(adjacent v90 e180)
(adjacent v91 e180)
(adjacent v90 e181)
(adjacent v91 e181)
(adjacent v91 e182)
(adjacent v92 e182)
(adjacent v91 e183)
(adjacent v92 e183)
(adjacent v92 e184)
(adjacent v93 e184)
(adjacent v92 e185)
(adjacent v93 e185)
(adjacent v93 e186)
(adjacent v94 e186)
(adjacent v93 e187)
(adjacent v94 e187)
(adjacent v94 e188)
(adjacent v95 e188)
(adjacent v94 e189)
(adjacent v95 e189)
(adjacent v95 e190)
(adjacent v96 e190)
(adjacent v95 e191)
(adjacent v96 e191)
(adjacent v96 e192)
(adjacent v97 e192)
(adjacent v96 e193)
(adjacent v97 e193)
(adjacent v97 e194)
(adjacent v98 e194)
(adjacent v97 e195)
(adjacent v98 e195)
(adjacent v98 e196)
(adjacent v99 e196)
(adjacent v98 e197)
(adjacent v99 e197)
(adjacent v99 e198)
(adjacent v100 e198)
(adjacent v99 e199)
(adjacent v100 e199)
(at v0)
(not (at v1))
(not (at v2))
(not (at v3))
(not (at v4))
(not (at v5))
(not (at v6))
(not (at v7))
(not (at v8))
(not (at v9))
(not (at v10))
(not (at v11))
(not (at v12))
(not (at v13))
(not (at v14))
(not (at v15))
(not (at v16))
(not (at v17))
(not (at v18))
(not (at v19))
(not (at v20))
(not (at v21))
(not (at v22))
(not (at v23))
(not (at v24))
(not (at v25))
(not (at v26))
(not (at v27))
(not (at v28))
(not (at v29))
(not (at v30))
(not (at v31))
(not (at v32))
(not (at v33))
(not (at v34))
(not (at v35))
(not (at v36))
(not (at v37))
(not (at v38))
(not (at v39))
(not (at v40))
(not (at v41))
(not (at v42))
(not (at v43))
(not (at v44))
(not (at v45))
(not (at v46))
(not (at v47))
(not (at v48))
(not (at v49))
(not (at v50))
(not (at v51))
(not (at v52))
(not (at v53))
(not (at v54))
(not (at v55))
(not (at v56))
(not (at v57))
(not (at v58))
(not (at v59))
(not (at v60))
(not (at v61))
(not (at v62))
(not (at v63))
(not (at v64))
(not (at v65))
(not (at v66))
(not (at v67))
(not (at v68))
(not (at v69))
(not (at v70))
(not (at v71))
(not (at v72))
(not (at v73))
(not (at v74))
(not (at v75))
(not (at v76))
(not (at v77))
(not (at v78))
(not (at v79))
(not (at v80))
(not (at v81))
(not (at v82))
(not (at v83))
(not (at v84))
(not (at v85))
(not (at v86))
(not (at v87))
(not (at v88))
(not (at v89))
(not (at v90))
(not (at v91))
(not (at v92))
(not (at v93))
(not (at v94))
(not (at v95))
(not (at v96))
(not (at v97))
(not (at v98))
(not (at v99))
(not (at v100))
(not (traversable e0))
(KNtraversable e0)
(traversable e1)
(Ktraversable e1)
(traversable e2)
(not (traversable e3))
(traversable e4)
(not (traversable e5))
(traversable e6)
(not (traversable e7))
(traversable e8)
(not (traversable e9))
(traversable e10)
(not (traversable e11))
(traversable e12)
(not (traversable e13))
(traversable e14)
(not (traversable e15))
(traversable e16)
(not (traversable e17))
(traversable e18)
(not (traversable e19))
(traversable e20)
(not (traversable e21))
(traversable e22)
(not (traversable e23))
(traversable e24)
(not (traversable e25))
(traversable e26)
(not (traversable e27))
(traversable e28)
(not (traversable e29))
(traversable e30)
(not (traversable e31))
(traversable e32)
(not (traversable e33))
(traversable e34)
(not (traversable e35))
(traversable e36)
(not (traversable e37))
(traversable e38)
(not (traversable e39))
(traversable e40)
(not (traversable e41))
(traversable e42)
(not (traversable e43))
(traversable e44)
(not (traversable e45))
(traversable e46)
(not (traversable e47))
(traversable e48)
(not (traversable e49))
(traversable e50)
(not (traversable e51))
(traversable e52)
(not (traversable e53))
(traversable e54)
(not (traversable e55))
(traversable e56)
(not (traversable e57))
(traversable e58)
(not (traversable e59))
(traversable e60)
(not (traversable e61))
(traversable e62)
(not (traversable e63))
(traversable e64)
(not (traversable e65))
(traversable e66)
(not (traversable e67))
(traversable e68)
(not (traversable e69))
(traversable e70)
(not (traversable e71))
(traversable e72)
(not (traversable e73))
(traversable e74)
(not (traversable e75))
(traversable e76)
(not (traversable e77))
(traversable e78)
(not (traversable e79))
(traversable e80)
(not (traversable e81))
(traversable e82)
(not (traversable e83))
(traversable e84)
(not (traversable e85))
(traversable e86)
(not (traversable e87))
(traversable e88)
(not (traversable e89))
(traversable e90)
(not (traversable e91))
(traversable e92)
(not (traversable e93))
(traversable e94)
(not (traversable e95))
(traversable e96)
(not (traversable e97))
(traversable e98)
(not (traversable e99))
(traversable e100)
(not (traversable e101))
(traversable e102)
(not (traversable e103))
(traversable e104)
(not (traversable e105))
(traversable e106)
(not (traversable e107))
(traversable e108)
(not (traversable e109))
(traversable e110)
(not (traversable e111))
(traversable e112)
(not (traversable e113))
(traversable e114)
(not (traversable e115))
(traversable e116)
(not (traversable e117))
(traversable e118)
(not (traversable e119))
(traversable e120)
(not (traversable e121))
(traversable e122)
(not (traversable e123))
(traversable e124)
(not (traversable e125))
(traversable e126)
(not (traversable e127))
(traversable e128)
(not (traversable e129))
(traversable e130)
(not (traversable e131))
(traversable e132)
(not (traversable e133))
(traversable e134)
(not (traversable e135))
(traversable e136)
(not (traversable e137))
(traversable e138)
(not (traversable e139))
(traversable e140)
(not (traversable e141))
(traversable e142)
(not (traversable e143))
(traversable e144)
(not (traversable e145))
(traversable e146)
(not (traversable e147))
(traversable e148)
(not (traversable e149))
(traversable e150)
(not (traversable e151))
(traversable e152)
(not (traversable e153))
(traversable e154)
(not (traversable e155))
(traversable e156)
(not (traversable e157))
(traversable e158)
(not (traversable e159))
(traversable e160)
(not (traversable e161))
(traversable e162)
(not (traversable e163))
(traversable e164)
(not (traversable e165))
(traversable e166)
(not (traversable e167))
(traversable e168)
(not (traversable e169))
(traversable e170)
(not (traversable e171))
(traversable e172)
(not (traversable e173))
(traversable e174)
(not (traversable e175))
(traversable e176)
(not (traversable e177))
(traversable e178)
(not (traversable e179))
(traversable e180)
(not (traversable e181))
(traversable e182)
(not (traversable e183))
(traversable e184)
(not (traversable e185))
(traversable e186)
(not (traversable e187))
(traversable e188)
(not (traversable e189))
(traversable e190)
(not (traversable e191))
(traversable e192)
(not (traversable e193))
(traversable e194)
(not (traversable e195))
(traversable e196)
(not (traversable e197))
(traversable e198)
(not (traversable e199))
)
(:goal (at v100))
)
