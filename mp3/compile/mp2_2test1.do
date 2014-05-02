echo "--- Executing initialization force file for ../testcode/mp2_2test1.asm ---"

echo "Resetting processor for 5 ns."
force /reset_l 0 @0
force /reset_l 1 @5
echo "Initializing the processor."
force /start_h 0 @0
force /start_h 1 @10

-- Test case: lowering start_h should not impact the function of the processor
force /start_h 0 @ 100

echo "Done initializing processor, loading ../testcode/mp2_2test1.asm program code."
run 5
change /mp2_cpu/dram/pdram/vhdl_memory/mem(0) X"0A"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(1) X"EE"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(2) X"C0"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(3) X"61"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(4) X"C1"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(5) X"63"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(6) X"C2"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(7) X"65"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(8) X"C3"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(9) X"67"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(10) X"0F"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(11) X"EE"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(12) X"C0"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(13) X"29"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(14) X"C1"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(15) X"2B"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(16) X"C2"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(17) X"2D"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(18) X"C3"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(19) X"2F"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(20) X"FF"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(21) X"0F"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(22) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(23) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(24) X"11"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(25) X"11"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(26) X"22"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(27) X"22"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(28) X"33"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(29) X"33"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(30) X"44"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(31) X"44"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(32) X"55"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(33) X"55"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(34) X"66"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(35) X"66"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(36) X"77"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(37) X"77"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(38) X"88"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(39) X"88"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(40) X"99"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(41) X"99"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(42) X"00"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(43) X"11"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(44) X"22"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(45) X"33"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(46) X"44"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(47) X"55"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(48) X"66"
change /mp2_cpu/dram/pdram/vhdl_memory/mem(49) X"77"
run 5
echo "Done loading ../testcode/mp2_2test1.asm program code."
