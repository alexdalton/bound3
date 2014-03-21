onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label Way0/Data -expand /mp2_cpu/DRAM/Cache_DP/Way0/WayData/Data
add wave -noupdate -label Way0/Tag -expand /mp2_cpu/DRAM/Cache_DP/Way0/WayTag/Tag
add wave -noupdate -label PCOut /mp2_cpu/theDatapath/PCout
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {109447 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 416
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {4500 ns}
