onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mp2_cpu/RESET_L
add wave -noupdate /mp2_cpu/START_H
add wave -noupdate /mp2_cpu/clk
add wave -noupdate /mp2_cpu/theDatapath/PCout
add wave -noupdate /mp2_cpu/ADDRESS
add wave -noupdate /mp2_cpu/theDatapath/MARMuxout
add wave -noupdate /mp2_cpu/theDatapath/LoadMAR
add wave -noupdate /mp2_cpu/theDatapath/MARMuxSel
add wave -noupdate /mp2_cpu/MWRITEH_L
add wave -noupdate /mp2_cpu/MWRITEL_L
add wave -noupdate /mp2_cpu/MREAD_L
add wave -noupdate /mp2_cpu/DATAIN
add wave -noupdate /mp2_cpu/DATAOUT
add wave -noupdate /mp2_cpu/theDatapath/MDRMuxout
add wave -noupdate -expand /mp2_cpu/theDatapath/aRegFile/RAM
add wave -noupdate /mp2_cpu/theDatapath/aIR/VAL_IR
add wave -noupdate /mp2_cpu/ControlUnit/current_state
add wave -noupdate /mp2_cpu/LoadIR
add wave -noupdate /mp2_cpu/theDatapath/RFAout
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/Way0/way_tag/Data
add wave -noupdate -expand /mp2_cpu/DRAM/Cache_DP/Way0/way_data/Data
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/Way0/way_dirty/Data
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/eq_v0
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/way0HIT
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/way0_write
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/Tag_out0
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/Valid_out0
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/Dirty_out0
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/Way1/way_tag/Data
add wave -noupdate -expand /mp2_cpu/DRAM/Cache_DP/Way1/way_data/Data
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/Way1/way_dirty/Data
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/eq_v1
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/way1HIT
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/way1_write
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/Tag_out1
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/Valid_out1
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/Dirty_out1
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/set_dirty
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/tag
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/set_index
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/offset
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/clk
add wave -noupdate /mp2_cpu/DRAM/Cache_Cont/current_state
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/LRU_out
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/LRU_ARRAY/Data(2)
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/LRU_load
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/MRESP_H
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/eq_v0
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/eq_v0_delayed
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/LRU_ARRAY/Data
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/set_index_delayed
add wave -noupdate /mp2_cpu/DRAM/Cache_Cont/set_dirty
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/Way0/way_dirty/Data(2)
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/DIRTY
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/RWactiveHIT
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/CACHE_HIT
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/ACTIVE
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/CACHE_WRITE
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/WRstate
add wave -noupdate /mp2_cpu/DRAM/Cache_DP/MRESP_EN
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
WaveRestoreCursors {{Cursor 1} {8525 ns} 0}
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
WaveRestoreZoom {8330 ns} {9202 ns}
