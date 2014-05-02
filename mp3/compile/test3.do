echo "--- Executing initialization force file for ../testcode/test3.asm ---"

echo "Resetting processor for 5 ns."
force /reset_l 0 @0
force /reset_l 1 @5
echo "Initializing the processor."
force /start_h 0 @0
force /start_h 1 @10

-- Test case: lowering start_h should not impact the function of the processor
force /start_h 0 @ 100

echo "Done initializing processor, loading ../testcode/test3.asm program code."
run 5
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(0) X"0B"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(1) X"62"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(2) X"0C"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(3) X"64"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(4) X"4A"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(5) X"56"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(6) X"09"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(7) X"76"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(8) X"9A"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(9) X"54"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(10) X"0A"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(11) X"74"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(12) X"09"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(13) X"6A"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(14) X"0A"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(15) X"6C"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(16) X"DD"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(17) X"1A"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(18) X"00"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(19) X"00"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(20) X"00"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(21) X"00"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(22) X"20"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(23) X"00"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(24) X"04"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(25) X"00"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(26) X"FF"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(27) X"0F"
run 5
echo "Done loading ../testcode/test3.asm program code."
