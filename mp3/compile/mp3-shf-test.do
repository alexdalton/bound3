echo "--- Executing initialization force file for ../testcode/mp3-shf-test.asm ---"

echo "Resetting processor for 5 ns."
force /reset_l 0 @0
force /reset_l 1 @5
echo "Initializing the processor."
force /start_h 0 @0
force /start_h 1 @10

-- Test case: lowering start_h should not impact the function of the processor
force /start_h 0 @ 100

echo "Done initializing processor, loading ../testcode/mp3-shf-test.asm program code."
run 5
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(0) X"09"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1) X"62"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(2) X"0A"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(3) X"64"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(4) X"09"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(5) X"66"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(6) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(7) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(8) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(9) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(10) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(11) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(12) X"65"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(13) X"D2"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(14) X"95"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(15) X"D4"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(16) X"F8"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(17) X"D6"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(18) X"FF"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(19) X"8F"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(20) X"77"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(21) X"77"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(22) X"11"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(23) X"11"
run 5
echo "Done loading ../testcode/mp3-shf-test.asm program code."
