onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mp2_cpu/RESET_L
add wave -noupdate /mp2_cpu/START_H
add wave -noupdate /mp2_cpu/clk
add wave -noupdate /mp2_cpu/theDatapath/PCout
add wave -noupdate /mp2_cpu/ADDRESS
add wave -noupdate /mp2_cpu/MWRITEH_L
add wave -noupdate /mp2_cpu/MWRITEL_L
add wave -noupdate /mp2_cpu/MREAD_L
add wave -noupdate /mp2_cpu/DATAIN
add wave -noupdate /mp2_cpu/DATAOUT
add wave -noupdate -expand /mp2_cpu/theDatapath/aRegFile/RAM
add wave -noupdate /mp2_cpu/theDatapath/aIR/VAL_IR
add wave -noupdate /mp2_cpu/ControlUnit/current_state
add wave -noupdate -expand /mp2_cpu/DRAM/Cache_DP/Way0/way_tag/Data
add wave -noupdate -expand /mp2_cpu/DRAM/Cache_DP/Way0/way_data/Data
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/Way1/way_tag/Data
add wave -noupdate -expand /mp2_cpu/DRAM/Cache_DP/Way1/way_data/Data
add wave -noupdate /mp2_cpu/DRAM/Cache_Cont/current_state
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/LRU_out
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/MRESP_H
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/DIRTY
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/RWactiveHIT
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/CACHE_HIT
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/ACTIVE
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/CACHE_WRITE
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/wayDin
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/wordwrite_out
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/PMDATAIN
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/PMDATAOUT
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/PMADDRESS
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/WRbackADDR
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/ADDRESS
add wave -noupdate /mp2_cpu/DRAM/PMREAD_L
add wave -noupdate /mp2_cpu/DRAM/PMWRITE_L
add wave -noupdate /mp2_cpu/DRAM/PMRESP_H
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
