echo "--- Executing initialization force file for ../testcode/mp2test_JSR.asm ---"

echo "Resetting processor for 5 ns."
force /reset_l 0 @0
force /reset_l 1 @5
echo "Initializing the processor."
force /start_h 0 @0
force /start_h 1 @10

-- Test case: lowering start_h should not impact the function of the processor
force /start_h 0 @ 100

echo "Done initializing processor, loading ../testcode/mp2test_JSR.asm program code."
run 5
change /mp2_cpu/dram/vhdl_memory/mem(0) X"08"
change /mp2_cpu/dram/vhdl_memory/mem(1) X"E0"
change /mp2_cpu/dram/vhdl_memory/mem(2) X"00"
change /mp2_cpu/dram/vhdl_memory/mem(3) X"62"
change /mp2_cpu/dram/vhdl_memory/mem(4) X"03"
change /mp2_cpu/dram/vhdl_memory/mem(5) X"48"
change /mp2_cpu/dram/vhdl_memory/mem(6) X"02"
change /mp2_cpu/dram/vhdl_memory/mem(7) X"E4"
change /mp2_cpu/dram/vhdl_memory/mem(8) X"80"
change /mp2_cpu/dram/vhdl_memory/mem(9) X"40"
change /mp2_cpu/dram/vhdl_memory/mem(10) X"02"
change /mp2_cpu/dram/vhdl_memory/mem(11) X"48"
change /mp2_cpu/dram/vhdl_memory/mem(12) X"61"
change /mp2_cpu/dram/vhdl_memory/mem(13) X"12"
change /mp2_cpu/dram/vhdl_memory/mem(14) X"C0"
change /mp2_cpu/dram/vhdl_memory/mem(15) X"C1"
change /mp2_cpu/dram/vhdl_memory/mem(16) X"FF"
change /mp2_cpu/dram/vhdl_memory/mem(17) X"0F"
change /mp2_cpu/dram/vhdl_memory/mem(18) X"00"
change /mp2_cpu/dram/vhdl_memory/mem(19) X"FF"
run 5
echo "Done loading ../testcode/mp2test_JSR.asm program code."
