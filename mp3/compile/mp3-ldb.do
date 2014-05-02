echo "--- Executing initialization force file for ../testcode/mp3-ldb.asm ---"

echo "Resetting processor for 5 ns."
force /reset_l 0 @0
force /reset_l 1 @5
echo "Initializing the processor."
force /start_h 0 @0
force /start_h 1 @10

-- Test case: lowering start_h should not impact the function of the processor
force /start_h 0 @ 100

echo "Done initializing processor, loading ../testcode/mp3-ldb.asm program code."
run 5
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(0) X"14"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1) X"22"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(2) X"16"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(3) X"24"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(4) X"18"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(5) X"26"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(6) X"21"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(7) X"10"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(8) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(9) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(10) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(11) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(12) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(13) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(14) X"14"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(15) X"28"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(16) X"16"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(17) X"2A"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(18) X"18"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(19) X"2C"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(20) X"34"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(21) X"12"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(22) X"78"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(23) X"56"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(24) X"BC"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(25) X"9A"
run 5
echo "Done loading ../testcode/mp3-ldb.asm program code."
