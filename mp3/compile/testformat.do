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
add wave -noupdate /mp2_cpu/theDatapath/MDRMuxout
add wave -noupdate -expand /mp2_cpu/theDatapath/aRegFile/RAM
add wave -noupdate /mp2_cpu/theDatapath/aIR/VAL_IR
add wave -noupdate /mp2_cpu/ControlUnit/current_state
add wave -noupdate /mp2_cpu/ControlUnit/next_state
add wave -noupdate /mp2_cpu/theDatapath/RegWrite
add wave -noupdate /mp2_cpu/LoadIR
add wave -noupdate /mp2_cpu/theDatapath/RFAout
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2192 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 258
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
WaveRestoreZoom {229 ns} {3749 ns}
