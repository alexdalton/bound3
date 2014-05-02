onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label clk /mp3_cpu/clk
add wave -noupdate -label ADDRESS1 /mp3_cpu/ADDRESS1
add wave -noupdate -label ADDRESS2 /mp3_cpu/ADDRESS2
add wave -noupdate -label DATAOUT /mp3_cpu/DATAOUT
add wave -noupdate -label D_DATAIN /mp3_cpu/D_DATAIN
add wave -noupdate -label D_MRESP_H /mp3_cpu/D_MRESP_H
add wave -noupdate -label I_DATAIN /mp3_cpu/I_DATAIN
add wave -noupdate -label I_MRESP_H /mp3_cpu/I_MRESP_H
add wave -noupdate -label MREADD_L /mp3_cpu/MREADD_L
add wave -noupdate -label MREADI_L /mp3_cpu/MREADI_L
add wave -noupdate -label MWRITEH_L /mp3_cpu/MWRITEH_L
add wave -noupdate -label MWRITEL_L /mp3_cpu/MWRITEL_L
add wave -noupdate -label PC1out /mp3_cpu/DATAPATH/stage2/PC1out
add wave -noupdate -label IR1out /mp3_cpu/DATAPATH/stage2/IR1out
add wave -noupdate -label IR2out /mp3_cpu/DATAPATH/stage3/IR2out
add wave -noupdate -label IR3out /mp3_cpu/DATAPATH/stage4/IR3out
add wave -noupdate -label IR4out /mp3_cpu/DATAPATH/stage5/IR4out
add wave -noupdate /mp3_cpu/DATAPATH/Valid1out
add wave -noupdate /mp3_cpu/DATAPATH/Valid2out
add wave -noupdate /mp3_cpu/DATAPATH/Valid3out
add wave -noupdate /mp3_cpu/DATAPATH/Valid4out
add wave -noupdate -label RAM -expand /mp3_cpu/DATAPATH/stage2/aREGFILE/RAM
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {4999890 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 414
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
WaveRestoreZoom {2149063 ns} {2149111 ns}
