restart -f
force /DATAOUT 16#AABB @0
force /MWRITEH_L 0 @0, 1 @30
force /MWRITEL_L 0 @10, 1 @40
force /OFFSET 16#0 @0, 16#1 @10, 16#A @20
force /WayMuxData 16#FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF @0
run 50
