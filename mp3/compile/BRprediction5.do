echo "--- Executing initialization force file for ../testcode/BRprediction5.asm ---"

echo "Resetting processor for 5 ns."
force /reset_l 0 @0
force /reset_l 1 @5
echo "Initializing the processor."
force /start_h 0 @0
force /start_h 1 @10

-- Test case: lowering start_h should not impact the function of the processor
force /start_h 0 @ 100

echo "Done initializing processor, loading ../testcode/BRprediction5.asm program code."
run 5
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(0) X"65"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(1) X"12"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(2) X"7F"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(3) X"12"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(4) X"FE"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(5) X"07"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(6) X"FF"
change /mp3_CPU/aMEMORY/PMEM/vhdl_memory/mem(7) X"0F"
run 5
echo "Done loading ../testcode/BRprediction5.asm program code."
