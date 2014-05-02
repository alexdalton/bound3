echo "--- Executing initialization force file for ../testcode/mp3-trap.asm ---"

echo "Resetting processor for 5 ns."
force /reset_l 0 @0
force /reset_l 1 @5
echo "Initializing the processor."
force /start_h 0 @0
force /start_h 1 @10

-- Test case: lowering start_h should not impact the function of the processor
force /start_h 0 @ 100

echo "Done initializing processor, loading ../testcode/mp3-trap.asm program code."
run 5
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(0) X"04"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1) X"F0"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(2) X"A1"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(3) X"1D"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(4) X"A1"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(5) X"1D"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(6) X"A1"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(7) X"1D"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(8) X"14"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(9) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(10) X"A1"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(11) X"1D"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(12) X"A1"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(13) X"1D"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(14) X"A1"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(15) X"1D"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(16) X"A1"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(17) X"1D"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(18) X"A1"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(19) X"1D"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(20) X"61"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(21) X"12"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(22) X"A2"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(23) X"14"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(24) X"FF"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(25) X"0F"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(26) X"A1"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(27) X"1D"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(28) X"A1"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(29) X"1D"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(30) X"A1"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(31) X"1D"
run 5
echo "Done loading ../testcode/mp3-trap.asm program code."
