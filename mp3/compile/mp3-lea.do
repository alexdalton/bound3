echo "--- Executing initialization force file for ../testcode/mp3-lea.asm ---"

echo "Resetting processor for 5 ns."
force /reset_l 0 @0
force /reset_l 1 @5
echo "Initializing the processor."
force /start_h 0 @0
force /start_h 1 @10

-- Test case: lowering start_h should not impact the function of the processor
force /start_h 0 @ 100

echo "Done initializing processor, loading ../testcode/mp3-lea.asm program code."
run 5
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(0) X"06"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1) X"E0"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(2) X"0E"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(3) X"E2"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(4) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(5) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(6) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(7) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(8) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(9) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(10) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(11) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(12) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(13) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(14) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(15) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(16) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(17) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(18) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(19) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(20) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(21) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(22) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(23) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(24) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(25) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(26) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(27) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(28) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(29) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(30) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(31) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(32) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(33) X"00"
run 5
echo "Done loading ../testcode/mp3-lea.asm program code."
