echo "--- Executing initialization force file for ../testcode/mp2test_STI_LDI.asm ---"

echo "Resetting processor for 5 ns."
force /reset_l 0 @0
force /reset_l 1 @5
echo "Initializing the processor."
force /start_h 0 @0
force /start_h 1 @10

-- Test case: lowering start_h should not impact the function of the processor
force /start_h 0 @ 100

echo "Done initializing processor, loading ../testcode/mp2test_STI_LDI.asm program code."
run 5
change /mp2_cpu/dram/vhdl_memory/mem(0) X"0E"
change /mp2_cpu/dram/vhdl_memory/mem(1) X"E0"
change /mp2_cpu/dram/vhdl_memory/mem(2) X"00"
change /mp2_cpu/dram/vhdl_memory/mem(3) X"62"
change /mp2_cpu/dram/vhdl_memory/mem(4) X"0E"
change /mp2_cpu/dram/vhdl_memory/mem(5) X"E4"
change /mp2_cpu/dram/vhdl_memory/mem(6) X"0E"
change /mp2_cpu/dram/vhdl_memory/mem(7) X"E6"
change /mp2_cpu/dram/vhdl_memory/mem(8) X"80"
change /mp2_cpu/dram/vhdl_memory/mem(9) X"76"
change /mp2_cpu/dram/vhdl_memory/mem(10) X"80"
change /mp2_cpu/dram/vhdl_memory/mem(11) X"B2"
change /mp2_cpu/dram/vhdl_memory/mem(12) X"61"
change /mp2_cpu/dram/vhdl_memory/mem(13) X"12"
change /mp2_cpu/dram/vhdl_memory/mem(14) X"81"
change /mp2_cpu/dram/vhdl_memory/mem(15) X"B2"
change /mp2_cpu/dram/vhdl_memory/mem(16) X"61"
change /mp2_cpu/dram/vhdl_memory/mem(17) X"12"
change /mp2_cpu/dram/vhdl_memory/mem(18) X"62"
change /mp2_cpu/dram/vhdl_memory/mem(19) X"12"
change /mp2_cpu/dram/vhdl_memory/mem(20) X"82"
change /mp2_cpu/dram/vhdl_memory/mem(21) X"B2"
change /mp2_cpu/dram/vhdl_memory/mem(22) X"80"
change /mp2_cpu/dram/vhdl_memory/mem(23) X"AA"
change /mp2_cpu/dram/vhdl_memory/mem(24) X"81"
change /mp2_cpu/dram/vhdl_memory/mem(25) X"AC"
change /mp2_cpu/dram/vhdl_memory/mem(26) X"82"
change /mp2_cpu/dram/vhdl_memory/mem(27) X"AE"
change /mp2_cpu/dram/vhdl_memory/mem(28) X"FF"
change /mp2_cpu/dram/vhdl_memory/mem(29) X"0F"
change /mp2_cpu/dram/vhdl_memory/mem(30) X"00"
change /mp2_cpu/dram/vhdl_memory/mem(31) X"FF"
change /mp2_cpu/dram/vhdl_memory/mem(32) X"10"
change /mp2_cpu/dram/vhdl_memory/mem(33) X"00"
change /mp2_cpu/dram/vhdl_memory/mem(44) X"0D"
change /mp2_cpu/dram/vhdl_memory/mem(45) X"60"
change /mp2_cpu/dram/vhdl_memory/mem(46) X"DD"
change /mp2_cpu/dram/vhdl_memory/mem(47) X"BA"
run 5
echo "Done loading ../testcode/mp2test_STI_LDI.asm program code."
