(define (domain Kmyworld)
(:requirements :strips :typing)
(:types grid blow rocket patha TAG_TYPE VALUE_TYPE)
(:constants
 turn - turn
 blown - blow
 a - rocket
 d - rocket
 a1 - patha
 a2 - patha
 a3 - patha
 a4 - patha
 a5 - patha
 g-x0-y0-z0 - grid
 g-x0-y0-z1 - grid
 g-x0-y0-z2 - grid
 g-x0-y0-z3 - grid
 g-x0-y0-z4 - grid
 g-x0-y0-z5 - grid
 g-x0-y0-z6 - grid
 g-x0-y0-z7 - grid
 g-x0-y0-z8 - grid
 g-x0-y0-z9 - grid
 g-x0-y0-z10 - grid
 g-x0-y0-z11 - grid
 g-x0-y0-z12 - grid
 g-x0-y0-z13 - grid
 g-x0-y0-z14 - grid
 g-x0-y0-z15 - grid
 g-x0-y1-z0 - grid
 g-x0-y1-z1 - grid
 g-x0-y1-z2 - grid
 g-x0-y1-z3 - grid
 g-x0-y1-z4 - grid
 g-x0-y1-z5 - grid
 g-x0-y1-z6 - grid
 g-x0-y1-z7 - grid
 g-x0-y1-z8 - grid
 g-x0-y1-z9 - grid
 g-x0-y1-z10 - grid
 g-x0-y1-z11 - grid
 g-x0-y1-z12 - grid
 g-x0-y1-z13 - grid
 g-x0-y1-z14 - grid
 g-x0-y1-z15 - grid
 g-x0-y2-z0 - grid
 g-x0-y2-z1 - grid
 g-x0-y2-z2 - grid
 g-x0-y2-z3 - grid
 g-x0-y2-z4 - grid
 g-x0-y2-z5 - grid
 g-x0-y2-z6 - grid
 g-x0-y2-z7 - grid
 g-x0-y2-z8 - grid
 g-x0-y2-z9 - grid
 g-x0-y2-z10 - grid
 g-x0-y2-z11 - grid
 g-x0-y2-z12 - grid
 g-x0-y2-z13 - grid
 g-x0-y2-z14 - grid
 g-x0-y2-z15 - grid
 g-x0-y3-z0 - grid
 g-x0-y3-z1 - grid
 g-x0-y3-z2 - grid
 g-x0-y3-z3 - grid
 g-x0-y3-z4 - grid
 g-x0-y3-z5 - grid
 g-x0-y3-z6 - grid
 g-x0-y3-z7 - grid
 g-x0-y3-z8 - grid
 g-x0-y3-z9 - grid
 g-x0-y3-z10 - grid
 g-x0-y3-z11 - grid
 g-x0-y3-z12 - grid
 g-x0-y3-z13 - grid
 g-x0-y3-z14 - grid
 g-x0-y3-z15 - grid
 g-x0-y4-z0 - grid
 g-x0-y4-z1 - grid
 g-x0-y4-z2 - grid
 g-x0-y4-z3 - grid
 g-x0-y4-z4 - grid
 g-x0-y4-z5 - grid
 g-x0-y4-z6 - grid
 g-x0-y4-z7 - grid
 g-x0-y4-z8 - grid
 g-x0-y4-z9 - grid
 g-x0-y4-z10 - grid
 g-x0-y4-z11 - grid
 g-x0-y4-z12 - grid
 g-x0-y4-z13 - grid
 g-x0-y4-z14 - grid
 g-x0-y4-z15 - grid
 g-x0-y5-z0 - grid
 g-x0-y5-z1 - grid
 g-x0-y5-z2 - grid
 g-x0-y5-z3 - grid
 g-x0-y5-z4 - grid
 g-x0-y5-z5 - grid
 g-x0-y5-z6 - grid
 g-x0-y5-z7 - grid
 g-x0-y5-z8 - grid
 g-x0-y5-z9 - grid
 g-x0-y5-z10 - grid
 g-x0-y5-z11 - grid
 g-x0-y5-z12 - grid
 g-x0-y5-z13 - grid
 g-x0-y5-z14 - grid
 g-x0-y5-z15 - grid
 g-x0-y6-z0 - grid
 g-x0-y6-z1 - grid
 g-x0-y6-z2 - grid
 g-x0-y6-z3 - grid
 g-x0-y6-z4 - grid
 g-x0-y6-z5 - grid
 g-x0-y6-z6 - grid
 g-x0-y6-z7 - grid
 g-x0-y6-z8 - grid
 g-x0-y6-z9 - grid
 g-x0-y6-z10 - grid
 g-x0-y6-z11 - grid
 g-x0-y6-z12 - grid
 g-x0-y6-z13 - grid
 g-x0-y6-z14 - grid
 g-x0-y6-z15 - grid
 g-x0-y7-z0 - grid
 g-x0-y7-z1 - grid
 g-x0-y7-z2 - grid
 g-x0-y7-z3 - grid
 g-x0-y7-z4 - grid
 g-x0-y7-z5 - grid
 g-x0-y7-z6 - grid
 g-x0-y7-z7 - grid
 g-x0-y7-z8 - grid
 g-x0-y7-z9 - grid
 g-x0-y7-z10 - grid
 g-x0-y7-z11 - grid
 g-x0-y7-z12 - grid
 g-x0-y7-z13 - grid
 g-x0-y7-z14 - grid
 g-x0-y7-z15 - grid
 g-x0-y8-z0 - grid
 g-x0-y8-z1 - grid
 g-x0-y8-z2 - grid
 g-x0-y8-z3 - grid
 g-x0-y8-z4 - grid
 g-x0-y8-z5 - grid
 g-x0-y8-z6 - grid
 g-x0-y8-z7 - grid
 g-x0-y8-z8 - grid
 g-x0-y8-z9 - grid
 g-x0-y8-z10 - grid
 g-x0-y8-z11 - grid
 g-x0-y8-z12 - grid
 g-x0-y8-z13 - grid
 g-x0-y8-z14 - grid
 g-x0-y8-z15 - grid
 g-x0-y9-z0 - grid
 g-x0-y9-z1 - grid
 g-x0-y9-z2 - grid
 g-x0-y9-z3 - grid
 g-x0-y9-z4 - grid
 g-x0-y9-z5 - grid
 g-x0-y9-z6 - grid
 g-x0-y9-z7 - grid
 g-x0-y9-z8 - grid
 g-x0-y9-z9 - grid
 g-x0-y9-z10 - grid
 g-x0-y9-z11 - grid
 g-x0-y9-z12 - grid
 g-x0-y9-z13 - grid
 g-x0-y9-z14 - grid
 g-x0-y9-z15 - grid
 g-x0-y10-z0 - grid
 g-x0-y10-z1 - grid
 g-x0-y10-z2 - grid
 g-x0-y10-z3 - grid
 g-x0-y10-z4 - grid
 g-x0-y10-z5 - grid
 g-x0-y10-z6 - grid
 g-x0-y10-z7 - grid
 g-x0-y10-z8 - grid
 g-x0-y10-z9 - grid
 g-x0-y10-z10 - grid
 g-x0-y10-z11 - grid
 g-x0-y10-z12 - grid
 g-x0-y10-z13 - grid
 g-x0-y10-z14 - grid
 g-x0-y10-z15 - grid
 g-x0-y11-z0 - grid
 g-x0-y11-z1 - grid
 g-x0-y11-z2 - grid
 g-x0-y11-z3 - grid
 g-x0-y11-z4 - grid
 g-x0-y11-z5 - grid
 g-x0-y11-z6 - grid
 g-x0-y11-z7 - grid
 g-x0-y11-z8 - grid
 g-x0-y11-z9 - grid
 g-x0-y11-z10 - grid
 g-x0-y11-z11 - grid
 g-x0-y11-z12 - grid
 g-x0-y11-z13 - grid
 g-x0-y11-z14 - grid
 g-x0-y11-z15 - grid
 g-x0-y12-z0 - grid
 g-x0-y12-z1 - grid
 g-x0-y12-z2 - grid
 g-x0-y12-z3 - grid
 g-x0-y12-z4 - grid
 g-x0-y12-z5 - grid
 g-x0-y12-z6 - grid
 g-x0-y12-z7 - grid
 g-x0-y12-z8 - grid
 g-x0-y12-z9 - grid
 g-x0-y12-z10 - grid
 g-x0-y12-z11 - grid
 g-x0-y12-z12 - grid
 g-x0-y12-z13 - grid
 g-x0-y12-z14 - grid
 g-x0-y12-z15 - grid
 g-x0-y13-z0 - grid
 g-x0-y13-z1 - grid
 g-x0-y13-z2 - grid
 g-x0-y13-z3 - grid
 g-x0-y13-z4 - grid
 g-x0-y13-z5 - grid
 g-x0-y13-z6 - grid
 g-x0-y13-z7 - grid
 g-x0-y13-z8 - grid
 g-x0-y13-z9 - grid
 g-x0-y13-z10 - grid
 g-x0-y13-z11 - grid
 g-x0-y13-z12 - grid
 g-x0-y13-z13 - grid
 g-x0-y13-z14 - grid
 g-x0-y13-z15 - grid
 g-x0-y14-z0 - grid
 g-x0-y14-z1 - grid
 g-x0-y14-z2 - grid
 g-x0-y14-z3 - grid
 g-x0-y14-z4 - grid
 g-x0-y14-z5 - grid
 g-x0-y14-z6 - grid
 g-x0-y14-z7 - grid
 g-x0-y14-z8 - grid
 g-x0-y14-z9 - grid
 g-x0-y14-z10 - grid
 g-x0-y14-z11 - grid
 g-x0-y14-z12 - grid
 g-x0-y14-z13 - grid
 g-x0-y14-z14 - grid
 g-x0-y14-z15 - grid
 g-x0-y15-z0 - grid
 g-x0-y15-z1 - grid
 g-x0-y15-z2 - grid
 g-x0-y15-z3 - grid
 g-x0-y15-z4 - grid
 g-x0-y15-z5 - grid
 g-x0-y15-z6 - grid
 g-x0-y15-z7 - grid
 g-x0-y15-z8 - grid
 g-x0-y15-z9 - grid
 g-x0-y15-z10 - grid
 g-x0-y15-z11 - grid
 g-x0-y15-z12 - grid
 g-x0-y15-z13 - grid
 g-x0-y15-z14 - grid
 g-x0-y15-z15 - grid
 g-x1-y0-z0 - grid
 g-x1-y0-z1 - grid
 g-x1-y0-z2 - grid
 g-x1-y0-z3 - grid
 g-x1-y0-z4 - grid
 g-x1-y0-z5 - grid
 g-x1-y0-z6 - grid
 g-x1-y0-z7 - grid
 g-x1-y0-z8 - grid
 g-x1-y0-z9 - grid
 g-x1-y0-z10 - grid
 g-x1-y0-z11 - grid
 g-x1-y0-z12 - grid
 g-x1-y0-z13 - grid
 g-x1-y0-z14 - grid
 g-x1-y0-z15 - grid
 g-x1-y1-z0 - grid
 g-x1-y1-z1 - grid
 g-x1-y1-z2 - grid
 g-x1-y1-z3 - grid
 g-x1-y1-z4 - grid
 g-x1-y1-z5 - grid
 g-x1-y1-z6 - grid
 g-x1-y1-z7 - grid
 g-x1-y1-z8 - grid
 g-x1-y1-z9 - grid
 g-x1-y1-z10 - grid
 g-x1-y1-z11 - grid
 g-x1-y1-z12 - grid
 g-x1-y1-z13 - grid
 g-x1-y1-z14 - grid
 g-x1-y1-z15 - grid
 g-x1-y2-z0 - grid
 g-x1-y2-z1 - grid
 g-x1-y2-z2 - grid
 g-x1-y2-z3 - grid
 g-x1-y2-z4 - grid
 g-x1-y2-z5 - grid
 g-x1-y2-z6 - grid
 g-x1-y2-z7 - grid
 g-x1-y2-z8 - grid
 g-x1-y2-z9 - grid
 g-x1-y2-z10 - grid
 g-x1-y2-z11 - grid
 g-x1-y2-z12 - grid
 g-x1-y2-z13 - grid
 g-x1-y2-z14 - grid
 g-x1-y2-z15 - grid
 g-x1-y3-z0 - grid
 g-x1-y3-z1 - grid
 g-x1-y3-z2 - grid
 g-x1-y3-z3 - grid
 g-x1-y3-z4 - grid
 g-x1-y3-z5 - grid
 g-x1-y3-z6 - grid
 g-x1-y3-z7 - grid
 g-x1-y3-z8 - grid
 g-x1-y3-z9 - grid
 g-x1-y3-z10 - grid
 g-x1-y3-z11 - grid
 g-x1-y3-z12 - grid
 g-x1-y3-z13 - grid
 g-x1-y3-z14 - grid
 g-x1-y3-z15 - grid
 g-x1-y4-z0 - grid
 g-x1-y4-z1 - grid
 g-x1-y4-z2 - grid
 g-x1-y4-z3 - grid
 g-x1-y4-z4 - grid
 g-x1-y4-z5 - grid
 g-x1-y4-z6 - grid
 g-x1-y4-z7 - grid
 g-x1-y4-z8 - grid
 g-x1-y4-z9 - grid
 g-x1-y4-z10 - grid
 g-x1-y4-z11 - grid
 g-x1-y4-z12 - grid
 g-x1-y4-z13 - grid
 g-x1-y4-z14 - grid
 g-x1-y4-z15 - grid
 g-x1-y5-z0 - grid
 g-x1-y5-z1 - grid
 g-x1-y5-z2 - grid
 g-x1-y5-z3 - grid
 g-x1-y5-z4 - grid
 g-x1-y5-z5 - grid
 g-x1-y5-z6 - grid
 g-x1-y5-z7 - grid
 g-x1-y5-z8 - grid
 g-x1-y5-z9 - grid
 g-x1-y5-z10 - grid
 g-x1-y5-z11 - grid
 g-x1-y5-z12 - grid
 g-x1-y5-z13 - grid
 g-x1-y5-z14 - grid
 g-x1-y5-z15 - grid
 g-x1-y6-z0 - grid
 g-x1-y6-z1 - grid
 g-x1-y6-z2 - grid
 g-x1-y6-z3 - grid
 g-x1-y6-z4 - grid
 g-x1-y6-z5 - grid
 g-x1-y6-z6 - grid
 g-x1-y6-z7 - grid
 g-x1-y6-z8 - grid
 g-x1-y6-z9 - grid
 g-x1-y6-z10 - grid
 g-x1-y6-z11 - grid
 g-x1-y6-z12 - grid
 g-x1-y6-z13 - grid
 g-x1-y6-z14 - grid
 g-x1-y6-z15 - grid
 g-x1-y7-z0 - grid
 g-x1-y7-z1 - grid
 g-x1-y7-z2 - grid
 g-x1-y7-z3 - grid
 g-x1-y7-z4 - grid
 g-x1-y7-z5 - grid
 g-x1-y7-z6 - grid
 g-x1-y7-z7 - grid
 g-x1-y7-z8 - grid
 g-x1-y7-z9 - grid
 g-x1-y7-z10 - grid
 g-x1-y7-z11 - grid
 g-x1-y7-z12 - grid
 g-x1-y7-z13 - grid
 g-x1-y7-z14 - grid
 g-x1-y7-z15 - grid
 g-x1-y8-z0 - grid
 g-x1-y8-z1 - grid
 g-x1-y8-z2 - grid
 g-x1-y8-z3 - grid
 g-x1-y8-z4 - grid
 g-x1-y8-z5 - grid
 g-x1-y8-z6 - grid
 g-x1-y8-z7 - grid
 g-x1-y8-z8 - grid
 g-x1-y8-z9 - grid
 g-x1-y8-z10 - grid
 g-x1-y8-z11 - grid
 g-x1-y8-z12 - grid
 g-x1-y8-z13 - grid
 g-x1-y8-z14 - grid
 g-x1-y8-z15 - grid
 g-x1-y9-z0 - grid
 g-x1-y9-z1 - grid
 g-x1-y9-z2 - grid
 g-x1-y9-z3 - grid
 g-x1-y9-z4 - grid
 g-x1-y9-z5 - grid
 g-x1-y9-z6 - grid
 g-x1-y9-z7 - grid
 g-x1-y9-z8 - grid
 g-x1-y9-z9 - grid
 g-x1-y9-z10 - grid
 g-x1-y9-z11 - grid
 g-x1-y9-z12 - grid
 g-x1-y9-z13 - grid
 g-x1-y9-z14 - grid
 g-x1-y9-z15 - grid
 g-x1-y10-z0 - grid
 g-x1-y10-z1 - grid
 g-x1-y10-z2 - grid
 g-x1-y10-z3 - grid
 g-x1-y10-z4 - grid
 g-x1-y10-z5 - grid
 g-x1-y10-z6 - grid
 g-x1-y10-z7 - grid
 g-x1-y10-z8 - grid
 g-x1-y10-z9 - grid
 g-x1-y10-z10 - grid
 g-x1-y10-z11 - grid
 g-x1-y10-z12 - grid
 g-x1-y10-z13 - grid
 g-x1-y10-z14 - grid
 g-x1-y10-z15 - grid
 g-x1-y11-z0 - grid
 g-x1-y11-z1 - grid
 g-x1-y11-z2 - grid
 g-x1-y11-z3 - grid
 g-x1-y11-z4 - grid
 g-x1-y11-z5 - grid
 g-x1-y11-z6 - grid
 g-x1-y11-z7 - grid
 g-x1-y11-z8 - grid
 g-x1-y11-z9 - grid
 g-x1-y11-z10 - grid
 g-x1-y11-z11 - grid
 g-x1-y11-z12 - grid
 g-x1-y11-z13 - grid
 g-x1-y11-z14 - grid
 g-x1-y11-z15 - grid
 g-x1-y12-z0 - grid
 g-x1-y12-z1 - grid
 g-x1-y12-z2 - grid
 g-x1-y12-z3 - grid
 g-x1-y12-z4 - grid
 g-x1-y12-z5 - grid
 g-x1-y12-z6 - grid
 g-x1-y12-z7 - grid
 g-x1-y12-z8 - grid
 g-x1-y12-z9 - grid
 g-x1-y12-z10 - grid
 g-x1-y12-z11 - grid
 g-x1-y12-z12 - grid
 g-x1-y12-z13 - grid
 g-x1-y12-z14 - grid
 g-x1-y12-z15 - grid
 g-x1-y13-z0 - grid
 g-x1-y13-z1 - grid
 g-x1-y13-z2 - grid
 g-x1-y13-z3 - grid
 g-x1-y13-z4 - grid
 g-x1-y13-z5 - grid
 g-x1-y13-z6 - grid
 g-x1-y13-z7 - grid
 g-x1-y13-z8 - grid
 g-x1-y13-z9 - grid
 g-x1-y13-z10 - grid
 g-x1-y13-z11 - grid
 g-x1-y13-z12 - grid
 g-x1-y13-z13 - grid
 g-x1-y13-z14 - grid
 g-x1-y13-z15 - grid
 g-x1-y14-z0 - grid
 g-x1-y14-z1 - grid
 g-x1-y14-z2 - grid
 g-x1-y14-z3 - grid
 g-x1-y14-z4 - grid
 g-x1-y14-z5 - grid
 g-x1-y14-z6 - grid
 g-x1-y14-z7 - grid
 g-x1-y14-z8 - grid
 g-x1-y14-z9 - grid
 g-x1-y14-z10 - grid
 g-x1-y14-z11 - grid
 g-x1-y14-z12 - grid
 g-x1-y14-z13 - grid
 g-x1-y14-z14 - grid
 g-x1-y14-z15 - grid
 g-x1-y15-z0 - grid
 g-x1-y15-z1 - grid
 g-x1-y15-z2 - grid
 g-x1-y15-z3 - grid
 g-x1-y15-z4 - grid
 g-x1-y15-z5 - grid
 g-x1-y15-z6 - grid
 g-x1-y15-z7 - grid
 g-x1-y15-z8 - grid
 g-x1-y15-z9 - grid
 g-x1-y15-z10 - grid
 g-x1-y15-z11 - grid
 g-x1-y15-z12 - grid
 g-x1-y15-z13 - grid
 g-x1-y15-z14 - grid
 g-x1-y15-z15 - grid
 g-x2-y0-z0 - grid
 g-x2-y0-z1 - grid
 g-x2-y0-z2 - grid
 g-x2-y0-z3 - grid
 g-x2-y0-z4 - grid
 g-x2-y0-z5 - grid
 g-x2-y0-z6 - grid
 g-x2-y0-z7 - grid
 g-x2-y0-z8 - grid
 g-x2-y0-z9 - grid
 g-x2-y0-z10 - grid
 g-x2-y0-z11 - grid
 g-x2-y0-z12 - grid
 g-x2-y0-z13 - grid
 g-x2-y0-z14 - grid
 g-x2-y0-z15 - grid
 g-x2-y1-z0 - grid
 g-x2-y1-z1 - grid
 g-x2-y1-z2 - grid
 g-x2-y1-z3 - grid
 g-x2-y1-z4 - grid
 g-x2-y1-z5 - grid
 g-x2-y1-z6 - grid
 g-x2-y1-z7 - grid
 g-x2-y1-z8 - grid
 g-x2-y1-z9 - grid
 g-x2-y1-z10 - grid
 g-x2-y1-z11 - grid
 g-x2-y1-z12 - grid
 g-x2-y1-z13 - grid
 g-x2-y1-z14 - grid
 g-x2-y1-z15 - grid
 g-x2-y2-z0 - grid
 g-x2-y2-z1 - grid
 g-x2-y2-z2 - grid
 g-x2-y2-z3 - grid
 g-x2-y2-z4 - grid
 g-x2-y2-z5 - grid
 g-x2-y2-z6 - grid
 g-x2-y2-z7 - grid
 g-x2-y2-z8 - grid
 g-x2-y2-z9 - grid
 g-x2-y2-z10 - grid
 g-x2-y2-z11 - grid
 g-x2-y2-z12 - grid
 g-x2-y2-z13 - grid
 g-x2-y2-z14 - grid
 g-x2-y2-z15 - grid
 g-x2-y3-z0 - grid
 g-x2-y3-z1 - grid
 g-x2-y3-z2 - grid
 g-x2-y3-z3 - grid
 g-x2-y3-z4 - grid
 g-x2-y3-z5 - grid
 g-x2-y3-z6 - grid
 g-x2-y3-z7 - grid
 g-x2-y3-z8 - grid
 g-x2-y3-z9 - grid
 g-x2-y3-z10 - grid
 g-x2-y3-z11 - grid
 g-x2-y3-z12 - grid
 g-x2-y3-z13 - grid
 g-x2-y3-z14 - grid
 g-x2-y3-z15 - grid
 g-x2-y4-z0 - grid
 g-x2-y4-z1 - grid
 g-x2-y4-z2 - grid
 g-x2-y4-z3 - grid
 g-x2-y4-z4 - grid
 g-x2-y4-z5 - grid
 g-x2-y4-z6 - grid
 g-x2-y4-z7 - grid
 g-x2-y4-z8 - grid
 g-x2-y4-z9 - grid
 g-x2-y4-z10 - grid
 g-x2-y4-z11 - grid
 g-x2-y4-z12 - grid
 g-x2-y4-z13 - grid
 g-x2-y4-z14 - grid
 g-x2-y4-z15 - grid
 g-x2-y5-z0 - grid
 g-x2-y5-z1 - grid
 g-x2-y5-z2 - grid
 g-x2-y5-z3 - grid
 g-x2-y5-z4 - grid
 g-x2-y5-z5 - grid
 g-x2-y5-z6 - grid
 g-x2-y5-z7 - grid
 g-x2-y5-z8 - grid
 g-x2-y5-z9 - grid
 g-x2-y5-z10 - grid
 g-x2-y5-z11 - grid
 g-x2-y5-z12 - grid
 g-x2-y5-z13 - grid
 g-x2-y5-z14 - grid
 g-x2-y5-z15 - grid
 g-x2-y6-z0 - grid
 g-x2-y6-z1 - grid
 g-x2-y6-z2 - grid
 g-x2-y6-z3 - grid
 g-x2-y6-z4 - grid
 g-x2-y6-z5 - grid
 g-x2-y6-z6 - grid
 g-x2-y6-z7 - grid
 g-x2-y6-z8 - grid
 g-x2-y6-z9 - grid
 g-x2-y6-z10 - grid
 g-x2-y6-z11 - grid
 g-x2-y6-z12 - grid
 g-x2-y6-z13 - grid
 g-x2-y6-z14 - grid
 g-x2-y6-z15 - grid
 g-x2-y7-z0 - grid
 g-x2-y7-z1 - grid
 g-x2-y7-z2 - grid
 g-x2-y7-z3 - grid
 g-x2-y7-z4 - grid
 g-x2-y7-z5 - grid
 g-x2-y7-z6 - grid
 g-x2-y7-z7 - grid
 g-x2-y7-z8 - grid
 g-x2-y7-z9 - grid
 g-x2-y7-z10 - grid
 g-x2-y7-z11 - grid
 g-x2-y7-z12 - grid
 g-x2-y7-z13 - grid
 g-x2-y7-z14 - grid
 g-x2-y7-z15 - grid
 g-x2-y8-z0 - grid
 g-x2-y8-z1 - grid
 g-x2-y8-z2 - grid
 g-x2-y8-z3 - grid
 g-x2-y8-z4 - grid
 g-x2-y8-z5 - grid
 g-x2-y8-z6 - grid
 g-x2-y8-z7 - grid
 g-x2-y8-z8 - grid
 g-x2-y8-z9 - grid
 g-x2-y8-z10 - grid
 g-x2-y8-z11 - grid
 g-x2-y8-z12 - grid
 g-x2-y8-z13 - grid
 g-x2-y8-z14 - grid
 g-x2-y8-z15 - grid
 g-x2-y9-z0 - grid
 g-x2-y9-z1 - grid
 g-x2-y9-z2 - grid
 g-x2-y9-z3 - grid
 g-x2-y9-z4 - grid
 g-x2-y9-z5 - grid
 g-x2-y9-z6 - grid
 g-x2-y9-z7 - grid
 g-x2-y9-z8 - grid
 g-x2-y9-z9 - grid
 g-x2-y9-z10 - grid
 g-x2-y9-z11 - grid
 g-x2-y9-z12 - grid
 g-x2-y9-z13 - grid
 g-x2-y9-z14 - grid
 g-x2-y9-z15 - grid
 g-x2-y10-z0 - grid
 g-x2-y10-z1 - grid
 g-x2-y10-z2 - grid
 g-x2-y10-z3 - grid
 g-x2-y10-z4 - grid
 g-x2-y10-z5 - grid
 g-x2-y10-z6 - grid
 g-x2-y10-z7 - grid
 g-x2-y10-z8 - grid
 g-x2-y10-z9 - grid
 g-x2-y10-z10 - grid
 g-x2-y10-z11 - grid
 g-x2-y10-z12 - grid
 g-x2-y10-z13 - grid
 g-x2-y10-z14 - grid
 g-x2-y10-z15 - grid
 g-x2-y11-z0 - grid
 g-x2-y11-z1 - grid
 g-x2-y11-z2 - grid
 g-x2-y11-z3 - grid
 g-x2-y11-z4 - grid
 g-x2-y11-z5 - grid
 g-x2-y11-z6 - grid
 g-x2-y11-z7 - grid
 g-x2-y11-z8 - grid
 g-x2-y11-z9 - grid
 g-x2-y11-z10 - grid
 g-x2-y11-z11 - grid
 g-x2-y11-z12 - grid
 g-x2-y11-z13 - grid
 g-x2-y11-z14 - grid
 g-x2-y11-z15 - grid
 g-x2-y12-z0 - grid
 g-x2-y12-z1 - grid
 g-x2-y12-z2 - grid
 g-x2-y12-z3 - grid
 g-x2-y12-z4 - grid
 g-x2-y12-z5 - grid
 g-x2-y12-z6 - grid
 g-x2-y12-z7 - grid
 g-x2-y12-z8 - grid
 g-x2-y12-z9 - grid
 g-x2-y12-z10 - grid
 g-x2-y12-z11 - grid
 g-x2-y12-z12 - grid
 g-x2-y12-z13 - grid
 g-x2-y12-z14 - grid
 g-x2-y12-z15 - grid
 g-x2-y13-z0 - grid
 g-x2-y13-z1 - grid
 g-x2-y13-z2 - grid
 g-x2-y13-z3 - grid
 g-x2-y13-z4 - grid
 g-x2-y13-z5 - grid
 g-x2-y13-z6 - grid
 g-x2-y13-z7 - grid
 g-x2-y13-z8 - grid
 g-x2-y13-z9 - grid
 g-x2-y13-z10 - grid
 g-x2-y13-z11 - grid
 g-x2-y13-z12 - grid
 g-x2-y13-z13 - grid
 g-x2-y13-z14 - grid
 g-x2-y13-z15 - grid
 g-x2-y14-z0 - grid
 g-x2-y14-z1 - grid
 g-x2-y14-z2 - grid
 g-x2-y14-z3 - grid
 g-x2-y14-z4 - grid
 g-x2-y14-z5 - grid
 g-x2-y14-z6 - grid
 g-x2-y14-z7 - grid
 g-x2-y14-z8 - grid
 g-x2-y14-z9 - grid
 g-x2-y14-z10 - grid
 g-x2-y14-z11 - grid
 g-x2-y14-z12 - grid
 g-x2-y14-z13 - grid
 g-x2-y14-z14 - grid
 g-x2-y14-z15 - grid
 g-x2-y15-z0 - grid
 g-x2-y15-z1 - grid
 g-x2-y15-z2 - grid
 g-x2-y15-z3 - grid
 g-x2-y15-z4 - grid
 g-x2-y15-z5 - grid
 g-x2-y15-z6 - grid
 g-x2-y15-z7 - grid
 g-x2-y15-z8 - grid
 g-x2-y15-z9 - grid
 g-x2-y15-z10 - grid
 g-x2-y15-z11 - grid
 g-x2-y15-z12 - grid
 g-x2-y15-z13 - grid
 g-x2-y15-z14 - grid
 g-x2-y15-z15 - grid
 g-x3-y0-z0 - grid
 g-x3-y0-z1 - grid
 g-x3-y0-z2 - grid
 g-x3-y0-z3 - grid
 g-x3-y0-z4 - grid
 g-x3-y0-z5 - grid
 g-x3-y0-z6 - grid
 g-x3-y0-z7 - grid
 g-x3-y0-z8 - grid
 g-x3-y0-z9 - grid
 g-x3-y0-z10 - grid
 g-x3-y0-z11 - grid
 g-x3-y0-z12 - grid
 g-x3-y0-z13 - grid
 g-x3-y0-z14 - grid
 g-x3-y0-z15 - grid
 g-x3-y1-z0 - grid
 g-x3-y1-z1 - grid
 g-x3-y1-z2 - grid
 g-x3-y1-z3 - grid
 g-x3-y1-z4 - grid
 g-x3-y1-z5 - grid
 g-x3-y1-z6 - grid
 g-x3-y1-z7 - grid
 g-x3-y1-z8 - grid
 g-x3-y1-z9 - grid
 g-x3-y1-z10 - grid
 g-x3-y1-z11 - grid
 g-x3-y1-z12 - grid
 g-x3-y1-z13 - grid
 g-x3-y1-z14 - grid
 g-x3-y1-z15 - grid
 g-x3-y2-z0 - grid
 g-x3-y2-z1 - grid
 g-x3-y2-z2 - grid
 g-x3-y2-z3 - grid
 g-x3-y2-z4 - grid
 g-x3-y2-z5 - grid
 g-x3-y2-z6 - grid
 g-x3-y2-z7 - grid
 g-x3-y2-z8 - grid
 g-x3-y2-z9 - grid
 g-x3-y2-z10 - grid
 g-x3-y2-z11 - grid
 g-x3-y2-z12 - grid
 g-x3-y2-z13 - grid
 g-x3-y2-z14 - grid
 g-x3-y2-z15 - grid
 g-x3-y3-z0 - grid
 g-x3-y3-z1 - grid
 g-x3-y3-z2 - grid
 g-x3-y3-z3 - grid
 g-x3-y3-z4 - grid
 g-x3-y3-z5 - grid
 g-x3-y3-z6 - grid
 g-x3-y3-z7 - grid
 g-x3-y3-z8 - grid
 g-x3-y3-z9 - grid
 g-x3-y3-z10 - grid
 g-x3-y3-z11 - grid
 g-x3-y3-z12 - grid
 g-x3-y3-z13 - grid
 g-x3-y3-z14 - grid
 g-x3-y3-z15 - grid
 g-x3-y4-z0 - grid
 g-x3-y4-z1 - grid
 g-x3-y4-z2 - grid
 g-x3-y4-z3 - grid
 g-x3-y4-z4 - grid
 g-x3-y4-z5 - grid
 g-x3-y4-z6 - grid
 g-x3-y4-z7 - grid
 g-x3-y4-z8 - grid
 g-x3-y4-z9 - grid
 g-x3-y4-z10 - grid
 g-x3-y4-z11 - grid
 g-x3-y4-z12 - grid
 g-x3-y4-z13 - grid
 g-x3-y4-z14 - grid
 g-x3-y4-z15 - grid
 g-x3-y5-z0 - grid
 g-x3-y5-z1 - grid
 g-x3-y5-z2 - grid
 g-x3-y5-z3 - grid
 g-x3-y5-z4 - grid
 g-x3-y5-z5 - grid
 g-x3-y5-z6 - grid
 g-x3-y5-z7 - grid
 g-x3-y5-z8 - grid
 g-x3-y5-z9 - grid
 g-x3-y5-z10 - grid
 g-x3-y5-z11 - grid
 g-x3-y5-z12 - grid
 g-x3-y5-z13 - grid
 g-x3-y5-z14 - grid
 g-x3-y5-z15 - grid
 g-x3-y6-z0 - grid
 g-x3-y6-z1 - grid
 g-x3-y6-z2 - grid
 g-x3-y6-z3 - grid
 g-x3-y6-z4 - grid
 g-x3-y6-z5 - grid
 g-x3-y6-z6 - grid
 g-x3-y6-z7 - grid
 g-x3-y6-z8 - grid
 g-x3-y6-z9 - grid
 g-x3-y6-z10 - grid
 g-x3-y6-z11 - grid
 g-x3-y6-z12 - grid
 g-x3-y6-z13 - grid
 g-x3-y6-z14 - grid
 g-x3-y6-z15 - grid
 g-x3-y7-z0 - grid
 g-x3-y7-z1 - grid
 g-x3-y7-z2 - grid
 g-x3-y7-z3 - grid
 g-x3-y7-z4 - grid
 g-x3-y7-z5 - grid
 g-x3-y7-z6 - grid
 g-x3-y7-z7 - grid
 g-x3-y7-z8 - grid
 g-x3-y7-z9 - grid
 g-x3-y7-z10 - grid
 g-x3-y7-z11 - grid
 g-x3-y7-z12 - grid
 g-x3-y7-z13 - grid
 g-x3-y7-z14 - grid
 g-x3-y7-z15 - grid
 g-x3-y8-z0 - grid
 g-x3-y8-z1 - grid
 g-x3-y8-z2 - grid
 g-x3-y8-z3 - grid
 g-x3-y8-z4 - grid
 g-x3-y8-z5 - grid
 g-x3-y8-z6 - grid
 g-x3-y8-z7 - grid
 g-x3-y8-z8 - grid
 g-x3-y8-z9 - grid
 g-x3-y8-z10 - grid
 g-x3-y8-z11 - grid
 g-x3-y8-z12 - grid
 g-x3-y8-z13 - grid
 g-x3-y8-z14 - grid
 g-x3-y8-z15 - grid
 g-x3-y9-z0 - grid
 g-x3-y9-z1 - grid
 g-x3-y9-z2 - grid
 g-x3-y9-z3 - grid
 g-x3-y9-z4 - grid
 g-x3-y9-z5 - grid
 g-x3-y9-z6 - grid
 g-x3-y9-z7 - grid
 g-x3-y9-z8 - grid
 g-x3-y9-z9 - grid
 g-x3-y9-z10 - grid
 g-x3-y9-z11 - grid
 g-x3-y9-z12 - grid
 g-x3-y9-z13 - grid
 g-x3-y9-z14 - grid
 g-x3-y9-z15 - grid
 g-x3-y10-z0 - grid
 g-x3-y10-z1 - grid
 g-x3-y10-z2 - grid
 g-x3-y10-z3 - grid
 g-x3-y10-z4 - grid
 g-x3-y10-z5 - grid
 g-x3-y10-z6 - grid
 g-x3-y10-z7 - grid
 g-x3-y10-z8 - grid
 g-x3-y10-z9 - grid
 g-x3-y10-z10 - grid
 g-x3-y10-z11 - grid
 g-x3-y10-z12 - grid
 g-x3-y10-z13 - grid
 g-x3-y10-z14 - grid
 g-x3-y10-z15 - grid
 g-x3-y11-z0 - grid
 g-x3-y11-z1 - grid
 g-x3-y11-z2 - grid
 g-x3-y11-z3 - grid
 g-x3-y11-z4 - grid
 g-x3-y11-z5 - grid
 g-x3-y11-z6 - grid
 g-x3-y11-z7 - grid
 g-x3-y11-z8 - grid
 g-x3-y11-z9 - grid
 g-x3-y11-z10 - grid
 g-x3-y11-z11 - grid
 g-x3-y11-z12 - grid
 g-x3-y11-z13 - grid
 g-x3-y11-z14 - grid
 g-x3-y11-z15 - grid
 g-x3-y12-z0 - grid
 g-x3-y12-z1 - grid
 g-x3-y12-z2 - grid
 g-x3-y12-z3 - grid
 g-x3-y12-z4 - grid
 g-x3-y12-z5 - grid
 g-x3-y12-z6 - grid
 g-x3-y12-z7 - grid
 g-x3-y12-z8 - grid
 g-x3-y12-z9 - grid
 g-x3-y12-z10 - grid
 g-x3-y12-z11 - grid
 g-x3-y12-z12 - grid
 g-x3-y12-z13 - grid
 g-x3-y12-z14 - grid
 g-x3-y12-z15 - grid
 g-x3-y13-z0 - grid
 g-x3-y13-z1 - grid
 g-x3-y13-z2 - grid
 g-x3-y13-z3 - grid
 g-x3-y13-z4 - grid
 g-x3-y13-z5 - grid
 g-x3-y13-z6 - grid
 g-x3-y13-z7 - grid
 g-x3-y13-z8 - grid
 g-x3-y13-z9 - grid
 g-x3-y13-z10 - grid
 g-x3-y13-z11 - grid
 g-x3-y13-z12 - grid
 g-x3-y13-z13 - grid
 g-x3-y13-z14 - grid
 g-x3-y13-z15 - grid
 g-x3-y14-z0 - grid
 g-x3-y14-z1 - grid
 g-x3-y14-z2 - grid
 g-x3-y14-z3 - grid
 g-x3-y14-z4 - grid
 g-x3-y14-z5 - grid
 g-x3-y14-z6 - grid
 g-x3-y14-z7 - grid
 g-x3-y14-z8 - grid
 g-x3-y14-z9 - grid
 g-x3-y14-z10 - grid
 g-x3-y14-z11 - grid
 g-x3-y14-z12 - grid
 g-x3-y14-z13 - grid
 g-x3-y14-z14 - grid
 g-x3-y14-z15 - grid
 g-x3-y15-z0 - grid
 g-x3-y15-z1 - grid
 g-x3-y15-z2 - grid
 g-x3-y15-z3 - grid
 g-x3-y15-z4 - grid
 g-x3-y15-z5 - grid
 g-x3-y15-z6 - grid
 g-x3-y15-z7 - grid
 g-x3-y15-z8 - grid
 g-x3-y15-z9 - grid
 g-x3-y15-z10 - grid
 g-x3-y15-z11 - grid
 g-x3-y15-z12 - grid
 g-x3-y15-z13 - grid
 g-x3-y15-z14 - grid
 g-x3-y15-z15 - grid
 g-x4-y0-z0 - grid
 g-x4-y0-z1 - grid
 g-x4-y0-z2 - grid
 g-x4-y0-z3 - grid
 g-x4-y0-z4 - grid
 g-x4-y0-z5 - grid
 g-x4-y0-z6 - grid
 g-x4-y0-z7 - grid
 g-x4-y0-z8 - grid
 g-x4-y0-z9 - grid
 g-x4-y0-z10 - grid
 g-x4-y0-z11 - grid
 g-x4-y0-z12 - grid
 g-x4-y0-z13 - grid
 g-x4-y0-z14 - grid
 g-x4-y0-z15 - grid
 g-x4-y1-z0 - grid
 g-x4-y1-z1 - grid
 g-x4-y1-z2 - grid
 g-x4-y1-z3 - grid
 g-x4-y1-z4 - grid
 g-x4-y1-z5 - grid
 g-x4-y1-z6 - grid
 g-x4-y1-z7 - grid
 g-x4-y1-z8 - grid
 g-x4-y1-z9 - grid
 g-x4-y1-z10 - grid
 g-x4-y1-z11 - grid
 g-x4-y1-z12 - grid
 g-x4-y1-z13 - grid
 g-x4-y1-z14 - grid
 g-x4-y1-z15 - grid
 g-x4-y2-z0 - grid
 g-x4-y2-z1 - grid
 g-x4-y2-z2 - grid
 g-x4-y2-z3 - grid
 g-x4-y2-z4 - grid
 g-x4-y2-z5 - grid
 g-x4-y2-z6 - grid
 g-x4-y2-z7 - grid
 g-x4-y2-z8 - grid
 g-x4-y2-z9 - grid
 g-x4-y2-z10 - grid
 g-x4-y2-z11 - grid
 g-x4-y2-z12 - grid
 g-x4-y2-z13 - grid
 g-x4-y2-z14 - grid
 g-x4-y2-z15 - grid
 g-x4-y3-z0 - grid
 g-x4-y3-z1 - grid
 g-x4-y3-z2 - grid
 g-x4-y3-z3 - grid
 g-x4-y3-z4 - grid
 g-x4-y3-z5 - grid
 g-x4-y3-z6 - grid
 g-x4-y3-z7 - grid
 g-x4-y3-z8 - grid
 g-x4-y3-z9 - grid
 g-x4-y3-z10 - grid
 g-x4-y3-z11 - grid
 g-x4-y3-z12 - grid
 g-x4-y3-z13 - grid
 g-x4-y3-z14 - grid
 g-x4-y3-z15 - grid
 g-x4-y4-z0 - grid
 g-x4-y4-z1 - grid
 g-x4-y4-z2 - grid
 g-x4-y4-z3 - grid
 g-x4-y4-z4 - grid
 g-x4-y4-z5 - grid
 g-x4-y4-z6 - grid
 g-x4-y4-z7 - grid
 g-x4-y4-z8 - grid
 g-x4-y4-z9 - grid
 g-x4-y4-z10 - grid
 g-x4-y4-z11 - grid
 g-x4-y4-z12 - grid
 g-x4-y4-z13 - grid
 g-x4-y4-z14 - grid
 g-x4-y4-z15 - grid
 g-x4-y5-z0 - grid
 g-x4-y5-z1 - grid
 g-x4-y5-z2 - grid
 g-x4-y5-z3 - grid
 g-x4-y5-z4 - grid
 g-x4-y5-z5 - grid
 g-x4-y5-z6 - grid
 g-x4-y5-z7 - grid
 g-x4-y5-z8 - grid
 g-x4-y5-z9 - grid
 g-x4-y5-z10 - grid
 g-x4-y5-z11 - grid
 g-x4-y5-z12 - grid
 g-x4-y5-z13 - grid
 g-x4-y5-z14 - grid
 g-x4-y5-z15 - grid
 g-x4-y6-z0 - grid
 g-x4-y6-z1 - grid
 g-x4-y6-z2 - grid
 g-x4-y6-z3 - grid
 g-x4-y6-z4 - grid
 g-x4-y6-z5 - grid
 g-x4-y6-z6 - grid
 g-x4-y6-z7 - grid
 g-x4-y6-z8 - grid
 g-x4-y6-z9 - grid
 g-x4-y6-z10 - grid
 g-x4-y6-z11 - grid
 g-x4-y6-z12 - grid
 g-x4-y6-z13 - grid
 g-x4-y6-z14 - grid
 g-x4-y6-z15 - grid
 g-x4-y7-z0 - grid
 g-x4-y7-z1 - grid
 g-x4-y7-z2 - grid
 g-x4-y7-z3 - grid
 g-x4-y7-z4 - grid
 g-x4-y7-z5 - grid
 g-x4-y7-z6 - grid
 g-x4-y7-z7 - grid
 g-x4-y7-z8 - grid
 g-x4-y7-z9 - grid
 g-x4-y7-z10 - grid
 g-x4-y7-z11 - grid
 g-x4-y7-z12 - grid
 g-x4-y7-z13 - grid
 g-x4-y7-z14 - grid
 g-x4-y7-z15 - grid
 g-x4-y8-z0 - grid
 g-x4-y8-z1 - grid
 g-x4-y8-z2 - grid
 g-x4-y8-z3 - grid
 g-x4-y8-z4 - grid
 g-x4-y8-z5 - grid
 g-x4-y8-z6 - grid
 g-x4-y8-z7 - grid
 g-x4-y8-z8 - grid
 g-x4-y8-z9 - grid
 g-x4-y8-z10 - grid
 g-x4-y8-z11 - grid
 g-x4-y8-z12 - grid
 g-x4-y8-z13 - grid
 g-x4-y8-z14 - grid
 g-x4-y8-z15 - grid
 g-x4-y9-z0 - grid
 g-x4-y9-z1 - grid
 g-x4-y9-z2 - grid
 g-x4-y9-z3 - grid
 g-x4-y9-z4 - grid
 g-x4-y9-z5 - grid
 g-x4-y9-z6 - grid
 g-x4-y9-z7 - grid
 g-x4-y9-z8 - grid
 g-x4-y9-z9 - grid
 g-x4-y9-z10 - grid
 g-x4-y9-z11 - grid
 g-x4-y9-z12 - grid
 g-x4-y9-z13 - grid
 g-x4-y9-z14 - grid
 g-x4-y9-z15 - grid
 g-x4-y10-z0 - grid
 g-x4-y10-z1 - grid
 g-x4-y10-z2 - grid
 g-x4-y10-z3 - grid
 g-x4-y10-z4 - grid
 g-x4-y10-z5 - grid
 g-x4-y10-z6 - grid
 g-x4-y10-z7 - grid
 g-x4-y10-z8 - grid
 g-x4-y10-z9 - grid
 g-x4-y10-z10 - grid
 g-x4-y10-z11 - grid
 g-x4-y10-z12 - grid
 g-x4-y10-z13 - grid
 g-x4-y10-z14 - grid
 g-x4-y10-z15 - grid
 g-x4-y11-z0 - grid
 g-x4-y11-z1 - grid
 g-x4-y11-z2 - grid
 g-x4-y11-z3 - grid
 g-x4-y11-z4 - grid
 g-x4-y11-z5 - grid
 g-x4-y11-z6 - grid
 g-x4-y11-z7 - grid
 g-x4-y11-z8 - grid
 g-x4-y11-z9 - grid
 g-x4-y11-z10 - grid
 g-x4-y11-z11 - grid
 g-x4-y11-z12 - grid
 g-x4-y11-z13 - grid
 g-x4-y11-z14 - grid
 g-x4-y11-z15 - grid
 g-x4-y12-z0 - grid
 g-x4-y12-z1 - grid
 g-x4-y12-z2 - grid
 g-x4-y12-z3 - grid
 g-x4-y12-z4 - grid
 g-x4-y12-z5 - grid
 g-x4-y12-z6 - grid
 g-x4-y12-z7 - grid
 g-x4-y12-z8 - grid
 g-x4-y12-z9 - grid
 g-x4-y12-z10 - grid
 g-x4-y12-z11 - grid
 g-x4-y12-z12 - grid
 g-x4-y12-z13 - grid
 g-x4-y12-z14 - grid
 g-x4-y12-z15 - grid
 g-x4-y13-z0 - grid
 g-x4-y13-z1 - grid
 g-x4-y13-z2 - grid
 g-x4-y13-z3 - grid
 g-x4-y13-z4 - grid
 g-x4-y13-z5 - grid
 g-x4-y13-z6 - grid
 g-x4-y13-z7 - grid
 g-x4-y13-z8 - grid
 g-x4-y13-z9 - grid
 g-x4-y13-z10 - grid
 g-x4-y13-z11 - grid
 g-x4-y13-z12 - grid
 g-x4-y13-z13 - grid
 g-x4-y13-z14 - grid
 g-x4-y13-z15 - grid
 g-x4-y14-z0 - grid
 g-x4-y14-z1 - grid
 g-x4-y14-z2 - grid
 g-x4-y14-z3 - grid
 g-x4-y14-z4 - grid
 g-x4-y14-z5 - grid
 g-x4-y14-z6 - grid
 g-x4-y14-z7 - grid
 g-x4-y14-z8 - grid
 g-x4-y14-z9 - grid
 g-x4-y14-z10 - grid
 g-x4-y14-z11 - grid
 g-x4-y14-z12 - grid
 g-x4-y14-z13 - grid
 g-x4-y14-z14 - grid
 g-x4-y14-z15 - grid
 g-x4-y15-z0 - grid
 g-x4-y15-z1 - grid
 g-x4-y15-z2 - grid
 g-x4-y15-z3 - grid
 g-x4-y15-z4 - grid
 g-x4-y15-z5 - grid
 g-x4-y15-z6 - grid
 g-x4-y15-z7 - grid
 g-x4-y15-z8 - grid
 g-x4-y15-z9 - grid
 g-x4-y15-z10 - grid
 g-x4-y15-z11 - grid
 g-x4-y15-z12 - grid
 g-x4-y15-z13 - grid
 g-x4-y15-z14 - grid
 g-x4-y15-z15 - grid
 g-x5-y0-z0 - grid
 g-x5-y0-z1 - grid
 g-x5-y0-z2 - grid
 g-x5-y0-z3 - grid
 g-x5-y0-z4 - grid
 g-x5-y0-z5 - grid
 g-x5-y0-z6 - grid
 g-x5-y0-z7 - grid
 g-x5-y0-z8 - grid
 g-x5-y0-z9 - grid
 g-x5-y0-z10 - grid
 g-x5-y0-z11 - grid
 g-x5-y0-z12 - grid
 g-x5-y0-z13 - grid
 g-x5-y0-z14 - grid
 g-x5-y0-z15 - grid
 g-x5-y1-z0 - grid
 g-x5-y1-z1 - grid
 g-x5-y1-z2 - grid
 g-x5-y1-z3 - grid
 g-x5-y1-z4 - grid
 g-x5-y1-z5 - grid
 g-x5-y1-z6 - grid
 g-x5-y1-z7 - grid
 g-x5-y1-z8 - grid
 g-x5-y1-z9 - grid
 g-x5-y1-z10 - grid
 g-x5-y1-z11 - grid
 g-x5-y1-z12 - grid
 g-x5-y1-z13 - grid
 g-x5-y1-z14 - grid
 g-x5-y1-z15 - grid
 g-x5-y2-z0 - grid
 g-x5-y2-z1 - grid
 g-x5-y2-z2 - grid
 g-x5-y2-z3 - grid
 g-x5-y2-z4 - grid
 g-x5-y2-z5 - grid
 g-x5-y2-z6 - grid
 g-x5-y2-z7 - grid
 g-x5-y2-z8 - grid
 g-x5-y2-z9 - grid
 g-x5-y2-z10 - grid
 g-x5-y2-z11 - grid
 g-x5-y2-z12 - grid
 g-x5-y2-z13 - grid
 g-x5-y2-z14 - grid
 g-x5-y2-z15 - grid
 g-x5-y3-z0 - grid
 g-x5-y3-z1 - grid
 g-x5-y3-z2 - grid
 g-x5-y3-z3 - grid
 g-x5-y3-z4 - grid
 g-x5-y3-z5 - grid
 g-x5-y3-z6 - grid
 g-x5-y3-z7 - grid
 g-x5-y3-z8 - grid
 g-x5-y3-z9 - grid
 g-x5-y3-z10 - grid
 g-x5-y3-z11 - grid
 g-x5-y3-z12 - grid
 g-x5-y3-z13 - grid
 g-x5-y3-z14 - grid
 g-x5-y3-z15 - grid
 g-x5-y4-z0 - grid
 g-x5-y4-z1 - grid
 g-x5-y4-z2 - grid
 g-x5-y4-z3 - grid
 g-x5-y4-z4 - grid
 g-x5-y4-z5 - grid
 g-x5-y4-z6 - grid
 g-x5-y4-z7 - grid
 g-x5-y4-z8 - grid
 g-x5-y4-z9 - grid
 g-x5-y4-z10 - grid
 g-x5-y4-z11 - grid
 g-x5-y4-z12 - grid
 g-x5-y4-z13 - grid
 g-x5-y4-z14 - grid
 g-x5-y4-z15 - grid
 g-x5-y5-z0 - grid
 g-x5-y5-z1 - grid
 g-x5-y5-z2 - grid
 g-x5-y5-z3 - grid
 g-x5-y5-z4 - grid
 g-x5-y5-z5 - grid
 g-x5-y5-z6 - grid
 g-x5-y5-z7 - grid
 g-x5-y5-z8 - grid
 g-x5-y5-z9 - grid
 g-x5-y5-z10 - grid
 g-x5-y5-z11 - grid
 g-x5-y5-z12 - grid
 g-x5-y5-z13 - grid
 g-x5-y5-z14 - grid
 g-x5-y5-z15 - grid
 g-x5-y6-z0 - grid
 g-x5-y6-z1 - grid
 g-x5-y6-z2 - grid
 g-x5-y6-z3 - grid
 g-x5-y6-z4 - grid
 g-x5-y6-z5 - grid
 g-x5-y6-z6 - grid
 g-x5-y6-z7 - grid
 g-x5-y6-z8 - grid
 g-x5-y6-z9 - grid
 g-x5-y6-z10 - grid
 g-x5-y6-z11 - grid
 g-x5-y6-z12 - grid
 g-x5-y6-z13 - grid
 g-x5-y6-z14 - grid
 g-x5-y6-z15 - grid
 g-x5-y7-z0 - grid
 g-x5-y7-z1 - grid
 g-x5-y7-z2 - grid
 g-x5-y7-z3 - grid
 g-x5-y7-z4 - grid
 g-x5-y7-z5 - grid
 g-x5-y7-z6 - grid
 g-x5-y7-z7 - grid
 g-x5-y7-z8 - grid
 g-x5-y7-z9 - grid
 g-x5-y7-z10 - grid
 g-x5-y7-z11 - grid
 g-x5-y7-z12 - grid
 g-x5-y7-z13 - grid
 g-x5-y7-z14 - grid
 g-x5-y7-z15 - grid
 g-x5-y8-z0 - grid
 g-x5-y8-z1 - grid
 g-x5-y8-z2 - grid
 g-x5-y8-z3 - grid
 g-x5-y8-z4 - grid
 g-x5-y8-z5 - grid
 g-x5-y8-z6 - grid
 g-x5-y8-z7 - grid
 g-x5-y8-z8 - grid
 g-x5-y8-z9 - grid
 g-x5-y8-z10 - grid
 g-x5-y8-z11 - grid
 g-x5-y8-z12 - grid
 g-x5-y8-z13 - grid
 g-x5-y8-z14 - grid
 g-x5-y8-z15 - grid
 g-x5-y9-z0 - grid
 g-x5-y9-z1 - grid
 g-x5-y9-z2 - grid
 g-x5-y9-z3 - grid
 g-x5-y9-z4 - grid
 g-x5-y9-z5 - grid
 g-x5-y9-z6 - grid
 g-x5-y9-z7 - grid
 g-x5-y9-z8 - grid
 g-x5-y9-z9 - grid
 g-x5-y9-z10 - grid
 g-x5-y9-z11 - grid
 g-x5-y9-z12 - grid
 g-x5-y9-z13 - grid
 g-x5-y9-z14 - grid
 g-x5-y9-z15 - grid
 g-x5-y10-z0 - grid
 g-x5-y10-z1 - grid
 g-x5-y10-z2 - grid
 g-x5-y10-z3 - grid
 g-x5-y10-z4 - grid
 g-x5-y10-z5 - grid
 g-x5-y10-z6 - grid
 g-x5-y10-z7 - grid
 g-x5-y10-z8 - grid
 g-x5-y10-z9 - grid
 g-x5-y10-z10 - grid
 g-x5-y10-z11 - grid
 g-x5-y10-z12 - grid
 g-x5-y10-z13 - grid
 g-x5-y10-z14 - grid
 g-x5-y10-z15 - grid
 g-x5-y11-z0 - grid
 g-x5-y11-z1 - grid
 g-x5-y11-z2 - grid
 g-x5-y11-z3 - grid
 g-x5-y11-z4 - grid
 g-x5-y11-z5 - grid
 g-x5-y11-z6 - grid
 g-x5-y11-z7 - grid
 g-x5-y11-z8 - grid
 g-x5-y11-z9 - grid
 g-x5-y11-z10 - grid
 g-x5-y11-z11 - grid
 g-x5-y11-z12 - grid
 g-x5-y11-z13 - grid
 g-x5-y11-z14 - grid
 g-x5-y11-z15 - grid
 g-x5-y12-z0 - grid
 g-x5-y12-z1 - grid
 g-x5-y12-z2 - grid
 g-x5-y12-z3 - grid
 g-x5-y12-z4 - grid
 g-x5-y12-z5 - grid
 g-x5-y12-z6 - grid
 g-x5-y12-z7 - grid
 g-x5-y12-z8 - grid
 g-x5-y12-z9 - grid
 g-x5-y12-z10 - grid
 g-x5-y12-z11 - grid
 g-x5-y12-z12 - grid
 g-x5-y12-z13 - grid
 g-x5-y12-z14 - grid
 g-x5-y12-z15 - grid
 g-x5-y13-z0 - grid
 g-x5-y13-z1 - grid
 g-x5-y13-z2 - grid
 g-x5-y13-z3 - grid
 g-x5-y13-z4 - grid
 g-x5-y13-z5 - grid
 g-x5-y13-z6 - grid
 g-x5-y13-z7 - grid
 g-x5-y13-z8 - grid
 g-x5-y13-z9 - grid
 g-x5-y13-z10 - grid
 g-x5-y13-z11 - grid
 g-x5-y13-z12 - grid
 g-x5-y13-z13 - grid
 g-x5-y13-z14 - grid
 g-x5-y13-z15 - grid
 g-x5-y14-z0 - grid
 g-x5-y14-z1 - grid
 g-x5-y14-z2 - grid
 g-x5-y14-z3 - grid
 g-x5-y14-z4 - grid
 g-x5-y14-z5 - grid
 g-x5-y14-z6 - grid
 g-x5-y14-z7 - grid
 g-x5-y14-z8 - grid
 g-x5-y14-z9 - grid
 g-x5-y14-z10 - grid
 g-x5-y14-z11 - grid
 g-x5-y14-z12 - grid
 g-x5-y14-z13 - grid
 g-x5-y14-z14 - grid
 g-x5-y14-z15 - grid
 g-x5-y15-z0 - grid
 g-x5-y15-z1 - grid
 g-x5-y15-z2 - grid
 g-x5-y15-z3 - grid
 g-x5-y15-z4 - grid
 g-x5-y15-z5 - grid
 g-x5-y15-z6 - grid
 g-x5-y15-z7 - grid
 g-x5-y15-z8 - grid
 g-x5-y15-z9 - grid
 g-x5-y15-z10 - grid
 g-x5-y15-z11 - grid
 g-x5-y15-z12 - grid
 g-x5-y15-z13 - grid
 g-x5-y15-z14 - grid
 g-x5-y15-z15 - grid
 g-x6-y0-z0 - grid
 g-x6-y0-z1 - grid
 g-x6-y0-z2 - grid
 g-x6-y0-z3 - grid
 g-x6-y0-z4 - grid
 g-x6-y0-z5 - grid
 g-x6-y0-z6 - grid
 g-x6-y0-z7 - grid
 g-x6-y0-z8 - grid
 g-x6-y0-z9 - grid
 g-x6-y0-z10 - grid
 g-x6-y0-z11 - grid
 g-x6-y0-z12 - grid
 g-x6-y0-z13 - grid
 g-x6-y0-z14 - grid
 g-x6-y0-z15 - grid
 g-x6-y1-z0 - grid
 g-x6-y1-z1 - grid
 g-x6-y1-z2 - grid
 g-x6-y1-z3 - grid
 g-x6-y1-z4 - grid
 g-x6-y1-z5 - grid
 g-x6-y1-z6 - grid
 g-x6-y1-z7 - grid
 g-x6-y1-z8 - grid
 g-x6-y1-z9 - grid
 g-x6-y1-z10 - grid
 g-x6-y1-z11 - grid
 g-x6-y1-z12 - grid
 g-x6-y1-z13 - grid
 g-x6-y1-z14 - grid
 g-x6-y1-z15 - grid
 g-x6-y2-z0 - grid
 g-x6-y2-z1 - grid
 g-x6-y2-z2 - grid
 g-x6-y2-z3 - grid
 g-x6-y2-z4 - grid
 g-x6-y2-z5 - grid
 g-x6-y2-z6 - grid
 g-x6-y2-z7 - grid
 g-x6-y2-z8 - grid
 g-x6-y2-z9 - grid
 g-x6-y2-z10 - grid
 g-x6-y2-z11 - grid
 g-x6-y2-z12 - grid
 g-x6-y2-z13 - grid
 g-x6-y2-z14 - grid
 g-x6-y2-z15 - grid
 g-x6-y3-z0 - grid
 g-x6-y3-z1 - grid
 g-x6-y3-z2 - grid
 g-x6-y3-z3 - grid
 g-x6-y3-z4 - grid
 g-x6-y3-z5 - grid
 g-x6-y3-z6 - grid
 g-x6-y3-z7 - grid
 g-x6-y3-z8 - grid
 g-x6-y3-z9 - grid
 g-x6-y3-z10 - grid
 g-x6-y3-z11 - grid
 g-x6-y3-z12 - grid
 g-x6-y3-z13 - grid
 g-x6-y3-z14 - grid
 g-x6-y3-z15 - grid
 g-x6-y4-z0 - grid
 g-x6-y4-z1 - grid
 g-x6-y4-z2 - grid
 g-x6-y4-z3 - grid
 g-x6-y4-z4 - grid
 g-x6-y4-z5 - grid
 g-x6-y4-z6 - grid
 g-x6-y4-z7 - grid
 g-x6-y4-z8 - grid
 g-x6-y4-z9 - grid
 g-x6-y4-z10 - grid
 g-x6-y4-z11 - grid
 g-x6-y4-z12 - grid
 g-x6-y4-z13 - grid
 g-x6-y4-z14 - grid
 g-x6-y4-z15 - grid
 g-x6-y5-z0 - grid
 g-x6-y5-z1 - grid
 g-x6-y5-z2 - grid
 g-x6-y5-z3 - grid
 g-x6-y5-z4 - grid
 g-x6-y5-z5 - grid
 g-x6-y5-z6 - grid
 g-x6-y5-z7 - grid
 g-x6-y5-z8 - grid
 g-x6-y5-z9 - grid
 g-x6-y5-z10 - grid
 g-x6-y5-z11 - grid
 g-x6-y5-z12 - grid
 g-x6-y5-z13 - grid
 g-x6-y5-z14 - grid
 g-x6-y5-z15 - grid
 g-x6-y6-z0 - grid
 g-x6-y6-z1 - grid
 g-x6-y6-z2 - grid
 g-x6-y6-z3 - grid
 g-x6-y6-z4 - grid
 g-x6-y6-z5 - grid
 g-x6-y6-z6 - grid
 g-x6-y6-z7 - grid
 g-x6-y6-z8 - grid
 g-x6-y6-z9 - grid
 g-x6-y6-z10 - grid
 g-x6-y6-z11 - grid
 g-x6-y6-z12 - grid
 g-x6-y6-z13 - grid
 g-x6-y6-z14 - grid
 g-x6-y6-z15 - grid
 g-x6-y7-z0 - grid
 g-x6-y7-z1 - grid
 g-x6-y7-z2 - grid
 g-x6-y7-z3 - grid
 g-x6-y7-z4 - grid
 g-x6-y7-z5 - grid
 g-x6-y7-z6 - grid
 g-x6-y7-z7 - grid
 g-x6-y7-z8 - grid
 g-x6-y7-z9 - grid
 g-x6-y7-z10 - grid
 g-x6-y7-z11 - grid
 g-x6-y7-z12 - grid
 g-x6-y7-z13 - grid
 g-x6-y7-z14 - grid
 g-x6-y7-z15 - grid
 g-x6-y8-z0 - grid
 g-x6-y8-z1 - grid
 g-x6-y8-z2 - grid
 g-x6-y8-z3 - grid
 g-x6-y8-z4 - grid
 g-x6-y8-z5 - grid
 g-x6-y8-z6 - grid
 g-x6-y8-z7 - grid
 g-x6-y8-z8 - grid
 g-x6-y8-z9 - grid
 g-x6-y8-z10 - grid
 g-x6-y8-z11 - grid
 g-x6-y8-z12 - grid
 g-x6-y8-z13 - grid
 g-x6-y8-z14 - grid
 g-x6-y8-z15 - grid
 g-x6-y9-z0 - grid
 g-x6-y9-z1 - grid
 g-x6-y9-z2 - grid
 g-x6-y9-z3 - grid
 g-x6-y9-z4 - grid
 g-x6-y9-z5 - grid
 g-x6-y9-z6 - grid
 g-x6-y9-z7 - grid
 g-x6-y9-z8 - grid
 g-x6-y9-z9 - grid
 g-x6-y9-z10 - grid
 g-x6-y9-z11 - grid
 g-x6-y9-z12 - grid
 g-x6-y9-z13 - grid
 g-x6-y9-z14 - grid
 g-x6-y9-z15 - grid
 g-x6-y10-z0 - grid
 g-x6-y10-z1 - grid
 g-x6-y10-z2 - grid
 g-x6-y10-z3 - grid
 g-x6-y10-z4 - grid
 g-x6-y10-z5 - grid
 g-x6-y10-z6 - grid
 g-x6-y10-z7 - grid
 g-x6-y10-z8 - grid
 g-x6-y10-z9 - grid
 g-x6-y10-z10 - grid
 g-x6-y10-z11 - grid
 g-x6-y10-z12 - grid
 g-x6-y10-z13 - grid
 g-x6-y10-z14 - grid
 g-x6-y10-z15 - grid
 g-x6-y11-z0 - grid
 g-x6-y11-z1 - grid
 g-x6-y11-z2 - grid
 g-x6-y11-z3 - grid
 g-x6-y11-z4 - grid
 g-x6-y11-z5 - grid
 g-x6-y11-z6 - grid
 g-x6-y11-z7 - grid
 g-x6-y11-z8 - grid
 g-x6-y11-z9 - grid
 g-x6-y11-z10 - grid
 g-x6-y11-z11 - grid
 g-x6-y11-z12 - grid
 g-x6-y11-z13 - grid
 g-x6-y11-z14 - grid
 g-x6-y11-z15 - grid
 g-x6-y12-z0 - grid
 g-x6-y12-z1 - grid
 g-x6-y12-z2 - grid
 g-x6-y12-z3 - grid
 g-x6-y12-z4 - grid
 g-x6-y12-z5 - grid
 g-x6-y12-z6 - grid
 g-x6-y12-z7 - grid
 g-x6-y12-z8 - grid
 g-x6-y12-z9 - grid
 g-x6-y12-z10 - grid
 g-x6-y12-z11 - grid
 g-x6-y12-z12 - grid
 g-x6-y12-z13 - grid
 g-x6-y12-z14 - grid
 g-x6-y12-z15 - grid
 g-x6-y13-z0 - grid
 g-x6-y13-z1 - grid
 g-x6-y13-z2 - grid
 g-x6-y13-z3 - grid
 g-x6-y13-z4 - grid
 g-x6-y13-z5 - grid
 g-x6-y13-z6 - grid
 g-x6-y13-z7 - grid
 g-x6-y13-z8 - grid
 g-x6-y13-z9 - grid
 g-x6-y13-z10 - grid
 g-x6-y13-z11 - grid
 g-x6-y13-z12 - grid
 g-x6-y13-z13 - grid
 g-x6-y13-z14 - grid
 g-x6-y13-z15 - grid
 g-x6-y14-z0 - grid
 g-x6-y14-z1 - grid
 g-x6-y14-z2 - grid
 g-x6-y14-z3 - grid
 g-x6-y14-z4 - grid
 g-x6-y14-z5 - grid
 g-x6-y14-z6 - grid
 g-x6-y14-z7 - grid
 g-x6-y14-z8 - grid
 g-x6-y14-z9 - grid
 g-x6-y14-z10 - grid
 g-x6-y14-z11 - grid
 g-x6-y14-z12 - grid
 g-x6-y14-z13 - grid
 g-x6-y14-z14 - grid
 g-x6-y14-z15 - grid
 g-x6-y15-z0 - grid
 g-x6-y15-z1 - grid
 g-x6-y15-z2 - grid
 g-x6-y15-z3 - grid
 g-x6-y15-z4 - grid
 g-x6-y15-z5 - grid
 g-x6-y15-z6 - grid
 g-x6-y15-z7 - grid
 g-x6-y15-z8 - grid
 g-x6-y15-z9 - grid
 g-x6-y15-z10 - grid
 g-x6-y15-z11 - grid
 g-x6-y15-z12 - grid
 g-x6-y15-z13 - grid
 g-x6-y15-z14 - grid
 g-x6-y15-z15 - grid
 g-x7-y0-z0 - grid
 g-x7-y0-z1 - grid
 g-x7-y0-z2 - grid
 g-x7-y0-z3 - grid
 g-x7-y0-z4 - grid
 g-x7-y0-z5 - grid
 g-x7-y0-z6 - grid
 g-x7-y0-z7 - grid
 g-x7-y0-z8 - grid
 g-x7-y0-z9 - grid
 g-x7-y0-z10 - grid
 g-x7-y0-z11 - grid
 g-x7-y0-z12 - grid
 g-x7-y0-z13 - grid
 g-x7-y0-z14 - grid
 g-x7-y0-z15 - grid
 g-x7-y1-z0 - grid
 g-x7-y1-z1 - grid
 g-x7-y1-z2 - grid
 g-x7-y1-z3 - grid
 g-x7-y1-z4 - grid
 g-x7-y1-z5 - grid
 g-x7-y1-z6 - grid
 g-x7-y1-z7 - grid
 g-x7-y1-z8 - grid
 g-x7-y1-z9 - grid
 g-x7-y1-z10 - grid
 g-x7-y1-z11 - grid
 g-x7-y1-z12 - grid
 g-x7-y1-z13 - grid
 g-x7-y1-z14 - grid
 g-x7-y1-z15 - grid
 g-x7-y2-z0 - grid
 g-x7-y2-z1 - grid
 g-x7-y2-z2 - grid
 g-x7-y2-z3 - grid
 g-x7-y2-z4 - grid
 g-x7-y2-z5 - grid
 g-x7-y2-z6 - grid
 g-x7-y2-z7 - grid
 g-x7-y2-z8 - grid
 g-x7-y2-z9 - grid
 g-x7-y2-z10 - grid
 g-x7-y2-z11 - grid
 g-x7-y2-z12 - grid
 g-x7-y2-z13 - grid
 g-x7-y2-z14 - grid
 g-x7-y2-z15 - grid
 g-x7-y3-z0 - grid
 g-x7-y3-z1 - grid
 g-x7-y3-z2 - grid
 g-x7-y3-z3 - grid
 g-x7-y3-z4 - grid
 g-x7-y3-z5 - grid
 g-x7-y3-z6 - grid
 g-x7-y3-z7 - grid
 g-x7-y3-z8 - grid
 g-x7-y3-z9 - grid
 g-x7-y3-z10 - grid
 g-x7-y3-z11 - grid
 g-x7-y3-z12 - grid
 g-x7-y3-z13 - grid
 g-x7-y3-z14 - grid
 g-x7-y3-z15 - grid
 g-x7-y4-z0 - grid
 g-x7-y4-z1 - grid
 g-x7-y4-z2 - grid
 g-x7-y4-z3 - grid
 g-x7-y4-z4 - grid
 g-x7-y4-z5 - grid
 g-x7-y4-z6 - grid
 g-x7-y4-z7 - grid
 g-x7-y4-z8 - grid
 g-x7-y4-z9 - grid
 g-x7-y4-z10 - grid
 g-x7-y4-z11 - grid
 g-x7-y4-z12 - grid
 g-x7-y4-z13 - grid
 g-x7-y4-z14 - grid
 g-x7-y4-z15 - grid
 g-x7-y5-z0 - grid
 g-x7-y5-z1 - grid
 g-x7-y5-z2 - grid
 g-x7-y5-z3 - grid
 g-x7-y5-z4 - grid
 g-x7-y5-z5 - grid
 g-x7-y5-z6 - grid
 g-x7-y5-z7 - grid
 g-x7-y5-z8 - grid
 g-x7-y5-z9 - grid
 g-x7-y5-z10 - grid
 g-x7-y5-z11 - grid
 g-x7-y5-z12 - grid
 g-x7-y5-z13 - grid
 g-x7-y5-z14 - grid
 g-x7-y5-z15 - grid
 g-x7-y6-z0 - grid
 g-x7-y6-z1 - grid
 g-x7-y6-z2 - grid
 g-x7-y6-z3 - grid
 g-x7-y6-z4 - grid
 g-x7-y6-z5 - grid
 g-x7-y6-z6 - grid
 g-x7-y6-z7 - grid
 g-x7-y6-z8 - grid
 g-x7-y6-z9 - grid
 g-x7-y6-z10 - grid
 g-x7-y6-z11 - grid
 g-x7-y6-z12 - grid
 g-x7-y6-z13 - grid
 g-x7-y6-z14 - grid
 g-x7-y6-z15 - grid
 g-x7-y7-z0 - grid
 g-x7-y7-z1 - grid
 g-x7-y7-z2 - grid
 g-x7-y7-z3 - grid
 g-x7-y7-z4 - grid
 g-x7-y7-z5 - grid
 g-x7-y7-z6 - grid
 g-x7-y7-z7 - grid
 g-x7-y7-z8 - grid
 g-x7-y7-z9 - grid
 g-x7-y7-z10 - grid
 g-x7-y7-z11 - grid
 g-x7-y7-z12 - grid
 g-x7-y7-z13 - grid
 g-x7-y7-z14 - grid
 g-x7-y7-z15 - grid
 g-x7-y8-z0 - grid
 g-x7-y8-z1 - grid
 g-x7-y8-z2 - grid
 g-x7-y8-z3 - grid
 g-x7-y8-z4 - grid
 g-x7-y8-z5 - grid
 g-x7-y8-z6 - grid
 g-x7-y8-z7 - grid
 g-x7-y8-z8 - grid
 g-x7-y8-z9 - grid
 g-x7-y8-z10 - grid
 g-x7-y8-z11 - grid
 g-x7-y8-z12 - grid
 g-x7-y8-z13 - grid
 g-x7-y8-z14 - grid
 g-x7-y8-z15 - grid
 g-x7-y9-z0 - grid
 g-x7-y9-z1 - grid
 g-x7-y9-z2 - grid
 g-x7-y9-z3 - grid
 g-x7-y9-z4 - grid
 g-x7-y9-z5 - grid
 g-x7-y9-z6 - grid
 g-x7-y9-z7 - grid
 g-x7-y9-z8 - grid
 g-x7-y9-z9 - grid
 g-x7-y9-z10 - grid
 g-x7-y9-z11 - grid
 g-x7-y9-z12 - grid
 g-x7-y9-z13 - grid
 g-x7-y9-z14 - grid
 g-x7-y9-z15 - grid
 g-x7-y10-z0 - grid
 g-x7-y10-z1 - grid
 g-x7-y10-z2 - grid
 g-x7-y10-z3 - grid
 g-x7-y10-z4 - grid
 g-x7-y10-z5 - grid
 g-x7-y10-z6 - grid
 g-x7-y10-z7 - grid
 g-x7-y10-z8 - grid
 g-x7-y10-z9 - grid
 g-x7-y10-z10 - grid
 g-x7-y10-z11 - grid
 g-x7-y10-z12 - grid
 g-x7-y10-z13 - grid
 g-x7-y10-z14 - grid
 g-x7-y10-z15 - grid
 g-x7-y11-z0 - grid
 g-x7-y11-z1 - grid
 g-x7-y11-z2 - grid
 g-x7-y11-z3 - grid
 g-x7-y11-z4 - grid
 g-x7-y11-z5 - grid
 g-x7-y11-z6 - grid
 g-x7-y11-z7 - grid
 g-x7-y11-z8 - grid
 g-x7-y11-z9 - grid
 g-x7-y11-z10 - grid
 g-x7-y11-z11 - grid
 g-x7-y11-z12 - grid
 g-x7-y11-z13 - grid
 g-x7-y11-z14 - grid
 g-x7-y11-z15 - grid
 g-x7-y12-z0 - grid
 g-x7-y12-z1 - grid
 g-x7-y12-z2 - grid
 g-x7-y12-z3 - grid
 g-x7-y12-z4 - grid
 g-x7-y12-z5 - grid
 g-x7-y12-z6 - grid
 g-x7-y12-z7 - grid
 g-x7-y12-z8 - grid
 g-x7-y12-z9 - grid
 g-x7-y12-z10 - grid
 g-x7-y12-z11 - grid
 g-x7-y12-z12 - grid
 g-x7-y12-z13 - grid
 g-x7-y12-z14 - grid
 g-x7-y12-z15 - grid
 g-x7-y13-z0 - grid
 g-x7-y13-z1 - grid
 g-x7-y13-z2 - grid
 g-x7-y13-z3 - grid
 g-x7-y13-z4 - grid
 g-x7-y13-z5 - grid
 g-x7-y13-z6 - grid
 g-x7-y13-z7 - grid
 g-x7-y13-z8 - grid
 g-x7-y13-z9 - grid
 g-x7-y13-z10 - grid
 g-x7-y13-z11 - grid
 g-x7-y13-z12 - grid
 g-x7-y13-z13 - grid
 g-x7-y13-z14 - grid
 g-x7-y13-z15 - grid
 g-x7-y14-z0 - grid
 g-x7-y14-z1 - grid
 g-x7-y14-z2 - grid
 g-x7-y14-z3 - grid
 g-x7-y14-z4 - grid
 g-x7-y14-z5 - grid
 g-x7-y14-z6 - grid
 g-x7-y14-z7 - grid
 g-x7-y14-z8 - grid
 g-x7-y14-z9 - grid
 g-x7-y14-z10 - grid
 g-x7-y14-z11 - grid
 g-x7-y14-z12 - grid
 g-x7-y14-z13 - grid
 g-x7-y14-z14 - grid
 g-x7-y14-z15 - grid
 g-x7-y15-z0 - grid
 g-x7-y15-z1 - grid
 g-x7-y15-z2 - grid
 g-x7-y15-z3 - grid
 g-x7-y15-z4 - grid
 g-x7-y15-z5 - grid
 g-x7-y15-z6 - grid
 g-x7-y15-z7 - grid
 g-x7-y15-z8 - grid
 g-x7-y15-z9 - grid
 g-x7-y15-z10 - grid
 g-x7-y15-z11 - grid
 g-x7-y15-z12 - grid
 g-x7-y15-z13 - grid
 g-x7-y15-z14 - grid
 g-x7-y15-z15 - grid
 g-x8-y0-z0 - grid
 g-x8-y0-z1 - grid
 g-x8-y0-z2 - grid
 g-x8-y0-z3 - grid
 g-x8-y0-z4 - grid
 g-x8-y0-z5 - grid
 g-x8-y0-z6 - grid
 g-x8-y0-z7 - grid
 g-x8-y0-z8 - grid
 g-x8-y0-z9 - grid
 g-x8-y0-z10 - grid
 g-x8-y0-z11 - grid
 g-x8-y0-z12 - grid
 g-x8-y0-z13 - grid
 g-x8-y0-z14 - grid
 g-x8-y0-z15 - grid
 g-x8-y1-z0 - grid
 g-x8-y1-z1 - grid
 g-x8-y1-z2 - grid
 g-x8-y1-z3 - grid
 g-x8-y1-z4 - grid
 g-x8-y1-z5 - grid
 g-x8-y1-z6 - grid
 g-x8-y1-z7 - grid
 g-x8-y1-z8 - grid
 g-x8-y1-z9 - grid
 g-x8-y1-z10 - grid
 g-x8-y1-z11 - grid
 g-x8-y1-z12 - grid
 g-x8-y1-z13 - grid
 g-x8-y1-z14 - grid
 g-x8-y1-z15 - grid
 g-x8-y2-z0 - grid
 g-x8-y2-z1 - grid
 g-x8-y2-z2 - grid
 g-x8-y2-z3 - grid
 g-x8-y2-z4 - grid
 g-x8-y2-z5 - grid
 g-x8-y2-z6 - grid
 g-x8-y2-z7 - grid
 g-x8-y2-z8 - grid
 g-x8-y2-z9 - grid
 g-x8-y2-z10 - grid
 g-x8-y2-z11 - grid
 g-x8-y2-z12 - grid
 g-x8-y2-z13 - grid
 g-x8-y2-z14 - grid
 g-x8-y2-z15 - grid
 g-x8-y3-z0 - grid
 g-x8-y3-z1 - grid
 g-x8-y3-z2 - grid
 g-x8-y3-z3 - grid
 g-x8-y3-z4 - grid
 g-x8-y3-z5 - grid
 g-x8-y3-z6 - grid
 g-x8-y3-z7 - grid
 g-x8-y3-z8 - grid
 g-x8-y3-z9 - grid
 g-x8-y3-z10 - grid
 g-x8-y3-z11 - grid
 g-x8-y3-z12 - grid
 g-x8-y3-z13 - grid
 g-x8-y3-z14 - grid
 g-x8-y3-z15 - grid
 g-x8-y4-z0 - grid
 g-x8-y4-z1 - grid
 g-x8-y4-z2 - grid
 g-x8-y4-z3 - grid
 g-x8-y4-z4 - grid
 g-x8-y4-z5 - grid
 g-x8-y4-z6 - grid
 g-x8-y4-z7 - grid
 g-x8-y4-z8 - grid
 g-x8-y4-z9 - grid
 g-x8-y4-z10 - grid
 g-x8-y4-z11 - grid
 g-x8-y4-z12 - grid
 g-x8-y4-z13 - grid
 g-x8-y4-z14 - grid
 g-x8-y4-z15 - grid
 g-x8-y5-z0 - grid
 g-x8-y5-z1 - grid
 g-x8-y5-z2 - grid
 g-x8-y5-z3 - grid
 g-x8-y5-z4 - grid
 g-x8-y5-z5 - grid
 g-x8-y5-z6 - grid
 g-x8-y5-z7 - grid
 g-x8-y5-z8 - grid
 g-x8-y5-z9 - grid
 g-x8-y5-z10 - grid
 g-x8-y5-z11 - grid
 g-x8-y5-z12 - grid
 g-x8-y5-z13 - grid
 g-x8-y5-z14 - grid
 g-x8-y5-z15 - grid
 g-x8-y6-z0 - grid
 g-x8-y6-z1 - grid
 g-x8-y6-z2 - grid
 g-x8-y6-z3 - grid
 g-x8-y6-z4 - grid
 g-x8-y6-z5 - grid
 g-x8-y6-z6 - grid
 g-x8-y6-z7 - grid
 g-x8-y6-z8 - grid
 g-x8-y6-z9 - grid
 g-x8-y6-z10 - grid
 g-x8-y6-z11 - grid
 g-x8-y6-z12 - grid
 g-x8-y6-z13 - grid
 g-x8-y6-z14 - grid
 g-x8-y6-z15 - grid
 g-x8-y7-z0 - grid
 g-x8-y7-z1 - grid
 g-x8-y7-z2 - grid
 g-x8-y7-z3 - grid
 g-x8-y7-z4 - grid
 g-x8-y7-z5 - grid
 g-x8-y7-z6 - grid
 g-x8-y7-z7 - grid
 g-x8-y7-z8 - grid
 g-x8-y7-z9 - grid
 g-x8-y7-z10 - grid
 g-x8-y7-z11 - grid
 g-x8-y7-z12 - grid
 g-x8-y7-z13 - grid
 g-x8-y7-z14 - grid
 g-x8-y7-z15 - grid
 g-x8-y8-z0 - grid
 g-x8-y8-z1 - grid
 g-x8-y8-z2 - grid
 g-x8-y8-z3 - grid
 g-x8-y8-z4 - grid
 g-x8-y8-z5 - grid
 g-x8-y8-z6 - grid
 g-x8-y8-z7 - grid
 g-x8-y8-z8 - grid
 g-x8-y8-z9 - grid
 g-x8-y8-z10 - grid
 g-x8-y8-z11 - grid
 g-x8-y8-z12 - grid
 g-x8-y8-z13 - grid
 g-x8-y8-z14 - grid
 g-x8-y8-z15 - grid
 g-x8-y9-z0 - grid
 g-x8-y9-z1 - grid
 g-x8-y9-z2 - grid
 g-x8-y9-z3 - grid
 g-x8-y9-z4 - grid
 g-x8-y9-z5 - grid
 g-x8-y9-z6 - grid
 g-x8-y9-z7 - grid
 g-x8-y9-z8 - grid
 g-x8-y9-z9 - grid
 g-x8-y9-z10 - grid
 g-x8-y9-z11 - grid
 g-x8-y9-z12 - grid
 g-x8-y9-z13 - grid
 g-x8-y9-z14 - grid
 g-x8-y9-z15 - grid
 g-x8-y10-z0 - grid
 g-x8-y10-z1 - grid
 g-x8-y10-z2 - grid
 g-x8-y10-z3 - grid
 g-x8-y10-z4 - grid
 g-x8-y10-z5 - grid
 g-x8-y10-z6 - grid
 g-x8-y10-z7 - grid
 g-x8-y10-z8 - grid
 g-x8-y10-z9 - grid
 g-x8-y10-z10 - grid
 g-x8-y10-z11 - grid
 g-x8-y10-z12 - grid
 g-x8-y10-z13 - grid
 g-x8-y10-z14 - grid
 g-x8-y10-z15 - grid
 g-x8-y11-z0 - grid
 g-x8-y11-z1 - grid
 g-x8-y11-z2 - grid
 g-x8-y11-z3 - grid
 g-x8-y11-z4 - grid
 g-x8-y11-z5 - grid
 g-x8-y11-z6 - grid
 g-x8-y11-z7 - grid
 g-x8-y11-z8 - grid
 g-x8-y11-z9 - grid
 g-x8-y11-z10 - grid
 g-x8-y11-z11 - grid
 g-x8-y11-z12 - grid
 g-x8-y11-z13 - grid
 g-x8-y11-z14 - grid
 g-x8-y11-z15 - grid
 g-x8-y12-z0 - grid
 g-x8-y12-z1 - grid
 g-x8-y12-z2 - grid
 g-x8-y12-z3 - grid
 g-x8-y12-z4 - grid
 g-x8-y12-z5 - grid
 g-x8-y12-z6 - grid
 g-x8-y12-z7 - grid
 g-x8-y12-z8 - grid
 g-x8-y12-z9 - grid
 g-x8-y12-z10 - grid
 g-x8-y12-z11 - grid
 g-x8-y12-z12 - grid
 g-x8-y12-z13 - grid
 g-x8-y12-z14 - grid
 g-x8-y12-z15 - grid
 g-x8-y13-z0 - grid
 g-x8-y13-z1 - grid
 g-x8-y13-z2 - grid
 g-x8-y13-z3 - grid
 g-x8-y13-z4 - grid
 g-x8-y13-z5 - grid
 g-x8-y13-z6 - grid
 g-x8-y13-z7 - grid
 g-x8-y13-z8 - grid
 g-x8-y13-z9 - grid
 g-x8-y13-z10 - grid
 g-x8-y13-z11 - grid
 g-x8-y13-z12 - grid
 g-x8-y13-z13 - grid
 g-x8-y13-z14 - grid
 g-x8-y13-z15 - grid
 g-x8-y14-z0 - grid
 g-x8-y14-z1 - grid
 g-x8-y14-z2 - grid
 g-x8-y14-z3 - grid
 g-x8-y14-z4 - grid
 g-x8-y14-z5 - grid
 g-x8-y14-z6 - grid
 g-x8-y14-z7 - grid
 g-x8-y14-z8 - grid
 g-x8-y14-z9 - grid
 g-x8-y14-z10 - grid
 g-x8-y14-z11 - grid
 g-x8-y14-z12 - grid
 g-x8-y14-z13 - grid
 g-x8-y14-z14 - grid
 g-x8-y14-z15 - grid
 g-x8-y15-z0 - grid
 g-x8-y15-z1 - grid
 g-x8-y15-z2 - grid
 g-x8-y15-z3 - grid
 g-x8-y15-z4 - grid
 g-x8-y15-z5 - grid
 g-x8-y15-z6 - grid
 g-x8-y15-z7 - grid
 g-x8-y15-z8 - grid
 g-x8-y15-z9 - grid
 g-x8-y15-z10 - grid
 g-x8-y15-z11 - grid
 g-x8-y15-z12 - grid
 g-x8-y15-z13 - grid
 g-x8-y15-z14 - grid
 g-x8-y15-z15 - grid
 g-x9-y0-z0 - grid
 g-x9-y0-z1 - grid
 g-x9-y0-z2 - grid
 g-x9-y0-z3 - grid
 g-x9-y0-z4 - grid
 g-x9-y0-z5 - grid
 g-x9-y0-z6 - grid
 g-x9-y0-z7 - grid
 g-x9-y0-z8 - grid
 g-x9-y0-z9 - grid
 g-x9-y0-z10 - grid
 g-x9-y0-z11 - grid
 g-x9-y0-z12 - grid
 g-x9-y0-z13 - grid
 g-x9-y0-z14 - grid
 g-x9-y0-z15 - grid
 g-x9-y1-z0 - grid
 g-x9-y1-z1 - grid
 g-x9-y1-z2 - grid
 g-x9-y1-z3 - grid
 g-x9-y1-z4 - grid
 g-x9-y1-z5 - grid
 g-x9-y1-z6 - grid
 g-x9-y1-z7 - grid
 g-x9-y1-z8 - grid
 g-x9-y1-z9 - grid
 g-x9-y1-z10 - grid
 g-x9-y1-z11 - grid
 g-x9-y1-z12 - grid
 g-x9-y1-z13 - grid
 g-x9-y1-z14 - grid
 g-x9-y1-z15 - grid
 g-x9-y2-z0 - grid
 g-x9-y2-z1 - grid
 g-x9-y2-z2 - grid
 g-x9-y2-z3 - grid
 g-x9-y2-z4 - grid
 g-x9-y2-z5 - grid
 g-x9-y2-z6 - grid
 g-x9-y2-z7 - grid
 g-x9-y2-z8 - grid
 g-x9-y2-z9 - grid
 g-x9-y2-z10 - grid
 g-x9-y2-z11 - grid
 g-x9-y2-z12 - grid
 g-x9-y2-z13 - grid
 g-x9-y2-z14 - grid
 g-x9-y2-z15 - grid
 g-x9-y3-z0 - grid
 g-x9-y3-z1 - grid
 g-x9-y3-z2 - grid
 g-x9-y3-z3 - grid
 g-x9-y3-z4 - grid
 g-x9-y3-z5 - grid
 g-x9-y3-z6 - grid
 g-x9-y3-z7 - grid
 g-x9-y3-z8 - grid
 g-x9-y3-z9 - grid
 g-x9-y3-z10 - grid
 g-x9-y3-z11 - grid
 g-x9-y3-z12 - grid
 g-x9-y3-z13 - grid
 g-x9-y3-z14 - grid
 g-x9-y3-z15 - grid
 g-x9-y4-z0 - grid
 g-x9-y4-z1 - grid
 g-x9-y4-z2 - grid
 g-x9-y4-z3 - grid
 g-x9-y4-z4 - grid
 g-x9-y4-z5 - grid
 g-x9-y4-z6 - grid
 g-x9-y4-z7 - grid
 g-x9-y4-z8 - grid
 g-x9-y4-z9 - grid
 g-x9-y4-z10 - grid
 g-x9-y4-z11 - grid
 g-x9-y4-z12 - grid
 g-x9-y4-z13 - grid
 g-x9-y4-z14 - grid
 g-x9-y4-z15 - grid
 g-x9-y5-z0 - grid
 g-x9-y5-z1 - grid
 g-x9-y5-z2 - grid
 g-x9-y5-z3 - grid
 g-x9-y5-z4 - grid
 g-x9-y5-z5 - grid
 g-x9-y5-z6 - grid
 g-x9-y5-z7 - grid
 g-x9-y5-z8 - grid
 g-x9-y5-z9 - grid
 g-x9-y5-z10 - grid
 g-x9-y5-z11 - grid
 g-x9-y5-z12 - grid
 g-x9-y5-z13 - grid
 g-x9-y5-z14 - grid
 g-x9-y5-z15 - grid
 g-x9-y6-z0 - grid
 g-x9-y6-z1 - grid
 g-x9-y6-z2 - grid
 g-x9-y6-z3 - grid
 g-x9-y6-z4 - grid
 g-x9-y6-z5 - grid
 g-x9-y6-z6 - grid
 g-x9-y6-z7 - grid
 g-x9-y6-z8 - grid
 g-x9-y6-z9 - grid
 g-x9-y6-z10 - grid
 g-x9-y6-z11 - grid
 g-x9-y6-z12 - grid
 g-x9-y6-z13 - grid
 g-x9-y6-z14 - grid
 g-x9-y6-z15 - grid
 g-x9-y7-z0 - grid
 g-x9-y7-z1 - grid
 g-x9-y7-z2 - grid
 g-x9-y7-z3 - grid
 g-x9-y7-z4 - grid
 g-x9-y7-z5 - grid
 g-x9-y7-z6 - grid
 g-x9-y7-z7 - grid
 g-x9-y7-z8 - grid
 g-x9-y7-z9 - grid
 g-x9-y7-z10 - grid
 g-x9-y7-z11 - grid
 g-x9-y7-z12 - grid
 g-x9-y7-z13 - grid
 g-x9-y7-z14 - grid
 g-x9-y7-z15 - grid
 g-x9-y8-z0 - grid
 g-x9-y8-z1 - grid
 g-x9-y8-z2 - grid
 g-x9-y8-z3 - grid
 g-x9-y8-z4 - grid
 g-x9-y8-z5 - grid
 g-x9-y8-z6 - grid
 g-x9-y8-z7 - grid
 g-x9-y8-z8 - grid
 g-x9-y8-z9 - grid
 g-x9-y8-z10 - grid
 g-x9-y8-z11 - grid
 g-x9-y8-z12 - grid
 g-x9-y8-z13 - grid
 g-x9-y8-z14 - grid
 g-x9-y8-z15 - grid
 g-x9-y9-z0 - grid
 g-x9-y9-z1 - grid
 g-x9-y9-z2 - grid
 g-x9-y9-z3 - grid
 g-x9-y9-z4 - grid
 g-x9-y9-z5 - grid
 g-x9-y9-z6 - grid
 g-x9-y9-z7 - grid
 g-x9-y9-z8 - grid
 g-x9-y9-z9 - grid
 g-x9-y9-z10 - grid
 g-x9-y9-z11 - grid
 g-x9-y9-z12 - grid
 g-x9-y9-z13 - grid
 g-x9-y9-z14 - grid
 g-x9-y9-z15 - grid
 g-x9-y10-z0 - grid
 g-x9-y10-z1 - grid
 g-x9-y10-z2 - grid
 g-x9-y10-z3 - grid
 g-x9-y10-z4 - grid
 g-x9-y10-z5 - grid
 g-x9-y10-z6 - grid
 g-x9-y10-z7 - grid
 g-x9-y10-z8 - grid
 g-x9-y10-z9 - grid
 g-x9-y10-z10 - grid
 g-x9-y10-z11 - grid
 g-x9-y10-z12 - grid
 g-x9-y10-z13 - grid
 g-x9-y10-z14 - grid
 g-x9-y10-z15 - grid
 g-x9-y11-z0 - grid
 g-x9-y11-z1 - grid
 g-x9-y11-z2 - grid
 g-x9-y11-z3 - grid
 g-x9-y11-z4 - grid
 g-x9-y11-z5 - grid
 g-x9-y11-z6 - grid
 g-x9-y11-z7 - grid
 g-x9-y11-z8 - grid
 g-x9-y11-z9 - grid
 g-x9-y11-z10 - grid
 g-x9-y11-z11 - grid
 g-x9-y11-z12 - grid
 g-x9-y11-z13 - grid
 g-x9-y11-z14 - grid
 g-x9-y11-z15 - grid
 g-x9-y12-z0 - grid
 g-x9-y12-z1 - grid
 g-x9-y12-z2 - grid
 g-x9-y12-z3 - grid
 g-x9-y12-z4 - grid
 g-x9-y12-z5 - grid
 g-x9-y12-z6 - grid
 g-x9-y12-z7 - grid
 g-x9-y12-z8 - grid
 g-x9-y12-z9 - grid
 g-x9-y12-z10 - grid
 g-x9-y12-z11 - grid
 g-x9-y12-z12 - grid
 g-x9-y12-z13 - grid
 g-x9-y12-z14 - grid
 g-x9-y12-z15 - grid
 g-x9-y13-z0 - grid
 g-x9-y13-z1 - grid
 g-x9-y13-z2 - grid
 g-x9-y13-z3 - grid
 g-x9-y13-z4 - grid
 g-x9-y13-z5 - grid
 g-x9-y13-z6 - grid
 g-x9-y13-z7 - grid
 g-x9-y13-z8 - grid
 g-x9-y13-z9 - grid
 g-x9-y13-z10 - grid
 g-x9-y13-z11 - grid
 g-x9-y13-z12 - grid
 g-x9-y13-z13 - grid
 g-x9-y13-z14 - grid
 g-x9-y13-z15 - grid
 g-x9-y14-z0 - grid
 g-x9-y14-z1 - grid
 g-x9-y14-z2 - grid
 g-x9-y14-z3 - grid
 g-x9-y14-z4 - grid
 g-x9-y14-z5 - grid
 g-x9-y14-z6 - grid
 g-x9-y14-z7 - grid
 g-x9-y14-z8 - grid
 g-x9-y14-z9 - grid
 g-x9-y14-z10 - grid
 g-x9-y14-z11 - grid
 g-x9-y14-z12 - grid
 g-x9-y14-z13 - grid
 g-x9-y14-z14 - grid
 g-x9-y14-z15 - grid
 g-x9-y15-z0 - grid
 g-x9-y15-z1 - grid
 g-x9-y15-z2 - grid
 g-x9-y15-z3 - grid
 g-x9-y15-z4 - grid
 g-x9-y15-z5 - grid
 g-x9-y15-z6 - grid
 g-x9-y15-z7 - grid
 g-x9-y15-z8 - grid
 g-x9-y15-z9 - grid
 g-x9-y15-z10 - grid
 g-x9-y15-z11 - grid
 g-x9-y15-z12 - grid
 g-x9-y15-z13 - grid
 g-x9-y15-z14 - grid
 g-x9-y15-z15 - grid
 g-x10-y0-z0 - grid
 g-x10-y0-z1 - grid
 g-x10-y0-z2 - grid
 g-x10-y0-z3 - grid
 g-x10-y0-z4 - grid
 g-x10-y0-z5 - grid
 g-x10-y0-z6 - grid
 g-x10-y0-z7 - grid
 g-x10-y0-z8 - grid
 g-x10-y0-z9 - grid
 g-x10-y0-z10 - grid
 g-x10-y0-z11 - grid
 g-x10-y0-z12 - grid
 g-x10-y0-z13 - grid
 g-x10-y0-z14 - grid
 g-x10-y0-z15 - grid
 g-x10-y1-z0 - grid
 g-x10-y1-z1 - grid
 g-x10-y1-z2 - grid
 g-x10-y1-z3 - grid
 g-x10-y1-z4 - grid
 g-x10-y1-z5 - grid
 g-x10-y1-z6 - grid
 g-x10-y1-z7 - grid
 g-x10-y1-z8 - grid
 g-x10-y1-z9 - grid
 g-x10-y1-z10 - grid
 g-x10-y1-z11 - grid
 g-x10-y1-z12 - grid
 g-x10-y1-z13 - grid
 g-x10-y1-z14 - grid
 g-x10-y1-z15 - grid
 g-x10-y2-z0 - grid
 g-x10-y2-z1 - grid
 g-x10-y2-z2 - grid
 g-x10-y2-z3 - grid
 g-x10-y2-z4 - grid
 g-x10-y2-z5 - grid
 g-x10-y2-z6 - grid
 g-x10-y2-z7 - grid
 g-x10-y2-z8 - grid
 g-x10-y2-z9 - grid
 g-x10-y2-z10 - grid
 g-x10-y2-z11 - grid
 g-x10-y2-z12 - grid
 g-x10-y2-z13 - grid
 g-x10-y2-z14 - grid
 g-x10-y2-z15 - grid
 g-x10-y3-z0 - grid
 g-x10-y3-z1 - grid
 g-x10-y3-z2 - grid
 g-x10-y3-z3 - grid
 g-x10-y3-z4 - grid
 g-x10-y3-z5 - grid
 g-x10-y3-z6 - grid
 g-x10-y3-z7 - grid
 g-x10-y3-z8 - grid
 g-x10-y3-z9 - grid
 g-x10-y3-z10 - grid
 g-x10-y3-z11 - grid
 g-x10-y3-z12 - grid
 g-x10-y3-z13 - grid
 g-x10-y3-z14 - grid
 g-x10-y3-z15 - grid
 g-x10-y4-z0 - grid
 g-x10-y4-z1 - grid
 g-x10-y4-z2 - grid
 g-x10-y4-z3 - grid
 g-x10-y4-z4 - grid
 g-x10-y4-z5 - grid
 g-x10-y4-z6 - grid
 g-x10-y4-z7 - grid
 g-x10-y4-z8 - grid
 g-x10-y4-z9 - grid
 g-x10-y4-z10 - grid
 g-x10-y4-z11 - grid
 g-x10-y4-z12 - grid
 g-x10-y4-z13 - grid
 g-x10-y4-z14 - grid
 g-x10-y4-z15 - grid
 g-x10-y5-z0 - grid
 g-x10-y5-z1 - grid
 g-x10-y5-z2 - grid
 g-x10-y5-z3 - grid
 g-x10-y5-z4 - grid
 g-x10-y5-z5 - grid
 g-x10-y5-z6 - grid
 g-x10-y5-z7 - grid
 g-x10-y5-z8 - grid
 g-x10-y5-z9 - grid
 g-x10-y5-z10 - grid
 g-x10-y5-z11 - grid
 g-x10-y5-z12 - grid
 g-x10-y5-z13 - grid
 g-x10-y5-z14 - grid
 g-x10-y5-z15 - grid
 g-x10-y6-z0 - grid
 g-x10-y6-z1 - grid
 g-x10-y6-z2 - grid
 g-x10-y6-z3 - grid
 g-x10-y6-z4 - grid
 g-x10-y6-z5 - grid
 g-x10-y6-z6 - grid
 g-x10-y6-z7 - grid
 g-x10-y6-z8 - grid
 g-x10-y6-z9 - grid
 g-x10-y6-z10 - grid
 g-x10-y6-z11 - grid
 g-x10-y6-z12 - grid
 g-x10-y6-z13 - grid
 g-x10-y6-z14 - grid
 g-x10-y6-z15 - grid
 g-x10-y7-z0 - grid
 g-x10-y7-z1 - grid
 g-x10-y7-z2 - grid
 g-x10-y7-z3 - grid
 g-x10-y7-z4 - grid
 g-x10-y7-z5 - grid
 g-x10-y7-z6 - grid
 g-x10-y7-z7 - grid
 g-x10-y7-z8 - grid
 g-x10-y7-z9 - grid
 g-x10-y7-z10 - grid
 g-x10-y7-z11 - grid
 g-x10-y7-z12 - grid
 g-x10-y7-z13 - grid
 g-x10-y7-z14 - grid
 g-x10-y7-z15 - grid
 g-x10-y8-z0 - grid
 g-x10-y8-z1 - grid
 g-x10-y8-z2 - grid
 g-x10-y8-z3 - grid
 g-x10-y8-z4 - grid
 g-x10-y8-z5 - grid
 g-x10-y8-z6 - grid
 g-x10-y8-z7 - grid
 g-x10-y8-z8 - grid
 g-x10-y8-z9 - grid
 g-x10-y8-z10 - grid
 g-x10-y8-z11 - grid
 g-x10-y8-z12 - grid
 g-x10-y8-z13 - grid
 g-x10-y8-z14 - grid
 g-x10-y8-z15 - grid
 g-x10-y9-z0 - grid
 g-x10-y9-z1 - grid
 g-x10-y9-z2 - grid
 g-x10-y9-z3 - grid
 g-x10-y9-z4 - grid
 g-x10-y9-z5 - grid
 g-x10-y9-z6 - grid
 g-x10-y9-z7 - grid
 g-x10-y9-z8 - grid
 g-x10-y9-z9 - grid
 g-x10-y9-z10 - grid
 g-x10-y9-z11 - grid
 g-x10-y9-z12 - grid
 g-x10-y9-z13 - grid
 g-x10-y9-z14 - grid
 g-x10-y9-z15 - grid
 g-x10-y10-z0 - grid
 g-x10-y10-z1 - grid
 g-x10-y10-z2 - grid
 g-x10-y10-z3 - grid
 g-x10-y10-z4 - grid
 g-x10-y10-z5 - grid
 g-x10-y10-z6 - grid
 g-x10-y10-z7 - grid
 g-x10-y10-z8 - grid
 g-x10-y10-z9 - grid
 g-x10-y10-z10 - grid
 g-x10-y10-z11 - grid
 g-x10-y10-z12 - grid
 g-x10-y10-z13 - grid
 g-x10-y10-z14 - grid
 g-x10-y10-z15 - grid
 g-x10-y11-z0 - grid
 g-x10-y11-z1 - grid
 g-x10-y11-z2 - grid
 g-x10-y11-z3 - grid
 g-x10-y11-z4 - grid
 g-x10-y11-z5 - grid
 g-x10-y11-z6 - grid
 g-x10-y11-z7 - grid
 g-x10-y11-z8 - grid
 g-x10-y11-z9 - grid
 g-x10-y11-z10 - grid
 g-x10-y11-z11 - grid
 g-x10-y11-z12 - grid
 g-x10-y11-z13 - grid
 g-x10-y11-z14 - grid
 g-x10-y11-z15 - grid
 g-x10-y12-z0 - grid
 g-x10-y12-z1 - grid
 g-x10-y12-z2 - grid
 g-x10-y12-z3 - grid
 g-x10-y12-z4 - grid
 g-x10-y12-z5 - grid
 g-x10-y12-z6 - grid
 g-x10-y12-z7 - grid
 g-x10-y12-z8 - grid
 g-x10-y12-z9 - grid
 g-x10-y12-z10 - grid
 g-x10-y12-z11 - grid
 g-x10-y12-z12 - grid
 g-x10-y12-z13 - grid
 g-x10-y12-z14 - grid
 g-x10-y12-z15 - grid
 g-x10-y13-z0 - grid
 g-x10-y13-z1 - grid
 g-x10-y13-z2 - grid
 g-x10-y13-z3 - grid
 g-x10-y13-z4 - grid
 g-x10-y13-z5 - grid
 g-x10-y13-z6 - grid
 g-x10-y13-z7 - grid
 g-x10-y13-z8 - grid
 g-x10-y13-z9 - grid
 g-x10-y13-z10 - grid
 g-x10-y13-z11 - grid
 g-x10-y13-z12 - grid
 g-x10-y13-z13 - grid
 g-x10-y13-z14 - grid
 g-x10-y13-z15 - grid
 g-x10-y14-z0 - grid
 g-x10-y14-z1 - grid
 g-x10-y14-z2 - grid
 g-x10-y14-z3 - grid
 g-x10-y14-z4 - grid
 g-x10-y14-z5 - grid
 g-x10-y14-z6 - grid
 g-x10-y14-z7 - grid
 g-x10-y14-z8 - grid
 g-x10-y14-z9 - grid
 g-x10-y14-z10 - grid
 g-x10-y14-z11 - grid
 g-x10-y14-z12 - grid
 g-x10-y14-z13 - grid
 g-x10-y14-z14 - grid
 g-x10-y14-z15 - grid
 g-x10-y15-z0 - grid
 g-x10-y15-z1 - grid
 g-x10-y15-z2 - grid
 g-x10-y15-z3 - grid
 g-x10-y15-z4 - grid
 g-x10-y15-z5 - grid
 g-x10-y15-z6 - grid
 g-x10-y15-z7 - grid
 g-x10-y15-z8 - grid
 g-x10-y15-z9 - grid
 g-x10-y15-z10 - grid
 g-x10-y15-z11 - grid
 g-x10-y15-z12 - grid
 g-x10-y15-z13 - grid
 g-x10-y15-z14 - grid
 g-x10-y15-z15 - grid
 g-x11-y0-z0 - grid
 g-x11-y0-z1 - grid
 g-x11-y0-z2 - grid
 g-x11-y0-z3 - grid
 g-x11-y0-z4 - grid
 g-x11-y0-z5 - grid
 g-x11-y0-z6 - grid
 g-x11-y0-z7 - grid
 g-x11-y0-z8 - grid
 g-x11-y0-z9 - grid
 g-x11-y0-z10 - grid
 g-x11-y0-z11 - grid
 g-x11-y0-z12 - grid
 g-x11-y0-z13 - grid
 g-x11-y0-z14 - grid
 g-x11-y0-z15 - grid
 g-x11-y1-z0 - grid
 g-x11-y1-z1 - grid
 g-x11-y1-z2 - grid
 g-x11-y1-z3 - grid
 g-x11-y1-z4 - grid
 g-x11-y1-z5 - grid
 g-x11-y1-z6 - grid
 g-x11-y1-z7 - grid
 g-x11-y1-z8 - grid
 g-x11-y1-z9 - grid
 g-x11-y1-z10 - grid
 g-x11-y1-z11 - grid
 g-x11-y1-z12 - grid
 g-x11-y1-z13 - grid
 g-x11-y1-z14 - grid
 g-x11-y1-z15 - grid
 g-x11-y2-z0 - grid
 g-x11-y2-z1 - grid
 g-x11-y2-z2 - grid
 g-x11-y2-z3 - grid
 g-x11-y2-z4 - grid
 g-x11-y2-z5 - grid
 g-x11-y2-z6 - grid
 g-x11-y2-z7 - grid
 g-x11-y2-z8 - grid
 g-x11-y2-z9 - grid
 g-x11-y2-z10 - grid
 g-x11-y2-z11 - grid
 g-x11-y2-z12 - grid
 g-x11-y2-z13 - grid
 g-x11-y2-z14 - grid
 g-x11-y2-z15 - grid
 g-x11-y3-z0 - grid
 g-x11-y3-z1 - grid
 g-x11-y3-z2 - grid
 g-x11-y3-z3 - grid
 g-x11-y3-z4 - grid
 g-x11-y3-z5 - grid
 g-x11-y3-z6 - grid
 g-x11-y3-z7 - grid
 g-x11-y3-z8 - grid
 g-x11-y3-z9 - grid
 g-x11-y3-z10 - grid
 g-x11-y3-z11 - grid
 g-x11-y3-z12 - grid
 g-x11-y3-z13 - grid
 g-x11-y3-z14 - grid
 g-x11-y3-z15 - grid
 g-x11-y4-z0 - grid
 g-x11-y4-z1 - grid
 g-x11-y4-z2 - grid
 g-x11-y4-z3 - grid
 g-x11-y4-z4 - grid
 g-x11-y4-z5 - grid
 g-x11-y4-z6 - grid
 g-x11-y4-z7 - grid
 g-x11-y4-z8 - grid
 g-x11-y4-z9 - grid
 g-x11-y4-z10 - grid
 g-x11-y4-z11 - grid
 g-x11-y4-z12 - grid
 g-x11-y4-z13 - grid
 g-x11-y4-z14 - grid
 g-x11-y4-z15 - grid
 g-x11-y5-z0 - grid
 g-x11-y5-z1 - grid
 g-x11-y5-z2 - grid
 g-x11-y5-z3 - grid
 g-x11-y5-z4 - grid
 g-x11-y5-z5 - grid
 g-x11-y5-z6 - grid
 g-x11-y5-z7 - grid
 g-x11-y5-z8 - grid
 g-x11-y5-z9 - grid
 g-x11-y5-z10 - grid
 g-x11-y5-z11 - grid
 g-x11-y5-z12 - grid
 g-x11-y5-z13 - grid
 g-x11-y5-z14 - grid
 g-x11-y5-z15 - grid
 g-x11-y6-z0 - grid
 g-x11-y6-z1 - grid
 g-x11-y6-z2 - grid
 g-x11-y6-z3 - grid
 g-x11-y6-z4 - grid
 g-x11-y6-z5 - grid
 g-x11-y6-z6 - grid
 g-x11-y6-z7 - grid
 g-x11-y6-z8 - grid
 g-x11-y6-z9 - grid
 g-x11-y6-z10 - grid
 g-x11-y6-z11 - grid
 g-x11-y6-z12 - grid
 g-x11-y6-z13 - grid
 g-x11-y6-z14 - grid
 g-x11-y6-z15 - grid
 g-x11-y7-z0 - grid
 g-x11-y7-z1 - grid
 g-x11-y7-z2 - grid
 g-x11-y7-z3 - grid
 g-x11-y7-z4 - grid
 g-x11-y7-z5 - grid
 g-x11-y7-z6 - grid
 g-x11-y7-z7 - grid
 g-x11-y7-z8 - grid
 g-x11-y7-z9 - grid
 g-x11-y7-z10 - grid
 g-x11-y7-z11 - grid
 g-x11-y7-z12 - grid
 g-x11-y7-z13 - grid
 g-x11-y7-z14 - grid
 g-x11-y7-z15 - grid
 g-x11-y8-z0 - grid
 g-x11-y8-z1 - grid
 g-x11-y8-z2 - grid
 g-x11-y8-z3 - grid
 g-x11-y8-z4 - grid
 g-x11-y8-z5 - grid
 g-x11-y8-z6 - grid
 g-x11-y8-z7 - grid
 g-x11-y8-z8 - grid
 g-x11-y8-z9 - grid
 g-x11-y8-z10 - grid
 g-x11-y8-z11 - grid
 g-x11-y8-z12 - grid
 g-x11-y8-z13 - grid
 g-x11-y8-z14 - grid
 g-x11-y8-z15 - grid
 g-x11-y9-z0 - grid
 g-x11-y9-z1 - grid
 g-x11-y9-z2 - grid
 g-x11-y9-z3 - grid
 g-x11-y9-z4 - grid
 g-x11-y9-z5 - grid
 g-x11-y9-z6 - grid
 g-x11-y9-z7 - grid
 g-x11-y9-z8 - grid
 g-x11-y9-z9 - grid
 g-x11-y9-z10 - grid
 g-x11-y9-z11 - grid
 g-x11-y9-z12 - grid
 g-x11-y9-z13 - grid
 g-x11-y9-z14 - grid
 g-x11-y9-z15 - grid
 g-x11-y10-z0 - grid
 g-x11-y10-z1 - grid
 g-x11-y10-z2 - grid
 g-x11-y10-z3 - grid
 g-x11-y10-z4 - grid
 g-x11-y10-z5 - grid
 g-x11-y10-z6 - grid
 g-x11-y10-z7 - grid
 g-x11-y10-z8 - grid
 g-x11-y10-z9 - grid
 g-x11-y10-z10 - grid
 g-x11-y10-z11 - grid
 g-x11-y10-z12 - grid
 g-x11-y10-z13 - grid
 g-x11-y10-z14 - grid
 g-x11-y10-z15 - grid
 g-x11-y11-z0 - grid
 g-x11-y11-z1 - grid
 g-x11-y11-z2 - grid
 g-x11-y11-z3 - grid
 g-x11-y11-z4 - grid
 g-x11-y11-z5 - grid
 g-x11-y11-z6 - grid
 g-x11-y11-z7 - grid
 g-x11-y11-z8 - grid
 g-x11-y11-z9 - grid
 g-x11-y11-z10 - grid
 g-x11-y11-z11 - grid
 g-x11-y11-z12 - grid
 g-x11-y11-z13 - grid
 g-x11-y11-z14 - grid
 g-x11-y11-z15 - grid
 g-x11-y12-z0 - grid
 g-x11-y12-z1 - grid
 g-x11-y12-z2 - grid
 g-x11-y12-z3 - grid
 g-x11-y12-z4 - grid
 g-x11-y12-z5 - grid
 g-x11-y12-z6 - grid
 g-x11-y12-z7 - grid
 g-x11-y12-z8 - grid
 g-x11-y12-z9 - grid
 g-x11-y12-z10 - grid
 g-x11-y12-z11 - grid
 g-x11-y12-z12 - grid
 g-x11-y12-z13 - grid
 g-x11-y12-z14 - grid
 g-x11-y12-z15 - grid
 g-x11-y13-z0 - grid
 g-x11-y13-z1 - grid
 g-x11-y13-z2 - grid
 g-x11-y13-z3 - grid
 g-x11-y13-z4 - grid
 g-x11-y13-z5 - grid
 g-x11-y13-z6 - grid
 g-x11-y13-z7 - grid
 g-x11-y13-z8 - grid
 g-x11-y13-z9 - grid
 g-x11-y13-z10 - grid
 g-x11-y13-z11 - grid
 g-x11-y13-z12 - grid
 g-x11-y13-z13 - grid
 g-x11-y13-z14 - grid
 g-x11-y13-z15 - grid
 g-x11-y14-z0 - grid
 g-x11-y14-z1 - grid
 g-x11-y14-z2 - grid
 g-x11-y14-z3 - grid
 g-x11-y14-z4 - grid
 g-x11-y14-z5 - grid
 g-x11-y14-z6 - grid
 g-x11-y14-z7 - grid
 g-x11-y14-z8 - grid
 g-x11-y14-z9 - grid
 g-x11-y14-z10 - grid
 g-x11-y14-z11 - grid
 g-x11-y14-z12 - grid
 g-x11-y14-z13 - grid
 g-x11-y14-z14 - grid
 g-x11-y14-z15 - grid
 g-x11-y15-z0 - grid
 g-x11-y15-z1 - grid
 g-x11-y15-z2 - grid
 g-x11-y15-z3 - grid
 g-x11-y15-z4 - grid
 g-x11-y15-z5 - grid
 g-x11-y15-z6 - grid
 g-x11-y15-z7 - grid
 g-x11-y15-z8 - grid
 g-x11-y15-z9 - grid
 g-x11-y15-z10 - grid
 g-x11-y15-z11 - grid
 g-x11-y15-z12 - grid
 g-x11-y15-z13 - grid
 g-x11-y15-z14 - grid
 g-x11-y15-z15 - grid
 g-x12-y0-z0 - grid
 g-x12-y0-z1 - grid
 g-x12-y0-z2 - grid
 g-x12-y0-z3 - grid
 g-x12-y0-z4 - grid
 g-x12-y0-z5 - grid
 g-x12-y0-z6 - grid
 g-x12-y0-z7 - grid
 g-x12-y0-z8 - grid
 g-x12-y0-z9 - grid
 g-x12-y0-z10 - grid
 g-x12-y0-z11 - grid
 g-x12-y0-z12 - grid
 g-x12-y0-z13 - grid
 g-x12-y0-z14 - grid
 g-x12-y0-z15 - grid
 g-x12-y1-z0 - grid
 g-x12-y1-z1 - grid
 g-x12-y1-z2 - grid
 g-x12-y1-z3 - grid
 g-x12-y1-z4 - grid
 g-x12-y1-z5 - grid
 g-x12-y1-z6 - grid
 g-x12-y1-z7 - grid
 g-x12-y1-z8 - grid
 g-x12-y1-z9 - grid
 g-x12-y1-z10 - grid
 g-x12-y1-z11 - grid
 g-x12-y1-z12 - grid
 g-x12-y1-z13 - grid
 g-x12-y1-z14 - grid
 g-x12-y1-z15 - grid
 g-x12-y2-z0 - grid
 g-x12-y2-z1 - grid
 g-x12-y2-z2 - grid
 g-x12-y2-z3 - grid
 g-x12-y2-z4 - grid
 g-x12-y2-z5 - grid
 g-x12-y2-z6 - grid
 g-x12-y2-z7 - grid
 g-x12-y2-z8 - grid
 g-x12-y2-z9 - grid
 g-x12-y2-z10 - grid
 g-x12-y2-z11 - grid
 g-x12-y2-z12 - grid
 g-x12-y2-z13 - grid
 g-x12-y2-z14 - grid
 g-x12-y2-z15 - grid
 g-x12-y3-z0 - grid
 g-x12-y3-z1 - grid
 g-x12-y3-z2 - grid
 g-x12-y3-z3 - grid
 g-x12-y3-z4 - grid
 g-x12-y3-z5 - grid
 g-x12-y3-z6 - grid
 g-x12-y3-z7 - grid
 g-x12-y3-z8 - grid
 g-x12-y3-z9 - grid
 g-x12-y3-z10 - grid
 g-x12-y3-z11 - grid
 g-x12-y3-z12 - grid
 g-x12-y3-z13 - grid
 g-x12-y3-z14 - grid
 g-x12-y3-z15 - grid
 g-x12-y4-z0 - grid
 g-x12-y4-z1 - grid
 g-x12-y4-z2 - grid
 g-x12-y4-z3 - grid
 g-x12-y4-z4 - grid
 g-x12-y4-z5 - grid
 g-x12-y4-z6 - grid
 g-x12-y4-z7 - grid
 g-x12-y4-z8 - grid
 g-x12-y4-z9 - grid
 g-x12-y4-z10 - grid
 g-x12-y4-z11 - grid
 g-x12-y4-z12 - grid
 g-x12-y4-z13 - grid
 g-x12-y4-z14 - grid
 g-x12-y4-z15 - grid
 g-x12-y5-z0 - grid
 g-x12-y5-z1 - grid
 g-x12-y5-z2 - grid
 g-x12-y5-z3 - grid
 g-x12-y5-z4 - grid
 g-x12-y5-z5 - grid
 g-x12-y5-z6 - grid
 g-x12-y5-z7 - grid
 g-x12-y5-z8 - grid
 g-x12-y5-z9 - grid
 g-x12-y5-z10 - grid
 g-x12-y5-z11 - grid
 g-x12-y5-z12 - grid
 g-x12-y5-z13 - grid
 g-x12-y5-z14 - grid
 g-x12-y5-z15 - grid
 g-x12-y6-z0 - grid
 g-x12-y6-z1 - grid
 g-x12-y6-z2 - grid
 g-x12-y6-z3 - grid
 g-x12-y6-z4 - grid
 g-x12-y6-z5 - grid
 g-x12-y6-z6 - grid
 g-x12-y6-z7 - grid
 g-x12-y6-z8 - grid
 g-x12-y6-z9 - grid
 g-x12-y6-z10 - grid
 g-x12-y6-z11 - grid
 g-x12-y6-z12 - grid
 g-x12-y6-z13 - grid
 g-x12-y6-z14 - grid
 g-x12-y6-z15 - grid
 g-x12-y7-z0 - grid
 g-x12-y7-z1 - grid
 g-x12-y7-z2 - grid
 g-x12-y7-z3 - grid
 g-x12-y7-z4 - grid
 g-x12-y7-z5 - grid
 g-x12-y7-z6 - grid
 g-x12-y7-z7 - grid
 g-x12-y7-z8 - grid
 g-x12-y7-z9 - grid
 g-x12-y7-z10 - grid
 g-x12-y7-z11 - grid
 g-x12-y7-z12 - grid
 g-x12-y7-z13 - grid
 g-x12-y7-z14 - grid
 g-x12-y7-z15 - grid
 g-x12-y8-z0 - grid
 g-x12-y8-z1 - grid
 g-x12-y8-z2 - grid
 g-x12-y8-z3 - grid
 g-x12-y8-z4 - grid
 g-x12-y8-z5 - grid
 g-x12-y8-z6 - grid
 g-x12-y8-z7 - grid
 g-x12-y8-z8 - grid
 g-x12-y8-z9 - grid
 g-x12-y8-z10 - grid
 g-x12-y8-z11 - grid
 g-x12-y8-z12 - grid
 g-x12-y8-z13 - grid
 g-x12-y8-z14 - grid
 g-x12-y8-z15 - grid
 g-x12-y9-z0 - grid
 g-x12-y9-z1 - grid
 g-x12-y9-z2 - grid
 g-x12-y9-z3 - grid
 g-x12-y9-z4 - grid
 g-x12-y9-z5 - grid
 g-x12-y9-z6 - grid
 g-x12-y9-z7 - grid
 g-x12-y9-z8 - grid
 g-x12-y9-z9 - grid
 g-x12-y9-z10 - grid
 g-x12-y9-z11 - grid
 g-x12-y9-z12 - grid
 g-x12-y9-z13 - grid
 g-x12-y9-z14 - grid
 g-x12-y9-z15 - grid
 g-x12-y10-z0 - grid
 g-x12-y10-z1 - grid
 g-x12-y10-z2 - grid
 g-x12-y10-z3 - grid
 g-x12-y10-z4 - grid
 g-x12-y10-z5 - grid
 g-x12-y10-z6 - grid
 g-x12-y10-z7 - grid
 g-x12-y10-z8 - grid
 g-x12-y10-z9 - grid
 g-x12-y10-z10 - grid
 g-x12-y10-z11 - grid
 g-x12-y10-z12 - grid
 g-x12-y10-z13 - grid
 g-x12-y10-z14 - grid
 g-x12-y10-z15 - grid
 g-x12-y11-z0 - grid
 g-x12-y11-z1 - grid
 g-x12-y11-z2 - grid
 g-x12-y11-z3 - grid
 g-x12-y11-z4 - grid
 g-x12-y11-z5 - grid
 g-x12-y11-z6 - grid
 g-x12-y11-z7 - grid
 g-x12-y11-z8 - grid
 g-x12-y11-z9 - grid
 g-x12-y11-z10 - grid
 g-x12-y11-z11 - grid
 g-x12-y11-z12 - grid
 g-x12-y11-z13 - grid
 g-x12-y11-z14 - grid
 g-x12-y11-z15 - grid
 g-x12-y12-z0 - grid
 g-x12-y12-z1 - grid
 g-x12-y12-z2 - grid
 g-x12-y12-z3 - grid
 g-x12-y12-z4 - grid
 g-x12-y12-z5 - grid
 g-x12-y12-z6 - grid
 g-x12-y12-z7 - grid
 g-x12-y12-z8 - grid
 g-x12-y12-z9 - grid
 g-x12-y12-z10 - grid
 g-x12-y12-z11 - grid
 g-x12-y12-z12 - grid
 g-x12-y12-z13 - grid
 g-x12-y12-z14 - grid
 g-x12-y12-z15 - grid
 g-x12-y13-z0 - grid
 g-x12-y13-z1 - grid
 g-x12-y13-z2 - grid
 g-x12-y13-z3 - grid
 g-x12-y13-z4 - grid
 g-x12-y13-z5 - grid
 g-x12-y13-z6 - grid
 g-x12-y13-z7 - grid
 g-x12-y13-z8 - grid
 g-x12-y13-z9 - grid
 g-x12-y13-z10 - grid
 g-x12-y13-z11 - grid
 g-x12-y13-z12 - grid
 g-x12-y13-z13 - grid
 g-x12-y13-z14 - grid
 g-x12-y13-z15 - grid
 g-x12-y14-z0 - grid
 g-x12-y14-z1 - grid
 g-x12-y14-z2 - grid
 g-x12-y14-z3 - grid
 g-x12-y14-z4 - grid
 g-x12-y14-z5 - grid
 g-x12-y14-z6 - grid
 g-x12-y14-z7 - grid
 g-x12-y14-z8 - grid
 g-x12-y14-z9 - grid
 g-x12-y14-z10 - grid
 g-x12-y14-z11 - grid
 g-x12-y14-z12 - grid
 g-x12-y14-z13 - grid
 g-x12-y14-z14 - grid
 g-x12-y14-z15 - grid
 g-x12-y15-z0 - grid
 g-x12-y15-z1 - grid
 g-x12-y15-z2 - grid
 g-x12-y15-z3 - grid
 g-x12-y15-z4 - grid
 g-x12-y15-z5 - grid
 g-x12-y15-z6 - grid
 g-x12-y15-z7 - grid
 g-x12-y15-z8 - grid
 g-x12-y15-z9 - grid
 g-x12-y15-z10 - grid
 g-x12-y15-z11 - grid
 g-x12-y15-z12 - grid
 g-x12-y15-z13 - grid
 g-x12-y15-z14 - grid
 g-x12-y15-z15 - grid
 g-x13-y0-z0 - grid
 g-x13-y0-z1 - grid
 g-x13-y0-z2 - grid
 g-x13-y0-z3 - grid
 g-x13-y0-z4 - grid
 g-x13-y0-z5 - grid
 g-x13-y0-z6 - grid
 g-x13-y0-z7 - grid
 g-x13-y0-z8 - grid
 g-x13-y0-z9 - grid
 g-x13-y0-z10 - grid
 g-x13-y0-z11 - grid
 g-x13-y0-z12 - grid
 g-x13-y0-z13 - grid
 g-x13-y0-z14 - grid
 g-x13-y0-z15 - grid
 g-x13-y1-z0 - grid
 g-x13-y1-z1 - grid
 g-x13-y1-z2 - grid
 g-x13-y1-z3 - grid
 g-x13-y1-z4 - grid
 g-x13-y1-z5 - grid
 g-x13-y1-z6 - grid
 g-x13-y1-z7 - grid
 g-x13-y1-z8 - grid
 g-x13-y1-z9 - grid
 g-x13-y1-z10 - grid
 g-x13-y1-z11 - grid
 g-x13-y1-z12 - grid
 g-x13-y1-z13 - grid
 g-x13-y1-z14 - grid
 g-x13-y1-z15 - grid
 g-x13-y2-z0 - grid
 g-x13-y2-z1 - grid
 g-x13-y2-z2 - grid
 g-x13-y2-z3 - grid
 g-x13-y2-z4 - grid
 g-x13-y2-z5 - grid
 g-x13-y2-z6 - grid
 g-x13-y2-z7 - grid
 g-x13-y2-z8 - grid
 g-x13-y2-z9 - grid
 g-x13-y2-z10 - grid
 g-x13-y2-z11 - grid
 g-x13-y2-z12 - grid
 g-x13-y2-z13 - grid
 g-x13-y2-z14 - grid
 g-x13-y2-z15 - grid
 g-x13-y3-z0 - grid
 g-x13-y3-z1 - grid
 g-x13-y3-z2 - grid
 g-x13-y3-z3 - grid
 g-x13-y3-z4 - grid
 g-x13-y3-z5 - grid
 g-x13-y3-z6 - grid
 g-x13-y3-z7 - grid
 g-x13-y3-z8 - grid
 g-x13-y3-z9 - grid
 g-x13-y3-z10 - grid
 g-x13-y3-z11 - grid
 g-x13-y3-z12 - grid
 g-x13-y3-z13 - grid
 g-x13-y3-z14 - grid
 g-x13-y3-z15 - grid
 g-x13-y4-z0 - grid
 g-x13-y4-z1 - grid
 g-x13-y4-z2 - grid
 g-x13-y4-z3 - grid
 g-x13-y4-z4 - grid
 g-x13-y4-z5 - grid
 g-x13-y4-z6 - grid
 g-x13-y4-z7 - grid
 g-x13-y4-z8 - grid
 g-x13-y4-z9 - grid
 g-x13-y4-z10 - grid
 g-x13-y4-z11 - grid
 g-x13-y4-z12 - grid
 g-x13-y4-z13 - grid
 g-x13-y4-z14 - grid
 g-x13-y4-z15 - grid
 g-x13-y5-z0 - grid
 g-x13-y5-z1 - grid
 g-x13-y5-z2 - grid
 g-x13-y5-z3 - grid
 g-x13-y5-z4 - grid
 g-x13-y5-z5 - grid
 g-x13-y5-z6 - grid
 g-x13-y5-z7 - grid
 g-x13-y5-z8 - grid
 g-x13-y5-z9 - grid
 g-x13-y5-z10 - grid
 g-x13-y5-z11 - grid
 g-x13-y5-z12 - grid
 g-x13-y5-z13 - grid
 g-x13-y5-z14 - grid
 g-x13-y5-z15 - grid
 g-x13-y6-z0 - grid
 g-x13-y6-z1 - grid
 g-x13-y6-z2 - grid
 g-x13-y6-z3 - grid
 g-x13-y6-z4 - grid
 g-x13-y6-z5 - grid
 g-x13-y6-z6 - grid
 g-x13-y6-z7 - grid
 g-x13-y6-z8 - grid
 g-x13-y6-z9 - grid
 g-x13-y6-z10 - grid
 g-x13-y6-z11 - grid
 g-x13-y6-z12 - grid
 g-x13-y6-z13 - grid
 g-x13-y6-z14 - grid
 g-x13-y6-z15 - grid
 g-x13-y7-z0 - grid
 g-x13-y7-z1 - grid
 g-x13-y7-z2 - grid
 g-x13-y7-z3 - grid
 g-x13-y7-z4 - grid
 g-x13-y7-z5 - grid
 g-x13-y7-z6 - grid
 g-x13-y7-z7 - grid
 g-x13-y7-z8 - grid
 g-x13-y7-z9 - grid
 g-x13-y7-z10 - grid
 g-x13-y7-z11 - grid
 g-x13-y7-z12 - grid
 g-x13-y7-z13 - grid
 g-x13-y7-z14 - grid
 g-x13-y7-z15 - grid
 g-x13-y8-z0 - grid
 g-x13-y8-z1 - grid
 g-x13-y8-z2 - grid
 g-x13-y8-z3 - grid
 g-x13-y8-z4 - grid
 g-x13-y8-z5 - grid
 g-x13-y8-z6 - grid
 g-x13-y8-z7 - grid
 g-x13-y8-z8 - grid
 g-x13-y8-z9 - grid
 g-x13-y8-z10 - grid
 g-x13-y8-z11 - grid
 g-x13-y8-z12 - grid
 g-x13-y8-z13 - grid
 g-x13-y8-z14 - grid
 g-x13-y8-z15 - grid
 g-x13-y9-z0 - grid
 g-x13-y9-z1 - grid
 g-x13-y9-z2 - grid
 g-x13-y9-z3 - grid
 g-x13-y9-z4 - grid
 g-x13-y9-z5 - grid
 g-x13-y9-z6 - grid
 g-x13-y9-z7 - grid
 g-x13-y9-z8 - grid
 g-x13-y9-z9 - grid
 g-x13-y9-z10 - grid
 g-x13-y9-z11 - grid
 g-x13-y9-z12 - grid
 g-x13-y9-z13 - grid
 g-x13-y9-z14 - grid
 g-x13-y9-z15 - grid
 g-x13-y10-z0 - grid
 g-x13-y10-z1 - grid
 g-x13-y10-z2 - grid
 g-x13-y10-z3 - grid
 g-x13-y10-z4 - grid
 g-x13-y10-z5 - grid
 g-x13-y10-z6 - grid
 g-x13-y10-z7 - grid
 g-x13-y10-z8 - grid
 g-x13-y10-z9 - grid
 g-x13-y10-z10 - grid
 g-x13-y10-z11 - grid
 g-x13-y10-z12 - grid
 g-x13-y10-z13 - grid
 g-x13-y10-z14 - grid
 g-x13-y10-z15 - grid
 g-x13-y11-z0 - grid
 g-x13-y11-z1 - grid
 g-x13-y11-z2 - grid
 g-x13-y11-z3 - grid
 g-x13-y11-z4 - grid
 g-x13-y11-z5 - grid
 g-x13-y11-z6 - grid
 g-x13-y11-z7 - grid
 g-x13-y11-z8 - grid
 g-x13-y11-z9 - grid
 g-x13-y11-z10 - grid
 g-x13-y11-z11 - grid
 g-x13-y11-z12 - grid
 g-x13-y11-z13 - grid
 g-x13-y11-z14 - grid
 g-x13-y11-z15 - grid
 g-x13-y12-z0 - grid
 g-x13-y12-z1 - grid
 g-x13-y12-z2 - grid
 g-x13-y12-z3 - grid
 g-x13-y12-z4 - grid
 g-x13-y12-z5 - grid
 g-x13-y12-z6 - grid
 g-x13-y12-z7 - grid
 g-x13-y12-z8 - grid
 g-x13-y12-z9 - grid
 g-x13-y12-z10 - grid
 g-x13-y12-z11 - grid
 g-x13-y12-z12 - grid
 g-x13-y12-z13 - grid
 g-x13-y12-z14 - grid
 g-x13-y12-z15 - grid
 g-x13-y13-z0 - grid
 g-x13-y13-z1 - grid
 g-x13-y13-z2 - grid
 g-x13-y13-z3 - grid
 g-x13-y13-z4 - grid
 g-x13-y13-z5 - grid
 g-x13-y13-z6 - grid
 g-x13-y13-z7 - grid
 g-x13-y13-z8 - grid
 g-x13-y13-z9 - grid
 g-x13-y13-z10 - grid
 g-x13-y13-z11 - grid
 g-x13-y13-z12 - grid
 g-x13-y13-z13 - grid
 g-x13-y13-z14 - grid
 g-x13-y13-z15 - grid
 g-x13-y14-z0 - grid
 g-x13-y14-z1 - grid
 g-x13-y14-z2 - grid
 g-x13-y14-z3 - grid
 g-x13-y14-z4 - grid
 g-x13-y14-z5 - grid
 g-x13-y14-z6 - grid
 g-x13-y14-z7 - grid
 g-x13-y14-z8 - grid
 g-x13-y14-z9 - grid
 g-x13-y14-z10 - grid
 g-x13-y14-z11 - grid
 g-x13-y14-z12 - grid
 g-x13-y14-z13 - grid
 g-x13-y14-z14 - grid
 g-x13-y14-z15 - grid
 g-x13-y15-z0 - grid
 g-x13-y15-z1 - grid
 g-x13-y15-z2 - grid
 g-x13-y15-z3 - grid
 g-x13-y15-z4 - grid
 g-x13-y15-z5 - grid
 g-x13-y15-z6 - grid
 g-x13-y15-z7 - grid
 g-x13-y15-z8 - grid
 g-x13-y15-z9 - grid
 g-x13-y15-z10 - grid
 g-x13-y15-z11 - grid
 g-x13-y15-z12 - grid
 g-x13-y15-z13 - grid
 g-x13-y15-z14 - grid
 g-x13-y15-z15 - grid
 g-x14-y0-z0 - grid
 g-x14-y0-z1 - grid
 g-x14-y0-z2 - grid
 g-x14-y0-z3 - grid
 g-x14-y0-z4 - grid
 g-x14-y0-z5 - grid
 g-x14-y0-z6 - grid
 g-x14-y0-z7 - grid
 g-x14-y0-z8 - grid
 g-x14-y0-z9 - grid
 g-x14-y0-z10 - grid
 g-x14-y0-z11 - grid
 g-x14-y0-z12 - grid
 g-x14-y0-z13 - grid
 g-x14-y0-z14 - grid
 g-x14-y0-z15 - grid
 g-x14-y1-z0 - grid
 g-x14-y1-z1 - grid
 g-x14-y1-z2 - grid
 g-x14-y1-z3 - grid
 g-x14-y1-z4 - grid
 g-x14-y1-z5 - grid
 g-x14-y1-z6 - grid
 g-x14-y1-z7 - grid
 g-x14-y1-z8 - grid
 g-x14-y1-z9 - grid
 g-x14-y1-z10 - grid
 g-x14-y1-z11 - grid
 g-x14-y1-z12 - grid
 g-x14-y1-z13 - grid
 g-x14-y1-z14 - grid
 g-x14-y1-z15 - grid
 g-x14-y2-z0 - grid
 g-x14-y2-z1 - grid
 g-x14-y2-z2 - grid
 g-x14-y2-z3 - grid
 g-x14-y2-z4 - grid
 g-x14-y2-z5 - grid
 g-x14-y2-z6 - grid
 g-x14-y2-z7 - grid
 g-x14-y2-z8 - grid
 g-x14-y2-z9 - grid
 g-x14-y2-z10 - grid
 g-x14-y2-z11 - grid
 g-x14-y2-z12 - grid
 g-x14-y2-z13 - grid
 g-x14-y2-z14 - grid
 g-x14-y2-z15 - grid
 g-x14-y3-z0 - grid
 g-x14-y3-z1 - grid
 g-x14-y3-z2 - grid
 g-x14-y3-z3 - grid
 g-x14-y3-z4 - grid
 g-x14-y3-z5 - grid
 g-x14-y3-z6 - grid
 g-x14-y3-z7 - grid
 g-x14-y3-z8 - grid
 g-x14-y3-z9 - grid
 g-x14-y3-z10 - grid
 g-x14-y3-z11 - grid
 g-x14-y3-z12 - grid
 g-x14-y3-z13 - grid
 g-x14-y3-z14 - grid
 g-x14-y3-z15 - grid
 g-x14-y4-z0 - grid
 g-x14-y4-z1 - grid
 g-x14-y4-z2 - grid
 g-x14-y4-z3 - grid
 g-x14-y4-z4 - grid
 g-x14-y4-z5 - grid
 g-x14-y4-z6 - grid
 g-x14-y4-z7 - grid
 g-x14-y4-z8 - grid
 g-x14-y4-z9 - grid
 g-x14-y4-z10 - grid
 g-x14-y4-z11 - grid
 g-x14-y4-z12 - grid
 g-x14-y4-z13 - grid
 g-x14-y4-z14 - grid
 g-x14-y4-z15 - grid
 g-x14-y5-z0 - grid
 g-x14-y5-z1 - grid
 g-x14-y5-z2 - grid
 g-x14-y5-z3 - grid
 g-x14-y5-z4 - grid
 g-x14-y5-z5 - grid
 g-x14-y5-z6 - grid
 g-x14-y5-z7 - grid
 g-x14-y5-z8 - grid
 g-x14-y5-z9 - grid
 g-x14-y5-z10 - grid
 g-x14-y5-z11 - grid
 g-x14-y5-z12 - grid
 g-x14-y5-z13 - grid
 g-x14-y5-z14 - grid
 g-x14-y5-z15 - grid
 g-x14-y6-z0 - grid
 g-x14-y6-z1 - grid
 g-x14-y6-z2 - grid
 g-x14-y6-z3 - grid
 g-x14-y6-z4 - grid
 g-x14-y6-z5 - grid
 g-x14-y6-z6 - grid
 g-x14-y6-z7 - grid
 g-x14-y6-z8 - grid
 g-x14-y6-z9 - grid
 g-x14-y6-z10 - grid
 g-x14-y6-z11 - grid
 g-x14-y6-z12 - grid
 g-x14-y6-z13 - grid
 g-x14-y6-z14 - grid
 g-x14-y6-z15 - grid
 g-x14-y7-z0 - grid
 g-x14-y7-z1 - grid
 g-x14-y7-z2 - grid
 g-x14-y7-z3 - grid
 g-x14-y7-z4 - grid
 g-x14-y7-z5 - grid
 g-x14-y7-z6 - grid
 g-x14-y7-z7 - grid
 g-x14-y7-z8 - grid
 g-x14-y7-z9 - grid
 g-x14-y7-z10 - grid
 g-x14-y7-z11 - grid
 g-x14-y7-z12 - grid
 g-x14-y7-z13 - grid
 g-x14-y7-z14 - grid
 g-x14-y7-z15 - grid
 g-x14-y8-z0 - grid
 g-x14-y8-z1 - grid
 g-x14-y8-z2 - grid
 g-x14-y8-z3 - grid
 g-x14-y8-z4 - grid
 g-x14-y8-z5 - grid
 g-x14-y8-z6 - grid
 g-x14-y8-z7 - grid
 g-x14-y8-z8 - grid
 g-x14-y8-z9 - grid
 g-x14-y8-z10 - grid
 g-x14-y8-z11 - grid
 g-x14-y8-z12 - grid
 g-x14-y8-z13 - grid
 g-x14-y8-z14 - grid
 g-x14-y8-z15 - grid
 g-x14-y9-z0 - grid
 g-x14-y9-z1 - grid
 g-x14-y9-z2 - grid
 g-x14-y9-z3 - grid
 g-x14-y9-z4 - grid
 g-x14-y9-z5 - grid
 g-x14-y9-z6 - grid
 g-x14-y9-z7 - grid
 g-x14-y9-z8 - grid
 g-x14-y9-z9 - grid
 g-x14-y9-z10 - grid
 g-x14-y9-z11 - grid
 g-x14-y9-z12 - grid
 g-x14-y9-z13 - grid
 g-x14-y9-z14 - grid
 g-x14-y9-z15 - grid
 g-x14-y10-z0 - grid
 g-x14-y10-z1 - grid
 g-x14-y10-z2 - grid
 g-x14-y10-z3 - grid
 g-x14-y10-z4 - grid
 g-x14-y10-z5 - grid
 g-x14-y10-z6 - grid
 g-x14-y10-z7 - grid
 g-x14-y10-z8 - grid
 g-x14-y10-z9 - grid
 g-x14-y10-z10 - grid
 g-x14-y10-z11 - grid
 g-x14-y10-z12 - grid
 g-x14-y10-z13 - grid
 g-x14-y10-z14 - grid
 g-x14-y10-z15 - grid
 g-x14-y11-z0 - grid
 g-x14-y11-z1 - grid
 g-x14-y11-z2 - grid
 g-x14-y11-z3 - grid
 g-x14-y11-z4 - grid
 g-x14-y11-z5 - grid
 g-x14-y11-z6 - grid
 g-x14-y11-z7 - grid
 g-x14-y11-z8 - grid
 g-x14-y11-z9 - grid
 g-x14-y11-z10 - grid
 g-x14-y11-z11 - grid
 g-x14-y11-z12 - grid
 g-x14-y11-z13 - grid
 g-x14-y11-z14 - grid
 g-x14-y11-z15 - grid
 g-x14-y12-z0 - grid
 g-x14-y12-z1 - grid
 g-x14-y12-z2 - grid
 g-x14-y12-z3 - grid
 g-x14-y12-z4 - grid
 g-x14-y12-z5 - grid
 g-x14-y12-z6 - grid
 g-x14-y12-z7 - grid
 g-x14-y12-z8 - grid
 g-x14-y12-z9 - grid
 g-x14-y12-z10 - grid
 g-x14-y12-z11 - grid
 g-x14-y12-z12 - grid
 g-x14-y12-z13 - grid
 g-x14-y12-z14 - grid
 g-x14-y12-z15 - grid
 g-x14-y13-z0 - grid
 g-x14-y13-z1 - grid
 g-x14-y13-z2 - grid
 g-x14-y13-z3 - grid
 g-x14-y13-z4 - grid
 g-x14-y13-z5 - grid
 g-x14-y13-z6 - grid
 g-x14-y13-z7 - grid
 g-x14-y13-z8 - grid
 g-x14-y13-z9 - grid
 g-x14-y13-z10 - grid
 g-x14-y13-z11 - grid
 g-x14-y13-z12 - grid
 g-x14-y13-z13 - grid
 g-x14-y13-z14 - grid
 g-x14-y13-z15 - grid
 g-x14-y14-z0 - grid
 g-x14-y14-z1 - grid
 g-x14-y14-z2 - grid
 g-x14-y14-z3 - grid
 g-x14-y14-z4 - grid
 g-x14-y14-z5 - grid
 g-x14-y14-z6 - grid
 g-x14-y14-z7 - grid
 g-x14-y14-z8 - grid
 g-x14-y14-z9 - grid
 g-x14-y14-z10 - grid
 g-x14-y14-z11 - grid
 g-x14-y14-z12 - grid
 g-x14-y14-z13 - grid
 g-x14-y14-z14 - grid
 g-x14-y14-z15 - grid
 g-x14-y15-z0 - grid
 g-x14-y15-z1 - grid
 g-x14-y15-z2 - grid
 g-x14-y15-z3 - grid
 g-x14-y15-z4 - grid
 g-x14-y15-z5 - grid
 g-x14-y15-z6 - grid
 g-x14-y15-z7 - grid
 g-x14-y15-z8 - grid
 g-x14-y15-z9 - grid
 g-x14-y15-z10 - grid
 g-x14-y15-z11 - grid
 g-x14-y15-z12 - grid
 g-x14-y15-z13 - grid
 g-x14-y15-z14 - grid
 g-x14-y15-z15 - grid
 g-x15-y0-z0 - grid
 g-x15-y0-z1 - grid
 g-x15-y0-z2 - grid
 g-x15-y0-z3 - grid
 g-x15-y0-z4 - grid
 g-x15-y0-z5 - grid
 g-x15-y0-z6 - grid
 g-x15-y0-z7 - grid
 g-x15-y0-z8 - grid
 g-x15-y0-z9 - grid
 g-x15-y0-z10 - grid
 g-x15-y0-z11 - grid
 g-x15-y0-z12 - grid
 g-x15-y0-z13 - grid
 g-x15-y0-z14 - grid
 g-x15-y0-z15 - grid
 g-x15-y1-z0 - grid
 g-x15-y1-z1 - grid
 g-x15-y1-z2 - grid
 g-x15-y1-z3 - grid
 g-x15-y1-z4 - grid
 g-x15-y1-z5 - grid
 g-x15-y1-z6 - grid
 g-x15-y1-z7 - grid
 g-x15-y1-z8 - grid
 g-x15-y1-z9 - grid
 g-x15-y1-z10 - grid
 g-x15-y1-z11 - grid
 g-x15-y1-z12 - grid
 g-x15-y1-z13 - grid
 g-x15-y1-z14 - grid
 g-x15-y1-z15 - grid
 g-x15-y2-z0 - grid
 g-x15-y2-z1 - grid
 g-x15-y2-z2 - grid
 g-x15-y2-z3 - grid
 g-x15-y2-z4 - grid
 g-x15-y2-z5 - grid
 g-x15-y2-z6 - grid
 g-x15-y2-z7 - grid
 g-x15-y2-z8 - grid
 g-x15-y2-z9 - grid
 g-x15-y2-z10 - grid
 g-x15-y2-z11 - grid
 g-x15-y2-z12 - grid
 g-x15-y2-z13 - grid
 g-x15-y2-z14 - grid
 g-x15-y2-z15 - grid
 g-x15-y3-z0 - grid
 g-x15-y3-z1 - grid
 g-x15-y3-z2 - grid
 g-x15-y3-z3 - grid
 g-x15-y3-z4 - grid
 g-x15-y3-z5 - grid
 g-x15-y3-z6 - grid
 g-x15-y3-z7 - grid
 g-x15-y3-z8 - grid
 g-x15-y3-z9 - grid
 g-x15-y3-z10 - grid
 g-x15-y3-z11 - grid
 g-x15-y3-z12 - grid
 g-x15-y3-z13 - grid
 g-x15-y3-z14 - grid
 g-x15-y3-z15 - grid
 g-x15-y4-z0 - grid
 g-x15-y4-z1 - grid
 g-x15-y4-z2 - grid
 g-x15-y4-z3 - grid
 g-x15-y4-z4 - grid
 g-x15-y4-z5 - grid
 g-x15-y4-z6 - grid
 g-x15-y4-z7 - grid
 g-x15-y4-z8 - grid
 g-x15-y4-z9 - grid
 g-x15-y4-z10 - grid
 g-x15-y4-z11 - grid
 g-x15-y4-z12 - grid
 g-x15-y4-z13 - grid
 g-x15-y4-z14 - grid
 g-x15-y4-z15 - grid
 g-x15-y5-z0 - grid
 g-x15-y5-z1 - grid
 g-x15-y5-z2 - grid
 g-x15-y5-z3 - grid
 g-x15-y5-z4 - grid
 g-x15-y5-z5 - grid
 g-x15-y5-z6 - grid
 g-x15-y5-z7 - grid
 g-x15-y5-z8 - grid
 g-x15-y5-z9 - grid
 g-x15-y5-z10 - grid
 g-x15-y5-z11 - grid
 g-x15-y5-z12 - grid
 g-x15-y5-z13 - grid
 g-x15-y5-z14 - grid
 g-x15-y5-z15 - grid
 g-x15-y6-z0 - grid
 g-x15-y6-z1 - grid
 g-x15-y6-z2 - grid
 g-x15-y6-z3 - grid
 g-x15-y6-z4 - grid
 g-x15-y6-z5 - grid
 g-x15-y6-z6 - grid
 g-x15-y6-z7 - grid
 g-x15-y6-z8 - grid
 g-x15-y6-z9 - grid
 g-x15-y6-z10 - grid
 g-x15-y6-z11 - grid
 g-x15-y6-z12 - grid
 g-x15-y6-z13 - grid
 g-x15-y6-z14 - grid
 g-x15-y6-z15 - grid
 g-x15-y7-z0 - grid
 g-x15-y7-z1 - grid
 g-x15-y7-z2 - grid
 g-x15-y7-z3 - grid
 g-x15-y7-z4 - grid
 g-x15-y7-z5 - grid
 g-x15-y7-z6 - grid
 g-x15-y7-z7 - grid
 g-x15-y7-z8 - grid
 g-x15-y7-z9 - grid
 g-x15-y7-z10 - grid
 g-x15-y7-z11 - grid
 g-x15-y7-z12 - grid
 g-x15-y7-z13 - grid
 g-x15-y7-z14 - grid
 g-x15-y7-z15 - grid
 g-x15-y8-z0 - grid
 g-x15-y8-z1 - grid
 g-x15-y8-z2 - grid
 g-x15-y8-z3 - grid
 g-x15-y8-z4 - grid
 g-x15-y8-z5 - grid
 g-x15-y8-z6 - grid
 g-x15-y8-z7 - grid
 g-x15-y8-z8 - grid
 g-x15-y8-z9 - grid
 g-x15-y8-z10 - grid
 g-x15-y8-z11 - grid
 g-x15-y8-z12 - grid
 g-x15-y8-z13 - grid
 g-x15-y8-z14 - grid
 g-x15-y8-z15 - grid
 g-x15-y9-z0 - grid
 g-x15-y9-z1 - grid
 g-x15-y9-z2 - grid
 g-x15-y9-z3 - grid
 g-x15-y9-z4 - grid
 g-x15-y9-z5 - grid
 g-x15-y9-z6 - grid
 g-x15-y9-z7 - grid
 g-x15-y9-z8 - grid
 g-x15-y9-z9 - grid
 g-x15-y9-z10 - grid
 g-x15-y9-z11 - grid
 g-x15-y9-z12 - grid
 g-x15-y9-z13 - grid
 g-x15-y9-z14 - grid
 g-x15-y9-z15 - grid
 g-x15-y10-z0 - grid
 g-x15-y10-z1 - grid
 g-x15-y10-z2 - grid
 g-x15-y10-z3 - grid
 g-x15-y10-z4 - grid
 g-x15-y10-z5 - grid
 g-x15-y10-z6 - grid
 g-x15-y10-z7 - grid
 g-x15-y10-z8 - grid
 g-x15-y10-z9 - grid
 g-x15-y10-z10 - grid
 g-x15-y10-z11 - grid
 g-x15-y10-z12 - grid
 g-x15-y10-z13 - grid
 g-x15-y10-z14 - grid
 g-x15-y10-z15 - grid
 g-x15-y11-z0 - grid
 g-x15-y11-z1 - grid
 g-x15-y11-z2 - grid
 g-x15-y11-z3 - grid
 g-x15-y11-z4 - grid
 g-x15-y11-z5 - grid
 g-x15-y11-z6 - grid
 g-x15-y11-z7 - grid
 g-x15-y11-z8 - grid
 g-x15-y11-z9 - grid
 g-x15-y11-z10 - grid
 g-x15-y11-z11 - grid
 g-x15-y11-z12 - grid
 g-x15-y11-z13 - grid
 g-x15-y11-z14 - grid
 g-x15-y11-z15 - grid
 g-x15-y12-z0 - grid
 g-x15-y12-z1 - grid
 g-x15-y12-z2 - grid
 g-x15-y12-z3 - grid
 g-x15-y12-z4 - grid
 g-x15-y12-z5 - grid
 g-x15-y12-z6 - grid
 g-x15-y12-z7 - grid
 g-x15-y12-z8 - grid
 g-x15-y12-z9 - grid
 g-x15-y12-z10 - grid
 g-x15-y12-z11 - grid
 g-x15-y12-z12 - grid
 g-x15-y12-z13 - grid
 g-x15-y12-z14 - grid
 g-x15-y12-z15 - grid
 g-x15-y13-z0 - grid
 g-x15-y13-z1 - grid
 g-x15-y13-z2 - grid
 g-x15-y13-z3 - grid
 g-x15-y13-z4 - grid
 g-x15-y13-z5 - grid
 g-x15-y13-z6 - grid
 g-x15-y13-z7 - grid
 g-x15-y13-z8 - grid
 g-x15-y13-z9 - grid
 g-x15-y13-z10 - grid
 g-x15-y13-z11 - grid
 g-x15-y13-z12 - grid
 g-x15-y13-z13 - grid
 g-x15-y13-z14 - grid
 g-x15-y13-z15 - grid
 g-x15-y14-z0 - grid
 g-x15-y14-z1 - grid
 g-x15-y14-z2 - grid
 g-x15-y14-z3 - grid
 g-x15-y14-z4 - grid
 g-x15-y14-z5 - grid
 g-x15-y14-z6 - grid
 g-x15-y14-z7 - grid
 g-x15-y14-z8 - grid
 g-x15-y14-z9 - grid
 g-x15-y14-z10 - grid
 g-x15-y14-z11 - grid
 g-x15-y14-z12 - grid
 g-x15-y14-z13 - grid
 g-x15-y14-z14 - grid
 g-x15-y14-z15 - grid
 g-x15-y15-z0 - grid
 g-x15-y15-z1 - grid
 g-x15-y15-z2 - grid
 g-x15-y15-z3 - grid
 g-x15-y15-z4 - grid
 g-x15-y15-z5 - grid
 g-x15-y15-z6 - grid
 g-x15-y15-z7 - grid
 g-x15-y15-z8 - grid
 g-x15-y15-z9 - grid
 g-x15-y15-z10 - grid
 g-x15-y15-z11 - grid
 g-x15-y15-z12 - grid
 g-x15-y15-z13 - grid
 g-x15-y15-z14 - grid
 g-x15-y15-z15 - grid
 tag0 - TAG_TYPE ; (pathselected a1) (not (pathselected a2))
 tag1 - TAG_TYPE ; (not (pathselected a1)) (pathselected a2)
 V_TRUE - VALUE_TYPE
 V_FALSE - VALUE_TYPE
)

(:predicates
(at ?r - rocket ?x - grid)
(Kat ?r - rocket ?x - grid)
(KNat ?r - rocket ?x - grid)
(KGivenat ?r - rocket ?x - grid ?TAG_PARAM - TAG_TYPE ?V_PARAM - VALUE_TYPE)
(turn ?r - rocket)
(adj ?x - grid ?y - grid)
(isblown ?x - blow)
(launchdfrom ?g - grid)
(blurlocation ?r - rocket)
(Kblurlocation ?r - rocket)
(KNblurlocation ?r - rocket)
(KGivenblurlocation ?r - rocket ?TAG_PARAM - TAG_TYPE ?V_PARAM - VALUE_TYPE)
(initlocation ?r - rocket)
(Kinitlocation ?r - rocket)
(KNinitlocation ?r - rocket)
(KGiveninitlocation ?r - rocket ?TAG_PARAM - TAG_TYPE ?V_PARAM - VALUE_TYPE)
(blurpath ?r - rocket)
(pathselected ?p - patha)
(Kpathselected ?p - patha)
(KNpathselected ?p - patha)
(KGivenpathselected ?p - patha ?TAG_PARAM - TAG_TYPE ?V_PARAM - VALUE_TYPE)
(KNot ?TAG_PARAM - TAG_TYPE)
)

(:action launchd
:parameters ( ?x - grid)
:precondition 
(and (turn d) (launchdfrom ?x) (blurlocation d) (Kblurlocation d))
:effect 
(and (at d ?x) (not (blurlocation d)) (Kat d ?x) (not (KNat d ?x)) (KGivenat d ?x tag0 V_TRUE) (not (KGivenat d ?x tag0 V_FALSE)) (KGivenat d ?x tag1 V_TRUE) (not (KGivenat d ?x tag1 V_FALSE)) (KNblurlocation d) (not (Kblurlocation d)) (KGivenblurlocation d tag0 V_FALSE) (not (KGivenblurlocation d tag0 V_TRUE)) (KGivenblurlocation d tag1 V_FALSE) (not (KGivenblurlocation d tag1 V_TRUE)))
)
(:action waitbeforelaunchd
:precondition 
(and (turn d) (blurlocation d) (Kblurlocation d))
:effect 
(and (not (turn d)) (turn a))
)
(:action moved
:parameters ( ?x - grid ?y - grid)
:precondition 
(and (at d ?x) (turn d) (adj ?x ?y) (Kat d ?x))
:effect 
(and (at d ?y) (not (at d ?x)) (not (turn d)) (turn a) (Kat d ?y) (not (KNat d ?y)) (KGivenat d ?y tag0 V_TRUE) (not (KGivenat d ?y tag0 V_FALSE)) (KGivenat d ?y tag1 V_TRUE) (not (KGivenat d ?y tag1 V_FALSE)) (KNat d ?x) (not (Kat d ?x)) (KGivenat d ?x tag0 V_FALSE) (not (KGivenat d ?x tag0 V_TRUE)) (KGivenat d ?x tag1 V_FALSE) (not (KGivenat d ?x tag1 V_TRUE)))
)
(:action observe-T
:parameters ( ?x - patha)
:precondition 
(and (turn a) (pathselected ?x))
:effect (Kpathselected ?x)
)
(:action observe-F
:parameters ( ?x - patha)
:precondition 
(and (turn a) (not (pathselected ?x)))
:effect (KNpathselected ?x)
)
(:action movea_g-x1-y0-z0___g-x1-y0-z1___1
:precondition 
(and (turn a) (initlocation a) (at a g-x1-y0-z0) (pathselected a1) (Kinitlocation a) (Kat a g-x1-y0-z0) (Kpathselected a1))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x1-y0-z0)) (at a g-x1-y0-z1) (KNat a g-x1-y0-z0) (not (Kat a g-x1-y0-z0)) (KGivenat a g-x1-y0-z0 tag0 V_FALSE) (not (KGivenat a g-x1-y0-z0 tag0 V_TRUE)) (KGivenat a g-x1-y0-z0 tag1 V_FALSE) (not (KGivenat a g-x1-y0-z0 tag1 V_TRUE)) (Kat a g-x1-y0-z1) (not (KNat a g-x1-y0-z1)) (KGivenat a g-x1-y0-z1 tag0 V_TRUE) (not (KGivenat a g-x1-y0-z1 tag0 V_FALSE)) (KGivenat a g-x1-y0-z1 tag1 V_TRUE) (not (KGivenat a g-x1-y0-z1 tag1 V_FALSE)))
)
(:action movea_g-x1-y0-z1___g-x1-y1-z1___1
:precondition 
(and (turn a) (initlocation a) (at a g-x1-y0-z1) (pathselected a1) (Kinitlocation a) (Kat a g-x1-y0-z1) (Kpathselected a1))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x1-y0-z1)) (at a g-x1-y1-z1) (KNat a g-x1-y0-z1) (not (Kat a g-x1-y0-z1)) (KGivenat a g-x1-y0-z1 tag0 V_FALSE) (not (KGivenat a g-x1-y0-z1 tag0 V_TRUE)) (KGivenat a g-x1-y0-z1 tag1 V_FALSE) (not (KGivenat a g-x1-y0-z1 tag1 V_TRUE)) (Kat a g-x1-y1-z1) (not (KNat a g-x1-y1-z1)) (KGivenat a g-x1-y1-z1 tag0 V_TRUE) (not (KGivenat a g-x1-y1-z1 tag0 V_FALSE)) (KGivenat a g-x1-y1-z1 tag1 V_TRUE) (not (KGivenat a g-x1-y1-z1 tag1 V_FALSE)))
)
(:action movea_g-x1-y1-z1___g-x1-y1-z2___1
:precondition 
(and (turn a) (initlocation a) (at a g-x1-y1-z1) (pathselected a1) (Kinitlocation a) (Kat a g-x1-y1-z1) (Kpathselected a1))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x1-y1-z1)) (at a g-x1-y1-z2) (KNat a g-x1-y1-z1) (not (Kat a g-x1-y1-z1)) (KGivenat a g-x1-y1-z1 tag0 V_FALSE) (not (KGivenat a g-x1-y1-z1 tag0 V_TRUE)) (KGivenat a g-x1-y1-z1 tag1 V_FALSE) (not (KGivenat a g-x1-y1-z1 tag1 V_TRUE)) (Kat a g-x1-y1-z2) (not (KNat a g-x1-y1-z2)) (KGivenat a g-x1-y1-z2 tag0 V_TRUE) (not (KGivenat a g-x1-y1-z2 tag0 V_FALSE)) (KGivenat a g-x1-y1-z2 tag1 V_TRUE) (not (KGivenat a g-x1-y1-z2 tag1 V_FALSE)))
)
(:action movea_g-x1-y1-z2___g-x1-y2-z2___1
:precondition 
(and (turn a) (initlocation a) (at a g-x1-y1-z2) (pathselected a1) (Kinitlocation a) (Kat a g-x1-y1-z2) (Kpathselected a1))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x1-y1-z2)) (at a g-x1-y2-z2) (KNat a g-x1-y1-z2) (not (Kat a g-x1-y1-z2)) (KGivenat a g-x1-y1-z2 tag0 V_FALSE) (not (KGivenat a g-x1-y1-z2 tag0 V_TRUE)) (KGivenat a g-x1-y1-z2 tag1 V_FALSE) (not (KGivenat a g-x1-y1-z2 tag1 V_TRUE)) (Kat a g-x1-y2-z2) (not (KNat a g-x1-y2-z2)) (KGivenat a g-x1-y2-z2 tag0 V_TRUE) (not (KGivenat a g-x1-y2-z2 tag0 V_FALSE)) (KGivenat a g-x1-y2-z2 tag1 V_TRUE) (not (KGivenat a g-x1-y2-z2 tag1 V_FALSE)))
)
(:action movea_g-x1-y2-z2___g-x1-y2-z3___1
:precondition 
(and (turn a) (initlocation a) (at a g-x1-y2-z2) (pathselected a1) (Kinitlocation a) (Kat a g-x1-y2-z2) (Kpathselected a1))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x1-y2-z2)) (at a g-x1-y2-z3) (KNat a g-x1-y2-z2) (not (Kat a g-x1-y2-z2)) (KGivenat a g-x1-y2-z2 tag0 V_FALSE) (not (KGivenat a g-x1-y2-z2 tag0 V_TRUE)) (KGivenat a g-x1-y2-z2 tag1 V_FALSE) (not (KGivenat a g-x1-y2-z2 tag1 V_TRUE)) (Kat a g-x1-y2-z3) (not (KNat a g-x1-y2-z3)) (KGivenat a g-x1-y2-z3 tag0 V_TRUE) (not (KGivenat a g-x1-y2-z3 tag0 V_FALSE)) (KGivenat a g-x1-y2-z3 tag1 V_TRUE) (not (KGivenat a g-x1-y2-z3 tag1 V_FALSE)))
)
(:action movea_g-x1-y2-z3___g-x1-y2-z4___1
:precondition 
(and (turn a) (initlocation a) (at a g-x1-y2-z3) (pathselected a1) (Kinitlocation a) (Kat a g-x1-y2-z3) (Kpathselected a1))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x1-y2-z3)) (at a g-x1-y2-z4) (KNat a g-x1-y2-z3) (not (Kat a g-x1-y2-z3)) (KGivenat a g-x1-y2-z3 tag0 V_FALSE) (not (KGivenat a g-x1-y2-z3 tag0 V_TRUE)) (KGivenat a g-x1-y2-z3 tag1 V_FALSE) (not (KGivenat a g-x1-y2-z3 tag1 V_TRUE)) (Kat a g-x1-y2-z4) (not (KNat a g-x1-y2-z4)) (KGivenat a g-x1-y2-z4 tag0 V_TRUE) (not (KGivenat a g-x1-y2-z4 tag0 V_FALSE)) (KGivenat a g-x1-y2-z4 tag1 V_TRUE) (not (KGivenat a g-x1-y2-z4 tag1 V_FALSE)))
)
(:action movea_g-x1-y2-z4___g-x1-y3-z4___1
:precondition 
(and (turn a) (initlocation a) (at a g-x1-y2-z4) (pathselected a1) (Kinitlocation a) (Kat a g-x1-y2-z4) (Kpathselected a1))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x1-y2-z4)) (at a g-x1-y3-z4) (KNat a g-x1-y2-z4) (not (Kat a g-x1-y2-z4)) (KGivenat a g-x1-y2-z4 tag0 V_FALSE) (not (KGivenat a g-x1-y2-z4 tag0 V_TRUE)) (KGivenat a g-x1-y2-z4 tag1 V_FALSE) (not (KGivenat a g-x1-y2-z4 tag1 V_TRUE)) (Kat a g-x1-y3-z4) (not (KNat a g-x1-y3-z4)) (KGivenat a g-x1-y3-z4 tag0 V_TRUE) (not (KGivenat a g-x1-y3-z4 tag0 V_FALSE)) (KGivenat a g-x1-y3-z4 tag1 V_TRUE) (not (KGivenat a g-x1-y3-z4 tag1 V_FALSE)))
)
(:action movea_g-x1-y3-z4___g-x1-y3-z5___1
:precondition 
(and (turn a) (initlocation a) (at a g-x1-y3-z4) (pathselected a1) (Kinitlocation a) (Kat a g-x1-y3-z4) (Kpathselected a1))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x1-y3-z4)) (at a g-x1-y3-z5) (KNat a g-x1-y3-z4) (not (Kat a g-x1-y3-z4)) (KGivenat a g-x1-y3-z4 tag0 V_FALSE) (not (KGivenat a g-x1-y3-z4 tag0 V_TRUE)) (KGivenat a g-x1-y3-z4 tag1 V_FALSE) (not (KGivenat a g-x1-y3-z4 tag1 V_TRUE)) (Kat a g-x1-y3-z5) (not (KNat a g-x1-y3-z5)) (KGivenat a g-x1-y3-z5 tag0 V_TRUE) (not (KGivenat a g-x1-y3-z5 tag0 V_FALSE)) (KGivenat a g-x1-y3-z5 tag1 V_TRUE) (not (KGivenat a g-x1-y3-z5 tag1 V_FALSE)))
)
(:action movea_g-x1-y3-z5___g-x1-y4-z5___1
:precondition 
(and (turn a) (initlocation a) (at a g-x1-y3-z5) (pathselected a1) (Kinitlocation a) (Kat a g-x1-y3-z5) (Kpathselected a1))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x1-y3-z5)) (at a g-x1-y4-z5) (KNat a g-x1-y3-z5) (not (Kat a g-x1-y3-z5)) (KGivenat a g-x1-y3-z5 tag0 V_FALSE) (not (KGivenat a g-x1-y3-z5 tag0 V_TRUE)) (KGivenat a g-x1-y3-z5 tag1 V_FALSE) (not (KGivenat a g-x1-y3-z5 tag1 V_TRUE)) (Kat a g-x1-y4-z5) (not (KNat a g-x1-y4-z5)) (KGivenat a g-x1-y4-z5 tag0 V_TRUE) (not (KGivenat a g-x1-y4-z5 tag0 V_FALSE)) (KGivenat a g-x1-y4-z5 tag1 V_TRUE) (not (KGivenat a g-x1-y4-z5 tag1 V_FALSE)))
)
(:action movea_g-x1-y4-z5___g-x1-y4-z6___1
:precondition 
(and (turn a) (initlocation a) (at a g-x1-y4-z5) (pathselected a1) (Kinitlocation a) (Kat a g-x1-y4-z5) (Kpathselected a1))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x1-y4-z5)) (at a g-x1-y4-z6) (KNat a g-x1-y4-z5) (not (Kat a g-x1-y4-z5)) (KGivenat a g-x1-y4-z5 tag0 V_FALSE) (not (KGivenat a g-x1-y4-z5 tag0 V_TRUE)) (KGivenat a g-x1-y4-z5 tag1 V_FALSE) (not (KGivenat a g-x1-y4-z5 tag1 V_TRUE)) (Kat a g-x1-y4-z6) (not (KNat a g-x1-y4-z6)) (KGivenat a g-x1-y4-z6 tag0 V_TRUE) (not (KGivenat a g-x1-y4-z6 tag0 V_FALSE)) (KGivenat a g-x1-y4-z6 tag1 V_TRUE) (not (KGivenat a g-x1-y4-z6 tag1 V_FALSE)))
)
(:action movea_g-x1-y4-z6___g-x1-y5-z6__1
:precondition 
(and (turn a) (initlocation a) (at a g-x1-y4-z6) (pathselected a1) (Kinitlocation a) (Kat a g-x1-y4-z6) (Kpathselected a1))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x1-y4-z6)) (at a g-x1-y5-z6) (KNat a g-x1-y4-z6) (not (Kat a g-x1-y4-z6)) (KGivenat a g-x1-y4-z6 tag0 V_FALSE) (not (KGivenat a g-x1-y4-z6 tag0 V_TRUE)) (KGivenat a g-x1-y4-z6 tag1 V_FALSE) (not (KGivenat a g-x1-y4-z6 tag1 V_TRUE)) (Kat a g-x1-y5-z6) (not (KNat a g-x1-y5-z6)) (KGivenat a g-x1-y5-z6 tag0 V_TRUE) (not (KGivenat a g-x1-y5-z6 tag0 V_FALSE)) (KGivenat a g-x1-y5-z6 tag1 V_TRUE) (not (KGivenat a g-x1-y5-z6 tag1 V_FALSE)))
)
(:action movea_g-x1-y5-z6___g-x1-y5-z7__1
:precondition 
(and (turn a) (initlocation a) (at a g-x1-y5-z6) (pathselected a1) (Kinitlocation a) (Kat a g-x1-y5-z6) (Kpathselected a1))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x1-y5-z6)) (at a g-x1-y5-z7) (KNat a g-x1-y5-z6) (not (Kat a g-x1-y5-z6)) (KGivenat a g-x1-y5-z6 tag0 V_FALSE) (not (KGivenat a g-x1-y5-z6 tag0 V_TRUE)) (KGivenat a g-x1-y5-z6 tag1 V_FALSE) (not (KGivenat a g-x1-y5-z6 tag1 V_TRUE)) (Kat a g-x1-y5-z7) (not (KNat a g-x1-y5-z7)) (KGivenat a g-x1-y5-z7 tag0 V_TRUE) (not (KGivenat a g-x1-y5-z7 tag0 V_FALSE)) (KGivenat a g-x1-y5-z7 tag1 V_TRUE) (not (KGivenat a g-x1-y5-z7 tag1 V_FALSE)))
)
(:action movea_g-x1-y5-z7___g-x1-y6-z7__1
:precondition 
(and (turn a) (initlocation a) (at a g-x1-y5-z7) (pathselected a1) (Kinitlocation a) (Kat a g-x1-y5-z7) (Kpathselected a1))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x1-y5-z7)) (at a g-x1-y6-z7) (KNat a g-x1-y5-z7) (not (Kat a g-x1-y5-z7)) (KGivenat a g-x1-y5-z7 tag0 V_FALSE) (not (KGivenat a g-x1-y5-z7 tag0 V_TRUE)) (KGivenat a g-x1-y5-z7 tag1 V_FALSE) (not (KGivenat a g-x1-y5-z7 tag1 V_TRUE)) (Kat a g-x1-y6-z7) (not (KNat a g-x1-y6-z7)) (KGivenat a g-x1-y6-z7 tag0 V_TRUE) (not (KGivenat a g-x1-y6-z7 tag0 V_FALSE)) (KGivenat a g-x1-y6-z7 tag1 V_TRUE) (not (KGivenat a g-x1-y6-z7 tag1 V_FALSE)))
)
(:action movea_g-x1-y6-z7___g-x1-y7-z7__1
:precondition 
(and (turn a) (initlocation a) (at a g-x1-y6-z7) (pathselected a1) (Kinitlocation a) (Kat a g-x1-y6-z7) (Kpathselected a1))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x1-y6-z7)) (at a g-x1-y7-z7) (KNat a g-x1-y6-z7) (not (Kat a g-x1-y6-z7)) (KGivenat a g-x1-y6-z7 tag0 V_FALSE) (not (KGivenat a g-x1-y6-z7 tag0 V_TRUE)) (KGivenat a g-x1-y6-z7 tag1 V_FALSE) (not (KGivenat a g-x1-y6-z7 tag1 V_TRUE)) (Kat a g-x1-y7-z7) (not (KNat a g-x1-y7-z7)) (KGivenat a g-x1-y7-z7 tag0 V_TRUE) (not (KGivenat a g-x1-y7-z7 tag0 V_FALSE)) (KGivenat a g-x1-y7-z7 tag1 V_TRUE) (not (KGivenat a g-x1-y7-z7 tag1 V_FALSE)))
)
(:action movea_g-x1-y7-z7___g-x1-y7-z8__1
:precondition 
(and (turn a) (initlocation a) (at a g-x1-y7-z7) (pathselected a1) (Kinitlocation a) (Kat a g-x1-y7-z7) (Kpathselected a1))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x1-y7-z7)) (at a g-x1-y7-z8) (KNat a g-x1-y7-z7) (not (Kat a g-x1-y7-z7)) (KGivenat a g-x1-y7-z7 tag0 V_FALSE) (not (KGivenat a g-x1-y7-z7 tag0 V_TRUE)) (KGivenat a g-x1-y7-z7 tag1 V_FALSE) (not (KGivenat a g-x1-y7-z7 tag1 V_TRUE)) (Kat a g-x1-y7-z8) (not (KNat a g-x1-y7-z8)) (KGivenat a g-x1-y7-z8 tag0 V_TRUE) (not (KGivenat a g-x1-y7-z8 tag0 V_FALSE)) (KGivenat a g-x1-y7-z8 tag1 V_TRUE) (not (KGivenat a g-x1-y7-z8 tag1 V_FALSE)))
)
(:action movea_g-x1-y7-z8___g-x1-y8-z8__1
:precondition 
(and (turn a) (initlocation a) (at a g-x1-y7-z8) (pathselected a1) (Kinitlocation a) (Kat a g-x1-y7-z8) (Kpathselected a1))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x1-y7-z8)) (at a g-x1-y8-z8) (KNat a g-x1-y7-z8) (not (Kat a g-x1-y7-z8)) (KGivenat a g-x1-y7-z8 tag0 V_FALSE) (not (KGivenat a g-x1-y7-z8 tag0 V_TRUE)) (KGivenat a g-x1-y7-z8 tag1 V_FALSE) (not (KGivenat a g-x1-y7-z8 tag1 V_TRUE)) (Kat a g-x1-y8-z8) (not (KNat a g-x1-y8-z8)) (KGivenat a g-x1-y8-z8 tag0 V_TRUE) (not (KGivenat a g-x1-y8-z8 tag0 V_FALSE)) (KGivenat a g-x1-y8-z8 tag1 V_TRUE) (not (KGivenat a g-x1-y8-z8 tag1 V_FALSE)))
)
(:action movea_g-x1-y8-z8___g-x1-y8-z9__1
:precondition 
(and (turn a) (initlocation a) (at a g-x1-y8-z8) (pathselected a1) (Kinitlocation a) (Kat a g-x1-y8-z8) (Kpathselected a1))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x1-y8-z8)) (at a g-x1-y8-z9) (KNat a g-x1-y8-z8) (not (Kat a g-x1-y8-z8)) (KGivenat a g-x1-y8-z8 tag0 V_FALSE) (not (KGivenat a g-x1-y8-z8 tag0 V_TRUE)) (KGivenat a g-x1-y8-z8 tag1 V_FALSE) (not (KGivenat a g-x1-y8-z8 tag1 V_TRUE)) (Kat a g-x1-y8-z9) (not (KNat a g-x1-y8-z9)) (KGivenat a g-x1-y8-z9 tag0 V_TRUE) (not (KGivenat a g-x1-y8-z9 tag0 V_FALSE)) (KGivenat a g-x1-y8-z9 tag1 V_TRUE) (not (KGivenat a g-x1-y8-z9 tag1 V_FALSE)))
)
(:action movea_g-x1-y8-z9___g-x1-y9-z9__1
:precondition 
(and (turn a) (initlocation a) (at a g-x1-y8-z9) (pathselected a1) (Kinitlocation a) (Kat a g-x1-y8-z9) (Kpathselected a1))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x1-y8-z9)) (at a g-x1-y9-z9) (KNat a g-x1-y8-z9) (not (Kat a g-x1-y8-z9)) (KGivenat a g-x1-y8-z9 tag0 V_FALSE) (not (KGivenat a g-x1-y8-z9 tag0 V_TRUE)) (KGivenat a g-x1-y8-z9 tag1 V_FALSE) (not (KGivenat a g-x1-y8-z9 tag1 V_TRUE)) (Kat a g-x1-y9-z9) (not (KNat a g-x1-y9-z9)) (KGivenat a g-x1-y9-z9 tag0 V_TRUE) (not (KGivenat a g-x1-y9-z9 tag0 V_FALSE)) (KGivenat a g-x1-y9-z9 tag1 V_TRUE) (not (KGivenat a g-x1-y9-z9 tag1 V_FALSE)))
)
(:action movea_g-x1-y9-z9___g-x1-y9-z10__1
:precondition 
(and (turn a) (initlocation a) (at a g-x1-y9-z9) (pathselected a1) (Kinitlocation a) (Kat a g-x1-y9-z9) (Kpathselected a1))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x1-y9-z9)) (at a g-x1-y9-z10) (KNat a g-x1-y9-z9) (not (Kat a g-x1-y9-z9)) (KGivenat a g-x1-y9-z9 tag0 V_FALSE) (not (KGivenat a g-x1-y9-z9 tag0 V_TRUE)) (KGivenat a g-x1-y9-z9 tag1 V_FALSE) (not (KGivenat a g-x1-y9-z9 tag1 V_TRUE)) (Kat a g-x1-y9-z10) (not (KNat a g-x1-y9-z10)) (KGivenat a g-x1-y9-z10 tag0 V_TRUE) (not (KGivenat a g-x1-y9-z10 tag0 V_FALSE)) (KGivenat a g-x1-y9-z10 tag1 V_TRUE) (not (KGivenat a g-x1-y9-z10 tag1 V_FALSE)))
)
(:action movea_g-x1-y9-z10___g-x1-y9-z11__1
:precondition 
(and (turn a) (initlocation a) (at a g-x1-y9-z10) (pathselected a1) (Kinitlocation a) (Kat a g-x1-y9-z10) (Kpathselected a1))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x1-y9-z10)) (at a g-x1-y9-z11) (KNat a g-x1-y9-z10) (not (Kat a g-x1-y9-z10)) (KGivenat a g-x1-y9-z10 tag0 V_FALSE) (not (KGivenat a g-x1-y9-z10 tag0 V_TRUE)) (KGivenat a g-x1-y9-z10 tag1 V_FALSE) (not (KGivenat a g-x1-y9-z10 tag1 V_TRUE)) (Kat a g-x1-y9-z11) (not (KNat a g-x1-y9-z11)) (KGivenat a g-x1-y9-z11 tag0 V_TRUE) (not (KGivenat a g-x1-y9-z11 tag0 V_FALSE)) (KGivenat a g-x1-y9-z11 tag1 V_TRUE) (not (KGivenat a g-x1-y9-z11 tag1 V_FALSE)))
)
(:action movea_g-x1-y9-z11___g-x1-y9-z12__1
:precondition 
(and (turn a) (initlocation a) (at a g-x1-y9-z11) (pathselected a1) (Kinitlocation a) (Kat a g-x1-y9-z11) (Kpathselected a1))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x1-y9-z11)) (at a g-x1-y9-z12) (KNat a g-x1-y9-z11) (not (Kat a g-x1-y9-z11)) (KGivenat a g-x1-y9-z11 tag0 V_FALSE) (not (KGivenat a g-x1-y9-z11 tag0 V_TRUE)) (KGivenat a g-x1-y9-z11 tag1 V_FALSE) (not (KGivenat a g-x1-y9-z11 tag1 V_TRUE)) (Kat a g-x1-y9-z12) (not (KNat a g-x1-y9-z12)) (KGivenat a g-x1-y9-z12 tag0 V_TRUE) (not (KGivenat a g-x1-y9-z12 tag0 V_FALSE)) (KGivenat a g-x1-y9-z12 tag1 V_TRUE) (not (KGivenat a g-x1-y9-z12 tag1 V_FALSE)))
)
(:action movea_g-x1-y9-z12___g-x1-y10-z12__1
:precondition 
(and (turn a) (initlocation a) (at a g-x1-y9-z12) (pathselected a1) (Kinitlocation a) (Kat a g-x1-y9-z12) (Kpathselected a1))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x1-y9-z12)) (at a g-x1-y10-z12) (KNat a g-x1-y9-z12) (not (Kat a g-x1-y9-z12)) (KGivenat a g-x1-y9-z12 tag0 V_FALSE) (not (KGivenat a g-x1-y9-z12 tag0 V_TRUE)) (KGivenat a g-x1-y9-z12 tag1 V_FALSE) (not (KGivenat a g-x1-y9-z12 tag1 V_TRUE)) (Kat a g-x1-y10-z12) (not (KNat a g-x1-y10-z12)) (KGivenat a g-x1-y10-z12 tag0 V_TRUE) (not (KGivenat a g-x1-y10-z12 tag0 V_FALSE)) (KGivenat a g-x1-y10-z12 tag1 V_TRUE) (not (KGivenat a g-x1-y10-z12 tag1 V_FALSE)))
)
(:action movea_g-x1-y10-z12___g-x1-y10-z13__1
:precondition 
(and (turn a) (initlocation a) (at a g-x1-y10-z12) (pathselected a1) (Kinitlocation a) (Kat a g-x1-y10-z12) (Kpathselected a1))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x1-y10-z12)) (at a g-x1-y10-z13) (KNat a g-x1-y10-z12) (not (Kat a g-x1-y10-z12)) (KGivenat a g-x1-y10-z12 tag0 V_FALSE) (not (KGivenat a g-x1-y10-z12 tag0 V_TRUE)) (KGivenat a g-x1-y10-z12 tag1 V_FALSE) (not (KGivenat a g-x1-y10-z12 tag1 V_TRUE)) (Kat a g-x1-y10-z13) (not (KNat a g-x1-y10-z13)) (KGivenat a g-x1-y10-z13 tag0 V_TRUE) (not (KGivenat a g-x1-y10-z13 tag0 V_FALSE)) (KGivenat a g-x1-y10-z13 tag1 V_TRUE) (not (KGivenat a g-x1-y10-z13 tag1 V_FALSE)))
)
(:action movea_g-x1-y10-z13___g-x1-y11-z13__1
:precondition 
(and (turn a) (initlocation a) (at a g-x1-y10-z13) (pathselected a1) (Kinitlocation a) (Kat a g-x1-y10-z13) (Kpathselected a1))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x1-y10-z13)) (at a g-x1-y11-z13) (KNat a g-x1-y10-z13) (not (Kat a g-x1-y10-z13)) (KGivenat a g-x1-y10-z13 tag0 V_FALSE) (not (KGivenat a g-x1-y10-z13 tag0 V_TRUE)) (KGivenat a g-x1-y10-z13 tag1 V_FALSE) (not (KGivenat a g-x1-y10-z13 tag1 V_TRUE)) (Kat a g-x1-y11-z13) (not (KNat a g-x1-y11-z13)) (KGivenat a g-x1-y11-z13 tag0 V_TRUE) (not (KGivenat a g-x1-y11-z13 tag0 V_FALSE)) (KGivenat a g-x1-y11-z13 tag1 V_TRUE) (not (KGivenat a g-x1-y11-z13 tag1 V_FALSE)))
)
(:action movea_g-x1-y11-z13___g-x1-y11-z14__1
:precondition 
(and (turn a) (initlocation a) (at a g-x1-y11-z13) (pathselected a1) (Kinitlocation a) (Kat a g-x1-y11-z13) (Kpathselected a1))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x1-y11-z13)) (at a g-x1-y11-z14) (KNat a g-x1-y11-z13) (not (Kat a g-x1-y11-z13)) (KGivenat a g-x1-y11-z13 tag0 V_FALSE) (not (KGivenat a g-x1-y11-z13 tag0 V_TRUE)) (KGivenat a g-x1-y11-z13 tag1 V_FALSE) (not (KGivenat a g-x1-y11-z13 tag1 V_TRUE)) (Kat a g-x1-y11-z14) (not (KNat a g-x1-y11-z14)) (KGivenat a g-x1-y11-z14 tag0 V_TRUE) (not (KGivenat a g-x1-y11-z14 tag0 V_FALSE)) (KGivenat a g-x1-y11-z14 tag1 V_TRUE) (not (KGivenat a g-x1-y11-z14 tag1 V_FALSE)))
)
(:action movea_g-x1-y11-z14___g-x1-y11-z15__1
:precondition 
(and (turn a) (initlocation a) (at a g-x1-y11-z14) (pathselected a1) (Kinitlocation a) (Kat a g-x1-y11-z14) (Kpathselected a1))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x1-y11-z14)) (at a g-x1-y11-z15) (KNat a g-x1-y11-z14) (not (Kat a g-x1-y11-z14)) (KGivenat a g-x1-y11-z14 tag0 V_FALSE) (not (KGivenat a g-x1-y11-z14 tag0 V_TRUE)) (KGivenat a g-x1-y11-z14 tag1 V_FALSE) (not (KGivenat a g-x1-y11-z14 tag1 V_TRUE)) (Kat a g-x1-y11-z15) (not (KNat a g-x1-y11-z15)) (KGivenat a g-x1-y11-z15 tag0 V_TRUE) (not (KGivenat a g-x1-y11-z15 tag0 V_FALSE)) (KGivenat a g-x1-y11-z15 tag1 V_TRUE) (not (KGivenat a g-x1-y11-z15 tag1 V_FALSE)))
)
(:action movea_g-x1-y11-z15___g-x1-y11-z14__1
:precondition 
(and (turn a) (initlocation a) (at a g-x1-y11-z15) (pathselected a1) (Kinitlocation a) (Kat a g-x1-y11-z15) (Kpathselected a1))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x1-y11-z15)) (at a g-x1-y11-z14) (KNat a g-x1-y11-z15) (not (Kat a g-x1-y11-z15)) (KGivenat a g-x1-y11-z15 tag0 V_FALSE) (not (KGivenat a g-x1-y11-z15 tag0 V_TRUE)) (KGivenat a g-x1-y11-z15 tag1 V_FALSE) (not (KGivenat a g-x1-y11-z15 tag1 V_TRUE)) (Kat a g-x1-y11-z14) (not (KNat a g-x1-y11-z14)) (KGivenat a g-x1-y11-z14 tag0 V_TRUE) (not (KGivenat a g-x1-y11-z14 tag0 V_FALSE)) (KGivenat a g-x1-y11-z14 tag1 V_TRUE) (not (KGivenat a g-x1-y11-z14 tag1 V_FALSE)))
)
(:action movea_g-x1-y11-z14___g-x1-y12-z14__1
:precondition 
(and (turn a) (initlocation a) (at a g-x1-y11-z14) (pathselected a1) (Kinitlocation a) (Kat a g-x1-y11-z14) (Kpathselected a1))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x1-y11-z14)) (at a g-x1-y12-z14) (KNat a g-x1-y11-z14) (not (Kat a g-x1-y11-z14)) (KGivenat a g-x1-y11-z14 tag0 V_FALSE) (not (KGivenat a g-x1-y11-z14 tag0 V_TRUE)) (KGivenat a g-x1-y11-z14 tag1 V_FALSE) (not (KGivenat a g-x1-y11-z14 tag1 V_TRUE)) (Kat a g-x1-y12-z14) (not (KNat a g-x1-y12-z14)) (KGivenat a g-x1-y12-z14 tag0 V_TRUE) (not (KGivenat a g-x1-y12-z14 tag0 V_FALSE)) (KGivenat a g-x1-y12-z14 tag1 V_TRUE) (not (KGivenat a g-x1-y12-z14 tag1 V_FALSE)))
)
(:action movea_g-x1-y12-z14___g-x1-y13-z14__1
:precondition 
(and (turn a) (initlocation a) (at a g-x1-y12-z14) (pathselected a1) (Kinitlocation a) (Kat a g-x1-y12-z14) (Kpathselected a1))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x1-y12-z14)) (at a g-x1-y13-z14) (KNat a g-x1-y12-z14) (not (Kat a g-x1-y12-z14)) (KGivenat a g-x1-y12-z14 tag0 V_FALSE) (not (KGivenat a g-x1-y12-z14 tag0 V_TRUE)) (KGivenat a g-x1-y12-z14 tag1 V_FALSE) (not (KGivenat a g-x1-y12-z14 tag1 V_TRUE)) (Kat a g-x1-y13-z14) (not (KNat a g-x1-y13-z14)) (KGivenat a g-x1-y13-z14 tag0 V_TRUE) (not (KGivenat a g-x1-y13-z14 tag0 V_FALSE)) (KGivenat a g-x1-y13-z14 tag1 V_TRUE) (not (KGivenat a g-x1-y13-z14 tag1 V_FALSE)))
)
(:action movea_g-x1-y13-z14___g-x1-y13-z13__1
:precondition 
(and (turn a) (initlocation a) (at a g-x1-y13-z14) (pathselected a1) (Kinitlocation a) (Kat a g-x1-y13-z14) (Kpathselected a1))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x1-y13-z14)) (at a g-x1-y13-z13) (KNat a g-x1-y13-z14) (not (Kat a g-x1-y13-z14)) (KGivenat a g-x1-y13-z14 tag0 V_FALSE) (not (KGivenat a g-x1-y13-z14 tag0 V_TRUE)) (KGivenat a g-x1-y13-z14 tag1 V_FALSE) (not (KGivenat a g-x1-y13-z14 tag1 V_TRUE)) (Kat a g-x1-y13-z13) (not (KNat a g-x1-y13-z13)) (KGivenat a g-x1-y13-z13 tag0 V_TRUE) (not (KGivenat a g-x1-y13-z13 tag0 V_FALSE)) (KGivenat a g-x1-y13-z13 tag1 V_TRUE) (not (KGivenat a g-x1-y13-z13 tag1 V_FALSE)))
)
(:action movea_g-x1-y13-z13___g-x1-y13-z12__1
:precondition 
(and (turn a) (initlocation a) (at a g-x1-y13-z13) (pathselected a1) (Kinitlocation a) (Kat a g-x1-y13-z13) (Kpathselected a1))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x1-y13-z13)) (at a g-x1-y13-z12) (KNat a g-x1-y13-z13) (not (Kat a g-x1-y13-z13)) (KGivenat a g-x1-y13-z13 tag0 V_FALSE) (not (KGivenat a g-x1-y13-z13 tag0 V_TRUE)) (KGivenat a g-x1-y13-z13 tag1 V_FALSE) (not (KGivenat a g-x1-y13-z13 tag1 V_TRUE)) (Kat a g-x1-y13-z12) (not (KNat a g-x1-y13-z12)) (KGivenat a g-x1-y13-z12 tag0 V_TRUE) (not (KGivenat a g-x1-y13-z12 tag0 V_FALSE)) (KGivenat a g-x1-y13-z12 tag1 V_TRUE) (not (KGivenat a g-x1-y13-z12 tag1 V_FALSE)))
)
(:action movea_g-x1-y13-z12___g-x2-y13-z12__1
:precondition 
(and (turn a) (initlocation a) (at a g-x1-y13-z12) (pathselected a1) (Kinitlocation a) (Kat a g-x1-y13-z12) (Kpathselected a1))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x1-y13-z12)) (at a g-x2-y13-z12) (KNat a g-x1-y13-z12) (not (Kat a g-x1-y13-z12)) (KGivenat a g-x1-y13-z12 tag0 V_FALSE) (not (KGivenat a g-x1-y13-z12 tag0 V_TRUE)) (KGivenat a g-x1-y13-z12 tag1 V_FALSE) (not (KGivenat a g-x1-y13-z12 tag1 V_TRUE)) (Kat a g-x2-y13-z12) (not (KNat a g-x2-y13-z12)) (KGivenat a g-x2-y13-z12 tag0 V_TRUE) (not (KGivenat a g-x2-y13-z12 tag0 V_FALSE)) (KGivenat a g-x2-y13-z12 tag1 V_TRUE) (not (KGivenat a g-x2-y13-z12 tag1 V_FALSE)))
)
(:action movea_g-x2-y13-z12___g-x2-y13-z11__1
:precondition 
(and (turn a) (initlocation a) (at a g-x2-y13-z12) (pathselected a1) (Kinitlocation a) (Kat a g-x2-y13-z12) (Kpathselected a1))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x2-y13-z12)) (at a g-x2-y13-z11) (KNat a g-x2-y13-z12) (not (Kat a g-x2-y13-z12)) (KGivenat a g-x2-y13-z12 tag0 V_FALSE) (not (KGivenat a g-x2-y13-z12 tag0 V_TRUE)) (KGivenat a g-x2-y13-z12 tag1 V_FALSE) (not (KGivenat a g-x2-y13-z12 tag1 V_TRUE)) (Kat a g-x2-y13-z11) (not (KNat a g-x2-y13-z11)) (KGivenat a g-x2-y13-z11 tag0 V_TRUE) (not (KGivenat a g-x2-y13-z11 tag0 V_FALSE)) (KGivenat a g-x2-y13-z11 tag1 V_TRUE) (not (KGivenat a g-x2-y13-z11 tag1 V_FALSE)))
)
(:action movea_g-x2-y13-z11___g-x2-y13-z10__1
:precondition 
(and (turn a) (initlocation a) (at a g-x2-y13-z11) (pathselected a1) (Kinitlocation a) (Kat a g-x2-y13-z11) (Kpathselected a1))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x2-y13-z11)) (at a g-x2-y13-z10) (KNat a g-x2-y13-z11) (not (Kat a g-x2-y13-z11)) (KGivenat a g-x2-y13-z11 tag0 V_FALSE) (not (KGivenat a g-x2-y13-z11 tag0 V_TRUE)) (KGivenat a g-x2-y13-z11 tag1 V_FALSE) (not (KGivenat a g-x2-y13-z11 tag1 V_TRUE)) (Kat a g-x2-y13-z10) (not (KNat a g-x2-y13-z10)) (KGivenat a g-x2-y13-z10 tag0 V_TRUE) (not (KGivenat a g-x2-y13-z10 tag0 V_FALSE)) (KGivenat a g-x2-y13-z10 tag1 V_TRUE) (not (KGivenat a g-x2-y13-z10 tag1 V_FALSE)))
)
(:action movea_g-x2-y13-z10___g-x3-y13-z10__1
:precondition 
(and (turn a) (initlocation a) (at a g-x2-y13-z10) (pathselected a1) (Kinitlocation a) (Kat a g-x2-y13-z10) (Kpathselected a1))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x2-y13-z10)) (at a g-x3-y13-z10) (KNat a g-x2-y13-z10) (not (Kat a g-x2-y13-z10)) (KGivenat a g-x2-y13-z10 tag0 V_FALSE) (not (KGivenat a g-x2-y13-z10 tag0 V_TRUE)) (KGivenat a g-x2-y13-z10 tag1 V_FALSE) (not (KGivenat a g-x2-y13-z10 tag1 V_TRUE)) (Kat a g-x3-y13-z10) (not (KNat a g-x3-y13-z10)) (KGivenat a g-x3-y13-z10 tag0 V_TRUE) (not (KGivenat a g-x3-y13-z10 tag0 V_FALSE)) (KGivenat a g-x3-y13-z10 tag1 V_TRUE) (not (KGivenat a g-x3-y13-z10 tag1 V_FALSE)))
)
(:action movea_g-x3-y13-z10___g-x3-y13-z9__1
:precondition 
(and (turn a) (initlocation a) (at a g-x3-y13-z10) (pathselected a1) (Kinitlocation a) (Kat a g-x3-y13-z10) (Kpathselected a1))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x3-y13-z10)) (at a g-x3-y13-z9) (KNat a g-x3-y13-z10) (not (Kat a g-x3-y13-z10)) (KGivenat a g-x3-y13-z10 tag0 V_FALSE) (not (KGivenat a g-x3-y13-z10 tag0 V_TRUE)) (KGivenat a g-x3-y13-z10 tag1 V_FALSE) (not (KGivenat a g-x3-y13-z10 tag1 V_TRUE)) (Kat a g-x3-y13-z9) (not (KNat a g-x3-y13-z9)) (KGivenat a g-x3-y13-z9 tag0 V_TRUE) (not (KGivenat a g-x3-y13-z9 tag0 V_FALSE)) (KGivenat a g-x3-y13-z9 tag1 V_TRUE) (not (KGivenat a g-x3-y13-z9 tag1 V_FALSE)))
)
(:action movea_g-x3-y13-z9___g-x3-y13-z8__1
:precondition 
(and (turn a) (initlocation a) (at a g-x3-y13-z9) (pathselected a1) (Kinitlocation a) (Kat a g-x3-y13-z9) (Kpathselected a1))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x3-y13-z9)) (at a g-x3-y13-z8) (KNat a g-x3-y13-z9) (not (Kat a g-x3-y13-z9)) (KGivenat a g-x3-y13-z9 tag0 V_FALSE) (not (KGivenat a g-x3-y13-z9 tag0 V_TRUE)) (KGivenat a g-x3-y13-z9 tag1 V_FALSE) (not (KGivenat a g-x3-y13-z9 tag1 V_TRUE)) (Kat a g-x3-y13-z8) (not (KNat a g-x3-y13-z8)) (KGivenat a g-x3-y13-z8 tag0 V_TRUE) (not (KGivenat a g-x3-y13-z8 tag0 V_FALSE)) (KGivenat a g-x3-y13-z8 tag1 V_TRUE) (not (KGivenat a g-x3-y13-z8 tag1 V_FALSE)))
)
(:action movea_g-x1-y0-z0___g-x1-y0-z1___2
:precondition 
(and (turn a) (initlocation a) (at a g-x1-y0-z0) (pathselected a2) (Kinitlocation a) (Kat a g-x1-y0-z0) (Kpathselected a2))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x1-y0-z0)) (at a g-x1-y0-z1) (KNat a g-x1-y0-z0) (not (Kat a g-x1-y0-z0)) (KGivenat a g-x1-y0-z0 tag0 V_FALSE) (not (KGivenat a g-x1-y0-z0 tag0 V_TRUE)) (KGivenat a g-x1-y0-z0 tag1 V_FALSE) (not (KGivenat a g-x1-y0-z0 tag1 V_TRUE)) (Kat a g-x1-y0-z1) (not (KNat a g-x1-y0-z1)) (KGivenat a g-x1-y0-z1 tag0 V_TRUE) (not (KGivenat a g-x1-y0-z1 tag0 V_FALSE)) (KGivenat a g-x1-y0-z1 tag1 V_TRUE) (not (KGivenat a g-x1-y0-z1 tag1 V_FALSE)))
)
(:action movea_g-x1-y0-z1___g-x1-y1-z1___2
:precondition 
(and (turn a) (initlocation a) (at a g-x1-y0-z1) (pathselected a2) (Kinitlocation a) (Kat a g-x1-y0-z1) (Kpathselected a2))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x1-y0-z1)) (at a g-x1-y1-z1) (KNat a g-x1-y0-z1) (not (Kat a g-x1-y0-z1)) (KGivenat a g-x1-y0-z1 tag0 V_FALSE) (not (KGivenat a g-x1-y0-z1 tag0 V_TRUE)) (KGivenat a g-x1-y0-z1 tag1 V_FALSE) (not (KGivenat a g-x1-y0-z1 tag1 V_TRUE)) (Kat a g-x1-y1-z1) (not (KNat a g-x1-y1-z1)) (KGivenat a g-x1-y1-z1 tag0 V_TRUE) (not (KGivenat a g-x1-y1-z1 tag0 V_FALSE)) (KGivenat a g-x1-y1-z1 tag1 V_TRUE) (not (KGivenat a g-x1-y1-z1 tag1 V_FALSE)))
)
(:action movea_g-x1-y1-z1___g-x1-y1-z2___2
:precondition 
(and (turn a) (initlocation a) (at a g-x1-y1-z1) (pathselected a2) (Kinitlocation a) (Kat a g-x1-y1-z1) (Kpathselected a2))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x1-y1-z1)) (at a g-x1-y1-z2) (KNat a g-x1-y1-z1) (not (Kat a g-x1-y1-z1)) (KGivenat a g-x1-y1-z1 tag0 V_FALSE) (not (KGivenat a g-x1-y1-z1 tag0 V_TRUE)) (KGivenat a g-x1-y1-z1 tag1 V_FALSE) (not (KGivenat a g-x1-y1-z1 tag1 V_TRUE)) (Kat a g-x1-y1-z2) (not (KNat a g-x1-y1-z2)) (KGivenat a g-x1-y1-z2 tag0 V_TRUE) (not (KGivenat a g-x1-y1-z2 tag0 V_FALSE)) (KGivenat a g-x1-y1-z2 tag1 V_TRUE) (not (KGivenat a g-x1-y1-z2 tag1 V_FALSE)))
)
(:action movea_g-x1-y1-z2___g-x1-y2-z2___2
:precondition 
(and (turn a) (initlocation a) (at a g-x1-y1-z2) (pathselected a2) (Kinitlocation a) (Kat a g-x1-y1-z2) (Kpathselected a2))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x1-y1-z2)) (at a g-x1-y2-z2) (KNat a g-x1-y1-z2) (not (Kat a g-x1-y1-z2)) (KGivenat a g-x1-y1-z2 tag0 V_FALSE) (not (KGivenat a g-x1-y1-z2 tag0 V_TRUE)) (KGivenat a g-x1-y1-z2 tag1 V_FALSE) (not (KGivenat a g-x1-y1-z2 tag1 V_TRUE)) (Kat a g-x1-y2-z2) (not (KNat a g-x1-y2-z2)) (KGivenat a g-x1-y2-z2 tag0 V_TRUE) (not (KGivenat a g-x1-y2-z2 tag0 V_FALSE)) (KGivenat a g-x1-y2-z2 tag1 V_TRUE) (not (KGivenat a g-x1-y2-z2 tag1 V_FALSE)))
)
(:action movea_g-x1-y2-z2___g-x1-y2-z3___2
:precondition 
(and (turn a) (initlocation a) (at a g-x1-y2-z2) (pathselected a2) (Kinitlocation a) (Kat a g-x1-y2-z2) (Kpathselected a2))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x1-y2-z2)) (at a g-x1-y2-z3) (KNat a g-x1-y2-z2) (not (Kat a g-x1-y2-z2)) (KGivenat a g-x1-y2-z2 tag0 V_FALSE) (not (KGivenat a g-x1-y2-z2 tag0 V_TRUE)) (KGivenat a g-x1-y2-z2 tag1 V_FALSE) (not (KGivenat a g-x1-y2-z2 tag1 V_TRUE)) (Kat a g-x1-y2-z3) (not (KNat a g-x1-y2-z3)) (KGivenat a g-x1-y2-z3 tag0 V_TRUE) (not (KGivenat a g-x1-y2-z3 tag0 V_FALSE)) (KGivenat a g-x1-y2-z3 tag1 V_TRUE) (not (KGivenat a g-x1-y2-z3 tag1 V_FALSE)))
)
(:action movea_g-x1-y2-z3___g-x1-y2-z4___2
:precondition 
(and (turn a) (initlocation a) (at a g-x1-y2-z3) (pathselected a2) (Kinitlocation a) (Kat a g-x1-y2-z3) (Kpathselected a2))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x1-y2-z3)) (at a g-x1-y2-z4) (KNat a g-x1-y2-z3) (not (Kat a g-x1-y2-z3)) (KGivenat a g-x1-y2-z3 tag0 V_FALSE) (not (KGivenat a g-x1-y2-z3 tag0 V_TRUE)) (KGivenat a g-x1-y2-z3 tag1 V_FALSE) (not (KGivenat a g-x1-y2-z3 tag1 V_TRUE)) (Kat a g-x1-y2-z4) (not (KNat a g-x1-y2-z4)) (KGivenat a g-x1-y2-z4 tag0 V_TRUE) (not (KGivenat a g-x1-y2-z4 tag0 V_FALSE)) (KGivenat a g-x1-y2-z4 tag1 V_TRUE) (not (KGivenat a g-x1-y2-z4 tag1 V_FALSE)))
)
(:action movea_g-x1-y2-z4___g-x1-y3-z4___2
:precondition 
(and (turn a) (initlocation a) (at a g-x1-y2-z4) (pathselected a2) (Kinitlocation a) (Kat a g-x1-y2-z4) (Kpathselected a2))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x1-y2-z4)) (at a g-x1-y3-z4) (KNat a g-x1-y2-z4) (not (Kat a g-x1-y2-z4)) (KGivenat a g-x1-y2-z4 tag0 V_FALSE) (not (KGivenat a g-x1-y2-z4 tag0 V_TRUE)) (KGivenat a g-x1-y2-z4 tag1 V_FALSE) (not (KGivenat a g-x1-y2-z4 tag1 V_TRUE)) (Kat a g-x1-y3-z4) (not (KNat a g-x1-y3-z4)) (KGivenat a g-x1-y3-z4 tag0 V_TRUE) (not (KGivenat a g-x1-y3-z4 tag0 V_FALSE)) (KGivenat a g-x1-y3-z4 tag1 V_TRUE) (not (KGivenat a g-x1-y3-z4 tag1 V_FALSE)))
)
(:action movea_g-x1-y3-z4___g-x1-y3-z5___2
:precondition 
(and (turn a) (initlocation a) (at a g-x1-y3-z4) (pathselected a2) (Kinitlocation a) (Kat a g-x1-y3-z4) (Kpathselected a2))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x1-y3-z4)) (at a g-x1-y3-z5) (KNat a g-x1-y3-z4) (not (Kat a g-x1-y3-z4)) (KGivenat a g-x1-y3-z4 tag0 V_FALSE) (not (KGivenat a g-x1-y3-z4 tag0 V_TRUE)) (KGivenat a g-x1-y3-z4 tag1 V_FALSE) (not (KGivenat a g-x1-y3-z4 tag1 V_TRUE)) (Kat a g-x1-y3-z5) (not (KNat a g-x1-y3-z5)) (KGivenat a g-x1-y3-z5 tag0 V_TRUE) (not (KGivenat a g-x1-y3-z5 tag0 V_FALSE)) (KGivenat a g-x1-y3-z5 tag1 V_TRUE) (not (KGivenat a g-x1-y3-z5 tag1 V_FALSE)))
)
(:action movea_g-x1-y3-z5___g-x1-y4-z5___2
:precondition 
(and (turn a) (initlocation a) (at a g-x1-y3-z5) (pathselected a2) (Kinitlocation a) (Kat a g-x1-y3-z5) (Kpathselected a2))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x1-y3-z5)) (at a g-x1-y4-z5) (KNat a g-x1-y3-z5) (not (Kat a g-x1-y3-z5)) (KGivenat a g-x1-y3-z5 tag0 V_FALSE) (not (KGivenat a g-x1-y3-z5 tag0 V_TRUE)) (KGivenat a g-x1-y3-z5 tag1 V_FALSE) (not (KGivenat a g-x1-y3-z5 tag1 V_TRUE)) (Kat a g-x1-y4-z5) (not (KNat a g-x1-y4-z5)) (KGivenat a g-x1-y4-z5 tag0 V_TRUE) (not (KGivenat a g-x1-y4-z5 tag0 V_FALSE)) (KGivenat a g-x1-y4-z5 tag1 V_TRUE) (not (KGivenat a g-x1-y4-z5 tag1 V_FALSE)))
)
(:action movea_g-x1-y4-z5___g-x1-y4-z6___2
:precondition 
(and (turn a) (initlocation a) (at a g-x1-y4-z5) (pathselected a2) (Kinitlocation a) (Kat a g-x1-y4-z5) (Kpathselected a2))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x1-y4-z5)) (at a g-x1-y4-z6) (KNat a g-x1-y4-z5) (not (Kat a g-x1-y4-z5)) (KGivenat a g-x1-y4-z5 tag0 V_FALSE) (not (KGivenat a g-x1-y4-z5 tag0 V_TRUE)) (KGivenat a g-x1-y4-z5 tag1 V_FALSE) (not (KGivenat a g-x1-y4-z5 tag1 V_TRUE)) (Kat a g-x1-y4-z6) (not (KNat a g-x1-y4-z6)) (KGivenat a g-x1-y4-z6 tag0 V_TRUE) (not (KGivenat a g-x1-y4-z6 tag0 V_FALSE)) (KGivenat a g-x1-y4-z6 tag1 V_TRUE) (not (KGivenat a g-x1-y4-z6 tag1 V_FALSE)))
)
(:action movea_g-x1-y4-z6___g-x1-y4-z7__2
:precondition 
(and (turn a) (initlocation a) (at a g-x1-y4-z6) (pathselected a2) (Kinitlocation a) (Kat a g-x1-y4-z6) (Kpathselected a2))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x1-y4-z6)) (at a g-x1-y4-z7) (KNat a g-x1-y4-z6) (not (Kat a g-x1-y4-z6)) (KGivenat a g-x1-y4-z6 tag0 V_FALSE) (not (KGivenat a g-x1-y4-z6 tag0 V_TRUE)) (KGivenat a g-x1-y4-z6 tag1 V_FALSE) (not (KGivenat a g-x1-y4-z6 tag1 V_TRUE)) (Kat a g-x1-y4-z7) (not (KNat a g-x1-y4-z7)) (KGivenat a g-x1-y4-z7 tag0 V_TRUE) (not (KGivenat a g-x1-y4-z7 tag0 V_FALSE)) (KGivenat a g-x1-y4-z7 tag1 V_TRUE) (not (KGivenat a g-x1-y4-z7 tag1 V_FALSE)))
)
(:action movea_g-x1-y4-z7___g-x2-y4-z7__2
:precondition 
(and (turn a) (initlocation a) (at a g-x1-y4-z7) (pathselected a2) (Kinitlocation a) (Kat a g-x1-y4-z7) (Kpathselected a2))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x1-y4-z7)) (at a g-x2-y4-z7) (KNat a g-x1-y4-z7) (not (Kat a g-x1-y4-z7)) (KGivenat a g-x1-y4-z7 tag0 V_FALSE) (not (KGivenat a g-x1-y4-z7 tag0 V_TRUE)) (KGivenat a g-x1-y4-z7 tag1 V_FALSE) (not (KGivenat a g-x1-y4-z7 tag1 V_TRUE)) (Kat a g-x2-y4-z7) (not (KNat a g-x2-y4-z7)) (KGivenat a g-x2-y4-z7 tag0 V_TRUE) (not (KGivenat a g-x2-y4-z7 tag0 V_FALSE)) (KGivenat a g-x2-y4-z7 tag1 V_TRUE) (not (KGivenat a g-x2-y4-z7 tag1 V_FALSE)))
)
(:action movea_g-x2-y4-z7___g-x2-y4-z8__2
:precondition 
(and (turn a) (initlocation a) (at a g-x2-y4-z7) (pathselected a2) (Kinitlocation a) (Kat a g-x2-y4-z7) (Kpathselected a2))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x2-y4-z7)) (at a g-x2-y4-z8) (KNat a g-x2-y4-z7) (not (Kat a g-x2-y4-z7)) (KGivenat a g-x2-y4-z7 tag0 V_FALSE) (not (KGivenat a g-x2-y4-z7 tag0 V_TRUE)) (KGivenat a g-x2-y4-z7 tag1 V_FALSE) (not (KGivenat a g-x2-y4-z7 tag1 V_TRUE)) (Kat a g-x2-y4-z8) (not (KNat a g-x2-y4-z8)) (KGivenat a g-x2-y4-z8 tag0 V_TRUE) (not (KGivenat a g-x2-y4-z8 tag0 V_FALSE)) (KGivenat a g-x2-y4-z8 tag1 V_TRUE) (not (KGivenat a g-x2-y4-z8 tag1 V_FALSE)))
)
(:action movea_g-x2-y4-z8___g-x2-y5-z8__2
:precondition 
(and (turn a) (initlocation a) (at a g-x2-y4-z8) (pathselected a2) (Kinitlocation a) (Kat a g-x2-y4-z8) (Kpathselected a2))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x2-y4-z8)) (at a g-x2-y5-z8) (KNat a g-x2-y4-z8) (not (Kat a g-x2-y4-z8)) (KGivenat a g-x2-y4-z8 tag0 V_FALSE) (not (KGivenat a g-x2-y4-z8 tag0 V_TRUE)) (KGivenat a g-x2-y4-z8 tag1 V_FALSE) (not (KGivenat a g-x2-y4-z8 tag1 V_TRUE)) (Kat a g-x2-y5-z8) (not (KNat a g-x2-y5-z8)) (KGivenat a g-x2-y5-z8 tag0 V_TRUE) (not (KGivenat a g-x2-y5-z8 tag0 V_FALSE)) (KGivenat a g-x2-y5-z8 tag1 V_TRUE) (not (KGivenat a g-x2-y5-z8 tag1 V_FALSE)))
)
(:action movea_g-x2-y5-z8___g-x3-y5-z8__2
:precondition 
(and (turn a) (initlocation a) (at a g-x2-y5-z8) (pathselected a2) (Kinitlocation a) (Kat a g-x2-y5-z8) (Kpathselected a2))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x2-y5-z8)) (at a g-x3-y5-z8) (KNat a g-x2-y5-z8) (not (Kat a g-x2-y5-z8)) (KGivenat a g-x2-y5-z8 tag0 V_FALSE) (not (KGivenat a g-x2-y5-z8 tag0 V_TRUE)) (KGivenat a g-x2-y5-z8 tag1 V_FALSE) (not (KGivenat a g-x2-y5-z8 tag1 V_TRUE)) (Kat a g-x3-y5-z8) (not (KNat a g-x3-y5-z8)) (KGivenat a g-x3-y5-z8 tag0 V_TRUE) (not (KGivenat a g-x3-y5-z8 tag0 V_FALSE)) (KGivenat a g-x3-y5-z8 tag1 V_TRUE) (not (KGivenat a g-x3-y5-z8 tag1 V_FALSE)))
)
(:action movea_g-x3-y5-z8___g-x3-y5-z9__2
:precondition 
(and (turn a) (initlocation a) (at a g-x3-y5-z8) (pathselected a2) (Kinitlocation a) (Kat a g-x3-y5-z8) (Kpathselected a2))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x3-y5-z8)) (at a g-x3-y5-z9) (KNat a g-x3-y5-z8) (not (Kat a g-x3-y5-z8)) (KGivenat a g-x3-y5-z8 tag0 V_FALSE) (not (KGivenat a g-x3-y5-z8 tag0 V_TRUE)) (KGivenat a g-x3-y5-z8 tag1 V_FALSE) (not (KGivenat a g-x3-y5-z8 tag1 V_TRUE)) (Kat a g-x3-y5-z9) (not (KNat a g-x3-y5-z9)) (KGivenat a g-x3-y5-z9 tag0 V_TRUE) (not (KGivenat a g-x3-y5-z9 tag0 V_FALSE)) (KGivenat a g-x3-y5-z9 tag1 V_TRUE) (not (KGivenat a g-x3-y5-z9 tag1 V_FALSE)))
)
(:action movea_g-x3-y5-z9___g-x3-y5-z10__2
:precondition 
(and (turn a) (initlocation a) (at a g-x3-y5-z9) (pathselected a2) (Kinitlocation a) (Kat a g-x3-y5-z9) (Kpathselected a2))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x3-y5-z9)) (at a g-x3-y5-z10) (KNat a g-x3-y5-z9) (not (Kat a g-x3-y5-z9)) (KGivenat a g-x3-y5-z9 tag0 V_FALSE) (not (KGivenat a g-x3-y5-z9 tag0 V_TRUE)) (KGivenat a g-x3-y5-z9 tag1 V_FALSE) (not (KGivenat a g-x3-y5-z9 tag1 V_TRUE)) (Kat a g-x3-y5-z10) (not (KNat a g-x3-y5-z10)) (KGivenat a g-x3-y5-z10 tag0 V_TRUE) (not (KGivenat a g-x3-y5-z10 tag0 V_FALSE)) (KGivenat a g-x3-y5-z10 tag1 V_TRUE) (not (KGivenat a g-x3-y5-z10 tag1 V_FALSE)))
)
(:action movea_g-x3-y5-z10___g-x3-y4-z10__2
:precondition 
(and (turn a) (initlocation a) (at a g-x3-y5-z10) (pathselected a2) (Kinitlocation a) (Kat a g-x3-y5-z10) (Kpathselected a2))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x3-y5-z10)) (at a g-x3-y4-z10) (KNat a g-x3-y5-z10) (not (Kat a g-x3-y5-z10)) (KGivenat a g-x3-y5-z10 tag0 V_FALSE) (not (KGivenat a g-x3-y5-z10 tag0 V_TRUE)) (KGivenat a g-x3-y5-z10 tag1 V_FALSE) (not (KGivenat a g-x3-y5-z10 tag1 V_TRUE)) (Kat a g-x3-y4-z10) (not (KNat a g-x3-y4-z10)) (KGivenat a g-x3-y4-z10 tag0 V_TRUE) (not (KGivenat a g-x3-y4-z10 tag0 V_FALSE)) (KGivenat a g-x3-y4-z10 tag1 V_TRUE) (not (KGivenat a g-x3-y4-z10 tag1 V_FALSE)))
)
(:action movea_g-x3-y4-z10___g-x3-y4-z9__2
:precondition 
(and (turn a) (initlocation a) (at a g-x3-y4-z10) (pathselected a2) (Kinitlocation a) (Kat a g-x3-y4-z10) (Kpathselected a2))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x3-y4-z10)) (at a g-x3-y4-z9) (KNat a g-x3-y4-z10) (not (Kat a g-x3-y4-z10)) (KGivenat a g-x3-y4-z10 tag0 V_FALSE) (not (KGivenat a g-x3-y4-z10 tag0 V_TRUE)) (KGivenat a g-x3-y4-z10 tag1 V_FALSE) (not (KGivenat a g-x3-y4-z10 tag1 V_TRUE)) (Kat a g-x3-y4-z9) (not (KNat a g-x3-y4-z9)) (KGivenat a g-x3-y4-z9 tag0 V_TRUE) (not (KGivenat a g-x3-y4-z9 tag0 V_FALSE)) (KGivenat a g-x3-y4-z9 tag1 V_TRUE) (not (KGivenat a g-x3-y4-z9 tag1 V_FALSE)))
)
(:action movea_g-x3-y4-z9___g-x4-y4-z9__2
:precondition 
(and (turn a) (initlocation a) (at a g-x3-y4-z9) (pathselected a2) (Kinitlocation a) (Kat a g-x3-y4-z9) (Kpathselected a2))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x3-y4-z9)) (at a g-x4-y4-z9) (KNat a g-x3-y4-z9) (not (Kat a g-x3-y4-z9)) (KGivenat a g-x3-y4-z9 tag0 V_FALSE) (not (KGivenat a g-x3-y4-z9 tag0 V_TRUE)) (KGivenat a g-x3-y4-z9 tag1 V_FALSE) (not (KGivenat a g-x3-y4-z9 tag1 V_TRUE)) (Kat a g-x4-y4-z9) (not (KNat a g-x4-y4-z9)) (KGivenat a g-x4-y4-z9 tag0 V_TRUE) (not (KGivenat a g-x4-y4-z9 tag0 V_FALSE)) (KGivenat a g-x4-y4-z9 tag1 V_TRUE) (not (KGivenat a g-x4-y4-z9 tag1 V_FALSE)))
)
(:action movea_g-x4-y4-z9___g-x4-y4-z8__2
:precondition 
(and (turn a) (initlocation a) (at a g-x4-y4-z9) (pathselected a2) (Kinitlocation a) (Kat a g-x4-y4-z9) (Kpathselected a2))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x4-y4-z9)) (at a g-x4-y4-z8) (KNat a g-x4-y4-z9) (not (Kat a g-x4-y4-z9)) (KGivenat a g-x4-y4-z9 tag0 V_FALSE) (not (KGivenat a g-x4-y4-z9 tag0 V_TRUE)) (KGivenat a g-x4-y4-z9 tag1 V_FALSE) (not (KGivenat a g-x4-y4-z9 tag1 V_TRUE)) (Kat a g-x4-y4-z8) (not (KNat a g-x4-y4-z8)) (KGivenat a g-x4-y4-z8 tag0 V_TRUE) (not (KGivenat a g-x4-y4-z8 tag0 V_FALSE)) (KGivenat a g-x4-y4-z8 tag1 V_TRUE) (not (KGivenat a g-x4-y4-z8 tag1 V_FALSE)))
)
(:action movea_g-x4-y4-z8___g-x4-y4-z7__2
:precondition 
(and (turn a) (initlocation a) (at a g-x4-y4-z8) (pathselected a2) (Kinitlocation a) (Kat a g-x4-y4-z8) (Kpathselected a2))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x4-y4-z8)) (at a g-x4-y4-z7) (KNat a g-x4-y4-z8) (not (Kat a g-x4-y4-z8)) (KGivenat a g-x4-y4-z8 tag0 V_FALSE) (not (KGivenat a g-x4-y4-z8 tag0 V_TRUE)) (KGivenat a g-x4-y4-z8 tag1 V_FALSE) (not (KGivenat a g-x4-y4-z8 tag1 V_TRUE)) (Kat a g-x4-y4-z7) (not (KNat a g-x4-y4-z7)) (KGivenat a g-x4-y4-z7 tag0 V_TRUE) (not (KGivenat a g-x4-y4-z7 tag0 V_FALSE)) (KGivenat a g-x4-y4-z7 tag1 V_TRUE) (not (KGivenat a g-x4-y4-z7 tag1 V_FALSE)))
)
(:action movea_g-x4-y4-z7___g-x4-y4-z6__2
:precondition 
(and (turn a) (initlocation a) (at a g-x4-y4-z7) (pathselected a2) (Kinitlocation a) (Kat a g-x4-y4-z7) (Kpathselected a2))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x4-y4-z7)) (at a g-x4-y4-z6) (KNat a g-x4-y4-z7) (not (Kat a g-x4-y4-z7)) (KGivenat a g-x4-y4-z7 tag0 V_FALSE) (not (KGivenat a g-x4-y4-z7 tag0 V_TRUE)) (KGivenat a g-x4-y4-z7 tag1 V_FALSE) (not (KGivenat a g-x4-y4-z7 tag1 V_TRUE)) (Kat a g-x4-y4-z6) (not (KNat a g-x4-y4-z6)) (KGivenat a g-x4-y4-z6 tag0 V_TRUE) (not (KGivenat a g-x4-y4-z6 tag0 V_FALSE)) (KGivenat a g-x4-y4-z6 tag1 V_TRUE) (not (KGivenat a g-x4-y4-z6 tag1 V_FALSE)))
)
(:action movea_g-x4-y4-z6___g-x3-y4-z6__2
:precondition 
(and (turn a) (initlocation a) (at a g-x4-y4-z6) (pathselected a2) (Kinitlocation a) (Kat a g-x4-y4-z6) (Kpathselected a2))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x4-y4-z6)) (at a g-x3-y4-z6) (KNat a g-x4-y4-z6) (not (Kat a g-x4-y4-z6)) (KGivenat a g-x4-y4-z6 tag0 V_FALSE) (not (KGivenat a g-x4-y4-z6 tag0 V_TRUE)) (KGivenat a g-x4-y4-z6 tag1 V_FALSE) (not (KGivenat a g-x4-y4-z6 tag1 V_TRUE)) (Kat a g-x3-y4-z6) (not (KNat a g-x3-y4-z6)) (KGivenat a g-x3-y4-z6 tag0 V_TRUE) (not (KGivenat a g-x3-y4-z6 tag0 V_FALSE)) (KGivenat a g-x3-y4-z6 tag1 V_TRUE) (not (KGivenat a g-x3-y4-z6 tag1 V_FALSE)))
)
(:action movea_g-x3-y4-z6___g-x3-y4-z5__2
:precondition 
(and (turn a) (initlocation a) (at a g-x3-y4-z6) (pathselected a2) (Kinitlocation a) (Kat a g-x3-y4-z6) (Kpathselected a2))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x3-y4-z6)) (at a g-x3-y4-z5) (KNat a g-x3-y4-z6) (not (Kat a g-x3-y4-z6)) (KGivenat a g-x3-y4-z6 tag0 V_FALSE) (not (KGivenat a g-x3-y4-z6 tag0 V_TRUE)) (KGivenat a g-x3-y4-z6 tag1 V_FALSE) (not (KGivenat a g-x3-y4-z6 tag1 V_TRUE)) (Kat a g-x3-y4-z5) (not (KNat a g-x3-y4-z5)) (KGivenat a g-x3-y4-z5 tag0 V_TRUE) (not (KGivenat a g-x3-y4-z5 tag0 V_FALSE)) (KGivenat a g-x3-y4-z5 tag1 V_TRUE) (not (KGivenat a g-x3-y4-z5 tag1 V_FALSE)))
)
(:action movea_g-x3-y4-z5___g-x2-y4-z5__2
:precondition 
(and (turn a) (initlocation a) (at a g-x3-y4-z5) (pathselected a2) (Kinitlocation a) (Kat a g-x3-y4-z5) (Kpathselected a2))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x3-y4-z5)) (at a g-x2-y4-z5) (KNat a g-x3-y4-z5) (not (Kat a g-x3-y4-z5)) (KGivenat a g-x3-y4-z5 tag0 V_FALSE) (not (KGivenat a g-x3-y4-z5 tag0 V_TRUE)) (KGivenat a g-x3-y4-z5 tag1 V_FALSE) (not (KGivenat a g-x3-y4-z5 tag1 V_TRUE)) (Kat a g-x2-y4-z5) (not (KNat a g-x2-y4-z5)) (KGivenat a g-x2-y4-z5 tag0 V_TRUE) (not (KGivenat a g-x2-y4-z5 tag0 V_FALSE)) (KGivenat a g-x2-y4-z5 tag1 V_TRUE) (not (KGivenat a g-x2-y4-z5 tag1 V_FALSE)))
)
(:action movea_g-x2-y4-z5___g-x2-y4-z4__2
:precondition 
(and (turn a) (initlocation a) (at a g-x2-y4-z5) (pathselected a2) (Kinitlocation a) (Kat a g-x2-y4-z5) (Kpathselected a2))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x2-y4-z5)) (at a g-x2-y4-z4) (KNat a g-x2-y4-z5) (not (Kat a g-x2-y4-z5)) (KGivenat a g-x2-y4-z5 tag0 V_FALSE) (not (KGivenat a g-x2-y4-z5 tag0 V_TRUE)) (KGivenat a g-x2-y4-z5 tag1 V_FALSE) (not (KGivenat a g-x2-y4-z5 tag1 V_TRUE)) (Kat a g-x2-y4-z4) (not (KNat a g-x2-y4-z4)) (KGivenat a g-x2-y4-z4 tag0 V_TRUE) (not (KGivenat a g-x2-y4-z4 tag0 V_FALSE)) (KGivenat a g-x2-y4-z4 tag1 V_TRUE) (not (KGivenat a g-x2-y4-z4 tag1 V_FALSE)))
)
(:action movea_g-x2-y4-z4___g-x2-y4-z3__2
:precondition 
(and (turn a) (initlocation a) (at a g-x2-y4-z4) (pathselected a2) (Kinitlocation a) (Kat a g-x2-y4-z4) (Kpathselected a2))
:effect 
(and (not (turn a)) (turn d) (not (at a g-x2-y4-z4)) (at a g-x2-y4-z3) (KNat a g-x2-y4-z4) (not (Kat a g-x2-y4-z4)) (KGivenat a g-x2-y4-z4 tag0 V_FALSE) (not (KGivenat a g-x2-y4-z4 tag0 V_TRUE)) (KGivenat a g-x2-y4-z4 tag1 V_FALSE) (not (KGivenat a g-x2-y4-z4 tag1 V_TRUE)) (Kat a g-x2-y4-z3) (not (KNat a g-x2-y4-z3)) (KGivenat a g-x2-y4-z3 tag0 V_TRUE) (not (KGivenat a g-x2-y4-z3 tag0 V_FALSE)) (KGivenat a g-x2-y4-z3 tag1 V_TRUE) (not (KGivenat a g-x2-y4-z3 tag1 V_FALSE)))
)
(:action launcha
:precondition 
(and (turn a) (blurlocation a) (Kblurlocation a))
:effect 
(and 
	
	(when (pathselected a1) 
		(and (at a g-x4-y0-z0) (initlocation a) (not (blurlocation a))))
	
	(when (Kpathselected a1) 
		(and (Kat a g-x4-y0-z0) (not (KNat a g-x4-y0-z0)) (Kinitlocation a) (not (KNinitlocation a)) (KNblurlocation a) (not (Kblurlocation a))))
	
	(when (not (KNpathselected a1)) 
		(and (not (KNat a g-x4-y0-z0)) (not (KNinitlocation a)) (not (Kblurlocation a))))
	
	(when (KGivenpathselected a1 tag0 V_TRUE) 
		(and (KGivenat a g-x4-y0-z0 tag0 V_TRUE) (KGiveninitlocation a tag0 V_TRUE) (KGivenblurlocation a tag0 V_FALSE)))
	
	(when (not (KGivenpathselected a1 tag0 V_FALSE)) 
		(and (not (KGivenat a g-x4-y0-z0 tag0 V_FALSE)) (not (KGiveninitlocation a tag0 V_FALSE)) (not (KGivenblurlocation a tag0 V_TRUE))))
	
	(when (KGivenpathselected a1 tag1 V_TRUE) 
		(and (KGivenat a g-x4-y0-z0 tag1 V_TRUE) (KGiveninitlocation a tag1 V_TRUE) (KGivenblurlocation a tag1 V_FALSE)))
	
	(when (not (KGivenpathselected a1 tag1 V_FALSE)) 
		(and (not (KGivenat a g-x4-y0-z0 tag1 V_FALSE)) (not (KGiveninitlocation a tag1 V_FALSE)) (not (KGivenblurlocation a tag1 V_TRUE))))
	
	(when (pathselected a2) 
		(and (at a g-x1-y5-z0) (initlocation a) (not (blurlocation a))))
	
	(when (Kpathselected a2) 
		(and (Kat a g-x1-y5-z0) (not (KNat a g-x1-y5-z0)) (Kinitlocation a) (not (KNinitlocation a)) (KNblurlocation a) (not (Kblurlocation a))))
	
	(when (not (KNpathselected a2)) 
		(and (not (KNat a g-x1-y5-z0)) (not (KNinitlocation a)) (not (Kblurlocation a))))
	
	(when (KGivenpathselected a2 tag0 V_TRUE) 
		(and (KGivenat a g-x1-y5-z0 tag0 V_TRUE) (KGiveninitlocation a tag0 V_TRUE) (KGivenblurlocation a tag0 V_FALSE)))
	
	(when (not (KGivenpathselected a2 tag0 V_FALSE)) 
		(and (not (KGivenat a g-x1-y5-z0 tag0 V_FALSE)) (not (KGiveninitlocation a tag0 V_FALSE)) (not (KGivenblurlocation a tag0 V_TRUE))))
	
	(when (KGivenpathselected a2 tag1 V_TRUE) 
		(and (KGivenat a g-x1-y5-z0 tag1 V_TRUE) (KGiveninitlocation a tag1 V_TRUE) (KGivenblurlocation a tag1 V_FALSE)))
	
	(when (not (KGivenpathselected a2 tag1 V_FALSE)) 
		(and (not (KGivenat a g-x1-y5-z0 tag1 V_FALSE)) (not (KGiveninitlocation a tag1 V_FALSE)) (not (KGivenblurlocation a tag1 V_TRUE)))))
)
(:action blowup
:parameters ( ?x - grid ?b - blow)
:precondition 
(and (at a ?x) (at d ?x) (Kat a ?x) (Kat d ?x))
:effect 
(and (isblown ?b))
)
(:action Merge-at
:parameters ( ?r - rocket ?x - grid ?V_PARAM - VALUE_TYPE)
:precondition 
(and (not (Kat ?r ?x)) 
	(or (KGivenat ?r ?x tag0 ?V_PARAM) (KNot tag0))
	(or (KGivenat ?r ?x tag1 ?V_PARAM) (KNot tag1)))
:effect 
(and (Kat ?r ?x))
)

(:action RefuteT-at
:parameters ( ?r - rocket ?x - grid ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivenat ?r ?x ?TAG_PARAM V_TRUE) (KNat ?r ?x) (not (at ?r ?x)))
:effect 
(and (KNot ?TAG_PARAM))
)

(:action RefuteF-at
:parameters ( ?r - rocket ?x - grid ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivenat ?r ?x ?TAG_PARAM V_FALSE) (Kat ?r ?x) (at ?r ?x))
:effect 
(and (KNot ?TAG_PARAM))
)

(:action Merge-blurlocation
:parameters ( ?r - rocket ?V_PARAM - VALUE_TYPE)
:precondition 
(and (not (Kblurlocation ?r)) 
	(or (KGivenblurlocation ?r tag0 ?V_PARAM) (KNot tag0))
	(or (KGivenblurlocation ?r tag1 ?V_PARAM) (KNot tag1)))
:effect 
(and (Kblurlocation ?r))
)

(:action RefuteT-blurlocation
:parameters ( ?r - rocket ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivenblurlocation ?r ?TAG_PARAM V_TRUE) (KNblurlocation ?r) (not (blurlocation ?r)))
:effect 
(and (KNot ?TAG_PARAM))
)

(:action RefuteF-blurlocation
:parameters ( ?r - rocket ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivenblurlocation ?r ?TAG_PARAM V_FALSE) (Kblurlocation ?r) (blurlocation ?r))
:effect 
(and (KNot ?TAG_PARAM))
)

(:action Merge-initlocation
:parameters ( ?r - rocket ?V_PARAM - VALUE_TYPE)
:precondition 
(and (not (Kinitlocation ?r)) 
	(or (KGiveninitlocation ?r tag0 ?V_PARAM) (KNot tag0))
	(or (KGiveninitlocation ?r tag1 ?V_PARAM) (KNot tag1)))
:effect 
(and (Kinitlocation ?r))
)

(:action RefuteT-initlocation
:parameters ( ?r - rocket ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGiveninitlocation ?r ?TAG_PARAM V_TRUE) (KNinitlocation ?r) (not (initlocation ?r)))
:effect 
(and (KNot ?TAG_PARAM))
)

(:action RefuteF-initlocation
:parameters ( ?r - rocket ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGiveninitlocation ?r ?TAG_PARAM V_FALSE) (Kinitlocation ?r) (initlocation ?r))
:effect 
(and (KNot ?TAG_PARAM))
)

(:action Merge-pathselected
:parameters ( ?p - patha ?V_PARAM - VALUE_TYPE)
:precondition 
(and (not (Kpathselected ?p)) 
	(or (KGivenpathselected ?p tag0 ?V_PARAM) (KNot tag0))
	(or (KGivenpathselected ?p tag1 ?V_PARAM) (KNot tag1)))
:effect 
(and (Kpathselected ?p))
)

(:action RefuteT-pathselected
:parameters ( ?p - patha ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivenpathselected ?p ?TAG_PARAM V_TRUE) (KNpathselected ?p) (not (pathselected ?p)))
:effect 
(and (KNot ?TAG_PARAM))
)

(:action RefuteF-pathselected
:parameters ( ?p - patha ?TAG_PARAM - TAG_TYPE)
:precondition 
(and (not (KNot ?TAG_PARAM)) (KGivenpathselected ?p ?TAG_PARAM V_FALSE) (Kpathselected ?p) (pathselected ?p))
:effect 
(and (KNot ?TAG_PARAM))
)

)
