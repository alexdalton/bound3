echo "--- Executing initialization force file for ../testcode/mp22chkpt.asm ---"

echo "Resetting processor for 5 ns."
force /reset_l 0 @0
force /reset_l 1 @5
echo "Initializing the processor."
force /start_h 0 @0
force /start_h 1 @10

-- Test case: lowering start_h should not impact the function of the processor
force /start_h 0 @ 100

echo "Done initializing processor, loading ../testcode/mp22chkpt.asm program code."
run 5
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(0) X"0B"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1) X"62"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(2) X"0C"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(3) X"64"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(4) X"0D"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(5) X"66"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(6) X"40"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(7) X"68"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(8) X"80"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(9) X"6A"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(10) X"40"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(11) X"6C"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(12) X"C0"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(13) X"6E"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(14) X"40"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(15) X"60"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(16) X"C0"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(17) X"62"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(18) X"80"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(19) X"64"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(20) X"FF"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(21) X"0F"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(22) X"20"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(23) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(24) X"A0"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(25) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(26) X"20"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(27) X"01"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(32) X"11"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(33) X"11"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(34) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(35) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(36) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(37) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(38) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(39) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(40) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(41) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(42) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(43) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(44) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(45) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(46) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(47) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(160) X"22"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(161) X"22"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(162) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(163) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(164) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(165) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(166) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(167) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(168) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(169) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(170) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(171) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(172) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(173) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(174) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(175) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(288) X"33"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(289) X"33"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(290) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(291) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(292) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(293) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(294) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(295) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(296) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(297) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(298) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(299) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(300) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(301) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(302) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(303) X"00"
run 5
echo "Done loading ../testcode/mp22chkpt.asm program code."
