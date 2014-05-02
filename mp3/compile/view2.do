onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand /mp2_cpu/DRAM/Cache_DP/Way0/way_tag/Data
add wave -noupdate -expand /mp2_cpu/DRAM/Cache_DP/Way0/way_data/Data
add wave -noupdate -expand /mp2_cpu/DRAM/Cache_DP/Way1/way_tag/Data
add wave -noupdate -expand /mp2_cpu/DRAM/Cache_DP/Way1/way_data/Data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {4479 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 258
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {4380 ns} {6145 ns}
