echo "--- Executing initialization force file for ../testcode/mp2test_SHF.asm ---"

echo "Resetting processor for 5 ns."
force /reset_l 0 @0
force /reset_l 1 @5
echo "Initializing the processor."
force /start_h 0 @0
force /start_h 1 @10

-- Test case: lowering start_h should not impact the function of the processor
force /start_h 0 @ 100

echo "Done initializing processor, loading ../testcode/mp2test_SHF.asm program code."
run 5
change /mp2_cpu/dram/vhdl_memory/mem(0) X"05"
change /mp2_cpu/dram/vhdl_memory/mem(1) X"E0"
change /mp2_cpu/dram/vhdl_memory/mem(2) X"00"
change /mp2_cpu/dram/vhdl_memory/mem(3) X"62"
change /mp2_cpu/dram/vhdl_memory/mem(4) X"61"
change /mp2_cpu/dram/vhdl_memory/mem(5) X"D4"
change /mp2_cpu/dram/vhdl_memory/mem(6) X"51"
change /mp2_cpu/dram/vhdl_memory/mem(7) X"D6"
change /mp2_cpu/dram/vhdl_memory/mem(8) X"71"
change /mp2_cpu/dram/vhdl_memory/mem(9) X"D8"
change /mp2_cpu/dram/vhdl_memory/mem(10) X"FF"
change /mp2_cpu/dram/vhdl_memory/mem(11) X"0F"
change /mp2_cpu/dram/vhdl_memory/mem(12) X"A0"
change /mp2_cpu/dram/vhdl_memory/mem(13) X"AA"
change /mp2_cpu/dram/vhdl_memory/mem(14) X"10"
change /mp2_cpu/dram/vhdl_memory/mem(15) X"00"
change /mp2_cpu/dram/vhdl_memory/mem(24) X"0D"
change /mp2_cpu/dram/vhdl_memory/mem(25) X"60"
change /mp2_cpu/dram/vhdl_memory/mem(26) X"DD"
change /mp2_cpu/dram/vhdl_memory/mem(27) X"BA"
run 5
echo "Done loading ../testcode/mp2test_SHF.asm program code."
