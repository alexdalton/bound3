echo "--- Executing initialization force file for ../testcode/BTBcheck1.asm ---"

echo "Resetting processor for 5 ns."
force /reset_l 0 @0
force /reset_l 1 @5
echo "Initializing the processor."
force /start_h 0 @0
force /start_h 1 @10

-- Test case: lowering start_h should not impact the function of the processor
force /start_h 0 @ 100

echo "Done initializing processor, loading ../testcode/BTBcheck1.asm program code."
run 5
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(0) X"08"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(1) X"66"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(2) X"61"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(3) X"12"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(4) X"A1"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(5) X"14"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(6) X"05"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(7) X"48"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(8) X"21"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(9) X"19"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(10) X"FF"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(11) X"16"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(12) X"FA"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(13) X"03"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(14) X"FF"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(15) X"0F"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(16) X"0A"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(17) X"00"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(18) X"61"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(19) X"1B"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(20) X"61"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(21) X"1B"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(22) X"C0"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(23) X"C1"
run 5
echo "Done loading ../testcode/BTBcheck1.asm program code."
