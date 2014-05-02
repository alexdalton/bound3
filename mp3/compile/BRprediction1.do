echo "--- Executing initialization force file for ../testcode/BRprediction1.asm ---"

echo "Resetting processor for 5 ns."
force /reset_l 0 @0
force /reset_l 1 @5
echo "Initializing the processor."
force /start_h 0 @0
force /start_h 1 @10

-- Test case: lowering start_h should not impact the function of the processor
force /start_h 0 @ 100

echo "Done initializing processor, loading ../testcode/BRprediction1.asm program code."
run 5
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(0) X"62"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(1) X"12"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(2) X"04"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(3) X"02"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(4) X"A1"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(5) X"14"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(6) X"E1"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(7) X"16"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(8) X"21"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(9) X"19"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(10) X"61"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(11) X"1B"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(12) X"63"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(13) X"12"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(14) X"FF"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(15) X"0F"
run 5
echo "Done loading ../testcode/BRprediction1.asm program code."
