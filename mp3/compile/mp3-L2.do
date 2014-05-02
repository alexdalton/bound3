echo "--- Executing initialization force file for ../testcode/mp3-L2.asm ---"

echo "Resetting processor for 5 ns."
force /reset_l 0 @0
force /reset_l 1 @5
echo "Initializing the processor."
force /start_h 0 @0
force /start_h 1 @10

-- Test case: lowering start_h should not impact the function of the processor
force /start_h 0 @ 100

echo "Done initializing processor, loading ../testcode/mp3-L2.asm program code."
run 5
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(0) X"7F"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1) X"E0"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(2) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(3) X"62"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(4) X"01"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(5) X"64"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(6) X"02"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(7) X"66"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(8) X"40"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(9) X"68"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(10) X"80"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(11) X"6A"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(12) X"65"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(13) X"1B"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(14) X"80"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(15) X"7A"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(16) X"40"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(17) X"6C"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(18) X"C0"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(19) X"6E"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(20) X"03"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(21) X"62"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(22) X"04"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(23) X"64"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(24) X"05"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(25) X"66"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(26) X"40"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(27) X"68"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(28) X"80"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(29) X"6A"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(30) X"C0"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(31) X"6C"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(32) X"06"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(33) X"62"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(34) X"07"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(35) X"64"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(36) X"08"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(37) X"66"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(38) X"40"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(39) X"68"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(40) X"80"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(41) X"6A"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(42) X"C0"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(43) X"6C"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(44) X"09"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(45) X"62"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(46) X"0A"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(47) X"64"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(48) X"0B"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(49) X"66"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(50) X"40"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(51) X"68"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(52) X"80"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(53) X"6A"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(54) X"C0"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(55) X"6C"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(56) X"01"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(57) X"62"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(58) X"40"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(59) X"6E"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(60) X"06"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(61) X"62"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(62) X"07"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(63) X"64"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(64) X"08"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(65) X"66"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(66) X"C0"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(67) X"6C"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(68) X"40"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(69) X"68"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(70) X"80"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(71) X"6A"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(72) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(73) X"62"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(74) X"01"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(75) X"64"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(76) X"02"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(77) X"66"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(78) X"40"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(79) X"68"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(80) X"24"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(81) X"19"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(82) X"42"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(83) X"78"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(84) X"80"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(85) X"6A"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(86) X"40"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(87) X"68"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(88) X"C0"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(89) X"6A"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(90) X"42"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(91) X"68"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(92) X"03"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(93) X"64"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(94) X"04"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(95) X"66"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(96) X"80"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(97) X"6A"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(98) X"40"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(99) X"68"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(100) X"C0"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(101) X"6A"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(102) X"42"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(103) X"68"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(104) X"05"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(105) X"64"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(106) X"06"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(107) X"66"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(108) X"80"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(109) X"6A"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(110) X"40"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(111) X"68"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(112) X"C0"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(113) X"6A"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(114) X"42"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(115) X"68"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(116) X"07"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(117) X"64"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(118) X"08"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(119) X"66"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(120) X"80"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(121) X"6A"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(122) X"40"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(123) X"68"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(124) X"C0"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(125) X"6A"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(126) X"80"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(127) X"68"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(128) X"42"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(129) X"68"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(130) X"FF"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(131) X"0F"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(256) X"A0"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(257) X"01"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(258) X"20"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(259) X"02"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(260) X"A0"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(261) X"02"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(262) X"20"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(263) X"03"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(264) X"A0"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(265) X"03"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(266) X"20"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(267) X"04"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(268) X"A0"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(269) X"04"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(270) X"20"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(271) X"05"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(272) X"A0"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(273) X"05"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(274) X"20"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(275) X"06"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(276) X"A0"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(277) X"06"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(278) X"20"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(279) X"07"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(288) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(289) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(290) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(291) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(416) X"11"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(417) X"11"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(418) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(419) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(420) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(421) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(422) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(423) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(424) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(425) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(426) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(427) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(428) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(429) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(430) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(431) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(544) X"22"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(545) X"22"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(546) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(547) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(548) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(549) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(550) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(551) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(552) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(553) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(554) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(555) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(556) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(557) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(558) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(559) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(672) X"33"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(673) X"33"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(674) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(675) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(676) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(677) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(678) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(679) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(680) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(681) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(682) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(683) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(684) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(685) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(686) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(687) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(800) X"44"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(801) X"44"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(802) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(803) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(804) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(805) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(806) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(807) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(808) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(809) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(810) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(811) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(812) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(813) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(814) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(815) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(928) X"55"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(929) X"55"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(930) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(931) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(932) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(933) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(934) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(935) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(936) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(937) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(938) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(939) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(940) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(941) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(942) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(943) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1056) X"66"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1057) X"66"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1058) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1059) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1060) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1061) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1062) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1063) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1064) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1065) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1066) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1067) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1068) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1069) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1070) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1071) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1184) X"77"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1185) X"77"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1186) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1187) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1188) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1189) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1190) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1191) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1192) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1193) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1194) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1195) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1196) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1197) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1198) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1199) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1312) X"88"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1313) X"88"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1314) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1315) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1316) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1317) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1318) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1319) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1320) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1321) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1322) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1323) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1324) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1325) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1326) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1327) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1440) X"99"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1441) X"99"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1442) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1443) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1444) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1445) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1446) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1447) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1448) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1449) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1450) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1451) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1452) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1453) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1454) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1455) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1568) X"AA"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1569) X"AA"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1570) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1571) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1572) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1573) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1574) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1575) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1576) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1577) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1578) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1579) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1580) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1581) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1582) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1583) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1696) X"BB"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1697) X"BB"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1698) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1699) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1700) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1701) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1702) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1703) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1704) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1705) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1706) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1707) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1708) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1709) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1710) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1711) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1824) X"CC"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1825) X"CC"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1826) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1827) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1828) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1829) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1830) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1831) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1832) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1833) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1834) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1835) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1836) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1837) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1838) X"00"
change /mp3_cpu/aMemory/PMEM/vhdl_memory/mem(1839) X"00"
run 5
echo "Done loading ../testcode/mp3-L2.asm program code."
