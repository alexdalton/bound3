onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mp3_cpu/clk
add wave -noupdate /mp3_cpu/RESET_L
add wave -noupdate /mp3_cpu/D_MRESP_H
add wave -noupdate /mp3_cpu/I_MRESP_H
add wave -noupdate /mp3_cpu/DATAPATH/stage2/PC1out
add wave -noupdate /mp3_cpu/DATAPATH/stage2/IR1out
add wave -noupdate /mp3_cpu/DATAPATH/stage3/IR2out
add wave -noupdate /mp3_cpu/DATAPATH/stage4/IR3out
add wave -noupdate /mp3_cpu/DATAPATH/stage5/IR4out
add wave -noupdate /mp3_cpu/aMemory/iL1Cache/Cache_DP/Way0/WayData/Data
add wave -noupdate /mp3_cpu/aMemory/iL1Cache/Cache_DP/Way1/WayData/Data
add wave -noupdate /mp3_cpu/aMemory/dL1Cache/Cache_DP/Way0/WayData/Data
add wave -noupdate /mp3_cpu/aMemory/dL1Cache/Cache_DP/Way1/WayData/Data
add wave -noupdate -expand /mp3_cpu/DATAPATH/stage2/aREGFILE/RAM
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {6289 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 390
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
WaveRestoreZoom {10253 ns} {11050 ns}
