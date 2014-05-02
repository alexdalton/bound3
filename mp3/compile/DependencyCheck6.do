echo "--- Executing initialization force file for ../testcode/DependencyCheck6.asm ---"

echo "Resetting processor for 5 ns."
force /reset_l 0 @0
force /reset_l 1 @5
echo "Initializing the processor."
force /start_h 0 @0
force /start_h 1 @10

-- Test case: lowering start_h should not impact the function of the processor
force /start_h 0 @ 100

echo "Done initializing processor, loading ../testcode/DependencyCheck6.asm program code."
run 5
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(0) X"06"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(1) X"48"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(2) X"05"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(3) X"EC"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(4) X"A2"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(5) X"1D"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(6) X"80"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(7) X"41"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(8) X"A2"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(9) X"1D"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(10) X"03"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(11) X"48"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(12) X"FF"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(13) X"0F"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(14) X"C0"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(15) X"C1"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(16) X"61"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(17) X"12"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(18) X"62"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(19) X"12"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(20) X"C0"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(21) X"C1"
run 5
echo "Done loading ../testcode/DependencyCheck6.asm program code."
