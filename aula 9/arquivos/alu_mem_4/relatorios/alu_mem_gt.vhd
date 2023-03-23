
-- 
-- Definition of  alu_mem
-- 
--      01/05/21 17:50:56
--      
--      LeonardoSpectrum Level 3, 2012b.6
-- 

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity alu_mem is
   port (
      clk : IN std_logic ;
      bs_from_rb : IN std_logic_vector (7 DOWNTO 0) ;
      ds_from_rb : IN std_logic_vector (7 DOWNTO 0) ;
      bs_from_cte : IN std_logic_vector (7 DOWNTO 0) ;
      ds_from_cte : IN std_logic_vector (7 DOWNTO 0) ;
      bs_ng_cte_incr : IN std_logic ;
      ds_ng_cte_incr : IN std_logic ;
      bs_data_in : IN std_logic_vector (7 DOWNTO 0) ;
      ds_data_in : IN std_logic_vector (7 DOWNTO 0) ;
      bs_data_out : OUT std_logic_vector (7 DOWNTO 0) ;
      ds_data_out : OUT std_logic_vector (7 DOWNTO 0) ;
      bs_mem_wr_en : IN std_logic ;
      ds_mem_wr_en : IN std_logic) ;
end alu_mem ;

architecture add_mux of alu_mem is
   signal mem_Mem_block_modgen_ram_ix60_a_4_dup_716, nx0, nx6, nx26, nx38, 
      nx52, nx58, nx62, nx68, nx74, nx80, nx86, nx90, nx98, nx120, nx126, 
      nx132, nx138, nx144, nx150, nx162, nx170, nx176, nx188, nx192, nx206, 
      nx212, mem_Mem_block_modgen_ram_ix60_a_19_dup_701, nx222, nx230, nx242, 
      nx252, nx256, mem_Mem_block_modgen_ram_ix60_a_36_dup_684, nx266, nx280, 
      nx282, nx284, mem_Mem_block_modgen_ram_ix60_a_42_dup_678, nx296, nx300, 
      nx310, nx314, nx318, mem_Mem_block_modgen_ram_ix60_a_30_dup_690, nx332, 
      nx336, nx344, nx348, mem_Mem_block_modgen_ram_ix60_a_16_dup_704, nx364, 
      mem_Mem_block_modgen_ram_ix60_a_27_dup_693, nx370, nx374, nx384, 
      mem_Mem_block_modgen_ram_ix60_a_51_dup_669, nx390, nx402, nx406, nx414, 
      mem_Mem_block_modgen_ram_ix60_a_28_dup_692, nx416, nx420, nx428, 
      mem_Mem_block_modgen_ram_ix60_a_35_dup_685, nx444, 
      mem_Mem_block_modgen_ram_ix60_a_57_dup_663, nx454, nx458, nx468, nx472, 
      mem_Mem_block_modgen_ram_ix60_a_17_dup_703, nx488, 
      mem_Mem_block_modgen_ram_ix60_a_59_dup_661, nx498, nx506, 
      mem_Mem_block_modgen_ram_ix60_a_24_dup_696, nx510, nx514, nx522, 
      mem_Mem_block_modgen_ram_ix60_a_47_dup_673, nx528, nx532, nx542, 
      mem_Mem_block_modgen_ram_ix60_a_34_dup_686, nx558, nx566, 
      mem_Mem_block_modgen_ram_ix60_a_43_dup_677, nx572, nx580, 
      mem_Mem_block_modgen_ram_ix60_a_0_dup_720, nx596, 
      mem_Mem_block_modgen_ram_ix60_a_1_dup_719, nx612, 
      mem_Mem_block_modgen_ram_ix60_a_41_dup_679, nx618, nx626, 
      mem_Mem_block_modgen_ram_ix60_a_33_dup_687, nx644, 
      mem_Mem_block_modgen_ram_ix60_a_63_dup_657, nx650, nx658, nx662, 
      mem_Mem_block_modgen_ram_ix60_a_62_dup_658, nx670, nx678, 
      mem_Mem_block_modgen_ram_ix60_a_25_dup_695, nx684, nx692, nx700, 
      mem_Mem_block_modgen_ram_ix60_a_58_dup_662, nx704, nx712, 
      mem_Mem_block_modgen_ram_ix60_a_6_dup_714, nx732, 
      mem_Mem_block_modgen_ram_ix60_a_22_dup_698, nx748, 
      mem_Mem_block_modgen_ram_ix60_a_12_dup_708, nx754, nx764, 
      mem_Mem_block_modgen_ram_ix60_a_8_dup_712, nx774, nx784, 
      mem_Mem_block_modgen_ram_ix60_a_39_dup_681, nx804, 
      mem_Mem_block_modgen_ram_ix60_a_55_dup_665, nx820, 
      mem_Mem_block_modgen_ram_ix60_a_45_dup_675, nx824, nx828, nx836, nx844, 
      mem_Mem_block_modgen_ram_ix60_a_44_dup_676, nx852, nx860, 
      mem_Mem_block_modgen_ram_ix60_a_32_dup_688, nx874, 
      mem_Mem_block_modgen_ram_ix60_a_48_dup_672, nx890, 
      mem_Mem_block_modgen_ram_ix60_a_40_dup_680, nx896, nx904, 
      mem_Mem_block_modgen_ram_ix60_a_29_dup_691, nx914, nx922, 
      mem_Mem_block_modgen_ram_ix60_a_31_dup_689, nx928, nx936, 
      mem_Mem_block_modgen_ram_ix60_a_3_dup_717, nx952, 
      mem_Mem_block_modgen_ram_ix60_a_2_dup_718, nx966, nx974, 
      mem_Mem_block_modgen_ram_ix60_a_38_dup_682, nx986, 
      mem_Mem_block_modgen_ram_ix60_a_49_dup_671, nx1000, 
      mem_Mem_block_modgen_ram_ix60_a_50_dup_670, nx1016, 
      mem_Mem_block_modgen_ram_ix60_a_60_dup_660, nx1022, nx1030, 
      mem_Mem_block_modgen_ram_ix60_a_61_dup_659, nx1040, nx1048, 
      mem_Mem_block_modgen_ram_ix60_a_53_dup_667, nx1068, 
      mem_Mem_block_modgen_ram_ix60_a_21_dup_699, nx1084, 
      mem_Mem_block_modgen_ram_ix60_a_37_dup_683, nx1098, nx1106, 
      mem_Mem_block_modgen_ram_ix60_a_5_dup_715, nx1120, 
      mem_Mem_block_modgen_ram_ix60_a_52_dup_668, nx1134, 
      mem_Mem_block_modgen_ram_ix60_a_20_dup_700, nx1150, 
      mem_Mem_block_modgen_ram_ix60_a_46_dup_674, nx1156, nx1164, 
      mem_Mem_block_modgen_ram_ix60_a_26_dup_694, nx1174, nx1182, 
      mem_Mem_block_modgen_ram_ix60_a_56_dup_664, nx1188, nx1196, 
      mem_Mem_block_modgen_ram_ix60_a_11_dup_709, nx1204, nx1212, 
      mem_Mem_block_modgen_ram_ix60_a_18_dup_702, nx1226, nx1234, 
      mem_Mem_block_modgen_ram_ix60_a_54_dup_666, nx1246, 
      mem_Mem_block_modgen_ram_ix60_a_13_dup_707, nx1252, nx1260, 
      mem_Mem_block_modgen_ram_ix60_a_9_dup_711, nx1268, nx1276, 
      mem_Mem_block_modgen_ram_ix60_a_10_dup_710, nx1282, nx1290, 
      mem_Mem_block_modgen_ram_ix60_a_15_dup_705, nx1300, nx1308, 
      mem_Mem_block_modgen_ram_ix60_a_7_dup_713, nx1322, 
      mem_Mem_block_modgen_ram_ix60_a_23_dup_697, nx1338, 
      mem_Mem_block_modgen_ram_ix60_a_14_dup_706, nx1344, nx1352, nx1360, 
      mem_Mem_block_modgen_ram_ix60_a_4_dup_646, 
      mem_Mem_block_modgen_ram_ix60_a_19_dup_631, 
      mem_Mem_block_modgen_ram_ix60_a_36_dup_614, 
      mem_Mem_block_modgen_ram_ix60_a_42_dup_608, 
      mem_Mem_block_modgen_ram_ix60_a_30_dup_620, 
      mem_Mem_block_modgen_ram_ix60_a_16_dup_634, 
      mem_Mem_block_modgen_ram_ix60_a_27_dup_623, 
      mem_Mem_block_modgen_ram_ix60_a_51_dup_599, nx1444, 
      mem_Mem_block_modgen_ram_ix60_a_28_dup_622, 
      mem_Mem_block_modgen_ram_ix60_a_35_dup_615, 
      mem_Mem_block_modgen_ram_ix60_a_57_dup_593, 
      mem_Mem_block_modgen_ram_ix60_a_17_dup_633, 
      mem_Mem_block_modgen_ram_ix60_a_59_dup_591, 
      mem_Mem_block_modgen_ram_ix60_a_24_dup_626, 
      mem_Mem_block_modgen_ram_ix60_a_47_dup_603, 
      mem_Mem_block_modgen_ram_ix60_a_34_dup_616, nx1522, 
      mem_Mem_block_modgen_ram_ix60_a_43_dup_607, 
      mem_Mem_block_modgen_ram_ix60_a_0_dup_650, 
      mem_Mem_block_modgen_ram_ix60_a_1_dup_649, 
      mem_Mem_block_modgen_ram_ix60_a_41_dup_609, 
      mem_Mem_block_modgen_ram_ix60_a_33_dup_617, 
      mem_Mem_block_modgen_ram_ix60_a_63_dup_587, 
      mem_Mem_block_modgen_ram_ix60_a_62_dup_588, 
      mem_Mem_block_modgen_ram_ix60_a_25_dup_625, nx1602, 
      mem_Mem_block_modgen_ram_ix60_a_58_dup_592, 
      mem_Mem_block_modgen_ram_ix60_a_6_dup_644, 
      mem_Mem_block_modgen_ram_ix60_a_22_dup_628, 
      mem_Mem_block_modgen_ram_ix60_a_12_dup_638, 
      mem_Mem_block_modgen_ram_ix60_a_8_dup_642, 
      mem_Mem_block_modgen_ram_ix60_a_39_dup_611, 
      mem_Mem_block_modgen_ram_ix60_a_55_dup_595, 
      mem_Mem_block_modgen_ram_ix60_a_45_dup_605, nx1680, 
      mem_Mem_block_modgen_ram_ix60_a_44_dup_606, 
      mem_Mem_block_modgen_ram_ix60_a_32_dup_618, 
      mem_Mem_block_modgen_ram_ix60_a_48_dup_602, 
      mem_Mem_block_modgen_ram_ix60_a_40_dup_610, 
      mem_Mem_block_modgen_ram_ix60_a_29_dup_621, 
      mem_Mem_block_modgen_ram_ix60_a_31_dup_619, 
      mem_Mem_block_modgen_ram_ix60_a_3_dup_647, 
      mem_Mem_block_modgen_ram_ix60_a_2_dup_648, nx1762, 
      mem_Mem_block_modgen_ram_ix60_a_38_dup_612, 
      mem_Mem_block_modgen_ram_ix60_a_49_dup_601, 
      mem_Mem_block_modgen_ram_ix60_a_50_dup_600, 
      mem_Mem_block_modgen_ram_ix60_a_60_dup_590, 
      mem_Mem_block_modgen_ram_ix60_a_61_dup_589, 
      mem_Mem_block_modgen_ram_ix60_a_53_dup_597, 
      mem_Mem_block_modgen_ram_ix60_a_21_dup_629, 
      mem_Mem_block_modgen_ram_ix60_a_37_dup_613, nx1840, 
      mem_Mem_block_modgen_ram_ix60_a_5_dup_645, 
      mem_Mem_block_modgen_ram_ix60_a_52_dup_598, 
      mem_Mem_block_modgen_ram_ix60_a_20_dup_630, 
      mem_Mem_block_modgen_ram_ix60_a_46_dup_604, 
      mem_Mem_block_modgen_ram_ix60_a_26_dup_624, 
      mem_Mem_block_modgen_ram_ix60_a_56_dup_594, 
      mem_Mem_block_modgen_ram_ix60_a_11_dup_639, 
      mem_Mem_block_modgen_ram_ix60_a_18_dup_632, nx1920, 
      mem_Mem_block_modgen_ram_ix60_a_54_dup_596, 
      mem_Mem_block_modgen_ram_ix60_a_13_dup_637, 
      mem_Mem_block_modgen_ram_ix60_a_9_dup_641, 
      mem_Mem_block_modgen_ram_ix60_a_10_dup_640, 
      mem_Mem_block_modgen_ram_ix60_a_15_dup_635, 
      mem_Mem_block_modgen_ram_ix60_a_7_dup_643, 
      mem_Mem_block_modgen_ram_ix60_a_23_dup_627, 
      mem_Mem_block_modgen_ram_ix60_a_14_dup_636, nx1998, 
      mem_Mem_block_modgen_ram_ix60_a_4_dup_576, 
      mem_Mem_block_modgen_ram_ix60_a_19_dup_561, 
      mem_Mem_block_modgen_ram_ix60_a_36_dup_544, 
      mem_Mem_block_modgen_ram_ix60_a_42_dup_538, 
      mem_Mem_block_modgen_ram_ix60_a_30_dup_550, 
      mem_Mem_block_modgen_ram_ix60_a_16_dup_564, 
      mem_Mem_block_modgen_ram_ix60_a_27_dup_553, 
      mem_Mem_block_modgen_ram_ix60_a_51_dup_529, nx2082, 
      mem_Mem_block_modgen_ram_ix60_a_28_dup_552, 
      mem_Mem_block_modgen_ram_ix60_a_35_dup_545, 
      mem_Mem_block_modgen_ram_ix60_a_57_dup_523, 
      mem_Mem_block_modgen_ram_ix60_a_17_dup_563, 
      mem_Mem_block_modgen_ram_ix60_a_59_dup_521, 
      mem_Mem_block_modgen_ram_ix60_a_24_dup_556, 
      mem_Mem_block_modgen_ram_ix60_a_47_dup_533, 
      mem_Mem_block_modgen_ram_ix60_a_34_dup_546, nx2160, 
      mem_Mem_block_modgen_ram_ix60_a_43_dup_537, 
      mem_Mem_block_modgen_ram_ix60_a_0_dup_580, 
      mem_Mem_block_modgen_ram_ix60_a_1_dup_579, 
      mem_Mem_block_modgen_ram_ix60_a_41_dup_539, 
      mem_Mem_block_modgen_ram_ix60_a_33_dup_547, 
      mem_Mem_block_modgen_ram_ix60_a_63_dup_517, 
      mem_Mem_block_modgen_ram_ix60_a_62_dup_518, 
      mem_Mem_block_modgen_ram_ix60_a_25_dup_555, nx2240, 
      mem_Mem_block_modgen_ram_ix60_a_58_dup_522, 
      mem_Mem_block_modgen_ram_ix60_a_6_dup_574, 
      mem_Mem_block_modgen_ram_ix60_a_22_dup_558, 
      mem_Mem_block_modgen_ram_ix60_a_12_dup_568, 
      mem_Mem_block_modgen_ram_ix60_a_8_dup_572, 
      mem_Mem_block_modgen_ram_ix60_a_39_dup_541, 
      mem_Mem_block_modgen_ram_ix60_a_55_dup_525, 
      mem_Mem_block_modgen_ram_ix60_a_45_dup_535, nx2318, 
      mem_Mem_block_modgen_ram_ix60_a_44_dup_536, 
      mem_Mem_block_modgen_ram_ix60_a_32_dup_548, 
      mem_Mem_block_modgen_ram_ix60_a_48_dup_532, 
      mem_Mem_block_modgen_ram_ix60_a_40_dup_540, 
      mem_Mem_block_modgen_ram_ix60_a_29_dup_551, 
      mem_Mem_block_modgen_ram_ix60_a_31_dup_549, 
      mem_Mem_block_modgen_ram_ix60_a_3_dup_577, 
      mem_Mem_block_modgen_ram_ix60_a_2_dup_578, nx2400, 
      mem_Mem_block_modgen_ram_ix60_a_38_dup_542, 
      mem_Mem_block_modgen_ram_ix60_a_49_dup_531, 
      mem_Mem_block_modgen_ram_ix60_a_50_dup_530, 
      mem_Mem_block_modgen_ram_ix60_a_60_dup_520, 
      mem_Mem_block_modgen_ram_ix60_a_61_dup_519, 
      mem_Mem_block_modgen_ram_ix60_a_53_dup_527, 
      mem_Mem_block_modgen_ram_ix60_a_21_dup_559, 
      mem_Mem_block_modgen_ram_ix60_a_37_dup_543, nx2478, 
      mem_Mem_block_modgen_ram_ix60_a_5_dup_575, 
      mem_Mem_block_modgen_ram_ix60_a_52_dup_528, 
      mem_Mem_block_modgen_ram_ix60_a_20_dup_560, 
      mem_Mem_block_modgen_ram_ix60_a_46_dup_534, 
      mem_Mem_block_modgen_ram_ix60_a_26_dup_554, 
      mem_Mem_block_modgen_ram_ix60_a_56_dup_524, 
      mem_Mem_block_modgen_ram_ix60_a_11_dup_569, 
      mem_Mem_block_modgen_ram_ix60_a_18_dup_562, nx2558, 
      mem_Mem_block_modgen_ram_ix60_a_54_dup_526, 
      mem_Mem_block_modgen_ram_ix60_a_13_dup_567, 
      mem_Mem_block_modgen_ram_ix60_a_9_dup_571, 
      mem_Mem_block_modgen_ram_ix60_a_10_dup_570, 
      mem_Mem_block_modgen_ram_ix60_a_15_dup_565, 
      mem_Mem_block_modgen_ram_ix60_a_7_dup_573, 
      mem_Mem_block_modgen_ram_ix60_a_23_dup_557, 
      mem_Mem_block_modgen_ram_ix60_a_14_dup_566, nx2636, 
      mem_Mem_block_modgen_ram_ix60_a_4_dup_506, 
      mem_Mem_block_modgen_ram_ix60_a_19_dup_491, 
      mem_Mem_block_modgen_ram_ix60_a_36_dup_474, 
      mem_Mem_block_modgen_ram_ix60_a_42_dup_468, 
      mem_Mem_block_modgen_ram_ix60_a_30_dup_480, 
      mem_Mem_block_modgen_ram_ix60_a_16_dup_494, 
      mem_Mem_block_modgen_ram_ix60_a_27_dup_483, 
      mem_Mem_block_modgen_ram_ix60_a_51_dup_459, nx2720, 
      mem_Mem_block_modgen_ram_ix60_a_28_dup_482, 
      mem_Mem_block_modgen_ram_ix60_a_35_dup_475, 
      mem_Mem_block_modgen_ram_ix60_a_57_dup_453, 
      mem_Mem_block_modgen_ram_ix60_a_17_dup_493, 
      mem_Mem_block_modgen_ram_ix60_a_59_dup_451, 
      mem_Mem_block_modgen_ram_ix60_a_24_dup_486, 
      mem_Mem_block_modgen_ram_ix60_a_47_dup_463, 
      mem_Mem_block_modgen_ram_ix60_a_34_dup_476, nx2798, 
      mem_Mem_block_modgen_ram_ix60_a_43_dup_467, 
      mem_Mem_block_modgen_ram_ix60_a_0_dup_510, 
      mem_Mem_block_modgen_ram_ix60_a_1_dup_509, 
      mem_Mem_block_modgen_ram_ix60_a_41_dup_469, 
      mem_Mem_block_modgen_ram_ix60_a_33_dup_477, 
      mem_Mem_block_modgen_ram_ix60_a_63_dup_447, 
      mem_Mem_block_modgen_ram_ix60_a_62_dup_448, 
      mem_Mem_block_modgen_ram_ix60_a_25_dup_485, nx2878, 
      mem_Mem_block_modgen_ram_ix60_a_58_dup_452, 
      mem_Mem_block_modgen_ram_ix60_a_6_dup_504, 
      mem_Mem_block_modgen_ram_ix60_a_22_dup_488, 
      mem_Mem_block_modgen_ram_ix60_a_12_dup_498, 
      mem_Mem_block_modgen_ram_ix60_a_8_dup_502, 
      mem_Mem_block_modgen_ram_ix60_a_39_dup_471, 
      mem_Mem_block_modgen_ram_ix60_a_55_dup_455, 
      mem_Mem_block_modgen_ram_ix60_a_45_dup_465, nx2956, 
      mem_Mem_block_modgen_ram_ix60_a_44_dup_466, 
      mem_Mem_block_modgen_ram_ix60_a_32_dup_478, 
      mem_Mem_block_modgen_ram_ix60_a_48_dup_462, 
      mem_Mem_block_modgen_ram_ix60_a_40_dup_470, 
      mem_Mem_block_modgen_ram_ix60_a_29_dup_481, 
      mem_Mem_block_modgen_ram_ix60_a_31_dup_479, 
      mem_Mem_block_modgen_ram_ix60_a_3_dup_507, 
      mem_Mem_block_modgen_ram_ix60_a_2_dup_508, nx3038, 
      mem_Mem_block_modgen_ram_ix60_a_38_dup_472, 
      mem_Mem_block_modgen_ram_ix60_a_49_dup_461, 
      mem_Mem_block_modgen_ram_ix60_a_50_dup_460, 
      mem_Mem_block_modgen_ram_ix60_a_60_dup_450, 
      mem_Mem_block_modgen_ram_ix60_a_61_dup_449, 
      mem_Mem_block_modgen_ram_ix60_a_53_dup_457, 
      mem_Mem_block_modgen_ram_ix60_a_21_dup_489, 
      mem_Mem_block_modgen_ram_ix60_a_37_dup_473, nx3116, 
      mem_Mem_block_modgen_ram_ix60_a_5_dup_505, 
      mem_Mem_block_modgen_ram_ix60_a_52_dup_458, 
      mem_Mem_block_modgen_ram_ix60_a_20_dup_490, 
      mem_Mem_block_modgen_ram_ix60_a_46_dup_464, 
      mem_Mem_block_modgen_ram_ix60_a_26_dup_484, 
      mem_Mem_block_modgen_ram_ix60_a_56_dup_454, 
      mem_Mem_block_modgen_ram_ix60_a_11_dup_499, 
      mem_Mem_block_modgen_ram_ix60_a_18_dup_492, nx3196, 
      mem_Mem_block_modgen_ram_ix60_a_54_dup_456, 
      mem_Mem_block_modgen_ram_ix60_a_13_dup_497, 
      mem_Mem_block_modgen_ram_ix60_a_9_dup_501, 
      mem_Mem_block_modgen_ram_ix60_a_10_dup_500, 
      mem_Mem_block_modgen_ram_ix60_a_15_dup_495, 
      mem_Mem_block_modgen_ram_ix60_a_7_dup_503, 
      mem_Mem_block_modgen_ram_ix60_a_23_dup_487, 
      mem_Mem_block_modgen_ram_ix60_a_14_dup_496, nx3274, 
      mem_Mem_block_modgen_ram_ix60_a_4_dup_436, 
      mem_Mem_block_modgen_ram_ix60_a_19_dup_421, 
      mem_Mem_block_modgen_ram_ix60_a_36_dup_404, 
      mem_Mem_block_modgen_ram_ix60_a_42_dup_398, 
      mem_Mem_block_modgen_ram_ix60_a_30_dup_410, 
      mem_Mem_block_modgen_ram_ix60_a_16_dup_424, 
      mem_Mem_block_modgen_ram_ix60_a_27_dup_413, 
      mem_Mem_block_modgen_ram_ix60_a_51_dup_389, nx3358, 
      mem_Mem_block_modgen_ram_ix60_a_28_dup_412, 
      mem_Mem_block_modgen_ram_ix60_a_35_dup_405, 
      mem_Mem_block_modgen_ram_ix60_a_57_dup_383, 
      mem_Mem_block_modgen_ram_ix60_a_17_dup_423, 
      mem_Mem_block_modgen_ram_ix60_a_59_dup_381, 
      mem_Mem_block_modgen_ram_ix60_a_24_dup_416, 
      mem_Mem_block_modgen_ram_ix60_a_47_dup_393, 
      mem_Mem_block_modgen_ram_ix60_a_34_dup_406, nx3436, 
      mem_Mem_block_modgen_ram_ix60_a_43_dup_397, 
      mem_Mem_block_modgen_ram_ix60_a_0_dup_440, 
      mem_Mem_block_modgen_ram_ix60_a_1_dup_439, 
      mem_Mem_block_modgen_ram_ix60_a_41_dup_399, 
      mem_Mem_block_modgen_ram_ix60_a_33_dup_407, 
      mem_Mem_block_modgen_ram_ix60_a_63_dup_377, 
      mem_Mem_block_modgen_ram_ix60_a_62_dup_378, 
      mem_Mem_block_modgen_ram_ix60_a_25_dup_415, nx3516, 
      mem_Mem_block_modgen_ram_ix60_a_58_dup_382, 
      mem_Mem_block_modgen_ram_ix60_a_6_dup_434, 
      mem_Mem_block_modgen_ram_ix60_a_22_dup_418, 
      mem_Mem_block_modgen_ram_ix60_a_12_dup_428, 
      mem_Mem_block_modgen_ram_ix60_a_8_dup_432, 
      mem_Mem_block_modgen_ram_ix60_a_39_dup_401, 
      mem_Mem_block_modgen_ram_ix60_a_55_dup_385, 
      mem_Mem_block_modgen_ram_ix60_a_45_dup_395, nx3594, 
      mem_Mem_block_modgen_ram_ix60_a_44_dup_396, 
      mem_Mem_block_modgen_ram_ix60_a_32_dup_408, 
      mem_Mem_block_modgen_ram_ix60_a_48_dup_392, 
      mem_Mem_block_modgen_ram_ix60_a_40_dup_400, 
      mem_Mem_block_modgen_ram_ix60_a_29_dup_411, 
      mem_Mem_block_modgen_ram_ix60_a_31_dup_409, 
      mem_Mem_block_modgen_ram_ix60_a_3_dup_437, 
      mem_Mem_block_modgen_ram_ix60_a_2_dup_438, nx3676, 
      mem_Mem_block_modgen_ram_ix60_a_38_dup_402, 
      mem_Mem_block_modgen_ram_ix60_a_49_dup_391, 
      mem_Mem_block_modgen_ram_ix60_a_50_dup_390, 
      mem_Mem_block_modgen_ram_ix60_a_60_dup_380, 
      mem_Mem_block_modgen_ram_ix60_a_61_dup_379, 
      mem_Mem_block_modgen_ram_ix60_a_53_dup_387, 
      mem_Mem_block_modgen_ram_ix60_a_21_dup_419, 
      mem_Mem_block_modgen_ram_ix60_a_37_dup_403, nx3754, 
      mem_Mem_block_modgen_ram_ix60_a_5_dup_435, 
      mem_Mem_block_modgen_ram_ix60_a_52_dup_388, 
      mem_Mem_block_modgen_ram_ix60_a_20_dup_420, 
      mem_Mem_block_modgen_ram_ix60_a_46_dup_394, 
      mem_Mem_block_modgen_ram_ix60_a_26_dup_414, 
      mem_Mem_block_modgen_ram_ix60_a_56_dup_384, 
      mem_Mem_block_modgen_ram_ix60_a_11_dup_429, 
      mem_Mem_block_modgen_ram_ix60_a_18_dup_422, nx3834, 
      mem_Mem_block_modgen_ram_ix60_a_54_dup_386, 
      mem_Mem_block_modgen_ram_ix60_a_13_dup_427, 
      mem_Mem_block_modgen_ram_ix60_a_9_dup_431, 
      mem_Mem_block_modgen_ram_ix60_a_10_dup_430, 
      mem_Mem_block_modgen_ram_ix60_a_15_dup_425, 
      mem_Mem_block_modgen_ram_ix60_a_7_dup_433, 
      mem_Mem_block_modgen_ram_ix60_a_23_dup_417, 
      mem_Mem_block_modgen_ram_ix60_a_14_dup_426, nx3912, 
      mem_Mem_block_modgen_ram_ix60_a_4_dup_366, 
      mem_Mem_block_modgen_ram_ix60_a_19_dup_351, 
      mem_Mem_block_modgen_ram_ix60_a_36_dup_334, 
      mem_Mem_block_modgen_ram_ix60_a_42_dup_328, 
      mem_Mem_block_modgen_ram_ix60_a_30_dup_340, 
      mem_Mem_block_modgen_ram_ix60_a_16_dup_354, 
      mem_Mem_block_modgen_ram_ix60_a_27_dup_343, 
      mem_Mem_block_modgen_ram_ix60_a_51_dup_319, nx3996, 
      mem_Mem_block_modgen_ram_ix60_a_28_dup_342, 
      mem_Mem_block_modgen_ram_ix60_a_35_dup_335, 
      mem_Mem_block_modgen_ram_ix60_a_57_dup_313, 
      mem_Mem_block_modgen_ram_ix60_a_17_dup_353, 
      mem_Mem_block_modgen_ram_ix60_a_59_dup_311, 
      mem_Mem_block_modgen_ram_ix60_a_24_dup_346, 
      mem_Mem_block_modgen_ram_ix60_a_47_dup_323, 
      mem_Mem_block_modgen_ram_ix60_a_34_dup_336, nx4074, 
      mem_Mem_block_modgen_ram_ix60_a_43_dup_327, 
      mem_Mem_block_modgen_ram_ix60_a_0_dup_370, 
      mem_Mem_block_modgen_ram_ix60_a_1_dup_369, 
      mem_Mem_block_modgen_ram_ix60_a_41_dup_329, 
      mem_Mem_block_modgen_ram_ix60_a_33_dup_337, 
      mem_Mem_block_modgen_ram_ix60_a_63_dup_307, 
      mem_Mem_block_modgen_ram_ix60_a_62_dup_308, 
      mem_Mem_block_modgen_ram_ix60_a_25_dup_345, nx4154, 
      mem_Mem_block_modgen_ram_ix60_a_58_dup_312, 
      mem_Mem_block_modgen_ram_ix60_a_6_dup_364, 
      mem_Mem_block_modgen_ram_ix60_a_22_dup_348, 
      mem_Mem_block_modgen_ram_ix60_a_12_dup_358, 
      mem_Mem_block_modgen_ram_ix60_a_8_dup_362, 
      mem_Mem_block_modgen_ram_ix60_a_39_dup_331, 
      mem_Mem_block_modgen_ram_ix60_a_55_dup_315, 
      mem_Mem_block_modgen_ram_ix60_a_45_dup_325, nx4232, 
      mem_Mem_block_modgen_ram_ix60_a_44_dup_326, 
      mem_Mem_block_modgen_ram_ix60_a_32_dup_338, 
      mem_Mem_block_modgen_ram_ix60_a_48_dup_322, 
      mem_Mem_block_modgen_ram_ix60_a_40_dup_330, 
      mem_Mem_block_modgen_ram_ix60_a_29_dup_341, 
      mem_Mem_block_modgen_ram_ix60_a_31_dup_339, 
      mem_Mem_block_modgen_ram_ix60_a_3_dup_367, 
      mem_Mem_block_modgen_ram_ix60_a_2_dup_368, nx4314, 
      mem_Mem_block_modgen_ram_ix60_a_38_dup_332, 
      mem_Mem_block_modgen_ram_ix60_a_49_dup_321, 
      mem_Mem_block_modgen_ram_ix60_a_50_dup_320, 
      mem_Mem_block_modgen_ram_ix60_a_60_dup_310, 
      mem_Mem_block_modgen_ram_ix60_a_61_dup_309, 
      mem_Mem_block_modgen_ram_ix60_a_53_dup_317, 
      mem_Mem_block_modgen_ram_ix60_a_21_dup_349, 
      mem_Mem_block_modgen_ram_ix60_a_37_dup_333, nx4392, 
      mem_Mem_block_modgen_ram_ix60_a_5_dup_365, 
      mem_Mem_block_modgen_ram_ix60_a_52_dup_318, 
      mem_Mem_block_modgen_ram_ix60_a_20_dup_350, 
      mem_Mem_block_modgen_ram_ix60_a_46_dup_324, 
      mem_Mem_block_modgen_ram_ix60_a_26_dup_344, 
      mem_Mem_block_modgen_ram_ix60_a_56_dup_314, 
      mem_Mem_block_modgen_ram_ix60_a_11_dup_359, 
      mem_Mem_block_modgen_ram_ix60_a_18_dup_352, nx4472, 
      mem_Mem_block_modgen_ram_ix60_a_54_dup_316, 
      mem_Mem_block_modgen_ram_ix60_a_13_dup_357, 
      mem_Mem_block_modgen_ram_ix60_a_9_dup_361, 
      mem_Mem_block_modgen_ram_ix60_a_10_dup_360, 
      mem_Mem_block_modgen_ram_ix60_a_15_dup_355, 
      mem_Mem_block_modgen_ram_ix60_a_7_dup_363, 
      mem_Mem_block_modgen_ram_ix60_a_23_dup_347, 
      mem_Mem_block_modgen_ram_ix60_a_14_dup_356, nx4550, 
      mem_Mem_block_modgen_ram_ix60_a_4_dup_296, 
      mem_Mem_block_modgen_ram_ix60_a_19_dup_281, 
      mem_Mem_block_modgen_ram_ix60_a_36_dup_264, 
      mem_Mem_block_modgen_ram_ix60_a_42_dup_258, 
      mem_Mem_block_modgen_ram_ix60_a_30_dup_270, 
      mem_Mem_block_modgen_ram_ix60_a_16_dup_284, 
      mem_Mem_block_modgen_ram_ix60_a_27_dup_273, 
      mem_Mem_block_modgen_ram_ix60_a_51_dup_249, nx4634, 
      mem_Mem_block_modgen_ram_ix60_a_28_dup_272, 
      mem_Mem_block_modgen_ram_ix60_a_35_dup_265, 
      mem_Mem_block_modgen_ram_ix60_a_57_dup_243, 
      mem_Mem_block_modgen_ram_ix60_a_17_dup_283, 
      mem_Mem_block_modgen_ram_ix60_a_59_dup_241, 
      mem_Mem_block_modgen_ram_ix60_a_24_dup_276, 
      mem_Mem_block_modgen_ram_ix60_a_47_dup_253, 
      mem_Mem_block_modgen_ram_ix60_a_34_dup_266, nx4712, 
      mem_Mem_block_modgen_ram_ix60_a_43_dup_257, 
      mem_Mem_block_modgen_ram_ix60_a_0_dup_300, 
      mem_Mem_block_modgen_ram_ix60_a_1_dup_299, 
      mem_Mem_block_modgen_ram_ix60_a_41_dup_259, 
      mem_Mem_block_modgen_ram_ix60_a_33_dup_267, 
      mem_Mem_block_modgen_ram_ix60_a_63_dup_237, 
      mem_Mem_block_modgen_ram_ix60_a_62_dup_238, 
      mem_Mem_block_modgen_ram_ix60_a_25_dup_275, nx4792, 
      mem_Mem_block_modgen_ram_ix60_a_58_dup_242, 
      mem_Mem_block_modgen_ram_ix60_a_6_dup_294, 
      mem_Mem_block_modgen_ram_ix60_a_22_dup_278, 
      mem_Mem_block_modgen_ram_ix60_a_12_dup_288, 
      mem_Mem_block_modgen_ram_ix60_a_8_dup_292, 
      mem_Mem_block_modgen_ram_ix60_a_39_dup_261, 
      mem_Mem_block_modgen_ram_ix60_a_55_dup_245, 
      mem_Mem_block_modgen_ram_ix60_a_45_dup_255, nx4870, 
      mem_Mem_block_modgen_ram_ix60_a_44_dup_256, 
      mem_Mem_block_modgen_ram_ix60_a_32_dup_268, 
      mem_Mem_block_modgen_ram_ix60_a_48_dup_252, 
      mem_Mem_block_modgen_ram_ix60_a_40_dup_260, 
      mem_Mem_block_modgen_ram_ix60_a_29_dup_271, 
      mem_Mem_block_modgen_ram_ix60_a_31_dup_269, 
      mem_Mem_block_modgen_ram_ix60_a_3_dup_297, 
      mem_Mem_block_modgen_ram_ix60_a_2_dup_298, nx4952, 
      mem_Mem_block_modgen_ram_ix60_a_38_dup_262, 
      mem_Mem_block_modgen_ram_ix60_a_49_dup_251, 
      mem_Mem_block_modgen_ram_ix60_a_50_dup_250, 
      mem_Mem_block_modgen_ram_ix60_a_60_dup_240, 
      mem_Mem_block_modgen_ram_ix60_a_61_dup_239, 
      mem_Mem_block_modgen_ram_ix60_a_53_dup_247, 
      mem_Mem_block_modgen_ram_ix60_a_21_dup_279, 
      mem_Mem_block_modgen_ram_ix60_a_37_dup_263, nx5030, 
      mem_Mem_block_modgen_ram_ix60_a_5_dup_295, 
      mem_Mem_block_modgen_ram_ix60_a_52_dup_248, 
      mem_Mem_block_modgen_ram_ix60_a_20_dup_280, 
      mem_Mem_block_modgen_ram_ix60_a_46_dup_254, 
      mem_Mem_block_modgen_ram_ix60_a_26_dup_274, 
      mem_Mem_block_modgen_ram_ix60_a_56_dup_244, 
      mem_Mem_block_modgen_ram_ix60_a_11_dup_289, 
      mem_Mem_block_modgen_ram_ix60_a_18_dup_282, nx5110, 
      mem_Mem_block_modgen_ram_ix60_a_54_dup_246, 
      mem_Mem_block_modgen_ram_ix60_a_13_dup_287, 
      mem_Mem_block_modgen_ram_ix60_a_9_dup_291, 
      mem_Mem_block_modgen_ram_ix60_a_10_dup_290, 
      mem_Mem_block_modgen_ram_ix60_a_15_dup_285, 
      mem_Mem_block_modgen_ram_ix60_a_7_dup_293, 
      mem_Mem_block_modgen_ram_ix60_a_23_dup_277, 
      mem_Mem_block_modgen_ram_ix60_a_14_dup_286, nx5188, 
      mem_Mem_block_modgen_ram_ix60_a_4_dup_232, 
      mem_Mem_block_modgen_ram_ix60_a_19, mem_Mem_block_modgen_ram_ix60_a_36, 
      mem_Mem_block_modgen_ram_ix60_a_42, mem_Mem_block_modgen_ram_ix60_a_30, 
      mem_Mem_block_modgen_ram_ix60_a_16, mem_Mem_block_modgen_ram_ix60_a_27, 
      mem_Mem_block_modgen_ram_ix60_a_51, nx5272, 
      mem_Mem_block_modgen_ram_ix60_a_28, mem_Mem_block_modgen_ram_ix60_a_35, 
      mem_Mem_block_modgen_ram_ix60_a_57, mem_Mem_block_modgen_ram_ix60_a_17, 
      mem_Mem_block_modgen_ram_ix60_a_59, mem_Mem_block_modgen_ram_ix60_a_24, 
      mem_Mem_block_modgen_ram_ix60_a_47, mem_Mem_block_modgen_ram_ix60_a_34, 
      nx5350, mem_Mem_block_modgen_ram_ix60_a_43, 
      mem_Mem_block_modgen_ram_ix60_a_0_dup_236, 
      mem_Mem_block_modgen_ram_ix60_a_1_dup_235, 
      mem_Mem_block_modgen_ram_ix60_a_41, mem_Mem_block_modgen_ram_ix60_a_33, 
      mem_Mem_block_modgen_ram_ix60_a_63, mem_Mem_block_modgen_ram_ix60_a_62, 
      mem_Mem_block_modgen_ram_ix60_a_25, nx5430, 
      mem_Mem_block_modgen_ram_ix60_a_58, mem_Mem_block_modgen_ram_ix60_a_6, 
      mem_Mem_block_modgen_ram_ix60_a_22, mem_Mem_block_modgen_ram_ix60_a_12, 
      mem_Mem_block_modgen_ram_ix60_a_8, mem_Mem_block_modgen_ram_ix60_a_39, 
      mem_Mem_block_modgen_ram_ix60_a_55, mem_Mem_block_modgen_ram_ix60_a_45, 
      nx5508, mem_Mem_block_modgen_ram_ix60_a_44, 
      mem_Mem_block_modgen_ram_ix60_a_32, mem_Mem_block_modgen_ram_ix60_a_48, 
      mem_Mem_block_modgen_ram_ix60_a_40, mem_Mem_block_modgen_ram_ix60_a_29, 
      mem_Mem_block_modgen_ram_ix60_a_31, 
      mem_Mem_block_modgen_ram_ix60_a_3_dup_233, 
      mem_Mem_block_modgen_ram_ix60_a_2_dup_234, nx5590, 
      mem_Mem_block_modgen_ram_ix60_a_38, mem_Mem_block_modgen_ram_ix60_a_49, 
      mem_Mem_block_modgen_ram_ix60_a_50, mem_Mem_block_modgen_ram_ix60_a_60, 
      mem_Mem_block_modgen_ram_ix60_a_61, mem_Mem_block_modgen_ram_ix60_a_53, 
      mem_Mem_block_modgen_ram_ix60_a_21, mem_Mem_block_modgen_ram_ix60_a_37, 
      nx5668, mem_Mem_block_modgen_ram_ix60_a_5_dup_231, 
      mem_Mem_block_modgen_ram_ix60_a_52, mem_Mem_block_modgen_ram_ix60_a_20, 
      mem_Mem_block_modgen_ram_ix60_a_46, mem_Mem_block_modgen_ram_ix60_a_26, 
      mem_Mem_block_modgen_ram_ix60_a_56, mem_Mem_block_modgen_ram_ix60_a_11, 
      mem_Mem_block_modgen_ram_ix60_a_18, nx5748, 
      mem_Mem_block_modgen_ram_ix60_a_54, mem_Mem_block_modgen_ram_ix60_a_13, 
      mem_Mem_block_modgen_ram_ix60_a_9, mem_Mem_block_modgen_ram_ix60_a_10, 
      mem_Mem_block_modgen_ram_ix60_a_15, mem_Mem_block_modgen_ram_ix60_a_7, 
      mem_Mem_block_modgen_ram_ix60_a_23, mem_Mem_block_modgen_ram_ix60_a_14, 
      nx5826, nx247, nx257, nx267, nx277, nx287, nx297, nx307, nx317, nx327, 
      nx337, nx347, nx357, nx367, nx377, nx387, nx397, nx407, nx417, nx427, 
      nx437, nx447, nx457, nx467, nx477, nx487, nx497, nx507, nx517, nx527, 
      nx537, nx547, nx557, nx567, nx577, nx587, nx597, nx607, nx617, nx627, 
      nx637, nx647, nx657, nx667, nx677, nx687, nx697, nx707, nx717, nx727, 
      nx737, nx747, nx757, nx767, nx777, nx787, nx797, nx807, nx817, nx827, 
      nx837, nx847, nx857, nx867, nx877, nx887, nx897, nx907, nx917, nx927, 
      nx937, nx947, nx957, nx967, nx977, nx987, nx997, nx1007, nx1017, 
      nx1027, nx1037, nx1047, nx1057, nx1067, nx1077, nx1087, nx1097, nx1107, 
      nx1117, nx1127, nx1137, nx1147, nx1157, nx1167, nx1177, nx1187, nx1197, 
      nx1207, nx1217, nx1227, nx1237, nx1247, nx1257, nx1267, nx1277, nx1287, 
      nx1297, nx1307, nx1317, nx1327, nx1337, nx1347, nx1357, nx1367, nx1377, 
      nx1387, nx1397, nx1407, nx1417, nx1427, nx1437, nx1447, nx1457, nx1467, 
      nx1477, nx1487, nx1497, nx1507, nx1517, nx1527, nx1537, nx1547, nx1557, 
      nx1567, nx1577, nx1587, nx1597, nx1607, nx1617, nx1627, nx1637, nx1647, 
      nx1657, nx1667, nx1677, nx1687, nx1697, nx1707, nx1717, nx1727, nx1737, 
      nx1747, nx1757, nx1767, nx1777, nx1787, nx1797, nx1807, nx1817, nx1827, 
      nx1837, nx1847, nx1857, nx1867, nx1877, nx1887, nx1897, nx1907, nx1917, 
      nx1927, nx1937, nx1947, nx1957, nx1967, nx1977, nx1987, nx1997, nx2007, 
      nx2017, nx2027, nx2037, nx2047, nx2057, nx2067, nx2077, nx2087, nx2097, 
      nx2107, nx2117, nx2127, nx2137, nx2147, nx2157, nx2167, nx2177, nx2187, 
      nx2197, nx2207, nx2217, nx2227, nx2237, nx2247, nx2257, nx2267, nx2277, 
      nx2287, nx2297, nx2307, nx2317, nx2327, nx2337, nx2347, nx2357, nx2367, 
      nx2377, nx2387, nx2397, nx2407, nx2417, nx2427, nx2437, nx2447, nx2457, 
      nx2467, nx2477, nx2487, nx2497, nx2507, nx2517, nx2527, nx2537, nx2547, 
      nx2557, nx2567, nx2577, nx2587, nx2597, nx2607, nx2617, nx2627, nx2637, 
      nx2647, nx2657, nx2667, nx2677, nx2687, nx2697, nx2707, nx2717, nx2727, 
      nx2737, nx2747, nx2757, nx2767, nx2777, nx2787, nx2797, nx2807, nx2817, 
      nx2827, nx2837, nx2847, nx2857, nx2867, nx2877, nx2887, nx2897, nx2907, 
      nx2917, nx2927, nx2937, nx2947, nx2957, nx2967, nx2977, nx2987, nx2997, 
      nx3007, nx3017, nx3027, nx3037, nx3047, nx3057, nx3067, nx3077, nx3087, 
      nx3097, nx3107, nx3117, nx3127, nx3137, nx3147, nx3157, nx3167, nx3177, 
      nx3187, nx3197, nx3207, nx3217, nx3227, nx3237, nx3247, nx3257, nx3267, 
      nx3277, nx3287, nx3297, nx3307, nx3317, nx3327, nx3337, nx3347, nx3357, 
      nx3367, nx3377, nx3387, nx3397, nx3407, nx3417, nx3427, nx3437, nx3447, 
      nx3457, nx3467, nx3477, nx3487, nx3497, nx3507, nx3517, nx3527, nx3537, 
      nx3547, nx3557, nx3567, nx3577, nx3587, nx3597, nx3607, nx3617, nx3627, 
      nx3637, nx3647, nx3657, nx3667, nx3677, nx3687, nx3697, nx3707, nx3717, 
      nx3727, nx3737, nx3747, nx3757, nx3767, nx3777, nx3787, nx3797, nx3807, 
      nx3817, nx3827, nx3837, nx3847, nx3857, nx3867, nx3877, nx3887, nx3897, 
      nx3907, nx3917, nx3927, nx3937, nx3947, nx3957, nx3967, nx3977, nx3987, 
      nx3997, nx4007, nx4017, nx4027, nx4037, nx4047, nx4057, nx4067, nx4077, 
      nx4087, nx4097, nx4107, nx4117, nx4127, nx4137, nx4147, nx4157, nx4167, 
      nx4177, nx4187, nx4197, nx4207, nx4217, nx4227, nx4237, nx4247, nx4257, 
      nx4267, nx4277, nx4287, nx4297, nx4307, nx4317, nx4327, nx4337, nx4347, 
      nx4357, nx4367, nx4377, nx4387, nx4397, nx4407, nx4417, nx4427, nx4437, 
      nx4447, nx4457, nx4467, nx4477, nx4487, nx4497, nx4507, nx4517, nx4527, 
      nx4537, nx4547, nx4557, nx4567, nx4577, nx4587, nx4597, nx4607, nx4617, 
      nx4627, nx4637, nx4647, nx4657, nx4667, nx4677, nx4687, nx4697, nx4707, 
      nx4717, nx4727, nx4737, nx4747, nx4757, nx4767, nx4777, nx4787, nx4797, 
      nx4807, nx4817, nx4827, nx4837, nx4847, nx4857, nx4867, nx4877, nx4887, 
      nx4897, nx4907, nx4917, nx4927, nx4937, nx4947, nx4957, nx4967, nx4977, 
      nx4987, nx4997, nx5007, nx5017, nx5027, nx5037, nx5047, nx5057, nx5067, 
      nx5077, nx5087, nx5097, nx5107, nx5117, nx5127, nx5137, nx5147, nx5157, 
      nx5167, nx5177, nx5187, nx5197, nx5207, nx5217, nx5227, nx5237, nx5247, 
      nx5257, nx5267, nx5277, nx5287, nx5297, nx5307, nx5317, nx5327, nx5337, 
      nx5347, nx5357, nx5369, nx5373, nx5379, nx5382, nx5384, nx5387, nx5393, 
      nx5395, nx5399, nx5402, nx5405, nx5407, nx5409, nx5411, nx5413, nx5415, 
      nx5419, nx5422, nx5429, nx5431, nx5434, nx5439, nx5443, nx5445, nx5447, 
      nx5449, nx5452, nx5455, nx5459, nx5461, nx5465, nx5469, nx5474, nx5477, 
      nx5487, nx5490, nx5497, nx5505, nx5511, nx5513, nx5519, nx5527, nx5535, 
      nx5542, nx5547, nx5549, nx5556, nx5564, nx5569, nx5571, nx5585, nx5599, 
      nx5603, nx5605, nx5611, nx5613, nx5622, nx5631, nx5642, nx5645, nx5657, 
      nx5659, nx5663, nx5665, nx5671, nx5681, nx5685, nx5691, nx5697, nx5699, 
      nx5705, nx5711, nx5715, nx5721, nx5725, nx5729, nx5733, nx5743, nx5747, 
      nx5752, nx5757, nx5767, nx5771, nx5773, nx5779, nx5785, nx5790, nx5795, 
      nx5799, nx5801, nx5805, nx5813, nx5821, nx5831, nx5836, nx5838, nx5842, 
      nx5846, nx5850, nx5857, nx5860, nx5864, nx5873, nx5877, nx5886, nx5895, 
      nx5899, nx5908, nx5913, nx5925, nx5929, nx5938, nx5947, nx5951, nx5960, 
      nx5965, nx5969, nx5978, nx5990, nx5999, nx6003, nx6007, nx6017, nx6021, 
      nx6030, nx6039, nx6043, nx6052, nx6056, nx6060, nx6066, nx6071, nx6074, 
      nx6082, nx6090, nx6098, nx6107, nx6115, nx6123, nx6131, nx6140, nx6148, 
      nx6156, nx6164, nx6173, nx6181, nx6189, nx6197, nx6205, nx6208, nx6216, 
      nx6224, nx6232, nx6241, nx6249, nx6257, nx6265, nx6274, nx6282, nx6290, 
      nx6298, nx6307, nx6315, nx6323, nx6331, nx6340, nx6343, nx6351, nx6359, 
      nx6367, nx6376, nx6384, nx6392, nx6400, nx6409, nx6417, nx6425, nx6433, 
      nx6442, nx6450, nx6458, nx6466, nx6474, nx6477, nx6485, nx6493, nx6501, 
      nx6510, nx6518, nx6526, nx6534, nx6543, nx6551, nx6559, nx6567, nx6576, 
      nx6584, nx6592, nx6600, nx6609, nx6612, nx6620, nx6628, nx6636, nx6645, 
      nx6653, nx6661, nx6669, nx6678, nx6686, nx6694, nx6702, nx6711, nx6719, 
      nx6727, nx6735, nx6743, nx6746, nx6754, nx6762, nx6770, nx6779, nx6787, 
      nx6795, nx6803, nx6812, nx6820, nx6828, nx6836, nx6845, nx6853, nx6861, 
      nx6869, nx6878, nx6881, nx6889, nx6897, nx6905, nx6914, nx6922, nx6930, 
      nx6938, nx6947, nx6955, nx6963, nx6971, nx6980, nx6988, nx6996, nx7004, 
      nx7012, nx7015, nx7023, nx7031, nx7039, nx7048, nx7056, nx7064, nx7072, 
      nx7081, nx7089, nx7097, nx7105, nx7114, nx7122, nx7130, nx7138, nx7147, 
      nx7150, nx7158, nx7166, nx7174, nx7183, nx7191, nx7199, nx7207, nx7216, 
      nx7224, nx7232, nx7240, nx7249, nx7257, nx7265, nx7273, nx7281, nx7284, 
      nx7292, nx7300, nx7308, nx7317, nx7325, nx7333, nx7341, nx7350, nx7358, 
      nx7366, nx7374, nx7383, nx7391, nx7399, nx7407, nx7416, nx7419, nx7427, 
      nx7435, nx7443, nx7452, nx7460, nx7468, nx7476, nx7485, nx7493, nx7501, 
      nx7509, nx7518, nx7526, nx7534, nx7542, nx7550, nx7553, nx7561, nx7569, 
      nx7577, nx7586, nx7594, nx7602, nx7610, nx7619, nx7627, nx7635, nx7643, 
      nx7652, nx7660, nx7668, nx7676, nx7685, nx7688, nx7696, nx7704, nx7712, 
      nx7721, nx7729, nx7737, nx7745, nx7754, nx7762, nx7770, nx7778, nx7787, 
      nx7795, nx7803, nx7811, nx7819, nx7822, nx7830, nx7838, nx7846, nx7855, 
      nx7863, nx7871, nx7879, nx7888, nx7896, nx7904, nx7912, nx7921, nx7929, 
      nx7937, nx7945, nx7958, nx7960, nx7962, nx7964, nx7966, nx7968, nx7970, 
      nx7972, nx7974, nx7976, nx7978, nx7980, nx7982, nx7984, nx7986, nx7988, 
      nx7990, nx7992, nx7994, nx7996, nx7998, nx8000, nx8002, nx8004, nx8006, 
      nx8008, nx8010, nx8012, nx8014, nx8016, nx8018, nx8020, nx8022, nx8024, 
      nx8026, nx8028, nx8030, nx8032, nx8034, nx8036, nx8038, nx8040, nx8042, 
      nx8044, nx8046, nx8048, nx8050, nx8052, nx8054, nx8056, nx8058, nx8060, 
      nx8062, nx8064, nx8066, nx8068, nx8070, nx8072, nx8074, nx8076, nx8078, 
      nx8080, nx8082, nx8084, nx8086, nx8088, nx8090, nx8092, nx8094, nx8096, 
      nx8098, nx8100, nx8102, nx8104, nx8106, nx8108, nx8110, nx8112, nx8114, 
      nx8116, nx8118, nx8120, nx8122, nx8124, nx8126, nx8128, nx8130, nx8132, 
      nx8134, nx8136, nx8138, nx8140, nx8142, nx8144, nx8146, nx8148, nx8150, 
      nx8152, nx8154, nx8156, nx8158, nx8162, nx8174, nx8176, nx8180, nx8188, 
      nx8192, nx8194, nx8204, nx8210, nx8212, nx8214, nx8216, nx8220, nx8230, 
      nx8234, nx8238, nx8240, nx8242, nx8244, nx8248, nx8252, nx8254, nx8256, 
      nx8258, nx8260, nx8266, nx8268, nx8270, nx8272, nx8274, nx8276, nx8278, 
      nx8280, nx8282, nx8284, nx8286, nx8288, nx8290, nx8292, nx8294, nx8296, 
      nx8298, nx8300, nx8302, nx8304, nx8306, nx8308, nx8310, nx8312, nx8314, 
      nx8316, nx8318, nx8320, nx8322, nx8324, nx8326, nx8328, nx8330, nx8332, 
      nx8334, nx8340, nx8342, nx8344, nx8346, nx8348, nx8350, nx8352, nx8354, 
      nx8356, nx8358, nx8360, nx8362, nx8364, nx8366, nx8368, nx8370, nx8372, 
      nx8374, nx8376, nx8378, nx8380, nx8386, nx8388, nx8390, nx8392, nx8398, 
      nx8400, nx8402, nx8404, nx8406, nx8408, nx8410, nx8412, nx8414, nx8416, 
      nx8418, nx8420, nx8422, nx8424, nx8426, nx8428, nx8430, nx8432, nx8434, 
      nx8436, nx8438, nx8440, nx8442, nx8444, nx8446, nx8448, nx8450, nx8452, 
      nx8454, nx8456, nx8458, nx8460, nx8462, nx8464, nx8466, nx8468, nx8470, 
      nx8472, nx8474, nx8476, nx8478, nx8480, nx8482, nx8484, nx8486, nx8488, 
      nx8490, nx8492, nx8494: std_logic ;

begin
   ix1367 : nand02 port map ( Y=>ds_data_out(0), A0=>nx5369, A1=>nx5857);
   ix5370 : nor04 port map ( Y=>nx5369, A0=>nx1360, A1=>nx1234, A2=>nx1106, 
      A3=>nx974);
   ix1361 : nand04 port map ( Y=>nx1360, A0=>nx5373, A1=>nx5513, A2=>nx5535, 
      A3=>nx5564);
   ix5374 : aoi22 port map ( Y=>nx5373, A0=>
      mem_Mem_block_modgen_ram_ix60_a_14_dup_706, A1=>nx8158, B0=>
      mem_Mem_block_modgen_ram_ix60_a_23_dup_697, B1=>nx8154);
   mem_Mem_block_modgen_ram_ix60_ix2122 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_14_dup_706, QB=>OPEN, D=>nx877, CLK=>
      clk);
   ix878 : mux21_ni port map ( Y=>nx877, A0=>
      mem_Mem_block_modgen_ram_ix60_a_14_dup_706, A1=>bs_data_in(0), S0=>
      nx8156);
   ix333 : nand02 port map ( Y=>nx332, A0=>nx8482, A1=>nx8358);
   ix5383 : inv01 port map ( Y=>nx5382, A=>bs_from_rb(0));
   ix5385 : aoi22 port map ( Y=>nx5384, A0=>bs_from_cte(1), A1=>nx5387, B0=>
      nx0, B1=>nx6);
   ix5388 : inv01 port map ( Y=>nx5387, A=>bs_ng_cte_incr);
   ix1 : or02 port map ( Y=>nx0, A0=>bs_from_rb(1), A1=>bs_from_rb(0));
   ix7 : aoi21 port map ( Y=>nx6, A0=>bs_from_rb(0), A1=>bs_from_rb(1), B0=>
      nx5387);
   ix5394 : nor02 port map ( Y=>nx5393, A0=>nx5395, A1=>nx8390);
   ix5396 : aoi21 port map ( Y=>nx5395, A0=>bs_from_cte(2), A1=>nx5387, B0=>
      nx52);
   ix5400 : aoi21 port map ( Y=>nx5399, A0=>bs_from_rb(0), A1=>bs_from_rb(1), 
      B0=>bs_from_rb(2));
   ix5403 : aoi21 port map ( Y=>nx5402, A0=>bs_from_cte(3), A1=>nx5387, B0=>
      nx38);
   ix39 : aoi21 port map ( Y=>nx38, A0=>nx5405, A1=>nx5407, B0=>nx5409);
   ix5406 : nand03 port map ( Y=>nx5405, A0=>bs_from_rb(2), A1=>
      bs_from_rb(0), A2=>bs_from_rb(1));
   ix5408 : inv01 port map ( Y=>nx5407, A=>bs_from_rb(3));
   ix5410 : nand02 port map ( Y=>nx5409, A0=>bs_ng_cte_incr, A1=>nx5411);
   ix5412 : nand04 port map ( Y=>nx5411, A0=>bs_from_rb(3), A1=>
      bs_from_rb(2), A2=>bs_from_rb(0), A3=>bs_from_rb(1));
   ix5414 : nand03 port map ( Y=>nx5413, A0=>nx5415, A1=>bs_mem_wr_en, A2=>
      nx5422);
   ix5416 : aoi21 port map ( Y=>nx5415, A0=>bs_from_cte(4), A1=>nx5387, B0=>
      nx74);
   ix75 : nor03 port map ( Y=>nx74, A0=>nx5419, A1=>nx5387, A2=>nx68);
   ix5420 : nor02ii port map ( Y=>nx5419, A0=>bs_from_rb(4), A1=>nx5411);
   ix69 : nor02ii port map ( Y=>nx68, A0=>nx5411, A1=>bs_from_rb(4));
   ix5423 : mux21 port map ( Y=>nx5422, A0=>bs_from_cte(5), A1=>nx86, S0=>
      bs_ng_cte_incr);
   ix87 : xor2 port map ( Y=>nx86, A0=>bs_from_rb(5), A1=>nx68);
   ix5430 : mux21 port map ( Y=>nx5429, A0=>ds_from_cte(0), A1=>nx5431, S0=>
      ds_ng_cte_incr);
   ix5432 : inv01 port map ( Y=>nx5431, A=>ds_from_rb(0));
   ix5435 : inv01 port map ( Y=>nx5434, A=>ds_ng_cte_incr);
   ix189 : or02 port map ( Y=>nx188, A0=>ds_from_rb(1), A1=>ds_from_rb(0));
   ix193 : aoi21 port map ( Y=>nx192, A0=>ds_from_rb(0), A1=>ds_from_rb(1), 
      B0=>nx5434);
   ix5440 : nand02 port map ( Y=>nx5439, A0=>nx8340, A1=>nx8408);
   ix171 : aoi21 port map ( Y=>nx170, A0=>nx5443, A1=>nx5445, B0=>nx5447);
   ix5444 : nand03 port map ( Y=>nx5443, A0=>ds_from_rb(2), A1=>
      ds_from_rb(0), A2=>ds_from_rb(1));
   ix5446 : inv01 port map ( Y=>nx5445, A=>ds_from_rb(3));
   ix5448 : nand02 port map ( Y=>nx5447, A0=>ds_ng_cte_incr, A1=>nx5449);
   ix5450 : nand04 port map ( Y=>nx5449, A0=>ds_from_rb(3), A1=>
      ds_from_rb(2), A2=>ds_from_rb(0), A3=>ds_from_rb(1));
   ix163 : nor02 port map ( Y=>nx162, A0=>nx8486, A1=>nx5459);
   ix5453 : aoi21 port map ( Y=>nx5452, A0=>ds_from_cte(2), A1=>nx5434, B0=>
      nx120);
   ix5456 : aoi21 port map ( Y=>nx5455, A0=>ds_from_rb(0), A1=>ds_from_rb(1), 
      B0=>ds_from_rb(2));
   ix5460 : nand02 port map ( Y=>nx5459, A0=>nx5461, A1=>nx5469);
   ix5462 : aoi21 port map ( Y=>nx5461, A0=>ds_from_cte(4), A1=>nx5434, B0=>
      nx138);
   ix139 : nor03 port map ( Y=>nx138, A0=>nx5465, A1=>nx5434, A2=>nx132);
   ix5466 : nor02ii port map ( Y=>nx5465, A0=>ds_from_rb(4), A1=>nx5449);
   ix133 : nor02ii port map ( Y=>nx132, A0=>nx5449, A1=>ds_from_rb(4));
   ix5470 : mux21 port map ( Y=>nx5469, A0=>ds_from_cte(5), A1=>nx150, S0=>
      ds_ng_cte_incr);
   ix151 : xor2 port map ( Y=>nx150, A0=>ds_from_rb(5), A1=>nx132);
   mem_Mem_block_modgen_ram_ix60_ix2086 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_23_dup_697, QB=>OPEN, D=>nx867, CLK=>
      clk);
   ix868 : mux21_ni port map ( Y=>nx867, A0=>bs_data_in(0), A1=>
      mem_Mem_block_modgen_ram_ix60_a_23_dup_697, S0=>nx8176);
   ix5475 : nand02 port map ( Y=>nx5474, A0=>nx8360, A1=>nx8330);
   ix63 : nand02 port map ( Y=>nx62, A0=>nx58, A1=>nx8390);
   ix5488 : mux21 port map ( Y=>nx5487, A0=>bs_from_cte(0), A1=>nx5382, S0=>
      bs_ng_cte_incr);
   ix5491 : inv01 port map ( Y=>nx5490, A=>bs_mem_wr_en);
   ix5498 : nand02 port map ( Y=>nx5497, A0=>nx144, A1=>nx5469);
   ix5506 : nand02 port map ( Y=>nx5505, A0=>nx8362, A1=>nx8426);
   ix243 : nor02 port map ( Y=>nx242, A0=>nx5429, A1=>nx5511);
   ix5512 : aoi22 port map ( Y=>nx5511, A0=>ds_from_cte(1), A1=>nx5434, B0=>
      nx188, B1=>nx192);
   ix5514 : aoi22 port map ( Y=>nx5513, A0=>
      mem_Mem_block_modgen_ram_ix60_a_15_dup_705, A1=>nx8150, B0=>
      mem_Mem_block_modgen_ram_ix60_a_7_dup_713, B1=>nx8152);
   mem_Mem_block_modgen_ram_ix60_ix2118 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_15_dup_705, QB=>OPEN, D=>nx847, CLK=>
      clk);
   ix848 : mux21_ni port map ( Y=>nx847, A0=>
      mem_Mem_block_modgen_ram_ix60_a_15_dup_705, A1=>bs_data_in(0), S0=>
      nx8148);
   ix529 : nand02 port map ( Y=>nx528, A0=>nx8490, A1=>nx8358);
   ix5520 : nor02 port map ( Y=>nx5519, A0=>nx5487, A1=>nx5384);
   mem_Mem_block_modgen_ram_ix60_ix2150 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_7_dup_713, QB=>OPEN, D=>nx857, CLK=>
      clk);
   ix858 : mux21_ni port map ( Y=>nx857, A0=>bs_data_in(0), A1=>
      mem_Mem_block_modgen_ram_ix60_a_7_dup_713, S0=>nx8188);
   ix5528 : nand02 port map ( Y=>nx5527, A0=>nx8360, A1=>nx8328);
   ix5536 : aoi22 port map ( Y=>nx5535, A0=>
      mem_Mem_block_modgen_ram_ix60_a_10_dup_710, A1=>nx8146, B0=>
      mem_Mem_block_modgen_ram_ix60_a_9_dup_711, B1=>nx8142);
   mem_Mem_block_modgen_ram_ix60_ix2138 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_10_dup_710, QB=>OPEN, D=>nx837, CLK=>
      clk);
   ix838 : mux21_ni port map ( Y=>nx837, A0=>
      mem_Mem_block_modgen_ram_ix60_a_10_dup_710, A1=>bs_data_in(0), S0=>
      nx8144);
   ix297 : nand02 port map ( Y=>nx296, A0=>nx8366, A1=>nx8482);
   ix5548 : or02 port map ( Y=>nx5547, A0=>nx5459, A1=>nx5549);
   ix5550 : nand02 port map ( Y=>nx5549, A0=>nx8486, A1=>nx8340);
   mem_Mem_block_modgen_ram_ix60_ix2142 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_9_dup_711, QB=>OPEN, D=>nx827, CLK=>
      clk);
   ix828 : mux21_ni port map ( Y=>nx827, A0=>
      mem_Mem_block_modgen_ram_ix60_a_9_dup_711, A1=>bs_data_in(0), S0=>
      nx8140);
   ix455 : nand02 port map ( Y=>nx454, A0=>nx8366, A1=>nx8492);
   ix5565 : aoi22 port map ( Y=>nx5564, A0=>
      mem_Mem_block_modgen_ram_ix60_a_54_dup_666, A1=>nx8134, B0=>
      mem_Mem_block_modgen_ram_ix60_a_13_dup_707, B1=>nx8138);
   mem_Mem_block_modgen_ram_ix60_ix1962 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_54_dup_666, QB=>OPEN, D=>nx807, CLK=>
      clk);
   ix808 : mux21_ni port map ( Y=>nx807, A0=>bs_data_in(0), A1=>
      mem_Mem_block_modgen_ram_ix60_a_54_dup_666, S0=>nx8204);
   ix5570 : nand02 port map ( Y=>nx5569, A0=>nx8368, A1=>nx8334);
   ix391 : nor03 port map ( Y=>nx390, A0=>nx5415, A1=>nx5490, A2=>nx5422);
   ix403 : nor02 port map ( Y=>nx402, A0=>nx5461, A1=>nx5469);
   ix5586 : nand02 port map ( Y=>nx5585, A0=>nx8362, A1=>nx8448);
   mem_Mem_block_modgen_ram_ix60_ix2126 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_13_dup_707, QB=>OPEN, D=>nx817, CLK=>
      clk);
   ix818 : mux21_ni port map ( Y=>nx817, A0=>
      mem_Mem_block_modgen_ram_ix60_a_13_dup_707, A1=>bs_data_in(0), S0=>
      nx8136);
   ix825 : nand02 port map ( Y=>nx824, A0=>nx8492, A1=>nx8358);
   ix1235 : nand04 port map ( Y=>nx1234, A0=>nx5599, A1=>nx5622, A2=>nx5659, 
      A3=>nx5685);
   ix5600 : aoi22 port map ( Y=>nx5599, A0=>
      mem_Mem_block_modgen_ram_ix60_a_18_dup_702, A1=>nx8132, B0=>
      mem_Mem_block_modgen_ram_ix60_a_11_dup_709, B1=>nx8130);
   mem_Mem_block_modgen_ram_ix60_ix2106 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_18_dup_702, QB=>OPEN, D=>nx797, CLK=>
      clk);
   ix798 : mux21_ni port map ( Y=>nx797, A0=>bs_data_in(0), A1=>
      mem_Mem_block_modgen_ram_ix60_a_18_dup_702, S0=>nx8212);
   ix5604 : nand02 port map ( Y=>nx5603, A0=>nx8370, A1=>nx8330);
   ix223 : nand02 port map ( Y=>nx222, A0=>nx5395, A1=>nx8390);
   ix5612 : or02 port map ( Y=>nx5611, A0=>nx5497, A1=>nx5613);
   ix5614 : nand02 port map ( Y=>nx5613, A0=>nx8486, A1=>nx8362);
   mem_Mem_block_modgen_ram_ix60_ix2134 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_11_dup_709, QB=>OPEN, D=>nx787, CLK=>
      clk);
   ix788 : mux21_ni port map ( Y=>nx787, A0=>
      mem_Mem_block_modgen_ram_ix60_a_11_dup_709, A1=>bs_data_in(0), S0=>
      nx8128);
   ix371 : nand02 port map ( Y=>nx370, A0=>nx8366, A1=>nx8490);
   ix5623 : aoi22 port map ( Y=>nx5622, A0=>
      mem_Mem_block_modgen_ram_ix60_a_56_dup_664, A1=>nx8126, B0=>
      mem_Mem_block_modgen_ram_ix60_a_26_dup_694, B1=>nx8122);
   mem_Mem_block_modgen_ram_ix60_ix1954 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_56_dup_664, QB=>OPEN, D=>nx777, CLK=>
      clk);
   ix778 : mux21_ni port map ( Y=>nx777, A0=>
      mem_Mem_block_modgen_ram_ix60_a_56_dup_664, A1=>bs_data_in(0), S0=>
      nx8124);
   ix511 : nand02 port map ( Y=>nx510, A0=>nx8366, A1=>nx5631);
   ix5643 : nand02 port map ( Y=>nx5642, A0=>nx5429, A1=>nx5511);
   ix5646 : nand02 port map ( Y=>nx5645, A0=>nx314, A1=>nx402);
   mem_Mem_block_modgen_ram_ix60_ix2074 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_26_dup_694, QB=>OPEN, D=>nx767, CLK=>
      clk);
   ix768 : mux21_ni port map ( Y=>nx767, A0=>
      mem_Mem_block_modgen_ram_ix60_a_26_dup_694, A1=>bs_data_in(0), S0=>
      nx8120);
   ix5658 : or02 port map ( Y=>nx5657, A0=>nx5497, A1=>nx5549);
   ix5660 : aoi22 port map ( Y=>nx5659, A0=>
      mem_Mem_block_modgen_ram_ix60_a_20_dup_700, A1=>nx8114, B0=>
      mem_Mem_block_modgen_ram_ix60_a_46_dup_674, B1=>nx8118);
   mem_Mem_block_modgen_ram_ix60_ix2098 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_20_dup_700, QB=>OPEN, D=>nx747, CLK=>
      clk);
   ix748 : mux21_ni port map ( Y=>nx747, A0=>bs_data_in(0), A1=>
      mem_Mem_block_modgen_ram_ix60_a_20_dup_700, S0=>nx8242);
   ix5664 : nand02 port map ( Y=>nx5663, A0=>nx8372, A1=>nx8330);
   ix5666 : nor02 port map ( Y=>nx5665, A0=>nx8386, A1=>nx26);
   ix27 : nand02 port map ( Y=>nx26, A0=>nx5487, A1=>nx5384);
   mem_Mem_block_modgen_ram_ix60_ix1994 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_46_dup_674, QB=>OPEN, D=>nx757, CLK=>
      clk);
   ix758 : mux21_ni port map ( Y=>nx757, A0=>
      mem_Mem_block_modgen_ram_ix60_a_46_dup_674, A1=>bs_data_in(0), S0=>
      nx8116);
   ix5686 : aoi22 port map ( Y=>nx5685, A0=>
      mem_Mem_block_modgen_ram_ix60_a_52_dup_668, A1=>nx8112, B0=>
      mem_Mem_block_modgen_ram_ix60_a_5_dup_715, B1=>nx8110);
   mem_Mem_block_modgen_ram_ix60_ix1970 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_52_dup_668, QB=>OPEN, D=>nx737, CLK=>
      clk);
   ix738 : mux21_ni port map ( Y=>nx737, A0=>bs_data_in(0), A1=>
      mem_Mem_block_modgen_ram_ix60_a_52_dup_668, S0=>nx8254);
   ix5692 : nand02 port map ( Y=>nx5691, A0=>nx8372, A1=>nx8334);
   mem_Mem_block_modgen_ram_ix60_ix2158 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_5_dup_715, QB=>OPEN, D=>nx727, CLK=>
      clk);
   ix728 : mux21_ni port map ( Y=>nx727, A0=>bs_data_in(0), A1=>
      mem_Mem_block_modgen_ram_ix60_a_5_dup_715, S0=>nx8256);
   ix5698 : nand02 port map ( Y=>nx5697, A0=>nx8374, A1=>nx8328);
   ix5706 : nand02 port map ( Y=>nx5705, A0=>nx8362, A1=>nx8468);
   ix1107 : nand04 port map ( Y=>nx1106, A0=>nx5711, A1=>nx5729, A2=>nx5747, 
      A3=>nx5767);
   ix5712 : aoi22 port map ( Y=>nx5711, A0=>
      mem_Mem_block_modgen_ram_ix60_a_37_dup_683, A1=>nx8108, B0=>
      mem_Mem_block_modgen_ram_ix60_a_21_dup_699, B1=>nx8106);
   mem_Mem_block_modgen_ram_ix60_ix2030 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_37_dup_683, QB=>OPEN, D=>nx717, CLK=>
      clk);
   ix718 : mux21_ni port map ( Y=>nx717, A0=>bs_data_in(0), A1=>
      mem_Mem_block_modgen_ram_ix60_a_37_dup_683, S0=>nx8260);
   ix5716 : nand02 port map ( Y=>nx5715, A0=>nx8374, A1=>nx8332);
   ix5722 : nand02 port map ( Y=>nx5721, A0=>nx126, A1=>nx280);
   mem_Mem_block_modgen_ram_ix60_ix2094 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_21_dup_699, QB=>OPEN, D=>nx707, CLK=>
      clk);
   ix708 : mux21_ni port map ( Y=>nx707, A0=>bs_data_in(0), A1=>
      mem_Mem_block_modgen_ram_ix60_a_21_dup_699, S0=>nx8266);
   ix5726 : nand02 port map ( Y=>nx5725, A0=>nx8374, A1=>nx8330);
   ix5730 : aoi22 port map ( Y=>nx5729, A0=>
      mem_Mem_block_modgen_ram_ix60_a_53_dup_667, A1=>nx8104, B0=>
      mem_Mem_block_modgen_ram_ix60_a_61_dup_659, B1=>nx8102);
   mem_Mem_block_modgen_ram_ix60_ix1966 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_53_dup_667, QB=>OPEN, D=>nx697, CLK=>
      clk);
   ix698 : mux21_ni port map ( Y=>nx697, A0=>bs_data_in(0), A1=>
      mem_Mem_block_modgen_ram_ix60_a_53_dup_667, S0=>nx8268);
   ix5734 : nand02 port map ( Y=>nx5733, A0=>nx8374, A1=>nx8334);
   mem_Mem_block_modgen_ram_ix60_ix1934 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_61_dup_659, QB=>OPEN, D=>nx687, CLK=>
      clk);
   ix688 : mux21_ni port map ( Y=>nx687, A0=>
      mem_Mem_block_modgen_ram_ix60_a_61_dup_659, A1=>bs_data_in(0), S0=>
      nx8100);
   ix5744 : nand02 port map ( Y=>nx5743, A0=>nx8340, A1=>nx8478);
   ix5748 : aoi22 port map ( Y=>nx5747, A0=>
      mem_Mem_block_modgen_ram_ix60_a_50_dup_670, A1=>nx8094, B0=>
      mem_Mem_block_modgen_ram_ix60_a_60_dup_660, B1=>nx8098);
   mem_Mem_block_modgen_ram_ix60_ix1978 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_50_dup_670, QB=>OPEN, D=>nx667, CLK=>
      clk);
   ix668 : mux21_ni port map ( Y=>nx667, A0=>bs_data_in(0), A1=>
      mem_Mem_block_modgen_ram_ix60_a_50_dup_670, S0=>nx8272);
   ix5753 : nand02 port map ( Y=>nx5752, A0=>nx8370, A1=>nx8334);
   ix5758 : nand02 port map ( Y=>nx5757, A0=>nx252, A1=>nx402);
   mem_Mem_block_modgen_ram_ix60_ix1938 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_60_dup_660, QB=>OPEN, D=>nx677, CLK=>
      clk);
   ix678 : mux21_ni port map ( Y=>nx677, A0=>
      mem_Mem_block_modgen_ram_ix60_a_60_dup_660, A1=>bs_data_in(0), S0=>
      nx8096);
   ix417 : nand02 port map ( Y=>nx416, A0=>nx5631, A1=>nx8358);
   ix5768 : aoi22 port map ( Y=>nx5767, A0=>
      mem_Mem_block_modgen_ram_ix60_a_49_dup_671, A1=>nx8092, B0=>
      mem_Mem_block_modgen_ram_ix60_a_38_dup_682, B1=>nx8090);
   mem_Mem_block_modgen_ram_ix60_ix1982 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_49_dup_671, QB=>OPEN, D=>nx657, CLK=>
      clk);
   ix658 : mux21_ni port map ( Y=>nx657, A0=>bs_data_in(0), A1=>
      mem_Mem_block_modgen_ram_ix60_a_49_dup_671, S0=>nx8276);
   ix5772 : nand02 port map ( Y=>nx5771, A0=>nx8376, A1=>nx8334);
   mem_Mem_block_modgen_ram_ix60_ix2026 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_38_dup_682, QB=>OPEN, D=>nx647, CLK=>
      clk);
   ix648 : mux21_ni port map ( Y=>nx647, A0=>bs_data_in(0), A1=>
      mem_Mem_block_modgen_ram_ix60_a_38_dup_682, S0=>nx8278);
   ix5780 : nand02 port map ( Y=>nx5779, A0=>nx8368, A1=>nx8332);
   ix975 : nand04 port map ( Y=>nx974, A0=>nx5785, A1=>nx5805, A2=>nx5821, 
      A3=>nx5842);
   ix5786 : aoi22 port map ( Y=>nx5785, A0=>
      mem_Mem_block_modgen_ram_ix60_a_2_dup_718, A1=>nx8088, B0=>
      mem_Mem_block_modgen_ram_ix60_a_3_dup_717, B1=>nx8086);
   mem_Mem_block_modgen_ram_ix60_ix2170 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_2_dup_718, QB=>OPEN, D=>nx637, CLK=>
      clk);
   ix638 : mux21_ni port map ( Y=>nx637, A0=>bs_data_in(0), A1=>
      mem_Mem_block_modgen_ram_ix60_a_2_dup_718, S0=>nx8280);
   ix5791 : nand02 port map ( Y=>nx5790, A0=>nx8370, A1=>nx8328);
   ix5796 : or02 port map ( Y=>nx5795, A0=>nx5459, A1=>nx5613);
   mem_Mem_block_modgen_ram_ix60_ix2166 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_3_dup_717, QB=>OPEN, D=>nx627, CLK=>
      clk);
   ix628 : mux21_ni port map ( Y=>nx627, A0=>bs_data_in(0), A1=>
      mem_Mem_block_modgen_ram_ix60_a_3_dup_717, S0=>nx8286);
   ix5800 : nand02 port map ( Y=>nx5799, A0=>nx8378, A1=>nx8328);
   ix5806 : aoi22 port map ( Y=>nx5805, A0=>
      mem_Mem_block_modgen_ram_ix60_a_31_dup_689, A1=>nx8084, B0=>
      mem_Mem_block_modgen_ram_ix60_a_29_dup_691, B1=>nx8080);
   mem_Mem_block_modgen_ram_ix60_ix2054 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_31_dup_689, QB=>OPEN, D=>nx617, CLK=>
      clk);
   ix618 : mux21_ni port map ( Y=>nx617, A0=>
      mem_Mem_block_modgen_ram_ix60_a_31_dup_689, A1=>bs_data_in(0), S0=>
      nx8082);
   ix5814 : nand02 port map ( Y=>nx5813, A0=>nx8340, A1=>nx8458);
   ix345 : nor02 port map ( Y=>nx344, A0=>nx8486, A1=>nx5497);
   mem_Mem_block_modgen_ram_ix60_ix2062 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_29_dup_691, QB=>OPEN, D=>nx607, CLK=>
      clk);
   ix608 : mux21_ni port map ( Y=>nx607, A0=>
      mem_Mem_block_modgen_ram_ix60_a_29_dup_691, A1=>bs_data_in(0), S0=>
      nx8078);
   ix5822 : aoi22 port map ( Y=>nx5821, A0=>
      mem_Mem_block_modgen_ram_ix60_a_40_dup_680, A1=>nx8076, B0=>
      mem_Mem_block_modgen_ram_ix60_a_48_dup_672, B1=>nx8072);
   mem_Mem_block_modgen_ram_ix60_ix2018 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_40_dup_680, QB=>OPEN, D=>nx597, CLK=>
      clk);
   ix598 : mux21_ni port map ( Y=>nx597, A0=>
      mem_Mem_block_modgen_ram_ix60_a_40_dup_680, A1=>bs_data_in(0), S0=>
      nx8074);
   ix5832 : nand02 port map ( Y=>nx5831, A0=>nx314, A1=>nx280);
   mem_Mem_block_modgen_ram_ix60_ix1986 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_48_dup_672, QB=>OPEN, D=>nx587, CLK=>
      clk);
   ix588 : mux21_ni port map ( Y=>nx587, A0=>bs_data_in(0), A1=>
      mem_Mem_block_modgen_ram_ix60_a_48_dup_672, S0=>nx8292);
   ix5837 : nand02 port map ( Y=>nx5836, A0=>nx8380, A1=>nx8334);
   ix5839 : nor02 port map ( Y=>nx5838, A0=>nx8388, A1=>nx26);
   ix5843 : aoi22 port map ( Y=>nx5842, A0=>
      mem_Mem_block_modgen_ram_ix60_a_32_dup_688, A1=>nx8070, B0=>
      mem_Mem_block_modgen_ram_ix60_a_44_dup_676, B1=>nx8068);
   mem_Mem_block_modgen_ram_ix60_ix2050 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_32_dup_688, QB=>OPEN, D=>nx577, CLK=>
      clk);
   ix578 : mux21_ni port map ( Y=>nx577, A0=>bs_data_in(0), A1=>
      mem_Mem_block_modgen_ram_ix60_a_32_dup_688, S0=>nx8294);
   ix5847 : nand02 port map ( Y=>nx5846, A0=>nx8380, A1=>nx8332);
   ix5851 : nand02 port map ( Y=>nx5850, A0=>nx252, A1=>nx280);
   mem_Mem_block_modgen_ram_ix60_ix2002 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_44_dup_676, QB=>OPEN, D=>nx567, CLK=>
      clk);
   ix568 : mux21_ni port map ( Y=>nx567, A0=>
      mem_Mem_block_modgen_ram_ix60_a_44_dup_676, A1=>bs_data_in(0), S0=>
      nx8066);
   ix5858 : nor04 port map ( Y=>nx5857, A0=>nx844, A1=>nx700, A2=>nx566, A3
      =>nx414);
   ix845 : nand04 port map ( Y=>nx844, A0=>nx5860, A1=>nx5873, A2=>nx5886, 
      A3=>nx5899);
   ix5861 : aoi22 port map ( Y=>nx5860, A0=>
      mem_Mem_block_modgen_ram_ix60_a_55_dup_665, A1=>nx8060, B0=>
      mem_Mem_block_modgen_ram_ix60_a_45_dup_675, B1=>nx8064);
   mem_Mem_block_modgen_ram_ix60_ix1958 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_55_dup_665, QB=>OPEN, D=>nx547, CLK=>
      clk);
   ix548 : mux21_ni port map ( Y=>nx547, A0=>bs_data_in(0), A1=>
      mem_Mem_block_modgen_ram_ix60_a_55_dup_665, S0=>nx8298);
   ix5865 : nand02 port map ( Y=>nx5864, A0=>nx8360, A1=>nx7986);
   mem_Mem_block_modgen_ram_ix60_ix1998 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_45_dup_675, QB=>OPEN, D=>nx557, CLK=>
      clk);
   ix558 : mux21_ni port map ( Y=>nx557, A0=>
      mem_Mem_block_modgen_ram_ix60_a_45_dup_675, A1=>bs_data_in(0), S0=>
      nx8062);
   ix5874 : aoi22 port map ( Y=>nx5873, A0=>
      mem_Mem_block_modgen_ram_ix60_a_39_dup_681, A1=>nx8058, B0=>
      mem_Mem_block_modgen_ram_ix60_a_8_dup_712, B1=>nx8056);
   mem_Mem_block_modgen_ram_ix60_ix2022 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_39_dup_681, QB=>OPEN, D=>nx537, CLK=>
      clk);
   ix538 : mux21_ni port map ( Y=>nx537, A0=>bs_data_in(0), A1=>
      mem_Mem_block_modgen_ram_ix60_a_39_dup_681, S0=>nx8300);
   ix5878 : nand02 port map ( Y=>nx5877, A0=>nx8360, A1=>nx8332);
   mem_Mem_block_modgen_ram_ix60_ix2146 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_8_dup_712, QB=>OPEN, D=>nx527, CLK=>
      clk);
   ix528 : mux21_ni port map ( Y=>nx527, A0=>
      mem_Mem_block_modgen_ram_ix60_a_8_dup_712, A1=>bs_data_in(0), S0=>
      nx8054);
   ix5887 : aoi22 port map ( Y=>nx5886, A0=>
      mem_Mem_block_modgen_ram_ix60_a_12_dup_708, A1=>nx8052, B0=>
      mem_Mem_block_modgen_ram_ix60_a_22_dup_698, B1=>nx8048);
   mem_Mem_block_modgen_ram_ix60_ix2130 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_12_dup_708, QB=>OPEN, D=>nx517, CLK=>
      clk);
   ix518 : mux21_ni port map ( Y=>nx517, A0=>
      mem_Mem_block_modgen_ram_ix60_a_12_dup_708, A1=>bs_data_in(0), S0=>
      nx8050);
   mem_Mem_block_modgen_ram_ix60_ix2090 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_22_dup_698, QB=>OPEN, D=>nx507, CLK=>
      clk);
   ix508 : mux21_ni port map ( Y=>nx507, A0=>bs_data_in(0), A1=>
      mem_Mem_block_modgen_ram_ix60_a_22_dup_698, S0=>nx8302);
   ix5896 : nand02 port map ( Y=>nx5895, A0=>nx8368, A1=>nx8330);
   ix5900 : aoi22 port map ( Y=>nx5899, A0=>
      mem_Mem_block_modgen_ram_ix60_a_58_dup_662, A1=>nx8044, B0=>
      mem_Mem_block_modgen_ram_ix60_a_6_dup_714, B1=>nx8046);
   mem_Mem_block_modgen_ram_ix60_ix1946 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_58_dup_662, QB=>OPEN, D=>nx487, CLK=>
      clk);
   ix488 : mux21_ni port map ( Y=>nx487, A0=>
      mem_Mem_block_modgen_ram_ix60_a_58_dup_662, A1=>bs_data_in(0), S0=>
      nx8042);
   mem_Mem_block_modgen_ram_ix60_ix2154 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_6_dup_714, QB=>OPEN, D=>nx497, CLK=>
      clk);
   ix498 : mux21_ni port map ( Y=>nx497, A0=>bs_data_in(0), A1=>
      mem_Mem_block_modgen_ram_ix60_a_6_dup_714, S0=>nx8304);
   ix5909 : nand02 port map ( Y=>nx5908, A0=>nx8368, A1=>nx8328);
   ix701 : nand04 port map ( Y=>nx700, A0=>nx5913, A1=>nx5925, A2=>nx5938, 
      A3=>nx5951);
   ix5914 : aoi22 port map ( Y=>nx5913, A0=>
      mem_Mem_block_modgen_ram_ix60_a_25_dup_695, A1=>nx8040, B0=>
      mem_Mem_block_modgen_ram_ix60_a_62_dup_658, B1=>nx8036);
   mem_Mem_block_modgen_ram_ix60_ix2078 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_25_dup_695, QB=>OPEN, D=>nx477, CLK=>
      clk);
   ix478 : mux21_ni port map ( Y=>nx477, A0=>
      mem_Mem_block_modgen_ram_ix60_a_25_dup_695, A1=>bs_data_in(0), S0=>
      nx8038);
   mem_Mem_block_modgen_ram_ix60_ix1930 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_62_dup_658, QB=>OPEN, D=>nx467, CLK=>
      clk);
   ix468 : mux21_ni port map ( Y=>nx467, A0=>
      mem_Mem_block_modgen_ram_ix60_a_62_dup_658, A1=>bs_data_in(0), S0=>
      nx8034);
   ix5926 : aoi22 port map ( Y=>nx5925, A0=>
      mem_Mem_block_modgen_ram_ix60_a_33_dup_687, A1=>nx8028, B0=>
      mem_Mem_block_modgen_ram_ix60_a_63_dup_657, B1=>nx8032);
   mem_Mem_block_modgen_ram_ix60_ix2046 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_33_dup_687, QB=>OPEN, D=>nx447, CLK=>
      clk);
   ix448 : mux21_ni port map ( Y=>nx447, A0=>bs_data_in(0), A1=>
      mem_Mem_block_modgen_ram_ix60_a_33_dup_687, S0=>nx8306);
   ix5930 : nand02 port map ( Y=>nx5929, A0=>nx8376, A1=>nx8332);
   mem_Mem_block_modgen_ram_ix60_ix1926 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_63_dup_657, QB=>OPEN, D=>nx457, CLK=>
      clk);
   ix458 : mux21_ni port map ( Y=>nx457, A0=>
      mem_Mem_block_modgen_ram_ix60_a_63_dup_657, A1=>bs_data_in(0), S0=>
      nx8030);
   ix5939 : aoi22 port map ( Y=>nx5938, A0=>
      mem_Mem_block_modgen_ram_ix60_a_41_dup_679, A1=>nx8026, B0=>
      mem_Mem_block_modgen_ram_ix60_a_1_dup_719, B1=>nx8022);
   mem_Mem_block_modgen_ram_ix60_ix2014 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_41_dup_679, QB=>OPEN, D=>nx437, CLK=>
      clk);
   ix438 : mux21_ni port map ( Y=>nx437, A0=>
      mem_Mem_block_modgen_ram_ix60_a_41_dup_679, A1=>bs_data_in(0), S0=>
      nx8024);
   mem_Mem_block_modgen_ram_ix60_ix2174 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_1_dup_719, QB=>OPEN, D=>nx427, CLK=>
      clk);
   ix428 : mux21_ni port map ( Y=>nx427, A0=>bs_data_in(0), A1=>
      mem_Mem_block_modgen_ram_ix60_a_1_dup_719, S0=>nx8308);
   ix5948 : nand02 port map ( Y=>nx5947, A0=>nx8376, A1=>nx8328);
   ix5952 : aoi22 port map ( Y=>nx5951, A0=>
      mem_Mem_block_modgen_ram_ix60_a_43_dup_677, A1=>nx8018, B0=>
      mem_Mem_block_modgen_ram_ix60_a_0_dup_720, B1=>nx8020);
   mem_Mem_block_modgen_ram_ix60_ix2006 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_43_dup_677, QB=>OPEN, D=>nx407, CLK=>
      clk);
   ix408 : mux21_ni port map ( Y=>nx407, A0=>
      mem_Mem_block_modgen_ram_ix60_a_43_dup_677, A1=>bs_data_in(0), S0=>
      nx8016);
   mem_Mem_block_modgen_ram_ix60_ix2178 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_0_dup_720, QB=>OPEN, D=>nx417, CLK=>
      clk);
   ix418 : mux21_ni port map ( Y=>nx417, A0=>bs_data_in(0), A1=>
      mem_Mem_block_modgen_ram_ix60_a_0_dup_720, S0=>nx8310);
   ix5961 : nand02 port map ( Y=>nx5960, A0=>nx8380, A1=>nx8402);
   ix567 : nand04 port map ( Y=>nx566, A0=>nx5965, A1=>nx5978, A2=>nx5990, 
      A3=>nx6003);
   ix5966 : aoi22 port map ( Y=>nx5965, A0=>
      mem_Mem_block_modgen_ram_ix60_a_34_dup_686, A1=>nx8014, B0=>
      mem_Mem_block_modgen_ram_ix60_a_47_dup_673, B1=>nx8012);
   mem_Mem_block_modgen_ram_ix60_ix2042 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_34_dup_686, QB=>OPEN, D=>nx397, CLK=>
      clk);
   ix398 : mux21_ni port map ( Y=>nx397, A0=>bs_data_in(0), A1=>
      mem_Mem_block_modgen_ram_ix60_a_34_dup_686, S0=>nx8312);
   ix5970 : nand02 port map ( Y=>nx5969, A0=>nx8370, A1=>nx8332);
   mem_Mem_block_modgen_ram_ix60_ix1990 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_47_dup_673, QB=>OPEN, D=>nx387, CLK=>
      clk);
   ix388 : mux21_ni port map ( Y=>nx387, A0=>
      mem_Mem_block_modgen_ram_ix60_a_47_dup_673, A1=>bs_data_in(0), S0=>
      nx8010);
   ix5979 : aoi22 port map ( Y=>nx5978, A0=>
      mem_Mem_block_modgen_ram_ix60_a_59_dup_661, A1=>nx8004, B0=>
      mem_Mem_block_modgen_ram_ix60_a_24_dup_696, B1=>nx8008);
   mem_Mem_block_modgen_ram_ix60_ix1942 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_59_dup_661, QB=>OPEN, D=>nx367, CLK=>
      clk);
   ix368 : mux21_ni port map ( Y=>nx367, A0=>
      mem_Mem_block_modgen_ram_ix60_a_59_dup_661, A1=>bs_data_in(0), S0=>
      nx8002);
   mem_Mem_block_modgen_ram_ix60_ix2082 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_24_dup_696, QB=>OPEN, D=>nx377, CLK=>
      clk);
   ix378 : mux21_ni port map ( Y=>nx377, A0=>
      mem_Mem_block_modgen_ram_ix60_a_24_dup_696, A1=>bs_data_in(0), S0=>
      nx8006);
   ix5991 : aoi22 port map ( Y=>nx5990, A0=>
      mem_Mem_block_modgen_ram_ix60_a_57_dup_663, A1=>nx7998, B0=>
      mem_Mem_block_modgen_ram_ix60_a_17_dup_703, B1=>nx8000);
   mem_Mem_block_modgen_ram_ix60_ix1950 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_57_dup_663, QB=>OPEN, D=>nx347, CLK=>
      clk);
   ix348 : mux21_ni port map ( Y=>nx347, A0=>
      mem_Mem_block_modgen_ram_ix60_a_57_dup_663, A1=>bs_data_in(0), S0=>
      nx7996);
   mem_Mem_block_modgen_ram_ix60_ix2110 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_17_dup_703, QB=>OPEN, D=>nx357, CLK=>
      clk);
   ix358 : mux21_ni port map ( Y=>nx357, A0=>bs_data_in(0), A1=>
      mem_Mem_block_modgen_ram_ix60_a_17_dup_703, S0=>nx8314);
   ix6000 : nand02 port map ( Y=>nx5999, A0=>nx8376, A1=>nx8330);
   ix6004 : aoi22 port map ( Y=>nx6003, A0=>
      mem_Mem_block_modgen_ram_ix60_a_35_dup_685, A1=>nx7994, B0=>
      mem_Mem_block_modgen_ram_ix60_a_28_dup_692, B1=>nx7992);
   mem_Mem_block_modgen_ram_ix60_ix2038 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_35_dup_685, QB=>OPEN, D=>nx337, CLK=>
      clk);
   ix338 : mux21_ni port map ( Y=>nx337, A0=>bs_data_in(0), A1=>
      mem_Mem_block_modgen_ram_ix60_a_35_dup_685, S0=>nx8316);
   ix6008 : nand02 port map ( Y=>nx6007, A0=>nx8378, A1=>nx8436);
   mem_Mem_block_modgen_ram_ix60_ix2066 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_28_dup_692, QB=>OPEN, D=>nx327, CLK=>
      clk);
   ix328 : mux21_ni port map ( Y=>nx327, A0=>
      mem_Mem_block_modgen_ram_ix60_a_28_dup_692, A1=>bs_data_in(0), S0=>
      nx7990);
   ix415 : nand04 port map ( Y=>nx414, A0=>nx6017, A1=>nx6030, A2=>nx6043, 
      A3=>nx6056);
   ix6018 : aoi22 port map ( Y=>nx6017, A0=>
      mem_Mem_block_modgen_ram_ix60_a_51_dup_669, A1=>nx7988, B0=>
      mem_Mem_block_modgen_ram_ix60_a_27_dup_693, B1=>nx7982);
   mem_Mem_block_modgen_ram_ix60_ix1974 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_51_dup_669, QB=>OPEN, D=>nx317, CLK=>
      clk);
   ix318 : mux21_ni port map ( Y=>nx317, A0=>bs_data_in(0), A1=>
      mem_Mem_block_modgen_ram_ix60_a_51_dup_669, S0=>nx8318);
   ix6022 : nand02 port map ( Y=>nx6021, A0=>nx8378, A1=>nx7986);
   mem_Mem_block_modgen_ram_ix60_ix2070 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_27_dup_693, QB=>OPEN, D=>nx307, CLK=>
      clk);
   ix308 : mux21_ni port map ( Y=>nx307, A0=>
      mem_Mem_block_modgen_ram_ix60_a_27_dup_693, A1=>bs_data_in(0), S0=>
      nx7980);
   ix6031 : aoi22 port map ( Y=>nx6030, A0=>
      mem_Mem_block_modgen_ram_ix60_a_30_dup_690, A1=>nx7976, B0=>
      mem_Mem_block_modgen_ram_ix60_a_16_dup_704, B1=>nx7978);
   mem_Mem_block_modgen_ram_ix60_ix2058 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_30_dup_690, QB=>OPEN, D=>nx287, CLK=>
      clk);
   ix288 : mux21_ni port map ( Y=>nx287, A0=>
      mem_Mem_block_modgen_ram_ix60_a_30_dup_690, A1=>bs_data_in(0), S0=>
      nx7974);
   mem_Mem_block_modgen_ram_ix60_ix2114 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_16_dup_704, QB=>OPEN, D=>nx297, CLK=>
      clk);
   ix298 : mux21_ni port map ( Y=>nx297, A0=>bs_data_in(0), A1=>
      mem_Mem_block_modgen_ram_ix60_a_16_dup_704, S0=>nx8320);
   ix6040 : nand02 port map ( Y=>nx6039, A0=>nx8380, A1=>nx8416);
   ix6044 : aoi22 port map ( Y=>nx6043, A0=>
      mem_Mem_block_modgen_ram_ix60_a_42_dup_678, A1=>nx7972, B0=>
      mem_Mem_block_modgen_ram_ix60_a_36_dup_684, B1=>nx7968);
   mem_Mem_block_modgen_ram_ix60_ix2010 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_42_dup_678, QB=>OPEN, D=>nx277, CLK=>
      clk);
   ix278 : mux21_ni port map ( Y=>nx277, A0=>
      mem_Mem_block_modgen_ram_ix60_a_42_dup_678, A1=>bs_data_in(0), S0=>
      nx7970);
   mem_Mem_block_modgen_ram_ix60_ix2034 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_36_dup_684, QB=>OPEN, D=>nx267, CLK=>
      clk);
   ix268 : mux21_ni port map ( Y=>nx267, A0=>bs_data_in(0), A1=>
      mem_Mem_block_modgen_ram_ix60_a_36_dup_684, S0=>nx8322);
   ix6053 : nand02 port map ( Y=>nx6052, A0=>nx8372, A1=>nx8436);
   ix6057 : aoi22 port map ( Y=>nx6056, A0=>
      mem_Mem_block_modgen_ram_ix60_a_4_dup_716, A1=>nx7960, B0=>
      mem_Mem_block_modgen_ram_ix60_a_19_dup_701, B1=>nx7964);
   mem_Mem_block_modgen_ram_ix60_ix2162 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_4_dup_716, QB=>OPEN, D=>nx247, CLK=>
      clk);
   ix248 : mux21_ni port map ( Y=>nx247, A0=>bs_data_in(0), A1=>
      mem_Mem_block_modgen_ram_ix60_a_4_dup_716, S0=>nx8324);
   ix6061 : nand02 port map ( Y=>nx6060, A0=>nx8372, A1=>nx8402);
   mem_Mem_block_modgen_ram_ix60_ix2102 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_19_dup_701, QB=>OPEN, D=>nx257, CLK=>
      clk);
   ix258 : mux21_ni port map ( Y=>nx257, A0=>bs_data_in(0), A1=>
      mem_Mem_block_modgen_ram_ix60_a_19_dup_701, S0=>nx8326);
   ix6067 : nand02 port map ( Y=>nx6066, A0=>nx8378, A1=>nx8416);
   ix2005 : nand02 port map ( Y=>ds_data_out(1), A0=>nx6071, A1=>nx6205);
   ix6072 : nor04 port map ( Y=>nx6071, A0=>nx1998, A1=>nx1920, A2=>nx1840, 
      A3=>nx1762);
   ix1999 : nand04 port map ( Y=>nx1998, A0=>nx6074, A1=>nx6082, A2=>nx6090, 
      A3=>nx6098);
   ix6075 : aoi22 port map ( Y=>nx6074, A0=>
      mem_Mem_block_modgen_ram_ix60_a_14_dup_636, A1=>nx8158, B0=>
      mem_Mem_block_modgen_ram_ix60_a_23_dup_627, B1=>nx8154);
   mem_Mem_block_modgen_ram_ix60_ix1864 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_14_dup_636, QB=>OPEN, D=>nx1517, CLK=>
      clk);
   ix1518 : mux21_ni port map ( Y=>nx1517, A0=>
      mem_Mem_block_modgen_ram_ix60_a_14_dup_636, A1=>bs_data_in(1), S0=>
      nx8156);
   mem_Mem_block_modgen_ram_ix60_ix1828 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_23_dup_627, QB=>OPEN, D=>nx1507, CLK=>
      clk);
   ix1508 : mux21_ni port map ( Y=>nx1507, A0=>bs_data_in(1), A1=>
      mem_Mem_block_modgen_ram_ix60_a_23_dup_627, S0=>nx8176);
   ix6083 : aoi22 port map ( Y=>nx6082, A0=>
      mem_Mem_block_modgen_ram_ix60_a_15_dup_635, A1=>nx8150, B0=>
      mem_Mem_block_modgen_ram_ix60_a_7_dup_643, B1=>nx8152);
   mem_Mem_block_modgen_ram_ix60_ix1860 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_15_dup_635, QB=>OPEN, D=>nx1487, CLK=>
      clk);
   ix1488 : mux21_ni port map ( Y=>nx1487, A0=>
      mem_Mem_block_modgen_ram_ix60_a_15_dup_635, A1=>bs_data_in(1), S0=>
      nx8148);
   mem_Mem_block_modgen_ram_ix60_ix1892 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_7_dup_643, QB=>OPEN, D=>nx1497, CLK=>
      clk);
   ix1498 : mux21_ni port map ( Y=>nx1497, A0=>bs_data_in(1), A1=>
      mem_Mem_block_modgen_ram_ix60_a_7_dup_643, S0=>nx8188);
   ix6091 : aoi22 port map ( Y=>nx6090, A0=>
      mem_Mem_block_modgen_ram_ix60_a_10_dup_640, A1=>nx8146, B0=>
      mem_Mem_block_modgen_ram_ix60_a_9_dup_641, B1=>nx8142);
   mem_Mem_block_modgen_ram_ix60_ix1880 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_10_dup_640, QB=>OPEN, D=>nx1477, CLK=>
      clk);
   ix1478 : mux21_ni port map ( Y=>nx1477, A0=>
      mem_Mem_block_modgen_ram_ix60_a_10_dup_640, A1=>bs_data_in(1), S0=>
      nx8144);
   mem_Mem_block_modgen_ram_ix60_ix1884 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_9_dup_641, QB=>OPEN, D=>nx1467, CLK=>
      clk);
   ix1468 : mux21_ni port map ( Y=>nx1467, A0=>
      mem_Mem_block_modgen_ram_ix60_a_9_dup_641, A1=>bs_data_in(1), S0=>
      nx8140);
   ix6099 : aoi22 port map ( Y=>nx6098, A0=>
      mem_Mem_block_modgen_ram_ix60_a_54_dup_596, A1=>nx8134, B0=>
      mem_Mem_block_modgen_ram_ix60_a_13_dup_637, B1=>nx8138);
   mem_Mem_block_modgen_ram_ix60_ix1704 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_54_dup_596, QB=>OPEN, D=>nx1447, CLK=>
      clk);
   ix1448 : mux21_ni port map ( Y=>nx1447, A0=>bs_data_in(1), A1=>
      mem_Mem_block_modgen_ram_ix60_a_54_dup_596, S0=>nx8204);
   mem_Mem_block_modgen_ram_ix60_ix1868 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_13_dup_637, QB=>OPEN, D=>nx1457, CLK=>
      clk);
   ix1458 : mux21_ni port map ( Y=>nx1457, A0=>
      mem_Mem_block_modgen_ram_ix60_a_13_dup_637, A1=>bs_data_in(1), S0=>
      nx8136);
   ix1921 : nand04 port map ( Y=>nx1920, A0=>nx6107, A1=>nx6115, A2=>nx6123, 
      A3=>nx6131);
   ix6108 : aoi22 port map ( Y=>nx6107, A0=>
      mem_Mem_block_modgen_ram_ix60_a_18_dup_632, A1=>nx8132, B0=>
      mem_Mem_block_modgen_ram_ix60_a_11_dup_639, B1=>nx8130);
   mem_Mem_block_modgen_ram_ix60_ix1848 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_18_dup_632, QB=>OPEN, D=>nx1437, CLK=>
      clk);
   ix1438 : mux21_ni port map ( Y=>nx1437, A0=>bs_data_in(1), A1=>
      mem_Mem_block_modgen_ram_ix60_a_18_dup_632, S0=>nx8212);
   mem_Mem_block_modgen_ram_ix60_ix1876 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_11_dup_639, QB=>OPEN, D=>nx1427, CLK=>
      clk);
   ix1428 : mux21_ni port map ( Y=>nx1427, A0=>
      mem_Mem_block_modgen_ram_ix60_a_11_dup_639, A1=>bs_data_in(1), S0=>
      nx8128);
   ix6116 : aoi22 port map ( Y=>nx6115, A0=>
      mem_Mem_block_modgen_ram_ix60_a_56_dup_594, A1=>nx8126, B0=>
      mem_Mem_block_modgen_ram_ix60_a_26_dup_624, B1=>nx8122);
   mem_Mem_block_modgen_ram_ix60_ix1696 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_56_dup_594, QB=>OPEN, D=>nx1417, CLK=>
      clk);
   ix1418 : mux21_ni port map ( Y=>nx1417, A0=>
      mem_Mem_block_modgen_ram_ix60_a_56_dup_594, A1=>bs_data_in(1), S0=>
      nx8124);
   mem_Mem_block_modgen_ram_ix60_ix1816 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_26_dup_624, QB=>OPEN, D=>nx1407, CLK=>
      clk);
   ix1408 : mux21_ni port map ( Y=>nx1407, A0=>
      mem_Mem_block_modgen_ram_ix60_a_26_dup_624, A1=>bs_data_in(1), S0=>
      nx8120);
   ix6124 : aoi22 port map ( Y=>nx6123, A0=>
      mem_Mem_block_modgen_ram_ix60_a_20_dup_630, A1=>nx8114, B0=>
      mem_Mem_block_modgen_ram_ix60_a_46_dup_604, B1=>nx8118);
   mem_Mem_block_modgen_ram_ix60_ix1840 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_20_dup_630, QB=>OPEN, D=>nx1387, CLK=>
      clk);
   ix1388 : mux21_ni port map ( Y=>nx1387, A0=>bs_data_in(1), A1=>
      mem_Mem_block_modgen_ram_ix60_a_20_dup_630, S0=>nx8242);
   mem_Mem_block_modgen_ram_ix60_ix1736 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_46_dup_604, QB=>OPEN, D=>nx1397, CLK=>
      clk);
   ix1398 : mux21_ni port map ( Y=>nx1397, A0=>
      mem_Mem_block_modgen_ram_ix60_a_46_dup_604, A1=>bs_data_in(1), S0=>
      nx8116);
   ix6132 : aoi22 port map ( Y=>nx6131, A0=>
      mem_Mem_block_modgen_ram_ix60_a_52_dup_598, A1=>nx8112, B0=>
      mem_Mem_block_modgen_ram_ix60_a_5_dup_645, B1=>nx8110);
   mem_Mem_block_modgen_ram_ix60_ix1712 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_52_dup_598, QB=>OPEN, D=>nx1377, CLK=>
      clk);
   ix1378 : mux21_ni port map ( Y=>nx1377, A0=>bs_data_in(1), A1=>
      mem_Mem_block_modgen_ram_ix60_a_52_dup_598, S0=>nx8254);
   mem_Mem_block_modgen_ram_ix60_ix1900 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_5_dup_645, QB=>OPEN, D=>nx1367, CLK=>
      clk);
   ix1368 : mux21_ni port map ( Y=>nx1367, A0=>bs_data_in(1), A1=>
      mem_Mem_block_modgen_ram_ix60_a_5_dup_645, S0=>nx8256);
   ix1841 : nand04 port map ( Y=>nx1840, A0=>nx6140, A1=>nx6148, A2=>nx6156, 
      A3=>nx6164);
   ix6141 : aoi22 port map ( Y=>nx6140, A0=>
      mem_Mem_block_modgen_ram_ix60_a_37_dup_613, A1=>nx8108, B0=>
      mem_Mem_block_modgen_ram_ix60_a_21_dup_629, B1=>nx8106);
   mem_Mem_block_modgen_ram_ix60_ix1772 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_37_dup_613, QB=>OPEN, D=>nx1357, CLK=>
      clk);
   ix1358 : mux21_ni port map ( Y=>nx1357, A0=>bs_data_in(1), A1=>
      mem_Mem_block_modgen_ram_ix60_a_37_dup_613, S0=>nx8260);
   mem_Mem_block_modgen_ram_ix60_ix1836 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_21_dup_629, QB=>OPEN, D=>nx1347, CLK=>
      clk);
   ix1348 : mux21_ni port map ( Y=>nx1347, A0=>bs_data_in(1), A1=>
      mem_Mem_block_modgen_ram_ix60_a_21_dup_629, S0=>nx8266);
   ix6149 : aoi22 port map ( Y=>nx6148, A0=>
      mem_Mem_block_modgen_ram_ix60_a_53_dup_597, A1=>nx8104, B0=>
      mem_Mem_block_modgen_ram_ix60_a_61_dup_589, B1=>nx8102);
   mem_Mem_block_modgen_ram_ix60_ix1708 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_53_dup_597, QB=>OPEN, D=>nx1337, CLK=>
      clk);
   ix1338 : mux21_ni port map ( Y=>nx1337, A0=>bs_data_in(1), A1=>
      mem_Mem_block_modgen_ram_ix60_a_53_dup_597, S0=>nx8268);
   mem_Mem_block_modgen_ram_ix60_ix1676 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_61_dup_589, QB=>OPEN, D=>nx1327, CLK=>
      clk);
   ix1328 : mux21_ni port map ( Y=>nx1327, A0=>
      mem_Mem_block_modgen_ram_ix60_a_61_dup_589, A1=>bs_data_in(1), S0=>
      nx8100);
   ix6157 : aoi22 port map ( Y=>nx6156, A0=>
      mem_Mem_block_modgen_ram_ix60_a_50_dup_600, A1=>nx8094, B0=>
      mem_Mem_block_modgen_ram_ix60_a_60_dup_590, B1=>nx8098);
   mem_Mem_block_modgen_ram_ix60_ix1720 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_50_dup_600, QB=>OPEN, D=>nx1307, CLK=>
      clk);
   ix1308 : mux21_ni port map ( Y=>nx1307, A0=>bs_data_in(1), A1=>
      mem_Mem_block_modgen_ram_ix60_a_50_dup_600, S0=>nx8272);
   mem_Mem_block_modgen_ram_ix60_ix1680 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_60_dup_590, QB=>OPEN, D=>nx1317, CLK=>
      clk);
   ix1318 : mux21_ni port map ( Y=>nx1317, A0=>
      mem_Mem_block_modgen_ram_ix60_a_60_dup_590, A1=>bs_data_in(1), S0=>
      nx8096);
   ix6165 : aoi22 port map ( Y=>nx6164, A0=>
      mem_Mem_block_modgen_ram_ix60_a_49_dup_601, A1=>nx8092, B0=>
      mem_Mem_block_modgen_ram_ix60_a_38_dup_612, B1=>nx8090);
   mem_Mem_block_modgen_ram_ix60_ix1724 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_49_dup_601, QB=>OPEN, D=>nx1297, CLK=>
      clk);
   ix1298 : mux21_ni port map ( Y=>nx1297, A0=>bs_data_in(1), A1=>
      mem_Mem_block_modgen_ram_ix60_a_49_dup_601, S0=>nx8276);
   mem_Mem_block_modgen_ram_ix60_ix1768 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_38_dup_612, QB=>OPEN, D=>nx1287, CLK=>
      clk);
   ix1288 : mux21_ni port map ( Y=>nx1287, A0=>bs_data_in(1), A1=>
      mem_Mem_block_modgen_ram_ix60_a_38_dup_612, S0=>nx8278);
   ix1763 : nand04 port map ( Y=>nx1762, A0=>nx6173, A1=>nx6181, A2=>nx6189, 
      A3=>nx6197);
   ix6174 : aoi22 port map ( Y=>nx6173, A0=>
      mem_Mem_block_modgen_ram_ix60_a_2_dup_648, A1=>nx8088, B0=>
      mem_Mem_block_modgen_ram_ix60_a_3_dup_647, B1=>nx8086);
   mem_Mem_block_modgen_ram_ix60_ix1912 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_2_dup_648, QB=>OPEN, D=>nx1277, CLK=>
      clk);
   ix1278 : mux21_ni port map ( Y=>nx1277, A0=>bs_data_in(1), A1=>
      mem_Mem_block_modgen_ram_ix60_a_2_dup_648, S0=>nx8280);
   mem_Mem_block_modgen_ram_ix60_ix1908 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_3_dup_647, QB=>OPEN, D=>nx1267, CLK=>
      clk);
   ix1268 : mux21_ni port map ( Y=>nx1267, A0=>bs_data_in(1), A1=>
      mem_Mem_block_modgen_ram_ix60_a_3_dup_647, S0=>nx8286);
   ix6182 : aoi22 port map ( Y=>nx6181, A0=>
      mem_Mem_block_modgen_ram_ix60_a_31_dup_619, A1=>nx8084, B0=>
      mem_Mem_block_modgen_ram_ix60_a_29_dup_621, B1=>nx8080);
   mem_Mem_block_modgen_ram_ix60_ix1796 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_31_dup_619, QB=>OPEN, D=>nx1257, CLK=>
      clk);
   ix1258 : mux21_ni port map ( Y=>nx1257, A0=>
      mem_Mem_block_modgen_ram_ix60_a_31_dup_619, A1=>bs_data_in(1), S0=>
      nx8082);
   mem_Mem_block_modgen_ram_ix60_ix1804 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_29_dup_621, QB=>OPEN, D=>nx1247, CLK=>
      clk);
   ix1248 : mux21_ni port map ( Y=>nx1247, A0=>
      mem_Mem_block_modgen_ram_ix60_a_29_dup_621, A1=>bs_data_in(1), S0=>
      nx8078);
   ix6190 : aoi22 port map ( Y=>nx6189, A0=>
      mem_Mem_block_modgen_ram_ix60_a_40_dup_610, A1=>nx8076, B0=>
      mem_Mem_block_modgen_ram_ix60_a_48_dup_602, B1=>nx8072);
   mem_Mem_block_modgen_ram_ix60_ix1760 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_40_dup_610, QB=>OPEN, D=>nx1237, CLK=>
      clk);
   ix1238 : mux21_ni port map ( Y=>nx1237, A0=>
      mem_Mem_block_modgen_ram_ix60_a_40_dup_610, A1=>bs_data_in(1), S0=>
      nx8074);
   mem_Mem_block_modgen_ram_ix60_ix1728 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_48_dup_602, QB=>OPEN, D=>nx1227, CLK=>
      clk);
   ix1228 : mux21_ni port map ( Y=>nx1227, A0=>bs_data_in(1), A1=>
      mem_Mem_block_modgen_ram_ix60_a_48_dup_602, S0=>nx8292);
   ix6198 : aoi22 port map ( Y=>nx6197, A0=>
      mem_Mem_block_modgen_ram_ix60_a_32_dup_618, A1=>nx8070, B0=>
      mem_Mem_block_modgen_ram_ix60_a_44_dup_606, B1=>nx8068);
   mem_Mem_block_modgen_ram_ix60_ix1792 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_32_dup_618, QB=>OPEN, D=>nx1217, CLK=>
      clk);
   ix1218 : mux21_ni port map ( Y=>nx1217, A0=>bs_data_in(1), A1=>
      mem_Mem_block_modgen_ram_ix60_a_32_dup_618, S0=>nx8294);
   mem_Mem_block_modgen_ram_ix60_ix1744 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_44_dup_606, QB=>OPEN, D=>nx1207, CLK=>
      clk);
   ix1208 : mux21_ni port map ( Y=>nx1207, A0=>
      mem_Mem_block_modgen_ram_ix60_a_44_dup_606, A1=>bs_data_in(1), S0=>
      nx8066);
   ix6206 : nor04 port map ( Y=>nx6205, A0=>nx1680, A1=>nx1602, A2=>nx1522, 
      A3=>nx1444);
   ix1681 : nand04 port map ( Y=>nx1680, A0=>nx6208, A1=>nx6216, A2=>nx6224, 
      A3=>nx6232);
   ix6209 : aoi22 port map ( Y=>nx6208, A0=>
      mem_Mem_block_modgen_ram_ix60_a_55_dup_595, A1=>nx8060, B0=>
      mem_Mem_block_modgen_ram_ix60_a_45_dup_605, B1=>nx8064);
   mem_Mem_block_modgen_ram_ix60_ix1700 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_55_dup_595, QB=>OPEN, D=>nx1187, CLK=>
      clk);
   ix1188 : mux21_ni port map ( Y=>nx1187, A0=>bs_data_in(1), A1=>
      mem_Mem_block_modgen_ram_ix60_a_55_dup_595, S0=>nx8298);
   mem_Mem_block_modgen_ram_ix60_ix1740 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_45_dup_605, QB=>OPEN, D=>nx1197, CLK=>
      clk);
   ix1198 : mux21_ni port map ( Y=>nx1197, A0=>
      mem_Mem_block_modgen_ram_ix60_a_45_dup_605, A1=>bs_data_in(1), S0=>
      nx8062);
   ix6217 : aoi22 port map ( Y=>nx6216, A0=>
      mem_Mem_block_modgen_ram_ix60_a_39_dup_611, A1=>nx8058, B0=>
      mem_Mem_block_modgen_ram_ix60_a_8_dup_642, B1=>nx8056);
   mem_Mem_block_modgen_ram_ix60_ix1764 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_39_dup_611, QB=>OPEN, D=>nx1177, CLK=>
      clk);
   ix1178 : mux21_ni port map ( Y=>nx1177, A0=>bs_data_in(1), A1=>
      mem_Mem_block_modgen_ram_ix60_a_39_dup_611, S0=>nx8300);
   mem_Mem_block_modgen_ram_ix60_ix1888 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_8_dup_642, QB=>OPEN, D=>nx1167, CLK=>
      clk);
   ix1168 : mux21_ni port map ( Y=>nx1167, A0=>
      mem_Mem_block_modgen_ram_ix60_a_8_dup_642, A1=>bs_data_in(1), S0=>
      nx8054);
   ix6225 : aoi22 port map ( Y=>nx6224, A0=>
      mem_Mem_block_modgen_ram_ix60_a_12_dup_638, A1=>nx8052, B0=>
      mem_Mem_block_modgen_ram_ix60_a_22_dup_628, B1=>nx8048);
   mem_Mem_block_modgen_ram_ix60_ix1872 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_12_dup_638, QB=>OPEN, D=>nx1157, CLK=>
      clk);
   ix1158 : mux21_ni port map ( Y=>nx1157, A0=>
      mem_Mem_block_modgen_ram_ix60_a_12_dup_638, A1=>bs_data_in(1), S0=>
      nx8050);
   mem_Mem_block_modgen_ram_ix60_ix1832 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_22_dup_628, QB=>OPEN, D=>nx1147, CLK=>
      clk);
   ix1148 : mux21_ni port map ( Y=>nx1147, A0=>bs_data_in(1), A1=>
      mem_Mem_block_modgen_ram_ix60_a_22_dup_628, S0=>nx8302);
   ix6233 : aoi22 port map ( Y=>nx6232, A0=>
      mem_Mem_block_modgen_ram_ix60_a_58_dup_592, A1=>nx8044, B0=>
      mem_Mem_block_modgen_ram_ix60_a_6_dup_644, B1=>nx8046);
   mem_Mem_block_modgen_ram_ix60_ix1688 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_58_dup_592, QB=>OPEN, D=>nx1127, CLK=>
      clk);
   ix1128 : mux21_ni port map ( Y=>nx1127, A0=>
      mem_Mem_block_modgen_ram_ix60_a_58_dup_592, A1=>bs_data_in(1), S0=>
      nx8042);
   mem_Mem_block_modgen_ram_ix60_ix1896 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_6_dup_644, QB=>OPEN, D=>nx1137, CLK=>
      clk);
   ix1138 : mux21_ni port map ( Y=>nx1137, A0=>bs_data_in(1), A1=>
      mem_Mem_block_modgen_ram_ix60_a_6_dup_644, S0=>nx8304);
   ix1603 : nand04 port map ( Y=>nx1602, A0=>nx6241, A1=>nx6249, A2=>nx6257, 
      A3=>nx6265);
   ix6242 : aoi22 port map ( Y=>nx6241, A0=>
      mem_Mem_block_modgen_ram_ix60_a_25_dup_625, A1=>nx8040, B0=>
      mem_Mem_block_modgen_ram_ix60_a_62_dup_588, B1=>nx8036);
   mem_Mem_block_modgen_ram_ix60_ix1820 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_25_dup_625, QB=>OPEN, D=>nx1117, CLK=>
      clk);
   ix1118 : mux21_ni port map ( Y=>nx1117, A0=>
      mem_Mem_block_modgen_ram_ix60_a_25_dup_625, A1=>bs_data_in(1), S0=>
      nx8038);
   mem_Mem_block_modgen_ram_ix60_ix1672 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_62_dup_588, QB=>OPEN, D=>nx1107, CLK=>
      clk);
   ix1108 : mux21_ni port map ( Y=>nx1107, A0=>
      mem_Mem_block_modgen_ram_ix60_a_62_dup_588, A1=>bs_data_in(1), S0=>
      nx8034);
   ix6250 : aoi22 port map ( Y=>nx6249, A0=>
      mem_Mem_block_modgen_ram_ix60_a_33_dup_617, A1=>nx8028, B0=>
      mem_Mem_block_modgen_ram_ix60_a_63_dup_587, B1=>nx8032);
   mem_Mem_block_modgen_ram_ix60_ix1788 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_33_dup_617, QB=>OPEN, D=>nx1087, CLK=>
      clk);
   ix1088 : mux21_ni port map ( Y=>nx1087, A0=>bs_data_in(1), A1=>
      mem_Mem_block_modgen_ram_ix60_a_33_dup_617, S0=>nx8306);
   mem_Mem_block_modgen_ram_ix60_ix1668 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_63_dup_587, QB=>OPEN, D=>nx1097, CLK=>
      clk);
   ix1098 : mux21_ni port map ( Y=>nx1097, A0=>
      mem_Mem_block_modgen_ram_ix60_a_63_dup_587, A1=>bs_data_in(1), S0=>
      nx8030);
   ix6258 : aoi22 port map ( Y=>nx6257, A0=>
      mem_Mem_block_modgen_ram_ix60_a_41_dup_609, A1=>nx8026, B0=>
      mem_Mem_block_modgen_ram_ix60_a_1_dup_649, B1=>nx8022);
   mem_Mem_block_modgen_ram_ix60_ix1756 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_41_dup_609, QB=>OPEN, D=>nx1077, CLK=>
      clk);
   ix1078 : mux21_ni port map ( Y=>nx1077, A0=>
      mem_Mem_block_modgen_ram_ix60_a_41_dup_609, A1=>bs_data_in(1), S0=>
      nx8024);
   mem_Mem_block_modgen_ram_ix60_ix1916 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_1_dup_649, QB=>OPEN, D=>nx1067, CLK=>
      clk);
   ix1068 : mux21_ni port map ( Y=>nx1067, A0=>bs_data_in(1), A1=>
      mem_Mem_block_modgen_ram_ix60_a_1_dup_649, S0=>nx8308);
   ix6266 : aoi22 port map ( Y=>nx6265, A0=>
      mem_Mem_block_modgen_ram_ix60_a_43_dup_607, A1=>nx8018, B0=>
      mem_Mem_block_modgen_ram_ix60_a_0_dup_650, B1=>nx8020);
   mem_Mem_block_modgen_ram_ix60_ix1748 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_43_dup_607, QB=>OPEN, D=>nx1047, CLK=>
      clk);
   ix1048 : mux21_ni port map ( Y=>nx1047, A0=>
      mem_Mem_block_modgen_ram_ix60_a_43_dup_607, A1=>bs_data_in(1), S0=>
      nx8016);
   mem_Mem_block_modgen_ram_ix60_ix1920 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_0_dup_650, QB=>OPEN, D=>nx1057, CLK=>
      clk);
   ix1058 : mux21_ni port map ( Y=>nx1057, A0=>bs_data_in(1), A1=>
      mem_Mem_block_modgen_ram_ix60_a_0_dup_650, S0=>nx8310);
   ix1523 : nand04 port map ( Y=>nx1522, A0=>nx6274, A1=>nx6282, A2=>nx6290, 
      A3=>nx6298);
   ix6275 : aoi22 port map ( Y=>nx6274, A0=>
      mem_Mem_block_modgen_ram_ix60_a_34_dup_616, A1=>nx8014, B0=>
      mem_Mem_block_modgen_ram_ix60_a_47_dup_603, B1=>nx8012);
   mem_Mem_block_modgen_ram_ix60_ix1784 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_34_dup_616, QB=>OPEN, D=>nx1037, CLK=>
      clk);
   ix1038 : mux21_ni port map ( Y=>nx1037, A0=>bs_data_in(1), A1=>
      mem_Mem_block_modgen_ram_ix60_a_34_dup_616, S0=>nx8312);
   mem_Mem_block_modgen_ram_ix60_ix1732 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_47_dup_603, QB=>OPEN, D=>nx1027, CLK=>
      clk);
   ix1028 : mux21_ni port map ( Y=>nx1027, A0=>
      mem_Mem_block_modgen_ram_ix60_a_47_dup_603, A1=>bs_data_in(1), S0=>
      nx8010);
   ix6283 : aoi22 port map ( Y=>nx6282, A0=>
      mem_Mem_block_modgen_ram_ix60_a_59_dup_591, A1=>nx8004, B0=>
      mem_Mem_block_modgen_ram_ix60_a_24_dup_626, B1=>nx8008);
   mem_Mem_block_modgen_ram_ix60_ix1684 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_59_dup_591, QB=>OPEN, D=>nx1007, CLK=>
      clk);
   ix1008 : mux21_ni port map ( Y=>nx1007, A0=>
      mem_Mem_block_modgen_ram_ix60_a_59_dup_591, A1=>bs_data_in(1), S0=>
      nx8002);
   mem_Mem_block_modgen_ram_ix60_ix1824 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_24_dup_626, QB=>OPEN, D=>nx1017, CLK=>
      clk);
   ix1018 : mux21_ni port map ( Y=>nx1017, A0=>
      mem_Mem_block_modgen_ram_ix60_a_24_dup_626, A1=>bs_data_in(1), S0=>
      nx8006);
   ix6291 : aoi22 port map ( Y=>nx6290, A0=>
      mem_Mem_block_modgen_ram_ix60_a_57_dup_593, A1=>nx7998, B0=>
      mem_Mem_block_modgen_ram_ix60_a_17_dup_633, B1=>nx8000);
   mem_Mem_block_modgen_ram_ix60_ix1692 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_57_dup_593, QB=>OPEN, D=>nx987, CLK=>
      clk);
   ix988 : mux21_ni port map ( Y=>nx987, A0=>
      mem_Mem_block_modgen_ram_ix60_a_57_dup_593, A1=>bs_data_in(1), S0=>
      nx7996);
   mem_Mem_block_modgen_ram_ix60_ix1852 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_17_dup_633, QB=>OPEN, D=>nx997, CLK=>
      clk);
   ix998 : mux21_ni port map ( Y=>nx997, A0=>bs_data_in(1), A1=>
      mem_Mem_block_modgen_ram_ix60_a_17_dup_633, S0=>nx8314);
   ix6299 : aoi22 port map ( Y=>nx6298, A0=>
      mem_Mem_block_modgen_ram_ix60_a_35_dup_615, A1=>nx7994, B0=>
      mem_Mem_block_modgen_ram_ix60_a_28_dup_622, B1=>nx7992);
   mem_Mem_block_modgen_ram_ix60_ix1780 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_35_dup_615, QB=>OPEN, D=>nx977, CLK=>
      clk);
   ix978 : mux21_ni port map ( Y=>nx977, A0=>bs_data_in(1), A1=>
      mem_Mem_block_modgen_ram_ix60_a_35_dup_615, S0=>nx8316);
   mem_Mem_block_modgen_ram_ix60_ix1808 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_28_dup_622, QB=>OPEN, D=>nx967, CLK=>
      clk);
   ix968 : mux21_ni port map ( Y=>nx967, A0=>
      mem_Mem_block_modgen_ram_ix60_a_28_dup_622, A1=>bs_data_in(1), S0=>
      nx7990);
   ix1445 : nand04 port map ( Y=>nx1444, A0=>nx6307, A1=>nx6315, A2=>nx6323, 
      A3=>nx6331);
   ix6308 : aoi22 port map ( Y=>nx6307, A0=>
      mem_Mem_block_modgen_ram_ix60_a_51_dup_599, A1=>nx7988, B0=>
      mem_Mem_block_modgen_ram_ix60_a_27_dup_623, B1=>nx7982);
   mem_Mem_block_modgen_ram_ix60_ix1716 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_51_dup_599, QB=>OPEN, D=>nx957, CLK=>
      clk);
   ix958 : mux21_ni port map ( Y=>nx957, A0=>bs_data_in(1), A1=>
      mem_Mem_block_modgen_ram_ix60_a_51_dup_599, S0=>nx8318);
   mem_Mem_block_modgen_ram_ix60_ix1812 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_27_dup_623, QB=>OPEN, D=>nx947, CLK=>
      clk);
   ix948 : mux21_ni port map ( Y=>nx947, A0=>
      mem_Mem_block_modgen_ram_ix60_a_27_dup_623, A1=>bs_data_in(1), S0=>
      nx7980);
   ix6316 : aoi22 port map ( Y=>nx6315, A0=>
      mem_Mem_block_modgen_ram_ix60_a_30_dup_620, A1=>nx7976, B0=>
      mem_Mem_block_modgen_ram_ix60_a_16_dup_634, B1=>nx7978);
   mem_Mem_block_modgen_ram_ix60_ix1800 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_30_dup_620, QB=>OPEN, D=>nx927, CLK=>
      clk);
   ix928 : mux21_ni port map ( Y=>nx927, A0=>
      mem_Mem_block_modgen_ram_ix60_a_30_dup_620, A1=>bs_data_in(1), S0=>
      nx7974);
   mem_Mem_block_modgen_ram_ix60_ix1856 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_16_dup_634, QB=>OPEN, D=>nx937, CLK=>
      clk);
   ix938 : mux21_ni port map ( Y=>nx937, A0=>bs_data_in(1), A1=>
      mem_Mem_block_modgen_ram_ix60_a_16_dup_634, S0=>nx8320);
   ix6324 : aoi22 port map ( Y=>nx6323, A0=>
      mem_Mem_block_modgen_ram_ix60_a_42_dup_608, A1=>nx7972, B0=>
      mem_Mem_block_modgen_ram_ix60_a_36_dup_614, B1=>nx7968);
   mem_Mem_block_modgen_ram_ix60_ix1752 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_42_dup_608, QB=>OPEN, D=>nx917, CLK=>
      clk);
   ix918 : mux21_ni port map ( Y=>nx917, A0=>
      mem_Mem_block_modgen_ram_ix60_a_42_dup_608, A1=>bs_data_in(1), S0=>
      nx7970);
   mem_Mem_block_modgen_ram_ix60_ix1776 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_36_dup_614, QB=>OPEN, D=>nx907, CLK=>
      clk);
   ix908 : mux21_ni port map ( Y=>nx907, A0=>bs_data_in(1), A1=>
      mem_Mem_block_modgen_ram_ix60_a_36_dup_614, S0=>nx8322);
   ix6332 : aoi22 port map ( Y=>nx6331, A0=>
      mem_Mem_block_modgen_ram_ix60_a_4_dup_646, A1=>nx7960, B0=>
      mem_Mem_block_modgen_ram_ix60_a_19_dup_631, B1=>nx7964);
   mem_Mem_block_modgen_ram_ix60_ix1904 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_4_dup_646, QB=>OPEN, D=>nx887, CLK=>
      clk);
   ix888 : mux21_ni port map ( Y=>nx887, A0=>bs_data_in(1), A1=>
      mem_Mem_block_modgen_ram_ix60_a_4_dup_646, S0=>nx8324);
   mem_Mem_block_modgen_ram_ix60_ix1844 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_19_dup_631, QB=>OPEN, D=>nx897, CLK=>
      clk);
   ix898 : mux21_ni port map ( Y=>nx897, A0=>bs_data_in(1), A1=>
      mem_Mem_block_modgen_ram_ix60_a_19_dup_631, S0=>nx8326);
   ix2643 : nand02 port map ( Y=>ds_data_out(2), A0=>nx6340, A1=>nx6474);
   ix6341 : nor04 port map ( Y=>nx6340, A0=>nx2636, A1=>nx2558, A2=>nx2478, 
      A3=>nx2400);
   ix2637 : nand04 port map ( Y=>nx2636, A0=>nx6343, A1=>nx6351, A2=>nx6359, 
      A3=>nx6367);
   ix6344 : aoi22 port map ( Y=>nx6343, A0=>
      mem_Mem_block_modgen_ram_ix60_a_14_dup_566, A1=>nx8158, B0=>
      mem_Mem_block_modgen_ram_ix60_a_23_dup_557, B1=>nx8154);
   mem_Mem_block_modgen_ram_ix60_ix1606 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_14_dup_566, QB=>OPEN, D=>nx2157, CLK=>
      clk);
   ix2158 : mux21_ni port map ( Y=>nx2157, A0=>
      mem_Mem_block_modgen_ram_ix60_a_14_dup_566, A1=>bs_data_in(2), S0=>
      nx8156);
   mem_Mem_block_modgen_ram_ix60_ix1570 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_23_dup_557, QB=>OPEN, D=>nx2147, CLK=>
      clk);
   ix2148 : mux21_ni port map ( Y=>nx2147, A0=>bs_data_in(2), A1=>
      mem_Mem_block_modgen_ram_ix60_a_23_dup_557, S0=>nx8176);
   ix6352 : aoi22 port map ( Y=>nx6351, A0=>
      mem_Mem_block_modgen_ram_ix60_a_15_dup_565, A1=>nx8150, B0=>
      mem_Mem_block_modgen_ram_ix60_a_7_dup_573, B1=>nx8152);
   mem_Mem_block_modgen_ram_ix60_ix1602 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_15_dup_565, QB=>OPEN, D=>nx2127, CLK=>
      clk);
   ix2128 : mux21_ni port map ( Y=>nx2127, A0=>
      mem_Mem_block_modgen_ram_ix60_a_15_dup_565, A1=>bs_data_in(2), S0=>
      nx8148);
   mem_Mem_block_modgen_ram_ix60_ix1634 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_7_dup_573, QB=>OPEN, D=>nx2137, CLK=>
      clk);
   ix2138 : mux21_ni port map ( Y=>nx2137, A0=>bs_data_in(2), A1=>
      mem_Mem_block_modgen_ram_ix60_a_7_dup_573, S0=>nx8188);
   ix6360 : aoi22 port map ( Y=>nx6359, A0=>
      mem_Mem_block_modgen_ram_ix60_a_10_dup_570, A1=>nx8146, B0=>
      mem_Mem_block_modgen_ram_ix60_a_9_dup_571, B1=>nx8142);
   mem_Mem_block_modgen_ram_ix60_ix1622 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_10_dup_570, QB=>OPEN, D=>nx2117, CLK=>
      clk);
   ix2118 : mux21_ni port map ( Y=>nx2117, A0=>
      mem_Mem_block_modgen_ram_ix60_a_10_dup_570, A1=>bs_data_in(2), S0=>
      nx8144);
   mem_Mem_block_modgen_ram_ix60_ix1626 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_9_dup_571, QB=>OPEN, D=>nx2107, CLK=>
      clk);
   ix2108 : mux21_ni port map ( Y=>nx2107, A0=>
      mem_Mem_block_modgen_ram_ix60_a_9_dup_571, A1=>bs_data_in(2), S0=>
      nx8140);
   ix6368 : aoi22 port map ( Y=>nx6367, A0=>
      mem_Mem_block_modgen_ram_ix60_a_54_dup_526, A1=>nx8134, B0=>
      mem_Mem_block_modgen_ram_ix60_a_13_dup_567, B1=>nx8138);
   mem_Mem_block_modgen_ram_ix60_ix1446 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_54_dup_526, QB=>OPEN, D=>nx2087, CLK=>
      clk);
   ix2088 : mux21_ni port map ( Y=>nx2087, A0=>bs_data_in(2), A1=>
      mem_Mem_block_modgen_ram_ix60_a_54_dup_526, S0=>nx8204);
   mem_Mem_block_modgen_ram_ix60_ix1610 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_13_dup_567, QB=>OPEN, D=>nx2097, CLK=>
      clk);
   ix2098 : mux21_ni port map ( Y=>nx2097, A0=>
      mem_Mem_block_modgen_ram_ix60_a_13_dup_567, A1=>bs_data_in(2), S0=>
      nx8136);
   ix2559 : nand04 port map ( Y=>nx2558, A0=>nx6376, A1=>nx6384, A2=>nx6392, 
      A3=>nx6400);
   ix6377 : aoi22 port map ( Y=>nx6376, A0=>
      mem_Mem_block_modgen_ram_ix60_a_18_dup_562, A1=>nx8132, B0=>
      mem_Mem_block_modgen_ram_ix60_a_11_dup_569, B1=>nx8130);
   mem_Mem_block_modgen_ram_ix60_ix1590 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_18_dup_562, QB=>OPEN, D=>nx2077, CLK=>
      clk);
   ix2078 : mux21_ni port map ( Y=>nx2077, A0=>bs_data_in(2), A1=>
      mem_Mem_block_modgen_ram_ix60_a_18_dup_562, S0=>nx8212);
   mem_Mem_block_modgen_ram_ix60_ix1618 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_11_dup_569, QB=>OPEN, D=>nx2067, CLK=>
      clk);
   ix2068 : mux21_ni port map ( Y=>nx2067, A0=>
      mem_Mem_block_modgen_ram_ix60_a_11_dup_569, A1=>bs_data_in(2), S0=>
      nx8128);
   ix6385 : aoi22 port map ( Y=>nx6384, A0=>
      mem_Mem_block_modgen_ram_ix60_a_56_dup_524, A1=>nx8126, B0=>
      mem_Mem_block_modgen_ram_ix60_a_26_dup_554, B1=>nx8122);
   mem_Mem_block_modgen_ram_ix60_ix1438 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_56_dup_524, QB=>OPEN, D=>nx2057, CLK=>
      clk);
   ix2058 : mux21_ni port map ( Y=>nx2057, A0=>
      mem_Mem_block_modgen_ram_ix60_a_56_dup_524, A1=>bs_data_in(2), S0=>
      nx8124);
   mem_Mem_block_modgen_ram_ix60_ix1558 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_26_dup_554, QB=>OPEN, D=>nx2047, CLK=>
      clk);
   ix2048 : mux21_ni port map ( Y=>nx2047, A0=>
      mem_Mem_block_modgen_ram_ix60_a_26_dup_554, A1=>bs_data_in(2), S0=>
      nx8120);
   ix6393 : aoi22 port map ( Y=>nx6392, A0=>
      mem_Mem_block_modgen_ram_ix60_a_20_dup_560, A1=>nx8114, B0=>
      mem_Mem_block_modgen_ram_ix60_a_46_dup_534, B1=>nx8118);
   mem_Mem_block_modgen_ram_ix60_ix1582 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_20_dup_560, QB=>OPEN, D=>nx2027, CLK=>
      clk);
   ix2028 : mux21_ni port map ( Y=>nx2027, A0=>bs_data_in(2), A1=>
      mem_Mem_block_modgen_ram_ix60_a_20_dup_560, S0=>nx8242);
   mem_Mem_block_modgen_ram_ix60_ix1478 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_46_dup_534, QB=>OPEN, D=>nx2037, CLK=>
      clk);
   ix2038 : mux21_ni port map ( Y=>nx2037, A0=>
      mem_Mem_block_modgen_ram_ix60_a_46_dup_534, A1=>bs_data_in(2), S0=>
      nx8116);
   ix6401 : aoi22 port map ( Y=>nx6400, A0=>
      mem_Mem_block_modgen_ram_ix60_a_52_dup_528, A1=>nx8112, B0=>
      mem_Mem_block_modgen_ram_ix60_a_5_dup_575, B1=>nx8110);
   mem_Mem_block_modgen_ram_ix60_ix1454 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_52_dup_528, QB=>OPEN, D=>nx2017, CLK=>
      clk);
   ix2018 : mux21_ni port map ( Y=>nx2017, A0=>bs_data_in(2), A1=>
      mem_Mem_block_modgen_ram_ix60_a_52_dup_528, S0=>nx8254);
   mem_Mem_block_modgen_ram_ix60_ix1642 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_5_dup_575, QB=>OPEN, D=>nx2007, CLK=>
      clk);
   ix2008 : mux21_ni port map ( Y=>nx2007, A0=>bs_data_in(2), A1=>
      mem_Mem_block_modgen_ram_ix60_a_5_dup_575, S0=>nx8256);
   ix2479 : nand04 port map ( Y=>nx2478, A0=>nx6409, A1=>nx6417, A2=>nx6425, 
      A3=>nx6433);
   ix6410 : aoi22 port map ( Y=>nx6409, A0=>
      mem_Mem_block_modgen_ram_ix60_a_37_dup_543, A1=>nx8108, B0=>
      mem_Mem_block_modgen_ram_ix60_a_21_dup_559, B1=>nx8106);
   mem_Mem_block_modgen_ram_ix60_ix1514 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_37_dup_543, QB=>OPEN, D=>nx1997, CLK=>
      clk);
   ix1998 : mux21_ni port map ( Y=>nx1997, A0=>bs_data_in(2), A1=>
      mem_Mem_block_modgen_ram_ix60_a_37_dup_543, S0=>nx8260);
   mem_Mem_block_modgen_ram_ix60_ix1578 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_21_dup_559, QB=>OPEN, D=>nx1987, CLK=>
      clk);
   ix1988 : mux21_ni port map ( Y=>nx1987, A0=>bs_data_in(2), A1=>
      mem_Mem_block_modgen_ram_ix60_a_21_dup_559, S0=>nx8266);
   ix6418 : aoi22 port map ( Y=>nx6417, A0=>
      mem_Mem_block_modgen_ram_ix60_a_53_dup_527, A1=>nx8104, B0=>
      mem_Mem_block_modgen_ram_ix60_a_61_dup_519, B1=>nx8102);
   mem_Mem_block_modgen_ram_ix60_ix1450 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_53_dup_527, QB=>OPEN, D=>nx1977, CLK=>
      clk);
   ix1978 : mux21_ni port map ( Y=>nx1977, A0=>bs_data_in(2), A1=>
      mem_Mem_block_modgen_ram_ix60_a_53_dup_527, S0=>nx8268);
   mem_Mem_block_modgen_ram_ix60_ix1418 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_61_dup_519, QB=>OPEN, D=>nx1967, CLK=>
      clk);
   ix1968 : mux21_ni port map ( Y=>nx1967, A0=>
      mem_Mem_block_modgen_ram_ix60_a_61_dup_519, A1=>bs_data_in(2), S0=>
      nx8100);
   ix6426 : aoi22 port map ( Y=>nx6425, A0=>
      mem_Mem_block_modgen_ram_ix60_a_50_dup_530, A1=>nx8094, B0=>
      mem_Mem_block_modgen_ram_ix60_a_60_dup_520, B1=>nx8098);
   mem_Mem_block_modgen_ram_ix60_ix1462 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_50_dup_530, QB=>OPEN, D=>nx1947, CLK=>
      clk);
   ix1948 : mux21_ni port map ( Y=>nx1947, A0=>bs_data_in(2), A1=>
      mem_Mem_block_modgen_ram_ix60_a_50_dup_530, S0=>nx8272);
   mem_Mem_block_modgen_ram_ix60_ix1422 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_60_dup_520, QB=>OPEN, D=>nx1957, CLK=>
      clk);
   ix1958 : mux21_ni port map ( Y=>nx1957, A0=>
      mem_Mem_block_modgen_ram_ix60_a_60_dup_520, A1=>bs_data_in(2), S0=>
      nx8096);
   ix6434 : aoi22 port map ( Y=>nx6433, A0=>
      mem_Mem_block_modgen_ram_ix60_a_49_dup_531, A1=>nx8092, B0=>
      mem_Mem_block_modgen_ram_ix60_a_38_dup_542, B1=>nx8090);
   mem_Mem_block_modgen_ram_ix60_ix1466 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_49_dup_531, QB=>OPEN, D=>nx1937, CLK=>
      clk);
   ix1938 : mux21_ni port map ( Y=>nx1937, A0=>bs_data_in(2), A1=>
      mem_Mem_block_modgen_ram_ix60_a_49_dup_531, S0=>nx8276);
   mem_Mem_block_modgen_ram_ix60_ix1510 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_38_dup_542, QB=>OPEN, D=>nx1927, CLK=>
      clk);
   ix1928 : mux21_ni port map ( Y=>nx1927, A0=>bs_data_in(2), A1=>
      mem_Mem_block_modgen_ram_ix60_a_38_dup_542, S0=>nx8278);
   ix2401 : nand04 port map ( Y=>nx2400, A0=>nx6442, A1=>nx6450, A2=>nx6458, 
      A3=>nx6466);
   ix6443 : aoi22 port map ( Y=>nx6442, A0=>
      mem_Mem_block_modgen_ram_ix60_a_2_dup_578, A1=>nx8088, B0=>
      mem_Mem_block_modgen_ram_ix60_a_3_dup_577, B1=>nx8086);
   mem_Mem_block_modgen_ram_ix60_ix1654 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_2_dup_578, QB=>OPEN, D=>nx1917, CLK=>
      clk);
   ix1918 : mux21_ni port map ( Y=>nx1917, A0=>bs_data_in(2), A1=>
      mem_Mem_block_modgen_ram_ix60_a_2_dup_578, S0=>nx8280);
   mem_Mem_block_modgen_ram_ix60_ix1650 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_3_dup_577, QB=>OPEN, D=>nx1907, CLK=>
      clk);
   ix1908 : mux21_ni port map ( Y=>nx1907, A0=>bs_data_in(2), A1=>
      mem_Mem_block_modgen_ram_ix60_a_3_dup_577, S0=>nx8286);
   ix6451 : aoi22 port map ( Y=>nx6450, A0=>
      mem_Mem_block_modgen_ram_ix60_a_31_dup_549, A1=>nx8084, B0=>
      mem_Mem_block_modgen_ram_ix60_a_29_dup_551, B1=>nx8080);
   mem_Mem_block_modgen_ram_ix60_ix1538 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_31_dup_549, QB=>OPEN, D=>nx1897, CLK=>
      clk);
   ix1898 : mux21_ni port map ( Y=>nx1897, A0=>
      mem_Mem_block_modgen_ram_ix60_a_31_dup_549, A1=>bs_data_in(2), S0=>
      nx8082);
   mem_Mem_block_modgen_ram_ix60_ix1546 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_29_dup_551, QB=>OPEN, D=>nx1887, CLK=>
      clk);
   ix1888 : mux21_ni port map ( Y=>nx1887, A0=>
      mem_Mem_block_modgen_ram_ix60_a_29_dup_551, A1=>bs_data_in(2), S0=>
      nx8078);
   ix6459 : aoi22 port map ( Y=>nx6458, A0=>
      mem_Mem_block_modgen_ram_ix60_a_40_dup_540, A1=>nx8076, B0=>
      mem_Mem_block_modgen_ram_ix60_a_48_dup_532, B1=>nx8072);
   mem_Mem_block_modgen_ram_ix60_ix1502 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_40_dup_540, QB=>OPEN, D=>nx1877, CLK=>
      clk);
   ix1878 : mux21_ni port map ( Y=>nx1877, A0=>
      mem_Mem_block_modgen_ram_ix60_a_40_dup_540, A1=>bs_data_in(2), S0=>
      nx8074);
   mem_Mem_block_modgen_ram_ix60_ix1470 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_48_dup_532, QB=>OPEN, D=>nx1867, CLK=>
      clk);
   ix1868 : mux21_ni port map ( Y=>nx1867, A0=>bs_data_in(2), A1=>
      mem_Mem_block_modgen_ram_ix60_a_48_dup_532, S0=>nx8292);
   ix6467 : aoi22 port map ( Y=>nx6466, A0=>
      mem_Mem_block_modgen_ram_ix60_a_32_dup_548, A1=>nx8070, B0=>
      mem_Mem_block_modgen_ram_ix60_a_44_dup_536, B1=>nx8068);
   mem_Mem_block_modgen_ram_ix60_ix1534 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_32_dup_548, QB=>OPEN, D=>nx1857, CLK=>
      clk);
   ix1858 : mux21_ni port map ( Y=>nx1857, A0=>bs_data_in(2), A1=>
      mem_Mem_block_modgen_ram_ix60_a_32_dup_548, S0=>nx8294);
   mem_Mem_block_modgen_ram_ix60_ix1486 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_44_dup_536, QB=>OPEN, D=>nx1847, CLK=>
      clk);
   ix1848 : mux21_ni port map ( Y=>nx1847, A0=>
      mem_Mem_block_modgen_ram_ix60_a_44_dup_536, A1=>bs_data_in(2), S0=>
      nx8066);
   ix6475 : nor04 port map ( Y=>nx6474, A0=>nx2318, A1=>nx2240, A2=>nx2160, 
      A3=>nx2082);
   ix2319 : nand04 port map ( Y=>nx2318, A0=>nx6477, A1=>nx6485, A2=>nx6493, 
      A3=>nx6501);
   ix6478 : aoi22 port map ( Y=>nx6477, A0=>
      mem_Mem_block_modgen_ram_ix60_a_55_dup_525, A1=>nx8060, B0=>
      mem_Mem_block_modgen_ram_ix60_a_45_dup_535, B1=>nx8064);
   mem_Mem_block_modgen_ram_ix60_ix1442 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_55_dup_525, QB=>OPEN, D=>nx1827, CLK=>
      clk);
   ix1828 : mux21_ni port map ( Y=>nx1827, A0=>bs_data_in(2), A1=>
      mem_Mem_block_modgen_ram_ix60_a_55_dup_525, S0=>nx8298);
   mem_Mem_block_modgen_ram_ix60_ix1482 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_45_dup_535, QB=>OPEN, D=>nx1837, CLK=>
      clk);
   ix1838 : mux21_ni port map ( Y=>nx1837, A0=>
      mem_Mem_block_modgen_ram_ix60_a_45_dup_535, A1=>bs_data_in(2), S0=>
      nx8062);
   ix6486 : aoi22 port map ( Y=>nx6485, A0=>
      mem_Mem_block_modgen_ram_ix60_a_39_dup_541, A1=>nx8058, B0=>
      mem_Mem_block_modgen_ram_ix60_a_8_dup_572, B1=>nx8056);
   mem_Mem_block_modgen_ram_ix60_ix1506 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_39_dup_541, QB=>OPEN, D=>nx1817, CLK=>
      clk);
   ix1818 : mux21_ni port map ( Y=>nx1817, A0=>bs_data_in(2), A1=>
      mem_Mem_block_modgen_ram_ix60_a_39_dup_541, S0=>nx8300);
   mem_Mem_block_modgen_ram_ix60_ix1630 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_8_dup_572, QB=>OPEN, D=>nx1807, CLK=>
      clk);
   ix1808 : mux21_ni port map ( Y=>nx1807, A0=>
      mem_Mem_block_modgen_ram_ix60_a_8_dup_572, A1=>bs_data_in(2), S0=>
      nx8054);
   ix6494 : aoi22 port map ( Y=>nx6493, A0=>
      mem_Mem_block_modgen_ram_ix60_a_12_dup_568, A1=>nx8052, B0=>
      mem_Mem_block_modgen_ram_ix60_a_22_dup_558, B1=>nx8048);
   mem_Mem_block_modgen_ram_ix60_ix1614 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_12_dup_568, QB=>OPEN, D=>nx1797, CLK=>
      clk);
   ix1798 : mux21_ni port map ( Y=>nx1797, A0=>
      mem_Mem_block_modgen_ram_ix60_a_12_dup_568, A1=>bs_data_in(2), S0=>
      nx8050);
   mem_Mem_block_modgen_ram_ix60_ix1574 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_22_dup_558, QB=>OPEN, D=>nx1787, CLK=>
      clk);
   ix1788 : mux21_ni port map ( Y=>nx1787, A0=>bs_data_in(2), A1=>
      mem_Mem_block_modgen_ram_ix60_a_22_dup_558, S0=>nx8302);
   ix6502 : aoi22 port map ( Y=>nx6501, A0=>
      mem_Mem_block_modgen_ram_ix60_a_58_dup_522, A1=>nx8044, B0=>
      mem_Mem_block_modgen_ram_ix60_a_6_dup_574, B1=>nx8046);
   mem_Mem_block_modgen_ram_ix60_ix1430 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_58_dup_522, QB=>OPEN, D=>nx1767, CLK=>
      clk);
   ix1768 : mux21_ni port map ( Y=>nx1767, A0=>
      mem_Mem_block_modgen_ram_ix60_a_58_dup_522, A1=>bs_data_in(2), S0=>
      nx8042);
   mem_Mem_block_modgen_ram_ix60_ix1638 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_6_dup_574, QB=>OPEN, D=>nx1777, CLK=>
      clk);
   ix1778 : mux21_ni port map ( Y=>nx1777, A0=>bs_data_in(2), A1=>
      mem_Mem_block_modgen_ram_ix60_a_6_dup_574, S0=>nx8304);
   ix2241 : nand04 port map ( Y=>nx2240, A0=>nx6510, A1=>nx6518, A2=>nx6526, 
      A3=>nx6534);
   ix6511 : aoi22 port map ( Y=>nx6510, A0=>
      mem_Mem_block_modgen_ram_ix60_a_25_dup_555, A1=>nx8040, B0=>
      mem_Mem_block_modgen_ram_ix60_a_62_dup_518, B1=>nx8036);
   mem_Mem_block_modgen_ram_ix60_ix1562 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_25_dup_555, QB=>OPEN, D=>nx1757, CLK=>
      clk);
   ix1758 : mux21_ni port map ( Y=>nx1757, A0=>
      mem_Mem_block_modgen_ram_ix60_a_25_dup_555, A1=>bs_data_in(2), S0=>
      nx8038);
   mem_Mem_block_modgen_ram_ix60_ix1414 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_62_dup_518, QB=>OPEN, D=>nx1747, CLK=>
      clk);
   ix1748 : mux21_ni port map ( Y=>nx1747, A0=>
      mem_Mem_block_modgen_ram_ix60_a_62_dup_518, A1=>bs_data_in(2), S0=>
      nx8034);
   ix6519 : aoi22 port map ( Y=>nx6518, A0=>
      mem_Mem_block_modgen_ram_ix60_a_33_dup_547, A1=>nx8028, B0=>
      mem_Mem_block_modgen_ram_ix60_a_63_dup_517, B1=>nx8032);
   mem_Mem_block_modgen_ram_ix60_ix1530 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_33_dup_547, QB=>OPEN, D=>nx1727, CLK=>
      clk);
   ix1728 : mux21_ni port map ( Y=>nx1727, A0=>bs_data_in(2), A1=>
      mem_Mem_block_modgen_ram_ix60_a_33_dup_547, S0=>nx8306);
   mem_Mem_block_modgen_ram_ix60_ix1410 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_63_dup_517, QB=>OPEN, D=>nx1737, CLK=>
      clk);
   ix1738 : mux21_ni port map ( Y=>nx1737, A0=>
      mem_Mem_block_modgen_ram_ix60_a_63_dup_517, A1=>bs_data_in(2), S0=>
      nx8030);
   ix6527 : aoi22 port map ( Y=>nx6526, A0=>
      mem_Mem_block_modgen_ram_ix60_a_41_dup_539, A1=>nx8026, B0=>
      mem_Mem_block_modgen_ram_ix60_a_1_dup_579, B1=>nx8022);
   mem_Mem_block_modgen_ram_ix60_ix1498 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_41_dup_539, QB=>OPEN, D=>nx1717, CLK=>
      clk);
   ix1718 : mux21_ni port map ( Y=>nx1717, A0=>
      mem_Mem_block_modgen_ram_ix60_a_41_dup_539, A1=>bs_data_in(2), S0=>
      nx8024);
   mem_Mem_block_modgen_ram_ix60_ix1658 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_1_dup_579, QB=>OPEN, D=>nx1707, CLK=>
      clk);
   ix1708 : mux21_ni port map ( Y=>nx1707, A0=>bs_data_in(2), A1=>
      mem_Mem_block_modgen_ram_ix60_a_1_dup_579, S0=>nx8308);
   ix6535 : aoi22 port map ( Y=>nx6534, A0=>
      mem_Mem_block_modgen_ram_ix60_a_43_dup_537, A1=>nx8018, B0=>
      mem_Mem_block_modgen_ram_ix60_a_0_dup_580, B1=>nx8020);
   mem_Mem_block_modgen_ram_ix60_ix1490 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_43_dup_537, QB=>OPEN, D=>nx1687, CLK=>
      clk);
   ix1688 : mux21_ni port map ( Y=>nx1687, A0=>
      mem_Mem_block_modgen_ram_ix60_a_43_dup_537, A1=>bs_data_in(2), S0=>
      nx8016);
   mem_Mem_block_modgen_ram_ix60_ix1662 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_0_dup_580, QB=>OPEN, D=>nx1697, CLK=>
      clk);
   ix1698 : mux21_ni port map ( Y=>nx1697, A0=>bs_data_in(2), A1=>
      mem_Mem_block_modgen_ram_ix60_a_0_dup_580, S0=>nx8310);
   ix2161 : nand04 port map ( Y=>nx2160, A0=>nx6543, A1=>nx6551, A2=>nx6559, 
      A3=>nx6567);
   ix6544 : aoi22 port map ( Y=>nx6543, A0=>
      mem_Mem_block_modgen_ram_ix60_a_34_dup_546, A1=>nx8014, B0=>
      mem_Mem_block_modgen_ram_ix60_a_47_dup_533, B1=>nx8012);
   mem_Mem_block_modgen_ram_ix60_ix1526 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_34_dup_546, QB=>OPEN, D=>nx1677, CLK=>
      clk);
   ix1678 : mux21_ni port map ( Y=>nx1677, A0=>bs_data_in(2), A1=>
      mem_Mem_block_modgen_ram_ix60_a_34_dup_546, S0=>nx8312);
   mem_Mem_block_modgen_ram_ix60_ix1474 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_47_dup_533, QB=>OPEN, D=>nx1667, CLK=>
      clk);
   ix1668 : mux21_ni port map ( Y=>nx1667, A0=>
      mem_Mem_block_modgen_ram_ix60_a_47_dup_533, A1=>bs_data_in(2), S0=>
      nx8010);
   ix6552 : aoi22 port map ( Y=>nx6551, A0=>
      mem_Mem_block_modgen_ram_ix60_a_59_dup_521, A1=>nx8004, B0=>
      mem_Mem_block_modgen_ram_ix60_a_24_dup_556, B1=>nx8008);
   mem_Mem_block_modgen_ram_ix60_ix1426 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_59_dup_521, QB=>OPEN, D=>nx1647, CLK=>
      clk);
   ix1648 : mux21_ni port map ( Y=>nx1647, A0=>
      mem_Mem_block_modgen_ram_ix60_a_59_dup_521, A1=>bs_data_in(2), S0=>
      nx8002);
   mem_Mem_block_modgen_ram_ix60_ix1566 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_24_dup_556, QB=>OPEN, D=>nx1657, CLK=>
      clk);
   ix1658 : mux21_ni port map ( Y=>nx1657, A0=>
      mem_Mem_block_modgen_ram_ix60_a_24_dup_556, A1=>bs_data_in(2), S0=>
      nx8006);
   ix6560 : aoi22 port map ( Y=>nx6559, A0=>
      mem_Mem_block_modgen_ram_ix60_a_57_dup_523, A1=>nx7998, B0=>
      mem_Mem_block_modgen_ram_ix60_a_17_dup_563, B1=>nx8000);
   mem_Mem_block_modgen_ram_ix60_ix1434 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_57_dup_523, QB=>OPEN, D=>nx1627, CLK=>
      clk);
   ix1628 : mux21_ni port map ( Y=>nx1627, A0=>
      mem_Mem_block_modgen_ram_ix60_a_57_dup_523, A1=>bs_data_in(2), S0=>
      nx7996);
   mem_Mem_block_modgen_ram_ix60_ix1594 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_17_dup_563, QB=>OPEN, D=>nx1637, CLK=>
      clk);
   ix1638 : mux21_ni port map ( Y=>nx1637, A0=>bs_data_in(2), A1=>
      mem_Mem_block_modgen_ram_ix60_a_17_dup_563, S0=>nx8314);
   ix6568 : aoi22 port map ( Y=>nx6567, A0=>
      mem_Mem_block_modgen_ram_ix60_a_35_dup_545, A1=>nx7994, B0=>
      mem_Mem_block_modgen_ram_ix60_a_28_dup_552, B1=>nx7992);
   mem_Mem_block_modgen_ram_ix60_ix1522 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_35_dup_545, QB=>OPEN, D=>nx1617, CLK=>
      clk);
   ix1618 : mux21_ni port map ( Y=>nx1617, A0=>bs_data_in(2), A1=>
      mem_Mem_block_modgen_ram_ix60_a_35_dup_545, S0=>nx8316);
   mem_Mem_block_modgen_ram_ix60_ix1550 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_28_dup_552, QB=>OPEN, D=>nx1607, CLK=>
      clk);
   ix1608 : mux21_ni port map ( Y=>nx1607, A0=>
      mem_Mem_block_modgen_ram_ix60_a_28_dup_552, A1=>bs_data_in(2), S0=>
      nx7990);
   ix2083 : nand04 port map ( Y=>nx2082, A0=>nx6576, A1=>nx6584, A2=>nx6592, 
      A3=>nx6600);
   ix6577 : aoi22 port map ( Y=>nx6576, A0=>
      mem_Mem_block_modgen_ram_ix60_a_51_dup_529, A1=>nx7988, B0=>
      mem_Mem_block_modgen_ram_ix60_a_27_dup_553, B1=>nx7982);
   mem_Mem_block_modgen_ram_ix60_ix1458 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_51_dup_529, QB=>OPEN, D=>nx1597, CLK=>
      clk);
   ix1598 : mux21_ni port map ( Y=>nx1597, A0=>bs_data_in(2), A1=>
      mem_Mem_block_modgen_ram_ix60_a_51_dup_529, S0=>nx8318);
   mem_Mem_block_modgen_ram_ix60_ix1554 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_27_dup_553, QB=>OPEN, D=>nx1587, CLK=>
      clk);
   ix1588 : mux21_ni port map ( Y=>nx1587, A0=>
      mem_Mem_block_modgen_ram_ix60_a_27_dup_553, A1=>bs_data_in(2), S0=>
      nx7980);
   ix6585 : aoi22 port map ( Y=>nx6584, A0=>
      mem_Mem_block_modgen_ram_ix60_a_30_dup_550, A1=>nx7976, B0=>
      mem_Mem_block_modgen_ram_ix60_a_16_dup_564, B1=>nx7978);
   mem_Mem_block_modgen_ram_ix60_ix1542 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_30_dup_550, QB=>OPEN, D=>nx1567, CLK=>
      clk);
   ix1568 : mux21_ni port map ( Y=>nx1567, A0=>
      mem_Mem_block_modgen_ram_ix60_a_30_dup_550, A1=>bs_data_in(2), S0=>
      nx7974);
   mem_Mem_block_modgen_ram_ix60_ix1598 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_16_dup_564, QB=>OPEN, D=>nx1577, CLK=>
      clk);
   ix1578 : mux21_ni port map ( Y=>nx1577, A0=>bs_data_in(2), A1=>
      mem_Mem_block_modgen_ram_ix60_a_16_dup_564, S0=>nx8320);
   ix6593 : aoi22 port map ( Y=>nx6592, A0=>
      mem_Mem_block_modgen_ram_ix60_a_42_dup_538, A1=>nx7972, B0=>
      mem_Mem_block_modgen_ram_ix60_a_36_dup_544, B1=>nx7968);
   mem_Mem_block_modgen_ram_ix60_ix1494 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_42_dup_538, QB=>OPEN, D=>nx1557, CLK=>
      clk);
   ix1558 : mux21_ni port map ( Y=>nx1557, A0=>
      mem_Mem_block_modgen_ram_ix60_a_42_dup_538, A1=>bs_data_in(2), S0=>
      nx7970);
   mem_Mem_block_modgen_ram_ix60_ix1518 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_36_dup_544, QB=>OPEN, D=>nx1547, CLK=>
      clk);
   ix1548 : mux21_ni port map ( Y=>nx1547, A0=>bs_data_in(2), A1=>
      mem_Mem_block_modgen_ram_ix60_a_36_dup_544, S0=>nx8322);
   ix6601 : aoi22 port map ( Y=>nx6600, A0=>
      mem_Mem_block_modgen_ram_ix60_a_4_dup_576, A1=>nx7960, B0=>
      mem_Mem_block_modgen_ram_ix60_a_19_dup_561, B1=>nx7964);
   mem_Mem_block_modgen_ram_ix60_ix1646 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_4_dup_576, QB=>OPEN, D=>nx1527, CLK=>
      clk);
   ix1528 : mux21_ni port map ( Y=>nx1527, A0=>bs_data_in(2), A1=>
      mem_Mem_block_modgen_ram_ix60_a_4_dup_576, S0=>nx8324);
   mem_Mem_block_modgen_ram_ix60_ix1586 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_19_dup_561, QB=>OPEN, D=>nx1537, CLK=>
      clk);
   ix1538 : mux21_ni port map ( Y=>nx1537, A0=>bs_data_in(2), A1=>
      mem_Mem_block_modgen_ram_ix60_a_19_dup_561, S0=>nx8326);
   ix3281 : nand02 port map ( Y=>ds_data_out(3), A0=>nx6609, A1=>nx6743);
   ix6610 : nor04 port map ( Y=>nx6609, A0=>nx3274, A1=>nx3196, A2=>nx3116, 
      A3=>nx3038);
   ix3275 : nand04 port map ( Y=>nx3274, A0=>nx6612, A1=>nx6620, A2=>nx6628, 
      A3=>nx6636);
   ix6613 : aoi22 port map ( Y=>nx6612, A0=>
      mem_Mem_block_modgen_ram_ix60_a_14_dup_496, A1=>nx8158, B0=>
      mem_Mem_block_modgen_ram_ix60_a_23_dup_487, B1=>nx8154);
   mem_Mem_block_modgen_ram_ix60_ix1348 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_14_dup_496, QB=>OPEN, D=>nx2797, CLK=>
      clk);
   ix2798 : mux21_ni port map ( Y=>nx2797, A0=>
      mem_Mem_block_modgen_ram_ix60_a_14_dup_496, A1=>bs_data_in(3), S0=>
      nx8156);
   mem_Mem_block_modgen_ram_ix60_ix1312 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_23_dup_487, QB=>OPEN, D=>nx2787, CLK=>
      clk);
   ix2788 : mux21_ni port map ( Y=>nx2787, A0=>bs_data_in(3), A1=>
      mem_Mem_block_modgen_ram_ix60_a_23_dup_487, S0=>nx8176);
   ix6621 : aoi22 port map ( Y=>nx6620, A0=>
      mem_Mem_block_modgen_ram_ix60_a_15_dup_495, A1=>nx8150, B0=>
      mem_Mem_block_modgen_ram_ix60_a_7_dup_503, B1=>nx8152);
   mem_Mem_block_modgen_ram_ix60_ix1344 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_15_dup_495, QB=>OPEN, D=>nx2767, CLK=>
      clk);
   ix2768 : mux21_ni port map ( Y=>nx2767, A0=>
      mem_Mem_block_modgen_ram_ix60_a_15_dup_495, A1=>bs_data_in(3), S0=>
      nx8148);
   mem_Mem_block_modgen_ram_ix60_ix1376 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_7_dup_503, QB=>OPEN, D=>nx2777, CLK=>
      clk);
   ix2778 : mux21_ni port map ( Y=>nx2777, A0=>bs_data_in(3), A1=>
      mem_Mem_block_modgen_ram_ix60_a_7_dup_503, S0=>nx8188);
   ix6629 : aoi22 port map ( Y=>nx6628, A0=>
      mem_Mem_block_modgen_ram_ix60_a_10_dup_500, A1=>nx8146, B0=>
      mem_Mem_block_modgen_ram_ix60_a_9_dup_501, B1=>nx8142);
   mem_Mem_block_modgen_ram_ix60_ix1364 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_10_dup_500, QB=>OPEN, D=>nx2757, CLK=>
      clk);
   ix2758 : mux21_ni port map ( Y=>nx2757, A0=>
      mem_Mem_block_modgen_ram_ix60_a_10_dup_500, A1=>bs_data_in(3), S0=>
      nx8144);
   mem_Mem_block_modgen_ram_ix60_ix1368 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_9_dup_501, QB=>OPEN, D=>nx2747, CLK=>
      clk);
   ix2748 : mux21_ni port map ( Y=>nx2747, A0=>
      mem_Mem_block_modgen_ram_ix60_a_9_dup_501, A1=>bs_data_in(3), S0=>
      nx8140);
   ix6637 : aoi22 port map ( Y=>nx6636, A0=>
      mem_Mem_block_modgen_ram_ix60_a_54_dup_456, A1=>nx8134, B0=>
      mem_Mem_block_modgen_ram_ix60_a_13_dup_497, B1=>nx8138);
   mem_Mem_block_modgen_ram_ix60_ix1188 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_54_dup_456, QB=>OPEN, D=>nx2727, CLK=>
      clk);
   ix2728 : mux21_ni port map ( Y=>nx2727, A0=>bs_data_in(3), A1=>
      mem_Mem_block_modgen_ram_ix60_a_54_dup_456, S0=>nx8204);
   mem_Mem_block_modgen_ram_ix60_ix1352 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_13_dup_497, QB=>OPEN, D=>nx2737, CLK=>
      clk);
   ix2738 : mux21_ni port map ( Y=>nx2737, A0=>
      mem_Mem_block_modgen_ram_ix60_a_13_dup_497, A1=>bs_data_in(3), S0=>
      nx8136);
   ix3197 : nand04 port map ( Y=>nx3196, A0=>nx6645, A1=>nx6653, A2=>nx6661, 
      A3=>nx6669);
   ix6646 : aoi22 port map ( Y=>nx6645, A0=>
      mem_Mem_block_modgen_ram_ix60_a_18_dup_492, A1=>nx8132, B0=>
      mem_Mem_block_modgen_ram_ix60_a_11_dup_499, B1=>nx8130);
   mem_Mem_block_modgen_ram_ix60_ix1332 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_18_dup_492, QB=>OPEN, D=>nx2717, CLK=>
      clk);
   ix2718 : mux21_ni port map ( Y=>nx2717, A0=>bs_data_in(3), A1=>
      mem_Mem_block_modgen_ram_ix60_a_18_dup_492, S0=>nx8212);
   mem_Mem_block_modgen_ram_ix60_ix1360 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_11_dup_499, QB=>OPEN, D=>nx2707, CLK=>
      clk);
   ix2708 : mux21_ni port map ( Y=>nx2707, A0=>
      mem_Mem_block_modgen_ram_ix60_a_11_dup_499, A1=>bs_data_in(3), S0=>
      nx8128);
   ix6654 : aoi22 port map ( Y=>nx6653, A0=>
      mem_Mem_block_modgen_ram_ix60_a_56_dup_454, A1=>nx8126, B0=>
      mem_Mem_block_modgen_ram_ix60_a_26_dup_484, B1=>nx8122);
   mem_Mem_block_modgen_ram_ix60_ix1180 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_56_dup_454, QB=>OPEN, D=>nx2697, CLK=>
      clk);
   ix2698 : mux21_ni port map ( Y=>nx2697, A0=>
      mem_Mem_block_modgen_ram_ix60_a_56_dup_454, A1=>bs_data_in(3), S0=>
      nx8124);
   mem_Mem_block_modgen_ram_ix60_ix1300 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_26_dup_484, QB=>OPEN, D=>nx2687, CLK=>
      clk);
   ix2688 : mux21_ni port map ( Y=>nx2687, A0=>
      mem_Mem_block_modgen_ram_ix60_a_26_dup_484, A1=>bs_data_in(3), S0=>
      nx8120);
   ix6662 : aoi22 port map ( Y=>nx6661, A0=>
      mem_Mem_block_modgen_ram_ix60_a_20_dup_490, A1=>nx8114, B0=>
      mem_Mem_block_modgen_ram_ix60_a_46_dup_464, B1=>nx8118);
   mem_Mem_block_modgen_ram_ix60_ix1324 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_20_dup_490, QB=>OPEN, D=>nx2667, CLK=>
      clk);
   ix2668 : mux21_ni port map ( Y=>nx2667, A0=>bs_data_in(3), A1=>
      mem_Mem_block_modgen_ram_ix60_a_20_dup_490, S0=>nx8242);
   mem_Mem_block_modgen_ram_ix60_ix1220 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_46_dup_464, QB=>OPEN, D=>nx2677, CLK=>
      clk);
   ix2678 : mux21_ni port map ( Y=>nx2677, A0=>
      mem_Mem_block_modgen_ram_ix60_a_46_dup_464, A1=>bs_data_in(3), S0=>
      nx8116);
   ix6670 : aoi22 port map ( Y=>nx6669, A0=>
      mem_Mem_block_modgen_ram_ix60_a_52_dup_458, A1=>nx8112, B0=>
      mem_Mem_block_modgen_ram_ix60_a_5_dup_505, B1=>nx8110);
   mem_Mem_block_modgen_ram_ix60_ix1196 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_52_dup_458, QB=>OPEN, D=>nx2657, CLK=>
      clk);
   ix2658 : mux21_ni port map ( Y=>nx2657, A0=>bs_data_in(3), A1=>
      mem_Mem_block_modgen_ram_ix60_a_52_dup_458, S0=>nx8254);
   mem_Mem_block_modgen_ram_ix60_ix1384 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_5_dup_505, QB=>OPEN, D=>nx2647, CLK=>
      clk);
   ix2648 : mux21_ni port map ( Y=>nx2647, A0=>bs_data_in(3), A1=>
      mem_Mem_block_modgen_ram_ix60_a_5_dup_505, S0=>nx8256);
   ix3117 : nand04 port map ( Y=>nx3116, A0=>nx6678, A1=>nx6686, A2=>nx6694, 
      A3=>nx6702);
   ix6679 : aoi22 port map ( Y=>nx6678, A0=>
      mem_Mem_block_modgen_ram_ix60_a_37_dup_473, A1=>nx8108, B0=>
      mem_Mem_block_modgen_ram_ix60_a_21_dup_489, B1=>nx8106);
   mem_Mem_block_modgen_ram_ix60_ix1256 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_37_dup_473, QB=>OPEN, D=>nx2637, CLK=>
      clk);
   ix2638 : mux21_ni port map ( Y=>nx2637, A0=>bs_data_in(3), A1=>
      mem_Mem_block_modgen_ram_ix60_a_37_dup_473, S0=>nx8260);
   mem_Mem_block_modgen_ram_ix60_ix1320 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_21_dup_489, QB=>OPEN, D=>nx2627, CLK=>
      clk);
   ix2628 : mux21_ni port map ( Y=>nx2627, A0=>bs_data_in(3), A1=>
      mem_Mem_block_modgen_ram_ix60_a_21_dup_489, S0=>nx8266);
   ix6687 : aoi22 port map ( Y=>nx6686, A0=>
      mem_Mem_block_modgen_ram_ix60_a_53_dup_457, A1=>nx8104, B0=>
      mem_Mem_block_modgen_ram_ix60_a_61_dup_449, B1=>nx8102);
   mem_Mem_block_modgen_ram_ix60_ix1192 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_53_dup_457, QB=>OPEN, D=>nx2617, CLK=>
      clk);
   ix2618 : mux21_ni port map ( Y=>nx2617, A0=>bs_data_in(3), A1=>
      mem_Mem_block_modgen_ram_ix60_a_53_dup_457, S0=>nx8268);
   mem_Mem_block_modgen_ram_ix60_ix1160 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_61_dup_449, QB=>OPEN, D=>nx2607, CLK=>
      clk);
   ix2608 : mux21_ni port map ( Y=>nx2607, A0=>
      mem_Mem_block_modgen_ram_ix60_a_61_dup_449, A1=>bs_data_in(3), S0=>
      nx8100);
   ix6695 : aoi22 port map ( Y=>nx6694, A0=>
      mem_Mem_block_modgen_ram_ix60_a_50_dup_460, A1=>nx8094, B0=>
      mem_Mem_block_modgen_ram_ix60_a_60_dup_450, B1=>nx8098);
   mem_Mem_block_modgen_ram_ix60_ix1204 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_50_dup_460, QB=>OPEN, D=>nx2587, CLK=>
      clk);
   ix2588 : mux21_ni port map ( Y=>nx2587, A0=>bs_data_in(3), A1=>
      mem_Mem_block_modgen_ram_ix60_a_50_dup_460, S0=>nx8272);
   mem_Mem_block_modgen_ram_ix60_ix1164 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_60_dup_450, QB=>OPEN, D=>nx2597, CLK=>
      clk);
   ix2598 : mux21_ni port map ( Y=>nx2597, A0=>
      mem_Mem_block_modgen_ram_ix60_a_60_dup_450, A1=>bs_data_in(3), S0=>
      nx8096);
   ix6703 : aoi22 port map ( Y=>nx6702, A0=>
      mem_Mem_block_modgen_ram_ix60_a_49_dup_461, A1=>nx8092, B0=>
      mem_Mem_block_modgen_ram_ix60_a_38_dup_472, B1=>nx8090);
   mem_Mem_block_modgen_ram_ix60_ix1208 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_49_dup_461, QB=>OPEN, D=>nx2577, CLK=>
      clk);
   ix2578 : mux21_ni port map ( Y=>nx2577, A0=>bs_data_in(3), A1=>
      mem_Mem_block_modgen_ram_ix60_a_49_dup_461, S0=>nx8276);
   mem_Mem_block_modgen_ram_ix60_ix1252 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_38_dup_472, QB=>OPEN, D=>nx2567, CLK=>
      clk);
   ix2568 : mux21_ni port map ( Y=>nx2567, A0=>bs_data_in(3), A1=>
      mem_Mem_block_modgen_ram_ix60_a_38_dup_472, S0=>nx8278);
   ix3039 : nand04 port map ( Y=>nx3038, A0=>nx6711, A1=>nx6719, A2=>nx6727, 
      A3=>nx6735);
   ix6712 : aoi22 port map ( Y=>nx6711, A0=>
      mem_Mem_block_modgen_ram_ix60_a_2_dup_508, A1=>nx8088, B0=>
      mem_Mem_block_modgen_ram_ix60_a_3_dup_507, B1=>nx8086);
   mem_Mem_block_modgen_ram_ix60_ix1396 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_2_dup_508, QB=>OPEN, D=>nx2557, CLK=>
      clk);
   ix2558 : mux21_ni port map ( Y=>nx2557, A0=>bs_data_in(3), A1=>
      mem_Mem_block_modgen_ram_ix60_a_2_dup_508, S0=>nx8280);
   mem_Mem_block_modgen_ram_ix60_ix1392 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_3_dup_507, QB=>OPEN, D=>nx2547, CLK=>
      clk);
   ix2548 : mux21_ni port map ( Y=>nx2547, A0=>bs_data_in(3), A1=>
      mem_Mem_block_modgen_ram_ix60_a_3_dup_507, S0=>nx8286);
   ix6720 : aoi22 port map ( Y=>nx6719, A0=>
      mem_Mem_block_modgen_ram_ix60_a_31_dup_479, A1=>nx8084, B0=>
      mem_Mem_block_modgen_ram_ix60_a_29_dup_481, B1=>nx8080);
   mem_Mem_block_modgen_ram_ix60_ix1280 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_31_dup_479, QB=>OPEN, D=>nx2537, CLK=>
      clk);
   ix2538 : mux21_ni port map ( Y=>nx2537, A0=>
      mem_Mem_block_modgen_ram_ix60_a_31_dup_479, A1=>bs_data_in(3), S0=>
      nx8082);
   mem_Mem_block_modgen_ram_ix60_ix1288 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_29_dup_481, QB=>OPEN, D=>nx2527, CLK=>
      clk);
   ix2528 : mux21_ni port map ( Y=>nx2527, A0=>
      mem_Mem_block_modgen_ram_ix60_a_29_dup_481, A1=>bs_data_in(3), S0=>
      nx8078);
   ix6728 : aoi22 port map ( Y=>nx6727, A0=>
      mem_Mem_block_modgen_ram_ix60_a_40_dup_470, A1=>nx8076, B0=>
      mem_Mem_block_modgen_ram_ix60_a_48_dup_462, B1=>nx8072);
   mem_Mem_block_modgen_ram_ix60_ix1244 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_40_dup_470, QB=>OPEN, D=>nx2517, CLK=>
      clk);
   ix2518 : mux21_ni port map ( Y=>nx2517, A0=>
      mem_Mem_block_modgen_ram_ix60_a_40_dup_470, A1=>bs_data_in(3), S0=>
      nx8074);
   mem_Mem_block_modgen_ram_ix60_ix1212 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_48_dup_462, QB=>OPEN, D=>nx2507, CLK=>
      clk);
   ix2508 : mux21_ni port map ( Y=>nx2507, A0=>bs_data_in(3), A1=>
      mem_Mem_block_modgen_ram_ix60_a_48_dup_462, S0=>nx8292);
   ix6736 : aoi22 port map ( Y=>nx6735, A0=>
      mem_Mem_block_modgen_ram_ix60_a_32_dup_478, A1=>nx8070, B0=>
      mem_Mem_block_modgen_ram_ix60_a_44_dup_466, B1=>nx8068);
   mem_Mem_block_modgen_ram_ix60_ix1276 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_32_dup_478, QB=>OPEN, D=>nx2497, CLK=>
      clk);
   ix2498 : mux21_ni port map ( Y=>nx2497, A0=>bs_data_in(3), A1=>
      mem_Mem_block_modgen_ram_ix60_a_32_dup_478, S0=>nx8294);
   mem_Mem_block_modgen_ram_ix60_ix1228 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_44_dup_466, QB=>OPEN, D=>nx2487, CLK=>
      clk);
   ix2488 : mux21_ni port map ( Y=>nx2487, A0=>
      mem_Mem_block_modgen_ram_ix60_a_44_dup_466, A1=>bs_data_in(3), S0=>
      nx8066);
   ix6744 : nor04 port map ( Y=>nx6743, A0=>nx2956, A1=>nx2878, A2=>nx2798, 
      A3=>nx2720);
   ix2957 : nand04 port map ( Y=>nx2956, A0=>nx6746, A1=>nx6754, A2=>nx6762, 
      A3=>nx6770);
   ix6747 : aoi22 port map ( Y=>nx6746, A0=>
      mem_Mem_block_modgen_ram_ix60_a_55_dup_455, A1=>nx8060, B0=>
      mem_Mem_block_modgen_ram_ix60_a_45_dup_465, B1=>nx8064);
   mem_Mem_block_modgen_ram_ix60_ix1184 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_55_dup_455, QB=>OPEN, D=>nx2467, CLK=>
      clk);
   ix2468 : mux21_ni port map ( Y=>nx2467, A0=>bs_data_in(3), A1=>
      mem_Mem_block_modgen_ram_ix60_a_55_dup_455, S0=>nx8298);
   mem_Mem_block_modgen_ram_ix60_ix1224 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_45_dup_465, QB=>OPEN, D=>nx2477, CLK=>
      clk);
   ix2478 : mux21_ni port map ( Y=>nx2477, A0=>
      mem_Mem_block_modgen_ram_ix60_a_45_dup_465, A1=>bs_data_in(3), S0=>
      nx8062);
   ix6755 : aoi22 port map ( Y=>nx6754, A0=>
      mem_Mem_block_modgen_ram_ix60_a_39_dup_471, A1=>nx8058, B0=>
      mem_Mem_block_modgen_ram_ix60_a_8_dup_502, B1=>nx8056);
   mem_Mem_block_modgen_ram_ix60_ix1248 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_39_dup_471, QB=>OPEN, D=>nx2457, CLK=>
      clk);
   ix2458 : mux21_ni port map ( Y=>nx2457, A0=>bs_data_in(3), A1=>
      mem_Mem_block_modgen_ram_ix60_a_39_dup_471, S0=>nx8300);
   mem_Mem_block_modgen_ram_ix60_ix1372 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_8_dup_502, QB=>OPEN, D=>nx2447, CLK=>
      clk);
   ix2448 : mux21_ni port map ( Y=>nx2447, A0=>
      mem_Mem_block_modgen_ram_ix60_a_8_dup_502, A1=>bs_data_in(3), S0=>
      nx8054);
   ix6763 : aoi22 port map ( Y=>nx6762, A0=>
      mem_Mem_block_modgen_ram_ix60_a_12_dup_498, A1=>nx8052, B0=>
      mem_Mem_block_modgen_ram_ix60_a_22_dup_488, B1=>nx8048);
   mem_Mem_block_modgen_ram_ix60_ix1356 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_12_dup_498, QB=>OPEN, D=>nx2437, CLK=>
      clk);
   ix2438 : mux21_ni port map ( Y=>nx2437, A0=>
      mem_Mem_block_modgen_ram_ix60_a_12_dup_498, A1=>bs_data_in(3), S0=>
      nx8050);
   mem_Mem_block_modgen_ram_ix60_ix1316 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_22_dup_488, QB=>OPEN, D=>nx2427, CLK=>
      clk);
   ix2428 : mux21_ni port map ( Y=>nx2427, A0=>bs_data_in(3), A1=>
      mem_Mem_block_modgen_ram_ix60_a_22_dup_488, S0=>nx8302);
   ix6771 : aoi22 port map ( Y=>nx6770, A0=>
      mem_Mem_block_modgen_ram_ix60_a_58_dup_452, A1=>nx8044, B0=>
      mem_Mem_block_modgen_ram_ix60_a_6_dup_504, B1=>nx8046);
   mem_Mem_block_modgen_ram_ix60_ix1172 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_58_dup_452, QB=>OPEN, D=>nx2407, CLK=>
      clk);
   ix2408 : mux21_ni port map ( Y=>nx2407, A0=>
      mem_Mem_block_modgen_ram_ix60_a_58_dup_452, A1=>bs_data_in(3), S0=>
      nx8042);
   mem_Mem_block_modgen_ram_ix60_ix1380 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_6_dup_504, QB=>OPEN, D=>nx2417, CLK=>
      clk);
   ix2418 : mux21_ni port map ( Y=>nx2417, A0=>bs_data_in(3), A1=>
      mem_Mem_block_modgen_ram_ix60_a_6_dup_504, S0=>nx8304);
   ix2879 : nand04 port map ( Y=>nx2878, A0=>nx6779, A1=>nx6787, A2=>nx6795, 
      A3=>nx6803);
   ix6780 : aoi22 port map ( Y=>nx6779, A0=>
      mem_Mem_block_modgen_ram_ix60_a_25_dup_485, A1=>nx8040, B0=>
      mem_Mem_block_modgen_ram_ix60_a_62_dup_448, B1=>nx8036);
   mem_Mem_block_modgen_ram_ix60_ix1304 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_25_dup_485, QB=>OPEN, D=>nx2397, CLK=>
      clk);
   ix2398 : mux21_ni port map ( Y=>nx2397, A0=>
      mem_Mem_block_modgen_ram_ix60_a_25_dup_485, A1=>bs_data_in(3), S0=>
      nx8038);
   mem_Mem_block_modgen_ram_ix60_ix1156 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_62_dup_448, QB=>OPEN, D=>nx2387, CLK=>
      clk);
   ix2388 : mux21_ni port map ( Y=>nx2387, A0=>
      mem_Mem_block_modgen_ram_ix60_a_62_dup_448, A1=>bs_data_in(3), S0=>
      nx8034);
   ix6788 : aoi22 port map ( Y=>nx6787, A0=>
      mem_Mem_block_modgen_ram_ix60_a_33_dup_477, A1=>nx8028, B0=>
      mem_Mem_block_modgen_ram_ix60_a_63_dup_447, B1=>nx8032);
   mem_Mem_block_modgen_ram_ix60_ix1272 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_33_dup_477, QB=>OPEN, D=>nx2367, CLK=>
      clk);
   ix2368 : mux21_ni port map ( Y=>nx2367, A0=>bs_data_in(3), A1=>
      mem_Mem_block_modgen_ram_ix60_a_33_dup_477, S0=>nx8306);
   mem_Mem_block_modgen_ram_ix60_ix1152 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_63_dup_447, QB=>OPEN, D=>nx2377, CLK=>
      clk);
   ix2378 : mux21_ni port map ( Y=>nx2377, A0=>
      mem_Mem_block_modgen_ram_ix60_a_63_dup_447, A1=>bs_data_in(3), S0=>
      nx8030);
   ix6796 : aoi22 port map ( Y=>nx6795, A0=>
      mem_Mem_block_modgen_ram_ix60_a_41_dup_469, A1=>nx8026, B0=>
      mem_Mem_block_modgen_ram_ix60_a_1_dup_509, B1=>nx8022);
   mem_Mem_block_modgen_ram_ix60_ix1240 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_41_dup_469, QB=>OPEN, D=>nx2357, CLK=>
      clk);
   ix2358 : mux21_ni port map ( Y=>nx2357, A0=>
      mem_Mem_block_modgen_ram_ix60_a_41_dup_469, A1=>bs_data_in(3), S0=>
      nx8024);
   mem_Mem_block_modgen_ram_ix60_ix1400 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_1_dup_509, QB=>OPEN, D=>nx2347, CLK=>
      clk);
   ix2348 : mux21_ni port map ( Y=>nx2347, A0=>bs_data_in(3), A1=>
      mem_Mem_block_modgen_ram_ix60_a_1_dup_509, S0=>nx8308);
   ix6804 : aoi22 port map ( Y=>nx6803, A0=>
      mem_Mem_block_modgen_ram_ix60_a_43_dup_467, A1=>nx8018, B0=>
      mem_Mem_block_modgen_ram_ix60_a_0_dup_510, B1=>nx8020);
   mem_Mem_block_modgen_ram_ix60_ix1232 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_43_dup_467, QB=>OPEN, D=>nx2327, CLK=>
      clk);
   ix2328 : mux21_ni port map ( Y=>nx2327, A0=>
      mem_Mem_block_modgen_ram_ix60_a_43_dup_467, A1=>bs_data_in(3), S0=>
      nx8016);
   mem_Mem_block_modgen_ram_ix60_ix1404 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_0_dup_510, QB=>OPEN, D=>nx2337, CLK=>
      clk);
   ix2338 : mux21_ni port map ( Y=>nx2337, A0=>bs_data_in(3), A1=>
      mem_Mem_block_modgen_ram_ix60_a_0_dup_510, S0=>nx8310);
   ix2799 : nand04 port map ( Y=>nx2798, A0=>nx6812, A1=>nx6820, A2=>nx6828, 
      A3=>nx6836);
   ix6813 : aoi22 port map ( Y=>nx6812, A0=>
      mem_Mem_block_modgen_ram_ix60_a_34_dup_476, A1=>nx8014, B0=>
      mem_Mem_block_modgen_ram_ix60_a_47_dup_463, B1=>nx8012);
   mem_Mem_block_modgen_ram_ix60_ix1268 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_34_dup_476, QB=>OPEN, D=>nx2317, CLK=>
      clk);
   ix2318 : mux21_ni port map ( Y=>nx2317, A0=>bs_data_in(3), A1=>
      mem_Mem_block_modgen_ram_ix60_a_34_dup_476, S0=>nx8312);
   mem_Mem_block_modgen_ram_ix60_ix1216 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_47_dup_463, QB=>OPEN, D=>nx2307, CLK=>
      clk);
   ix2308 : mux21_ni port map ( Y=>nx2307, A0=>
      mem_Mem_block_modgen_ram_ix60_a_47_dup_463, A1=>bs_data_in(3), S0=>
      nx8010);
   ix6821 : aoi22 port map ( Y=>nx6820, A0=>
      mem_Mem_block_modgen_ram_ix60_a_59_dup_451, A1=>nx8004, B0=>
      mem_Mem_block_modgen_ram_ix60_a_24_dup_486, B1=>nx8008);
   mem_Mem_block_modgen_ram_ix60_ix1168 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_59_dup_451, QB=>OPEN, D=>nx2287, CLK=>
      clk);
   ix2288 : mux21_ni port map ( Y=>nx2287, A0=>
      mem_Mem_block_modgen_ram_ix60_a_59_dup_451, A1=>bs_data_in(3), S0=>
      nx8002);
   mem_Mem_block_modgen_ram_ix60_ix1308 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_24_dup_486, QB=>OPEN, D=>nx2297, CLK=>
      clk);
   ix2298 : mux21_ni port map ( Y=>nx2297, A0=>
      mem_Mem_block_modgen_ram_ix60_a_24_dup_486, A1=>bs_data_in(3), S0=>
      nx8006);
   ix6829 : aoi22 port map ( Y=>nx6828, A0=>
      mem_Mem_block_modgen_ram_ix60_a_57_dup_453, A1=>nx7998, B0=>
      mem_Mem_block_modgen_ram_ix60_a_17_dup_493, B1=>nx8000);
   mem_Mem_block_modgen_ram_ix60_ix1176 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_57_dup_453, QB=>OPEN, D=>nx2267, CLK=>
      clk);
   ix2268 : mux21_ni port map ( Y=>nx2267, A0=>
      mem_Mem_block_modgen_ram_ix60_a_57_dup_453, A1=>bs_data_in(3), S0=>
      nx7996);
   mem_Mem_block_modgen_ram_ix60_ix1336 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_17_dup_493, QB=>OPEN, D=>nx2277, CLK=>
      clk);
   ix2278 : mux21_ni port map ( Y=>nx2277, A0=>bs_data_in(3), A1=>
      mem_Mem_block_modgen_ram_ix60_a_17_dup_493, S0=>nx8314);
   ix6837 : aoi22 port map ( Y=>nx6836, A0=>
      mem_Mem_block_modgen_ram_ix60_a_35_dup_475, A1=>nx7994, B0=>
      mem_Mem_block_modgen_ram_ix60_a_28_dup_482, B1=>nx7992);
   mem_Mem_block_modgen_ram_ix60_ix1264 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_35_dup_475, QB=>OPEN, D=>nx2257, CLK=>
      clk);
   ix2258 : mux21_ni port map ( Y=>nx2257, A0=>bs_data_in(3), A1=>
      mem_Mem_block_modgen_ram_ix60_a_35_dup_475, S0=>nx8316);
   mem_Mem_block_modgen_ram_ix60_ix1292 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_28_dup_482, QB=>OPEN, D=>nx2247, CLK=>
      clk);
   ix2248 : mux21_ni port map ( Y=>nx2247, A0=>
      mem_Mem_block_modgen_ram_ix60_a_28_dup_482, A1=>bs_data_in(3), S0=>
      nx7990);
   ix2721 : nand04 port map ( Y=>nx2720, A0=>nx6845, A1=>nx6853, A2=>nx6861, 
      A3=>nx6869);
   ix6846 : aoi22 port map ( Y=>nx6845, A0=>
      mem_Mem_block_modgen_ram_ix60_a_51_dup_459, A1=>nx7988, B0=>
      mem_Mem_block_modgen_ram_ix60_a_27_dup_483, B1=>nx7982);
   mem_Mem_block_modgen_ram_ix60_ix1200 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_51_dup_459, QB=>OPEN, D=>nx2237, CLK=>
      clk);
   ix2238 : mux21_ni port map ( Y=>nx2237, A0=>bs_data_in(3), A1=>
      mem_Mem_block_modgen_ram_ix60_a_51_dup_459, S0=>nx8318);
   mem_Mem_block_modgen_ram_ix60_ix1296 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_27_dup_483, QB=>OPEN, D=>nx2227, CLK=>
      clk);
   ix2228 : mux21_ni port map ( Y=>nx2227, A0=>
      mem_Mem_block_modgen_ram_ix60_a_27_dup_483, A1=>bs_data_in(3), S0=>
      nx7980);
   ix6854 : aoi22 port map ( Y=>nx6853, A0=>
      mem_Mem_block_modgen_ram_ix60_a_30_dup_480, A1=>nx7976, B0=>
      mem_Mem_block_modgen_ram_ix60_a_16_dup_494, B1=>nx7978);
   mem_Mem_block_modgen_ram_ix60_ix1284 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_30_dup_480, QB=>OPEN, D=>nx2207, CLK=>
      clk);
   ix2208 : mux21_ni port map ( Y=>nx2207, A0=>
      mem_Mem_block_modgen_ram_ix60_a_30_dup_480, A1=>bs_data_in(3), S0=>
      nx7974);
   mem_Mem_block_modgen_ram_ix60_ix1340 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_16_dup_494, QB=>OPEN, D=>nx2217, CLK=>
      clk);
   ix2218 : mux21_ni port map ( Y=>nx2217, A0=>bs_data_in(3), A1=>
      mem_Mem_block_modgen_ram_ix60_a_16_dup_494, S0=>nx8320);
   ix6862 : aoi22 port map ( Y=>nx6861, A0=>
      mem_Mem_block_modgen_ram_ix60_a_42_dup_468, A1=>nx7972, B0=>
      mem_Mem_block_modgen_ram_ix60_a_36_dup_474, B1=>nx7968);
   mem_Mem_block_modgen_ram_ix60_ix1236 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_42_dup_468, QB=>OPEN, D=>nx2197, CLK=>
      clk);
   ix2198 : mux21_ni port map ( Y=>nx2197, A0=>
      mem_Mem_block_modgen_ram_ix60_a_42_dup_468, A1=>bs_data_in(3), S0=>
      nx7970);
   mem_Mem_block_modgen_ram_ix60_ix1260 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_36_dup_474, QB=>OPEN, D=>nx2187, CLK=>
      clk);
   ix2188 : mux21_ni port map ( Y=>nx2187, A0=>bs_data_in(3), A1=>
      mem_Mem_block_modgen_ram_ix60_a_36_dup_474, S0=>nx8322);
   ix6870 : aoi22 port map ( Y=>nx6869, A0=>
      mem_Mem_block_modgen_ram_ix60_a_4_dup_506, A1=>nx7960, B0=>
      mem_Mem_block_modgen_ram_ix60_a_19_dup_491, B1=>nx7964);
   mem_Mem_block_modgen_ram_ix60_ix1388 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_4_dup_506, QB=>OPEN, D=>nx2167, CLK=>
      clk);
   ix2168 : mux21_ni port map ( Y=>nx2167, A0=>bs_data_in(3), A1=>
      mem_Mem_block_modgen_ram_ix60_a_4_dup_506, S0=>nx8324);
   mem_Mem_block_modgen_ram_ix60_ix1328 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_19_dup_491, QB=>OPEN, D=>nx2177, CLK=>
      clk);
   ix2178 : mux21_ni port map ( Y=>nx2177, A0=>bs_data_in(3), A1=>
      mem_Mem_block_modgen_ram_ix60_a_19_dup_491, S0=>nx8326);
   ix3919 : nand02 port map ( Y=>ds_data_out(4), A0=>nx6878, A1=>nx7012);
   ix6879 : nor04 port map ( Y=>nx6878, A0=>nx3912, A1=>nx3834, A2=>nx3754, 
      A3=>nx3676);
   ix3913 : nand04 port map ( Y=>nx3912, A0=>nx6881, A1=>nx6889, A2=>nx6897, 
      A3=>nx6905);
   ix6882 : aoi22 port map ( Y=>nx6881, A0=>
      mem_Mem_block_modgen_ram_ix60_a_14_dup_426, A1=>nx8158, B0=>
      mem_Mem_block_modgen_ram_ix60_a_23_dup_417, B1=>nx8154);
   mem_Mem_block_modgen_ram_ix60_ix1090 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_14_dup_426, QB=>OPEN, D=>nx3437, CLK=>
      clk);
   ix3438 : mux21_ni port map ( Y=>nx3437, A0=>
      mem_Mem_block_modgen_ram_ix60_a_14_dup_426, A1=>bs_data_in(4), S0=>
      nx8156);
   mem_Mem_block_modgen_ram_ix60_ix1054 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_23_dup_417, QB=>OPEN, D=>nx3427, CLK=>
      clk);
   ix3428 : mux21_ni port map ( Y=>nx3427, A0=>bs_data_in(4), A1=>
      mem_Mem_block_modgen_ram_ix60_a_23_dup_417, S0=>nx8176);
   ix6890 : aoi22 port map ( Y=>nx6889, A0=>
      mem_Mem_block_modgen_ram_ix60_a_15_dup_425, A1=>nx8150, B0=>
      mem_Mem_block_modgen_ram_ix60_a_7_dup_433, B1=>nx8152);
   mem_Mem_block_modgen_ram_ix60_ix1086 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_15_dup_425, QB=>OPEN, D=>nx3407, CLK=>
      clk);
   ix3408 : mux21_ni port map ( Y=>nx3407, A0=>
      mem_Mem_block_modgen_ram_ix60_a_15_dup_425, A1=>bs_data_in(4), S0=>
      nx8148);
   mem_Mem_block_modgen_ram_ix60_ix1118 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_7_dup_433, QB=>OPEN, D=>nx3417, CLK=>
      clk);
   ix3418 : mux21_ni port map ( Y=>nx3417, A0=>bs_data_in(4), A1=>
      mem_Mem_block_modgen_ram_ix60_a_7_dup_433, S0=>nx8188);
   ix6898 : aoi22 port map ( Y=>nx6897, A0=>
      mem_Mem_block_modgen_ram_ix60_a_10_dup_430, A1=>nx8146, B0=>
      mem_Mem_block_modgen_ram_ix60_a_9_dup_431, B1=>nx8142);
   mem_Mem_block_modgen_ram_ix60_ix1106 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_10_dup_430, QB=>OPEN, D=>nx3397, CLK=>
      clk);
   ix3398 : mux21_ni port map ( Y=>nx3397, A0=>
      mem_Mem_block_modgen_ram_ix60_a_10_dup_430, A1=>bs_data_in(4), S0=>
      nx8144);
   mem_Mem_block_modgen_ram_ix60_ix1110 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_9_dup_431, QB=>OPEN, D=>nx3387, CLK=>
      clk);
   ix3388 : mux21_ni port map ( Y=>nx3387, A0=>
      mem_Mem_block_modgen_ram_ix60_a_9_dup_431, A1=>bs_data_in(4), S0=>
      nx8140);
   ix6906 : aoi22 port map ( Y=>nx6905, A0=>
      mem_Mem_block_modgen_ram_ix60_a_54_dup_386, A1=>nx8134, B0=>
      mem_Mem_block_modgen_ram_ix60_a_13_dup_427, B1=>nx8138);
   mem_Mem_block_modgen_ram_ix60_ix930 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_54_dup_386, QB=>OPEN, D=>nx3367, CLK=>
      clk);
   ix3368 : mux21_ni port map ( Y=>nx3367, A0=>bs_data_in(4), A1=>
      mem_Mem_block_modgen_ram_ix60_a_54_dup_386, S0=>nx8204);
   mem_Mem_block_modgen_ram_ix60_ix1094 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_13_dup_427, QB=>OPEN, D=>nx3377, CLK=>
      clk);
   ix3378 : mux21_ni port map ( Y=>nx3377, A0=>
      mem_Mem_block_modgen_ram_ix60_a_13_dup_427, A1=>bs_data_in(4), S0=>
      nx8136);
   ix3835 : nand04 port map ( Y=>nx3834, A0=>nx6914, A1=>nx6922, A2=>nx6930, 
      A3=>nx6938);
   ix6915 : aoi22 port map ( Y=>nx6914, A0=>
      mem_Mem_block_modgen_ram_ix60_a_18_dup_422, A1=>nx8132, B0=>
      mem_Mem_block_modgen_ram_ix60_a_11_dup_429, B1=>nx8130);
   mem_Mem_block_modgen_ram_ix60_ix1074 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_18_dup_422, QB=>OPEN, D=>nx3357, CLK=>
      clk);
   ix3358 : mux21_ni port map ( Y=>nx3357, A0=>bs_data_in(4), A1=>
      mem_Mem_block_modgen_ram_ix60_a_18_dup_422, S0=>nx8212);
   mem_Mem_block_modgen_ram_ix60_ix1102 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_11_dup_429, QB=>OPEN, D=>nx3347, CLK=>
      clk);
   ix3348 : mux21_ni port map ( Y=>nx3347, A0=>
      mem_Mem_block_modgen_ram_ix60_a_11_dup_429, A1=>bs_data_in(4), S0=>
      nx8128);
   ix6923 : aoi22 port map ( Y=>nx6922, A0=>
      mem_Mem_block_modgen_ram_ix60_a_56_dup_384, A1=>nx8126, B0=>
      mem_Mem_block_modgen_ram_ix60_a_26_dup_414, B1=>nx8122);
   mem_Mem_block_modgen_ram_ix60_ix922 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_56_dup_384, QB=>OPEN, D=>nx3337, CLK=>
      clk);
   ix3338 : mux21_ni port map ( Y=>nx3337, A0=>
      mem_Mem_block_modgen_ram_ix60_a_56_dup_384, A1=>bs_data_in(4), S0=>
      nx8124);
   mem_Mem_block_modgen_ram_ix60_ix1042 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_26_dup_414, QB=>OPEN, D=>nx3327, CLK=>
      clk);
   ix3328 : mux21_ni port map ( Y=>nx3327, A0=>
      mem_Mem_block_modgen_ram_ix60_a_26_dup_414, A1=>bs_data_in(4), S0=>
      nx8120);
   ix6931 : aoi22 port map ( Y=>nx6930, A0=>
      mem_Mem_block_modgen_ram_ix60_a_20_dup_420, A1=>nx8114, B0=>
      mem_Mem_block_modgen_ram_ix60_a_46_dup_394, B1=>nx8118);
   mem_Mem_block_modgen_ram_ix60_ix1066 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_20_dup_420, QB=>OPEN, D=>nx3307, CLK=>
      clk);
   ix3308 : mux21_ni port map ( Y=>nx3307, A0=>bs_data_in(4), A1=>
      mem_Mem_block_modgen_ram_ix60_a_20_dup_420, S0=>nx8242);
   mem_Mem_block_modgen_ram_ix60_ix962 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_46_dup_394, QB=>OPEN, D=>nx3317, CLK=>
      clk);
   ix3318 : mux21_ni port map ( Y=>nx3317, A0=>
      mem_Mem_block_modgen_ram_ix60_a_46_dup_394, A1=>bs_data_in(4), S0=>
      nx8116);
   ix6939 : aoi22 port map ( Y=>nx6938, A0=>
      mem_Mem_block_modgen_ram_ix60_a_52_dup_388, A1=>nx8112, B0=>
      mem_Mem_block_modgen_ram_ix60_a_5_dup_435, B1=>nx8110);
   mem_Mem_block_modgen_ram_ix60_ix938 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_52_dup_388, QB=>OPEN, D=>nx3297, CLK=>
      clk);
   ix3298 : mux21_ni port map ( Y=>nx3297, A0=>bs_data_in(4), A1=>
      mem_Mem_block_modgen_ram_ix60_a_52_dup_388, S0=>nx8254);
   mem_Mem_block_modgen_ram_ix60_ix1126 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_5_dup_435, QB=>OPEN, D=>nx3287, CLK=>
      clk);
   ix3288 : mux21_ni port map ( Y=>nx3287, A0=>bs_data_in(4), A1=>
      mem_Mem_block_modgen_ram_ix60_a_5_dup_435, S0=>nx8256);
   ix3755 : nand04 port map ( Y=>nx3754, A0=>nx6947, A1=>nx6955, A2=>nx6963, 
      A3=>nx6971);
   ix6948 : aoi22 port map ( Y=>nx6947, A0=>
      mem_Mem_block_modgen_ram_ix60_a_37_dup_403, A1=>nx8108, B0=>
      mem_Mem_block_modgen_ram_ix60_a_21_dup_419, B1=>nx8106);
   mem_Mem_block_modgen_ram_ix60_ix998 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_37_dup_403, QB=>OPEN, D=>nx3277, CLK=>
      clk);
   ix3278 : mux21_ni port map ( Y=>nx3277, A0=>bs_data_in(4), A1=>
      mem_Mem_block_modgen_ram_ix60_a_37_dup_403, S0=>nx8260);
   mem_Mem_block_modgen_ram_ix60_ix1062 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_21_dup_419, QB=>OPEN, D=>nx3267, CLK=>
      clk);
   ix3268 : mux21_ni port map ( Y=>nx3267, A0=>bs_data_in(4), A1=>
      mem_Mem_block_modgen_ram_ix60_a_21_dup_419, S0=>nx8266);
   ix6956 : aoi22 port map ( Y=>nx6955, A0=>
      mem_Mem_block_modgen_ram_ix60_a_53_dup_387, A1=>nx8104, B0=>
      mem_Mem_block_modgen_ram_ix60_a_61_dup_379, B1=>nx8102);
   mem_Mem_block_modgen_ram_ix60_ix934 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_53_dup_387, QB=>OPEN, D=>nx3257, CLK=>
      clk);
   ix3258 : mux21_ni port map ( Y=>nx3257, A0=>bs_data_in(4), A1=>
      mem_Mem_block_modgen_ram_ix60_a_53_dup_387, S0=>nx8268);
   mem_Mem_block_modgen_ram_ix60_ix902 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_61_dup_379, QB=>OPEN, D=>nx3247, CLK=>
      clk);
   ix3248 : mux21_ni port map ( Y=>nx3247, A0=>
      mem_Mem_block_modgen_ram_ix60_a_61_dup_379, A1=>bs_data_in(4), S0=>
      nx8100);
   ix6964 : aoi22 port map ( Y=>nx6963, A0=>
      mem_Mem_block_modgen_ram_ix60_a_50_dup_390, A1=>nx8094, B0=>
      mem_Mem_block_modgen_ram_ix60_a_60_dup_380, B1=>nx8098);
   mem_Mem_block_modgen_ram_ix60_ix946 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_50_dup_390, QB=>OPEN, D=>nx3227, CLK=>
      clk);
   ix3228 : mux21_ni port map ( Y=>nx3227, A0=>bs_data_in(4), A1=>
      mem_Mem_block_modgen_ram_ix60_a_50_dup_390, S0=>nx8272);
   mem_Mem_block_modgen_ram_ix60_ix906 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_60_dup_380, QB=>OPEN, D=>nx3237, CLK=>
      clk);
   ix3238 : mux21_ni port map ( Y=>nx3237, A0=>
      mem_Mem_block_modgen_ram_ix60_a_60_dup_380, A1=>bs_data_in(4), S0=>
      nx8096);
   ix6972 : aoi22 port map ( Y=>nx6971, A0=>
      mem_Mem_block_modgen_ram_ix60_a_49_dup_391, A1=>nx8092, B0=>
      mem_Mem_block_modgen_ram_ix60_a_38_dup_402, B1=>nx8090);
   mem_Mem_block_modgen_ram_ix60_ix950 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_49_dup_391, QB=>OPEN, D=>nx3217, CLK=>
      clk);
   ix3218 : mux21_ni port map ( Y=>nx3217, A0=>bs_data_in(4), A1=>
      mem_Mem_block_modgen_ram_ix60_a_49_dup_391, S0=>nx8276);
   mem_Mem_block_modgen_ram_ix60_ix994 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_38_dup_402, QB=>OPEN, D=>nx3207, CLK=>
      clk);
   ix3208 : mux21_ni port map ( Y=>nx3207, A0=>bs_data_in(4), A1=>
      mem_Mem_block_modgen_ram_ix60_a_38_dup_402, S0=>nx8278);
   ix3677 : nand04 port map ( Y=>nx3676, A0=>nx6980, A1=>nx6988, A2=>nx6996, 
      A3=>nx7004);
   ix6981 : aoi22 port map ( Y=>nx6980, A0=>
      mem_Mem_block_modgen_ram_ix60_a_2_dup_438, A1=>nx8088, B0=>
      mem_Mem_block_modgen_ram_ix60_a_3_dup_437, B1=>nx8086);
   mem_Mem_block_modgen_ram_ix60_ix1138 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_2_dup_438, QB=>OPEN, D=>nx3197, CLK=>
      clk);
   ix3198 : mux21_ni port map ( Y=>nx3197, A0=>bs_data_in(4), A1=>
      mem_Mem_block_modgen_ram_ix60_a_2_dup_438, S0=>nx8280);
   mem_Mem_block_modgen_ram_ix60_ix1134 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_3_dup_437, QB=>OPEN, D=>nx3187, CLK=>
      clk);
   ix3188 : mux21_ni port map ( Y=>nx3187, A0=>bs_data_in(4), A1=>
      mem_Mem_block_modgen_ram_ix60_a_3_dup_437, S0=>nx8286);
   ix6989 : aoi22 port map ( Y=>nx6988, A0=>
      mem_Mem_block_modgen_ram_ix60_a_31_dup_409, A1=>nx8084, B0=>
      mem_Mem_block_modgen_ram_ix60_a_29_dup_411, B1=>nx8080);
   mem_Mem_block_modgen_ram_ix60_ix1022 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_31_dup_409, QB=>OPEN, D=>nx3177, CLK=>
      clk);
   ix3178 : mux21_ni port map ( Y=>nx3177, A0=>
      mem_Mem_block_modgen_ram_ix60_a_31_dup_409, A1=>bs_data_in(4), S0=>
      nx8082);
   mem_Mem_block_modgen_ram_ix60_ix1030 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_29_dup_411, QB=>OPEN, D=>nx3167, CLK=>
      clk);
   ix3168 : mux21_ni port map ( Y=>nx3167, A0=>
      mem_Mem_block_modgen_ram_ix60_a_29_dup_411, A1=>bs_data_in(4), S0=>
      nx8078);
   ix6997 : aoi22 port map ( Y=>nx6996, A0=>
      mem_Mem_block_modgen_ram_ix60_a_40_dup_400, A1=>nx8076, B0=>
      mem_Mem_block_modgen_ram_ix60_a_48_dup_392, B1=>nx8072);
   mem_Mem_block_modgen_ram_ix60_ix986 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_40_dup_400, QB=>OPEN, D=>nx3157, CLK=>
      clk);
   ix3158 : mux21_ni port map ( Y=>nx3157, A0=>
      mem_Mem_block_modgen_ram_ix60_a_40_dup_400, A1=>bs_data_in(4), S0=>
      nx8074);
   mem_Mem_block_modgen_ram_ix60_ix954 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_48_dup_392, QB=>OPEN, D=>nx3147, CLK=>
      clk);
   ix3148 : mux21_ni port map ( Y=>nx3147, A0=>bs_data_in(4), A1=>
      mem_Mem_block_modgen_ram_ix60_a_48_dup_392, S0=>nx8292);
   ix7005 : aoi22 port map ( Y=>nx7004, A0=>
      mem_Mem_block_modgen_ram_ix60_a_32_dup_408, A1=>nx8070, B0=>
      mem_Mem_block_modgen_ram_ix60_a_44_dup_396, B1=>nx8068);
   mem_Mem_block_modgen_ram_ix60_ix1018 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_32_dup_408, QB=>OPEN, D=>nx3137, CLK=>
      clk);
   ix3138 : mux21_ni port map ( Y=>nx3137, A0=>bs_data_in(4), A1=>
      mem_Mem_block_modgen_ram_ix60_a_32_dup_408, S0=>nx8294);
   mem_Mem_block_modgen_ram_ix60_ix970 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_44_dup_396, QB=>OPEN, D=>nx3127, CLK=>
      clk);
   ix3128 : mux21_ni port map ( Y=>nx3127, A0=>
      mem_Mem_block_modgen_ram_ix60_a_44_dup_396, A1=>bs_data_in(4), S0=>
      nx8066);
   ix7013 : nor04 port map ( Y=>nx7012, A0=>nx3594, A1=>nx3516, A2=>nx3436, 
      A3=>nx3358);
   ix3595 : nand04 port map ( Y=>nx3594, A0=>nx7015, A1=>nx7023, A2=>nx7031, 
      A3=>nx7039);
   ix7016 : aoi22 port map ( Y=>nx7015, A0=>
      mem_Mem_block_modgen_ram_ix60_a_55_dup_385, A1=>nx8060, B0=>
      mem_Mem_block_modgen_ram_ix60_a_45_dup_395, B1=>nx8064);
   mem_Mem_block_modgen_ram_ix60_ix926 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_55_dup_385, QB=>OPEN, D=>nx3107, CLK=>
      clk);
   ix3108 : mux21_ni port map ( Y=>nx3107, A0=>bs_data_in(4), A1=>
      mem_Mem_block_modgen_ram_ix60_a_55_dup_385, S0=>nx8298);
   mem_Mem_block_modgen_ram_ix60_ix966 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_45_dup_395, QB=>OPEN, D=>nx3117, CLK=>
      clk);
   ix3118 : mux21_ni port map ( Y=>nx3117, A0=>
      mem_Mem_block_modgen_ram_ix60_a_45_dup_395, A1=>bs_data_in(4), S0=>
      nx8062);
   ix7024 : aoi22 port map ( Y=>nx7023, A0=>
      mem_Mem_block_modgen_ram_ix60_a_39_dup_401, A1=>nx8058, B0=>
      mem_Mem_block_modgen_ram_ix60_a_8_dup_432, B1=>nx8056);
   mem_Mem_block_modgen_ram_ix60_ix990 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_39_dup_401, QB=>OPEN, D=>nx3097, CLK=>
      clk);
   ix3098 : mux21_ni port map ( Y=>nx3097, A0=>bs_data_in(4), A1=>
      mem_Mem_block_modgen_ram_ix60_a_39_dup_401, S0=>nx8300);
   mem_Mem_block_modgen_ram_ix60_ix1114 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_8_dup_432, QB=>OPEN, D=>nx3087, CLK=>
      clk);
   ix3088 : mux21_ni port map ( Y=>nx3087, A0=>
      mem_Mem_block_modgen_ram_ix60_a_8_dup_432, A1=>bs_data_in(4), S0=>
      nx8054);
   ix7032 : aoi22 port map ( Y=>nx7031, A0=>
      mem_Mem_block_modgen_ram_ix60_a_12_dup_428, A1=>nx8052, B0=>
      mem_Mem_block_modgen_ram_ix60_a_22_dup_418, B1=>nx8048);
   mem_Mem_block_modgen_ram_ix60_ix1098 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_12_dup_428, QB=>OPEN, D=>nx3077, CLK=>
      clk);
   ix3078 : mux21_ni port map ( Y=>nx3077, A0=>
      mem_Mem_block_modgen_ram_ix60_a_12_dup_428, A1=>bs_data_in(4), S0=>
      nx8050);
   mem_Mem_block_modgen_ram_ix60_ix1058 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_22_dup_418, QB=>OPEN, D=>nx3067, CLK=>
      clk);
   ix3068 : mux21_ni port map ( Y=>nx3067, A0=>bs_data_in(4), A1=>
      mem_Mem_block_modgen_ram_ix60_a_22_dup_418, S0=>nx8302);
   ix7040 : aoi22 port map ( Y=>nx7039, A0=>
      mem_Mem_block_modgen_ram_ix60_a_58_dup_382, A1=>nx8044, B0=>
      mem_Mem_block_modgen_ram_ix60_a_6_dup_434, B1=>nx8046);
   mem_Mem_block_modgen_ram_ix60_ix914 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_58_dup_382, QB=>OPEN, D=>nx3047, CLK=>
      clk);
   ix3048 : mux21_ni port map ( Y=>nx3047, A0=>
      mem_Mem_block_modgen_ram_ix60_a_58_dup_382, A1=>bs_data_in(4), S0=>
      nx8042);
   mem_Mem_block_modgen_ram_ix60_ix1122 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_6_dup_434, QB=>OPEN, D=>nx3057, CLK=>
      clk);
   ix3058 : mux21_ni port map ( Y=>nx3057, A0=>bs_data_in(4), A1=>
      mem_Mem_block_modgen_ram_ix60_a_6_dup_434, S0=>nx8304);
   ix3517 : nand04 port map ( Y=>nx3516, A0=>nx7048, A1=>nx7056, A2=>nx7064, 
      A3=>nx7072);
   ix7049 : aoi22 port map ( Y=>nx7048, A0=>
      mem_Mem_block_modgen_ram_ix60_a_25_dup_415, A1=>nx8040, B0=>
      mem_Mem_block_modgen_ram_ix60_a_62_dup_378, B1=>nx8036);
   mem_Mem_block_modgen_ram_ix60_ix1046 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_25_dup_415, QB=>OPEN, D=>nx3037, CLK=>
      clk);
   ix3038 : mux21_ni port map ( Y=>nx3037, A0=>
      mem_Mem_block_modgen_ram_ix60_a_25_dup_415, A1=>bs_data_in(4), S0=>
      nx8038);
   mem_Mem_block_modgen_ram_ix60_ix898 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_62_dup_378, QB=>OPEN, D=>nx3027, CLK=>
      clk);
   ix3028 : mux21_ni port map ( Y=>nx3027, A0=>
      mem_Mem_block_modgen_ram_ix60_a_62_dup_378, A1=>bs_data_in(4), S0=>
      nx8034);
   ix7057 : aoi22 port map ( Y=>nx7056, A0=>
      mem_Mem_block_modgen_ram_ix60_a_33_dup_407, A1=>nx8028, B0=>
      mem_Mem_block_modgen_ram_ix60_a_63_dup_377, B1=>nx8032);
   mem_Mem_block_modgen_ram_ix60_ix1014 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_33_dup_407, QB=>OPEN, D=>nx3007, CLK=>
      clk);
   ix3008 : mux21_ni port map ( Y=>nx3007, A0=>bs_data_in(4), A1=>
      mem_Mem_block_modgen_ram_ix60_a_33_dup_407, S0=>nx8306);
   mem_Mem_block_modgen_ram_ix60_ix894 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_63_dup_377, QB=>OPEN, D=>nx3017, CLK=>
      clk);
   ix3018 : mux21_ni port map ( Y=>nx3017, A0=>
      mem_Mem_block_modgen_ram_ix60_a_63_dup_377, A1=>bs_data_in(4), S0=>
      nx8030);
   ix7065 : aoi22 port map ( Y=>nx7064, A0=>
      mem_Mem_block_modgen_ram_ix60_a_41_dup_399, A1=>nx8026, B0=>
      mem_Mem_block_modgen_ram_ix60_a_1_dup_439, B1=>nx8022);
   mem_Mem_block_modgen_ram_ix60_ix982 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_41_dup_399, QB=>OPEN, D=>nx2997, CLK=>
      clk);
   ix2998 : mux21_ni port map ( Y=>nx2997, A0=>
      mem_Mem_block_modgen_ram_ix60_a_41_dup_399, A1=>bs_data_in(4), S0=>
      nx8024);
   mem_Mem_block_modgen_ram_ix60_ix1142 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_1_dup_439, QB=>OPEN, D=>nx2987, CLK=>
      clk);
   ix2988 : mux21_ni port map ( Y=>nx2987, A0=>bs_data_in(4), A1=>
      mem_Mem_block_modgen_ram_ix60_a_1_dup_439, S0=>nx8308);
   ix7073 : aoi22 port map ( Y=>nx7072, A0=>
      mem_Mem_block_modgen_ram_ix60_a_43_dup_397, A1=>nx8018, B0=>
      mem_Mem_block_modgen_ram_ix60_a_0_dup_440, B1=>nx8020);
   mem_Mem_block_modgen_ram_ix60_ix974 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_43_dup_397, QB=>OPEN, D=>nx2967, CLK=>
      clk);
   ix2968 : mux21_ni port map ( Y=>nx2967, A0=>
      mem_Mem_block_modgen_ram_ix60_a_43_dup_397, A1=>bs_data_in(4), S0=>
      nx8016);
   mem_Mem_block_modgen_ram_ix60_ix1146 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_0_dup_440, QB=>OPEN, D=>nx2977, CLK=>
      clk);
   ix2978 : mux21_ni port map ( Y=>nx2977, A0=>bs_data_in(4), A1=>
      mem_Mem_block_modgen_ram_ix60_a_0_dup_440, S0=>nx8310);
   ix3437 : nand04 port map ( Y=>nx3436, A0=>nx7081, A1=>nx7089, A2=>nx7097, 
      A3=>nx7105);
   ix7082 : aoi22 port map ( Y=>nx7081, A0=>
      mem_Mem_block_modgen_ram_ix60_a_34_dup_406, A1=>nx8014, B0=>
      mem_Mem_block_modgen_ram_ix60_a_47_dup_393, B1=>nx8012);
   mem_Mem_block_modgen_ram_ix60_ix1010 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_34_dup_406, QB=>OPEN, D=>nx2957, CLK=>
      clk);
   ix2958 : mux21_ni port map ( Y=>nx2957, A0=>bs_data_in(4), A1=>
      mem_Mem_block_modgen_ram_ix60_a_34_dup_406, S0=>nx8312);
   mem_Mem_block_modgen_ram_ix60_ix958 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_47_dup_393, QB=>OPEN, D=>nx2947, CLK=>
      clk);
   ix2948 : mux21_ni port map ( Y=>nx2947, A0=>
      mem_Mem_block_modgen_ram_ix60_a_47_dup_393, A1=>bs_data_in(4), S0=>
      nx8010);
   ix7090 : aoi22 port map ( Y=>nx7089, A0=>
      mem_Mem_block_modgen_ram_ix60_a_59_dup_381, A1=>nx8004, B0=>
      mem_Mem_block_modgen_ram_ix60_a_24_dup_416, B1=>nx8008);
   mem_Mem_block_modgen_ram_ix60_ix910 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_59_dup_381, QB=>OPEN, D=>nx2927, CLK=>
      clk);
   ix2928 : mux21_ni port map ( Y=>nx2927, A0=>
      mem_Mem_block_modgen_ram_ix60_a_59_dup_381, A1=>bs_data_in(4), S0=>
      nx8002);
   mem_Mem_block_modgen_ram_ix60_ix1050 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_24_dup_416, QB=>OPEN, D=>nx2937, CLK=>
      clk);
   ix2938 : mux21_ni port map ( Y=>nx2937, A0=>
      mem_Mem_block_modgen_ram_ix60_a_24_dup_416, A1=>bs_data_in(4), S0=>
      nx8006);
   ix7098 : aoi22 port map ( Y=>nx7097, A0=>
      mem_Mem_block_modgen_ram_ix60_a_57_dup_383, A1=>nx7998, B0=>
      mem_Mem_block_modgen_ram_ix60_a_17_dup_423, B1=>nx8000);
   mem_Mem_block_modgen_ram_ix60_ix918 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_57_dup_383, QB=>OPEN, D=>nx2907, CLK=>
      clk);
   ix2908 : mux21_ni port map ( Y=>nx2907, A0=>
      mem_Mem_block_modgen_ram_ix60_a_57_dup_383, A1=>bs_data_in(4), S0=>
      nx7996);
   mem_Mem_block_modgen_ram_ix60_ix1078 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_17_dup_423, QB=>OPEN, D=>nx2917, CLK=>
      clk);
   ix2918 : mux21_ni port map ( Y=>nx2917, A0=>bs_data_in(4), A1=>
      mem_Mem_block_modgen_ram_ix60_a_17_dup_423, S0=>nx8314);
   ix7106 : aoi22 port map ( Y=>nx7105, A0=>
      mem_Mem_block_modgen_ram_ix60_a_35_dup_405, A1=>nx7994, B0=>
      mem_Mem_block_modgen_ram_ix60_a_28_dup_412, B1=>nx7992);
   mem_Mem_block_modgen_ram_ix60_ix1006 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_35_dup_405, QB=>OPEN, D=>nx2897, CLK=>
      clk);
   ix2898 : mux21_ni port map ( Y=>nx2897, A0=>bs_data_in(4), A1=>
      mem_Mem_block_modgen_ram_ix60_a_35_dup_405, S0=>nx8316);
   mem_Mem_block_modgen_ram_ix60_ix1034 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_28_dup_412, QB=>OPEN, D=>nx2887, CLK=>
      clk);
   ix2888 : mux21_ni port map ( Y=>nx2887, A0=>
      mem_Mem_block_modgen_ram_ix60_a_28_dup_412, A1=>bs_data_in(4), S0=>
      nx7990);
   ix3359 : nand04 port map ( Y=>nx3358, A0=>nx7114, A1=>nx7122, A2=>nx7130, 
      A3=>nx7138);
   ix7115 : aoi22 port map ( Y=>nx7114, A0=>
      mem_Mem_block_modgen_ram_ix60_a_51_dup_389, A1=>nx7988, B0=>
      mem_Mem_block_modgen_ram_ix60_a_27_dup_413, B1=>nx7982);
   mem_Mem_block_modgen_ram_ix60_ix942 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_51_dup_389, QB=>OPEN, D=>nx2877, CLK=>
      clk);
   ix2878 : mux21_ni port map ( Y=>nx2877, A0=>bs_data_in(4), A1=>
      mem_Mem_block_modgen_ram_ix60_a_51_dup_389, S0=>nx8318);
   mem_Mem_block_modgen_ram_ix60_ix1038 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_27_dup_413, QB=>OPEN, D=>nx2867, CLK=>
      clk);
   ix2868 : mux21_ni port map ( Y=>nx2867, A0=>
      mem_Mem_block_modgen_ram_ix60_a_27_dup_413, A1=>bs_data_in(4), S0=>
      nx7980);
   ix7123 : aoi22 port map ( Y=>nx7122, A0=>
      mem_Mem_block_modgen_ram_ix60_a_30_dup_410, A1=>nx7976, B0=>
      mem_Mem_block_modgen_ram_ix60_a_16_dup_424, B1=>nx7978);
   mem_Mem_block_modgen_ram_ix60_ix1026 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_30_dup_410, QB=>OPEN, D=>nx2847, CLK=>
      clk);
   ix2848 : mux21_ni port map ( Y=>nx2847, A0=>
      mem_Mem_block_modgen_ram_ix60_a_30_dup_410, A1=>bs_data_in(4), S0=>
      nx7974);
   mem_Mem_block_modgen_ram_ix60_ix1082 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_16_dup_424, QB=>OPEN, D=>nx2857, CLK=>
      clk);
   ix2858 : mux21_ni port map ( Y=>nx2857, A0=>bs_data_in(4), A1=>
      mem_Mem_block_modgen_ram_ix60_a_16_dup_424, S0=>nx8320);
   ix7131 : aoi22 port map ( Y=>nx7130, A0=>
      mem_Mem_block_modgen_ram_ix60_a_42_dup_398, A1=>nx7972, B0=>
      mem_Mem_block_modgen_ram_ix60_a_36_dup_404, B1=>nx7968);
   mem_Mem_block_modgen_ram_ix60_ix978 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_42_dup_398, QB=>OPEN, D=>nx2837, CLK=>
      clk);
   ix2838 : mux21_ni port map ( Y=>nx2837, A0=>
      mem_Mem_block_modgen_ram_ix60_a_42_dup_398, A1=>bs_data_in(4), S0=>
      nx7970);
   mem_Mem_block_modgen_ram_ix60_ix1002 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_36_dup_404, QB=>OPEN, D=>nx2827, CLK=>
      clk);
   ix2828 : mux21_ni port map ( Y=>nx2827, A0=>bs_data_in(4), A1=>
      mem_Mem_block_modgen_ram_ix60_a_36_dup_404, S0=>nx8322);
   ix7139 : aoi22 port map ( Y=>nx7138, A0=>
      mem_Mem_block_modgen_ram_ix60_a_4_dup_436, A1=>nx7960, B0=>
      mem_Mem_block_modgen_ram_ix60_a_19_dup_421, B1=>nx7964);
   mem_Mem_block_modgen_ram_ix60_ix1130 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_4_dup_436, QB=>OPEN, D=>nx2807, CLK=>
      clk);
   ix2808 : mux21_ni port map ( Y=>nx2807, A0=>bs_data_in(4), A1=>
      mem_Mem_block_modgen_ram_ix60_a_4_dup_436, S0=>nx8324);
   mem_Mem_block_modgen_ram_ix60_ix1070 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_19_dup_421, QB=>OPEN, D=>nx2817, CLK=>
      clk);
   ix2818 : mux21_ni port map ( Y=>nx2817, A0=>bs_data_in(4), A1=>
      mem_Mem_block_modgen_ram_ix60_a_19_dup_421, S0=>nx8326);
   ix4557 : nand02 port map ( Y=>ds_data_out(5), A0=>nx7147, A1=>nx7281);
   ix7148 : nor04 port map ( Y=>nx7147, A0=>nx4550, A1=>nx4472, A2=>nx4392, 
      A3=>nx4314);
   ix4551 : nand04 port map ( Y=>nx4550, A0=>nx7150, A1=>nx7158, A2=>nx7166, 
      A3=>nx7174);
   ix7151 : aoi22 port map ( Y=>nx7150, A0=>
      mem_Mem_block_modgen_ram_ix60_a_14_dup_356, A1=>nx8158, B0=>
      mem_Mem_block_modgen_ram_ix60_a_23_dup_347, B1=>nx8154);
   mem_Mem_block_modgen_ram_ix60_ix832 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_14_dup_356, QB=>OPEN, D=>nx4077, CLK=>
      clk);
   ix4078 : mux21_ni port map ( Y=>nx4077, A0=>
      mem_Mem_block_modgen_ram_ix60_a_14_dup_356, A1=>bs_data_in(5), S0=>
      nx8156);
   mem_Mem_block_modgen_ram_ix60_ix796 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_23_dup_347, QB=>OPEN, D=>nx4067, CLK=>
      clk);
   ix4068 : mux21_ni port map ( Y=>nx4067, A0=>bs_data_in(5), A1=>
      mem_Mem_block_modgen_ram_ix60_a_23_dup_347, S0=>nx8176);
   ix7159 : aoi22 port map ( Y=>nx7158, A0=>
      mem_Mem_block_modgen_ram_ix60_a_15_dup_355, A1=>nx8150, B0=>
      mem_Mem_block_modgen_ram_ix60_a_7_dup_363, B1=>nx8152);
   mem_Mem_block_modgen_ram_ix60_ix828 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_15_dup_355, QB=>OPEN, D=>nx4047, CLK=>
      clk);
   ix4048 : mux21_ni port map ( Y=>nx4047, A0=>
      mem_Mem_block_modgen_ram_ix60_a_15_dup_355, A1=>bs_data_in(5), S0=>
      nx8148);
   mem_Mem_block_modgen_ram_ix60_ix860 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_7_dup_363, QB=>OPEN, D=>nx4057, CLK=>
      clk);
   ix4058 : mux21_ni port map ( Y=>nx4057, A0=>bs_data_in(5), A1=>
      mem_Mem_block_modgen_ram_ix60_a_7_dup_363, S0=>nx8188);
   ix7167 : aoi22 port map ( Y=>nx7166, A0=>
      mem_Mem_block_modgen_ram_ix60_a_10_dup_360, A1=>nx8146, B0=>
      mem_Mem_block_modgen_ram_ix60_a_9_dup_361, B1=>nx8142);
   mem_Mem_block_modgen_ram_ix60_ix848 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_10_dup_360, QB=>OPEN, D=>nx4037, CLK=>
      clk);
   ix4038 : mux21_ni port map ( Y=>nx4037, A0=>
      mem_Mem_block_modgen_ram_ix60_a_10_dup_360, A1=>bs_data_in(5), S0=>
      nx8144);
   mem_Mem_block_modgen_ram_ix60_ix852 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_9_dup_361, QB=>OPEN, D=>nx4027, CLK=>
      clk);
   ix4028 : mux21_ni port map ( Y=>nx4027, A0=>
      mem_Mem_block_modgen_ram_ix60_a_9_dup_361, A1=>bs_data_in(5), S0=>
      nx8140);
   ix7175 : aoi22 port map ( Y=>nx7174, A0=>
      mem_Mem_block_modgen_ram_ix60_a_54_dup_316, A1=>nx8134, B0=>
      mem_Mem_block_modgen_ram_ix60_a_13_dup_357, B1=>nx8138);
   mem_Mem_block_modgen_ram_ix60_ix672 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_54_dup_316, QB=>OPEN, D=>nx4007, CLK=>
      clk);
   ix4008 : mux21_ni port map ( Y=>nx4007, A0=>bs_data_in(5), A1=>
      mem_Mem_block_modgen_ram_ix60_a_54_dup_316, S0=>nx8204);
   mem_Mem_block_modgen_ram_ix60_ix836 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_13_dup_357, QB=>OPEN, D=>nx4017, CLK=>
      clk);
   ix4018 : mux21_ni port map ( Y=>nx4017, A0=>
      mem_Mem_block_modgen_ram_ix60_a_13_dup_357, A1=>bs_data_in(5), S0=>
      nx8136);
   ix4473 : nand04 port map ( Y=>nx4472, A0=>nx7183, A1=>nx7191, A2=>nx7199, 
      A3=>nx7207);
   ix7184 : aoi22 port map ( Y=>nx7183, A0=>
      mem_Mem_block_modgen_ram_ix60_a_18_dup_352, A1=>nx8132, B0=>
      mem_Mem_block_modgen_ram_ix60_a_11_dup_359, B1=>nx8130);
   mem_Mem_block_modgen_ram_ix60_ix816 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_18_dup_352, QB=>OPEN, D=>nx3997, CLK=>
      clk);
   ix3998 : mux21_ni port map ( Y=>nx3997, A0=>bs_data_in(5), A1=>
      mem_Mem_block_modgen_ram_ix60_a_18_dup_352, S0=>nx8212);
   mem_Mem_block_modgen_ram_ix60_ix844 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_11_dup_359, QB=>OPEN, D=>nx3987, CLK=>
      clk);
   ix3988 : mux21_ni port map ( Y=>nx3987, A0=>
      mem_Mem_block_modgen_ram_ix60_a_11_dup_359, A1=>bs_data_in(5), S0=>
      nx8128);
   ix7192 : aoi22 port map ( Y=>nx7191, A0=>
      mem_Mem_block_modgen_ram_ix60_a_56_dup_314, A1=>nx8126, B0=>
      mem_Mem_block_modgen_ram_ix60_a_26_dup_344, B1=>nx8122);
   mem_Mem_block_modgen_ram_ix60_ix664 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_56_dup_314, QB=>OPEN, D=>nx3977, CLK=>
      clk);
   ix3978 : mux21_ni port map ( Y=>nx3977, A0=>
      mem_Mem_block_modgen_ram_ix60_a_56_dup_314, A1=>bs_data_in(5), S0=>
      nx8124);
   mem_Mem_block_modgen_ram_ix60_ix784 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_26_dup_344, QB=>OPEN, D=>nx3967, CLK=>
      clk);
   ix3968 : mux21_ni port map ( Y=>nx3967, A0=>
      mem_Mem_block_modgen_ram_ix60_a_26_dup_344, A1=>bs_data_in(5), S0=>
      nx8120);
   ix7200 : aoi22 port map ( Y=>nx7199, A0=>
      mem_Mem_block_modgen_ram_ix60_a_20_dup_350, A1=>nx8114, B0=>
      mem_Mem_block_modgen_ram_ix60_a_46_dup_324, B1=>nx8118);
   mem_Mem_block_modgen_ram_ix60_ix808 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_20_dup_350, QB=>OPEN, D=>nx3947, CLK=>
      clk);
   ix3948 : mux21_ni port map ( Y=>nx3947, A0=>bs_data_in(5), A1=>
      mem_Mem_block_modgen_ram_ix60_a_20_dup_350, S0=>nx8242);
   mem_Mem_block_modgen_ram_ix60_ix704 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_46_dup_324, QB=>OPEN, D=>nx3957, CLK=>
      clk);
   ix3958 : mux21_ni port map ( Y=>nx3957, A0=>
      mem_Mem_block_modgen_ram_ix60_a_46_dup_324, A1=>bs_data_in(5), S0=>
      nx8116);
   ix7208 : aoi22 port map ( Y=>nx7207, A0=>
      mem_Mem_block_modgen_ram_ix60_a_52_dup_318, A1=>nx8112, B0=>
      mem_Mem_block_modgen_ram_ix60_a_5_dup_365, B1=>nx8110);
   mem_Mem_block_modgen_ram_ix60_ix680 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_52_dup_318, QB=>OPEN, D=>nx3937, CLK=>
      clk);
   ix3938 : mux21_ni port map ( Y=>nx3937, A0=>bs_data_in(5), A1=>
      mem_Mem_block_modgen_ram_ix60_a_52_dup_318, S0=>nx8254);
   mem_Mem_block_modgen_ram_ix60_ix868 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_5_dup_365, QB=>OPEN, D=>nx3927, CLK=>
      clk);
   ix3928 : mux21_ni port map ( Y=>nx3927, A0=>bs_data_in(5), A1=>
      mem_Mem_block_modgen_ram_ix60_a_5_dup_365, S0=>nx8256);
   ix4393 : nand04 port map ( Y=>nx4392, A0=>nx7216, A1=>nx7224, A2=>nx7232, 
      A3=>nx7240);
   ix7217 : aoi22 port map ( Y=>nx7216, A0=>
      mem_Mem_block_modgen_ram_ix60_a_37_dup_333, A1=>nx8108, B0=>
      mem_Mem_block_modgen_ram_ix60_a_21_dup_349, B1=>nx8106);
   mem_Mem_block_modgen_ram_ix60_ix740 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_37_dup_333, QB=>OPEN, D=>nx3917, CLK=>
      clk);
   ix3918 : mux21_ni port map ( Y=>nx3917, A0=>bs_data_in(5), A1=>
      mem_Mem_block_modgen_ram_ix60_a_37_dup_333, S0=>nx8260);
   mem_Mem_block_modgen_ram_ix60_ix804 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_21_dup_349, QB=>OPEN, D=>nx3907, CLK=>
      clk);
   ix3908 : mux21_ni port map ( Y=>nx3907, A0=>bs_data_in(5), A1=>
      mem_Mem_block_modgen_ram_ix60_a_21_dup_349, S0=>nx8266);
   ix7225 : aoi22 port map ( Y=>nx7224, A0=>
      mem_Mem_block_modgen_ram_ix60_a_53_dup_317, A1=>nx8104, B0=>
      mem_Mem_block_modgen_ram_ix60_a_61_dup_309, B1=>nx8102);
   mem_Mem_block_modgen_ram_ix60_ix676 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_53_dup_317, QB=>OPEN, D=>nx3897, CLK=>
      clk);
   ix3898 : mux21_ni port map ( Y=>nx3897, A0=>bs_data_in(5), A1=>
      mem_Mem_block_modgen_ram_ix60_a_53_dup_317, S0=>nx8268);
   mem_Mem_block_modgen_ram_ix60_ix644 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_61_dup_309, QB=>OPEN, D=>nx3887, CLK=>
      clk);
   ix3888 : mux21_ni port map ( Y=>nx3887, A0=>
      mem_Mem_block_modgen_ram_ix60_a_61_dup_309, A1=>bs_data_in(5), S0=>
      nx8100);
   ix7233 : aoi22 port map ( Y=>nx7232, A0=>
      mem_Mem_block_modgen_ram_ix60_a_50_dup_320, A1=>nx8094, B0=>
      mem_Mem_block_modgen_ram_ix60_a_60_dup_310, B1=>nx8098);
   mem_Mem_block_modgen_ram_ix60_ix688 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_50_dup_320, QB=>OPEN, D=>nx3867, CLK=>
      clk);
   ix3868 : mux21_ni port map ( Y=>nx3867, A0=>bs_data_in(5), A1=>
      mem_Mem_block_modgen_ram_ix60_a_50_dup_320, S0=>nx8272);
   mem_Mem_block_modgen_ram_ix60_ix648 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_60_dup_310, QB=>OPEN, D=>nx3877, CLK=>
      clk);
   ix3878 : mux21_ni port map ( Y=>nx3877, A0=>
      mem_Mem_block_modgen_ram_ix60_a_60_dup_310, A1=>bs_data_in(5), S0=>
      nx8096);
   ix7241 : aoi22 port map ( Y=>nx7240, A0=>
      mem_Mem_block_modgen_ram_ix60_a_49_dup_321, A1=>nx8092, B0=>
      mem_Mem_block_modgen_ram_ix60_a_38_dup_332, B1=>nx8090);
   mem_Mem_block_modgen_ram_ix60_ix692 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_49_dup_321, QB=>OPEN, D=>nx3857, CLK=>
      clk);
   ix3858 : mux21_ni port map ( Y=>nx3857, A0=>bs_data_in(5), A1=>
      mem_Mem_block_modgen_ram_ix60_a_49_dup_321, S0=>nx8276);
   mem_Mem_block_modgen_ram_ix60_ix736 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_38_dup_332, QB=>OPEN, D=>nx3847, CLK=>
      clk);
   ix3848 : mux21_ni port map ( Y=>nx3847, A0=>bs_data_in(5), A1=>
      mem_Mem_block_modgen_ram_ix60_a_38_dup_332, S0=>nx8278);
   ix4315 : nand04 port map ( Y=>nx4314, A0=>nx7249, A1=>nx7257, A2=>nx7265, 
      A3=>nx7273);
   ix7250 : aoi22 port map ( Y=>nx7249, A0=>
      mem_Mem_block_modgen_ram_ix60_a_2_dup_368, A1=>nx8088, B0=>
      mem_Mem_block_modgen_ram_ix60_a_3_dup_367, B1=>nx8086);
   mem_Mem_block_modgen_ram_ix60_ix880 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_2_dup_368, QB=>OPEN, D=>nx3837, CLK=>
      clk);
   ix3838 : mux21_ni port map ( Y=>nx3837, A0=>bs_data_in(5), A1=>
      mem_Mem_block_modgen_ram_ix60_a_2_dup_368, S0=>nx8280);
   mem_Mem_block_modgen_ram_ix60_ix876 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_3_dup_367, QB=>OPEN, D=>nx3827, CLK=>
      clk);
   ix3828 : mux21_ni port map ( Y=>nx3827, A0=>bs_data_in(5), A1=>
      mem_Mem_block_modgen_ram_ix60_a_3_dup_367, S0=>nx8286);
   ix7258 : aoi22 port map ( Y=>nx7257, A0=>
      mem_Mem_block_modgen_ram_ix60_a_31_dup_339, A1=>nx8084, B0=>
      mem_Mem_block_modgen_ram_ix60_a_29_dup_341, B1=>nx8080);
   mem_Mem_block_modgen_ram_ix60_ix764 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_31_dup_339, QB=>OPEN, D=>nx3817, CLK=>
      clk);
   ix3818 : mux21_ni port map ( Y=>nx3817, A0=>
      mem_Mem_block_modgen_ram_ix60_a_31_dup_339, A1=>bs_data_in(5), S0=>
      nx8082);
   mem_Mem_block_modgen_ram_ix60_ix772 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_29_dup_341, QB=>OPEN, D=>nx3807, CLK=>
      clk);
   ix3808 : mux21_ni port map ( Y=>nx3807, A0=>
      mem_Mem_block_modgen_ram_ix60_a_29_dup_341, A1=>bs_data_in(5), S0=>
      nx8078);
   ix7266 : aoi22 port map ( Y=>nx7265, A0=>
      mem_Mem_block_modgen_ram_ix60_a_40_dup_330, A1=>nx8076, B0=>
      mem_Mem_block_modgen_ram_ix60_a_48_dup_322, B1=>nx8072);
   mem_Mem_block_modgen_ram_ix60_ix728 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_40_dup_330, QB=>OPEN, D=>nx3797, CLK=>
      clk);
   ix3798 : mux21_ni port map ( Y=>nx3797, A0=>
      mem_Mem_block_modgen_ram_ix60_a_40_dup_330, A1=>bs_data_in(5), S0=>
      nx8074);
   mem_Mem_block_modgen_ram_ix60_ix696 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_48_dup_322, QB=>OPEN, D=>nx3787, CLK=>
      clk);
   ix3788 : mux21_ni port map ( Y=>nx3787, A0=>bs_data_in(5), A1=>
      mem_Mem_block_modgen_ram_ix60_a_48_dup_322, S0=>nx8292);
   ix7274 : aoi22 port map ( Y=>nx7273, A0=>
      mem_Mem_block_modgen_ram_ix60_a_32_dup_338, A1=>nx8070, B0=>
      mem_Mem_block_modgen_ram_ix60_a_44_dup_326, B1=>nx8068);
   mem_Mem_block_modgen_ram_ix60_ix760 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_32_dup_338, QB=>OPEN, D=>nx3777, CLK=>
      clk);
   ix3778 : mux21_ni port map ( Y=>nx3777, A0=>bs_data_in(5), A1=>
      mem_Mem_block_modgen_ram_ix60_a_32_dup_338, S0=>nx8294);
   mem_Mem_block_modgen_ram_ix60_ix712 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_44_dup_326, QB=>OPEN, D=>nx3767, CLK=>
      clk);
   ix3768 : mux21_ni port map ( Y=>nx3767, A0=>
      mem_Mem_block_modgen_ram_ix60_a_44_dup_326, A1=>bs_data_in(5), S0=>
      nx8066);
   ix7282 : nor04 port map ( Y=>nx7281, A0=>nx4232, A1=>nx4154, A2=>nx4074, 
      A3=>nx3996);
   ix4233 : nand04 port map ( Y=>nx4232, A0=>nx7284, A1=>nx7292, A2=>nx7300, 
      A3=>nx7308);
   ix7285 : aoi22 port map ( Y=>nx7284, A0=>
      mem_Mem_block_modgen_ram_ix60_a_55_dup_315, A1=>nx8060, B0=>
      mem_Mem_block_modgen_ram_ix60_a_45_dup_325, B1=>nx8064);
   mem_Mem_block_modgen_ram_ix60_ix668 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_55_dup_315, QB=>OPEN, D=>nx3747, CLK=>
      clk);
   ix3748 : mux21_ni port map ( Y=>nx3747, A0=>bs_data_in(5), A1=>
      mem_Mem_block_modgen_ram_ix60_a_55_dup_315, S0=>nx8298);
   mem_Mem_block_modgen_ram_ix60_ix708 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_45_dup_325, QB=>OPEN, D=>nx3757, CLK=>
      clk);
   ix3758 : mux21_ni port map ( Y=>nx3757, A0=>
      mem_Mem_block_modgen_ram_ix60_a_45_dup_325, A1=>bs_data_in(5), S0=>
      nx8062);
   ix7293 : aoi22 port map ( Y=>nx7292, A0=>
      mem_Mem_block_modgen_ram_ix60_a_39_dup_331, A1=>nx8058, B0=>
      mem_Mem_block_modgen_ram_ix60_a_8_dup_362, B1=>nx8056);
   mem_Mem_block_modgen_ram_ix60_ix732 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_39_dup_331, QB=>OPEN, D=>nx3737, CLK=>
      clk);
   ix3738 : mux21_ni port map ( Y=>nx3737, A0=>bs_data_in(5), A1=>
      mem_Mem_block_modgen_ram_ix60_a_39_dup_331, S0=>nx8300);
   mem_Mem_block_modgen_ram_ix60_ix856 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_8_dup_362, QB=>OPEN, D=>nx3727, CLK=>
      clk);
   ix3728 : mux21_ni port map ( Y=>nx3727, A0=>
      mem_Mem_block_modgen_ram_ix60_a_8_dup_362, A1=>bs_data_in(5), S0=>
      nx8054);
   ix7301 : aoi22 port map ( Y=>nx7300, A0=>
      mem_Mem_block_modgen_ram_ix60_a_12_dup_358, A1=>nx8052, B0=>
      mem_Mem_block_modgen_ram_ix60_a_22_dup_348, B1=>nx8048);
   mem_Mem_block_modgen_ram_ix60_ix840 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_12_dup_358, QB=>OPEN, D=>nx3717, CLK=>
      clk);
   ix3718 : mux21_ni port map ( Y=>nx3717, A0=>
      mem_Mem_block_modgen_ram_ix60_a_12_dup_358, A1=>bs_data_in(5), S0=>
      nx8050);
   mem_Mem_block_modgen_ram_ix60_ix800 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_22_dup_348, QB=>OPEN, D=>nx3707, CLK=>
      clk);
   ix3708 : mux21_ni port map ( Y=>nx3707, A0=>bs_data_in(5), A1=>
      mem_Mem_block_modgen_ram_ix60_a_22_dup_348, S0=>nx8302);
   ix7309 : aoi22 port map ( Y=>nx7308, A0=>
      mem_Mem_block_modgen_ram_ix60_a_58_dup_312, A1=>nx8044, B0=>
      mem_Mem_block_modgen_ram_ix60_a_6_dup_364, B1=>nx8046);
   mem_Mem_block_modgen_ram_ix60_ix656 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_58_dup_312, QB=>OPEN, D=>nx3687, CLK=>
      clk);
   ix3688 : mux21_ni port map ( Y=>nx3687, A0=>
      mem_Mem_block_modgen_ram_ix60_a_58_dup_312, A1=>bs_data_in(5), S0=>
      nx8042);
   mem_Mem_block_modgen_ram_ix60_ix864 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_6_dup_364, QB=>OPEN, D=>nx3697, CLK=>
      clk);
   ix3698 : mux21_ni port map ( Y=>nx3697, A0=>bs_data_in(5), A1=>
      mem_Mem_block_modgen_ram_ix60_a_6_dup_364, S0=>nx8304);
   ix4155 : nand04 port map ( Y=>nx4154, A0=>nx7317, A1=>nx7325, A2=>nx7333, 
      A3=>nx7341);
   ix7318 : aoi22 port map ( Y=>nx7317, A0=>
      mem_Mem_block_modgen_ram_ix60_a_25_dup_345, A1=>nx8040, B0=>
      mem_Mem_block_modgen_ram_ix60_a_62_dup_308, B1=>nx8036);
   mem_Mem_block_modgen_ram_ix60_ix788 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_25_dup_345, QB=>OPEN, D=>nx3677, CLK=>
      clk);
   ix3678 : mux21_ni port map ( Y=>nx3677, A0=>
      mem_Mem_block_modgen_ram_ix60_a_25_dup_345, A1=>bs_data_in(5), S0=>
      nx8038);
   mem_Mem_block_modgen_ram_ix60_ix640 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_62_dup_308, QB=>OPEN, D=>nx3667, CLK=>
      clk);
   ix3668 : mux21_ni port map ( Y=>nx3667, A0=>
      mem_Mem_block_modgen_ram_ix60_a_62_dup_308, A1=>bs_data_in(5), S0=>
      nx8034);
   ix7326 : aoi22 port map ( Y=>nx7325, A0=>
      mem_Mem_block_modgen_ram_ix60_a_33_dup_337, A1=>nx8028, B0=>
      mem_Mem_block_modgen_ram_ix60_a_63_dup_307, B1=>nx8032);
   mem_Mem_block_modgen_ram_ix60_ix756 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_33_dup_337, QB=>OPEN, D=>nx3647, CLK=>
      clk);
   ix3648 : mux21_ni port map ( Y=>nx3647, A0=>bs_data_in(5), A1=>
      mem_Mem_block_modgen_ram_ix60_a_33_dup_337, S0=>nx8306);
   mem_Mem_block_modgen_ram_ix60_ix636 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_63_dup_307, QB=>OPEN, D=>nx3657, CLK=>
      clk);
   ix3658 : mux21_ni port map ( Y=>nx3657, A0=>
      mem_Mem_block_modgen_ram_ix60_a_63_dup_307, A1=>bs_data_in(5), S0=>
      nx8030);
   ix7334 : aoi22 port map ( Y=>nx7333, A0=>
      mem_Mem_block_modgen_ram_ix60_a_41_dup_329, A1=>nx8026, B0=>
      mem_Mem_block_modgen_ram_ix60_a_1_dup_369, B1=>nx8022);
   mem_Mem_block_modgen_ram_ix60_ix724 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_41_dup_329, QB=>OPEN, D=>nx3637, CLK=>
      clk);
   ix3638 : mux21_ni port map ( Y=>nx3637, A0=>
      mem_Mem_block_modgen_ram_ix60_a_41_dup_329, A1=>bs_data_in(5), S0=>
      nx8024);
   mem_Mem_block_modgen_ram_ix60_ix884 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_1_dup_369, QB=>OPEN, D=>nx3627, CLK=>
      clk);
   ix3628 : mux21_ni port map ( Y=>nx3627, A0=>bs_data_in(5), A1=>
      mem_Mem_block_modgen_ram_ix60_a_1_dup_369, S0=>nx8308);
   ix7342 : aoi22 port map ( Y=>nx7341, A0=>
      mem_Mem_block_modgen_ram_ix60_a_43_dup_327, A1=>nx8018, B0=>
      mem_Mem_block_modgen_ram_ix60_a_0_dup_370, B1=>nx8020);
   mem_Mem_block_modgen_ram_ix60_ix716 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_43_dup_327, QB=>OPEN, D=>nx3607, CLK=>
      clk);
   ix3608 : mux21_ni port map ( Y=>nx3607, A0=>
      mem_Mem_block_modgen_ram_ix60_a_43_dup_327, A1=>bs_data_in(5), S0=>
      nx8016);
   mem_Mem_block_modgen_ram_ix60_ix888 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_0_dup_370, QB=>OPEN, D=>nx3617, CLK=>
      clk);
   ix3618 : mux21_ni port map ( Y=>nx3617, A0=>bs_data_in(5), A1=>
      mem_Mem_block_modgen_ram_ix60_a_0_dup_370, S0=>nx8310);
   ix4075 : nand04 port map ( Y=>nx4074, A0=>nx7350, A1=>nx7358, A2=>nx7366, 
      A3=>nx7374);
   ix7351 : aoi22 port map ( Y=>nx7350, A0=>
      mem_Mem_block_modgen_ram_ix60_a_34_dup_336, A1=>nx8014, B0=>
      mem_Mem_block_modgen_ram_ix60_a_47_dup_323, B1=>nx8012);
   mem_Mem_block_modgen_ram_ix60_ix752 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_34_dup_336, QB=>OPEN, D=>nx3597, CLK=>
      clk);
   ix3598 : mux21_ni port map ( Y=>nx3597, A0=>bs_data_in(5), A1=>
      mem_Mem_block_modgen_ram_ix60_a_34_dup_336, S0=>nx8312);
   mem_Mem_block_modgen_ram_ix60_ix700 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_47_dup_323, QB=>OPEN, D=>nx3587, CLK=>
      clk);
   ix3588 : mux21_ni port map ( Y=>nx3587, A0=>
      mem_Mem_block_modgen_ram_ix60_a_47_dup_323, A1=>bs_data_in(5), S0=>
      nx8010);
   ix7359 : aoi22 port map ( Y=>nx7358, A0=>
      mem_Mem_block_modgen_ram_ix60_a_59_dup_311, A1=>nx8004, B0=>
      mem_Mem_block_modgen_ram_ix60_a_24_dup_346, B1=>nx8008);
   mem_Mem_block_modgen_ram_ix60_ix652 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_59_dup_311, QB=>OPEN, D=>nx3567, CLK=>
      clk);
   ix3568 : mux21_ni port map ( Y=>nx3567, A0=>
      mem_Mem_block_modgen_ram_ix60_a_59_dup_311, A1=>bs_data_in(5), S0=>
      nx8002);
   mem_Mem_block_modgen_ram_ix60_ix792 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_24_dup_346, QB=>OPEN, D=>nx3577, CLK=>
      clk);
   ix3578 : mux21_ni port map ( Y=>nx3577, A0=>
      mem_Mem_block_modgen_ram_ix60_a_24_dup_346, A1=>bs_data_in(5), S0=>
      nx8006);
   ix7367 : aoi22 port map ( Y=>nx7366, A0=>
      mem_Mem_block_modgen_ram_ix60_a_57_dup_313, A1=>nx7998, B0=>
      mem_Mem_block_modgen_ram_ix60_a_17_dup_353, B1=>nx8000);
   mem_Mem_block_modgen_ram_ix60_ix660 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_57_dup_313, QB=>OPEN, D=>nx3547, CLK=>
      clk);
   ix3548 : mux21_ni port map ( Y=>nx3547, A0=>
      mem_Mem_block_modgen_ram_ix60_a_57_dup_313, A1=>bs_data_in(5), S0=>
      nx7996);
   mem_Mem_block_modgen_ram_ix60_ix820 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_17_dup_353, QB=>OPEN, D=>nx3557, CLK=>
      clk);
   ix3558 : mux21_ni port map ( Y=>nx3557, A0=>bs_data_in(5), A1=>
      mem_Mem_block_modgen_ram_ix60_a_17_dup_353, S0=>nx8314);
   ix7375 : aoi22 port map ( Y=>nx7374, A0=>
      mem_Mem_block_modgen_ram_ix60_a_35_dup_335, A1=>nx7994, B0=>
      mem_Mem_block_modgen_ram_ix60_a_28_dup_342, B1=>nx7992);
   mem_Mem_block_modgen_ram_ix60_ix748 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_35_dup_335, QB=>OPEN, D=>nx3537, CLK=>
      clk);
   ix3538 : mux21_ni port map ( Y=>nx3537, A0=>bs_data_in(5), A1=>
      mem_Mem_block_modgen_ram_ix60_a_35_dup_335, S0=>nx8316);
   mem_Mem_block_modgen_ram_ix60_ix776 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_28_dup_342, QB=>OPEN, D=>nx3527, CLK=>
      clk);
   ix3528 : mux21_ni port map ( Y=>nx3527, A0=>
      mem_Mem_block_modgen_ram_ix60_a_28_dup_342, A1=>bs_data_in(5), S0=>
      nx7990);
   ix3997 : nand04 port map ( Y=>nx3996, A0=>nx7383, A1=>nx7391, A2=>nx7399, 
      A3=>nx7407);
   ix7384 : aoi22 port map ( Y=>nx7383, A0=>
      mem_Mem_block_modgen_ram_ix60_a_51_dup_319, A1=>nx7988, B0=>
      mem_Mem_block_modgen_ram_ix60_a_27_dup_343, B1=>nx7982);
   mem_Mem_block_modgen_ram_ix60_ix684 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_51_dup_319, QB=>OPEN, D=>nx3517, CLK=>
      clk);
   ix3518 : mux21_ni port map ( Y=>nx3517, A0=>bs_data_in(5), A1=>
      mem_Mem_block_modgen_ram_ix60_a_51_dup_319, S0=>nx8318);
   mem_Mem_block_modgen_ram_ix60_ix780 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_27_dup_343, QB=>OPEN, D=>nx3507, CLK=>
      clk);
   ix3508 : mux21_ni port map ( Y=>nx3507, A0=>
      mem_Mem_block_modgen_ram_ix60_a_27_dup_343, A1=>bs_data_in(5), S0=>
      nx7980);
   ix7392 : aoi22 port map ( Y=>nx7391, A0=>
      mem_Mem_block_modgen_ram_ix60_a_30_dup_340, A1=>nx7976, B0=>
      mem_Mem_block_modgen_ram_ix60_a_16_dup_354, B1=>nx7978);
   mem_Mem_block_modgen_ram_ix60_ix768 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_30_dup_340, QB=>OPEN, D=>nx3487, CLK=>
      clk);
   ix3488 : mux21_ni port map ( Y=>nx3487, A0=>
      mem_Mem_block_modgen_ram_ix60_a_30_dup_340, A1=>bs_data_in(5), S0=>
      nx7974);
   mem_Mem_block_modgen_ram_ix60_ix824 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_16_dup_354, QB=>OPEN, D=>nx3497, CLK=>
      clk);
   ix3498 : mux21_ni port map ( Y=>nx3497, A0=>bs_data_in(5), A1=>
      mem_Mem_block_modgen_ram_ix60_a_16_dup_354, S0=>nx8320);
   ix7400 : aoi22 port map ( Y=>nx7399, A0=>
      mem_Mem_block_modgen_ram_ix60_a_42_dup_328, A1=>nx7972, B0=>
      mem_Mem_block_modgen_ram_ix60_a_36_dup_334, B1=>nx7968);
   mem_Mem_block_modgen_ram_ix60_ix720 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_42_dup_328, QB=>OPEN, D=>nx3477, CLK=>
      clk);
   ix3478 : mux21_ni port map ( Y=>nx3477, A0=>
      mem_Mem_block_modgen_ram_ix60_a_42_dup_328, A1=>bs_data_in(5), S0=>
      nx7970);
   mem_Mem_block_modgen_ram_ix60_ix744 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_36_dup_334, QB=>OPEN, D=>nx3467, CLK=>
      clk);
   ix3468 : mux21_ni port map ( Y=>nx3467, A0=>bs_data_in(5), A1=>
      mem_Mem_block_modgen_ram_ix60_a_36_dup_334, S0=>nx8322);
   ix7408 : aoi22 port map ( Y=>nx7407, A0=>
      mem_Mem_block_modgen_ram_ix60_a_4_dup_366, A1=>nx7960, B0=>
      mem_Mem_block_modgen_ram_ix60_a_19_dup_351, B1=>nx7964);
   mem_Mem_block_modgen_ram_ix60_ix872 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_4_dup_366, QB=>OPEN, D=>nx3447, CLK=>
      clk);
   ix3448 : mux21_ni port map ( Y=>nx3447, A0=>bs_data_in(5), A1=>
      mem_Mem_block_modgen_ram_ix60_a_4_dup_366, S0=>nx8324);
   mem_Mem_block_modgen_ram_ix60_ix812 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_19_dup_351, QB=>OPEN, D=>nx3457, CLK=>
      clk);
   ix3458 : mux21_ni port map ( Y=>nx3457, A0=>bs_data_in(5), A1=>
      mem_Mem_block_modgen_ram_ix60_a_19_dup_351, S0=>nx8326);
   ix5195 : nand02 port map ( Y=>ds_data_out(6), A0=>nx7416, A1=>nx7550);
   ix7417 : nor04 port map ( Y=>nx7416, A0=>nx5188, A1=>nx5110, A2=>nx5030, 
      A3=>nx4952);
   ix5189 : nand04 port map ( Y=>nx5188, A0=>nx7419, A1=>nx7427, A2=>nx7435, 
      A3=>nx7443);
   ix7420 : aoi22 port map ( Y=>nx7419, A0=>
      mem_Mem_block_modgen_ram_ix60_a_14_dup_286, A1=>nx1352, B0=>
      mem_Mem_block_modgen_ram_ix60_a_23_dup_277, B1=>nx1338);
   mem_Mem_block_modgen_ram_ix60_ix574 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_14_dup_286, QB=>OPEN, D=>nx4717, CLK=>
      clk);
   ix4718 : mux21_ni port map ( Y=>nx4717, A0=>
      mem_Mem_block_modgen_ram_ix60_a_14_dup_286, A1=>bs_data_in(6), S0=>
      nx1344);
   mem_Mem_block_modgen_ram_ix60_ix538 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_23_dup_277, QB=>OPEN, D=>nx4707, CLK=>
      clk);
   ix4708 : mux21_ni port map ( Y=>nx4707, A0=>bs_data_in(6), A1=>
      mem_Mem_block_modgen_ram_ix60_a_23_dup_277, S0=>nx5474);
   ix7428 : aoi22 port map ( Y=>nx7427, A0=>
      mem_Mem_block_modgen_ram_ix60_a_15_dup_285, A1=>nx1308, B0=>
      mem_Mem_block_modgen_ram_ix60_a_7_dup_293, B1=>nx1322);
   mem_Mem_block_modgen_ram_ix60_ix570 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_15_dup_285, QB=>OPEN, D=>nx4687, CLK=>
      clk);
   ix4688 : mux21_ni port map ( Y=>nx4687, A0=>
      mem_Mem_block_modgen_ram_ix60_a_15_dup_285, A1=>bs_data_in(6), S0=>
      nx1300);
   mem_Mem_block_modgen_ram_ix60_ix602 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_7_dup_293, QB=>OPEN, D=>nx4697, CLK=>
      clk);
   ix4698 : mux21_ni port map ( Y=>nx4697, A0=>bs_data_in(6), A1=>
      mem_Mem_block_modgen_ram_ix60_a_7_dup_293, S0=>nx5527);
   ix7436 : aoi22 port map ( Y=>nx7435, A0=>
      mem_Mem_block_modgen_ram_ix60_a_10_dup_290, A1=>nx1290, B0=>
      mem_Mem_block_modgen_ram_ix60_a_9_dup_291, B1=>nx1276);
   mem_Mem_block_modgen_ram_ix60_ix590 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_10_dup_290, QB=>OPEN, D=>nx4677, CLK=>
      clk);
   ix4678 : mux21_ni port map ( Y=>nx4677, A0=>
      mem_Mem_block_modgen_ram_ix60_a_10_dup_290, A1=>bs_data_in(6), S0=>
      nx1282);
   mem_Mem_block_modgen_ram_ix60_ix594 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_9_dup_291, QB=>OPEN, D=>nx4667, CLK=>
      clk);
   ix4668 : mux21_ni port map ( Y=>nx4667, A0=>
      mem_Mem_block_modgen_ram_ix60_a_9_dup_291, A1=>bs_data_in(6), S0=>
      nx1268);
   ix7444 : aoi22 port map ( Y=>nx7443, A0=>
      mem_Mem_block_modgen_ram_ix60_a_54_dup_246, A1=>nx1246, B0=>
      mem_Mem_block_modgen_ram_ix60_a_13_dup_287, B1=>nx1260);
   mem_Mem_block_modgen_ram_ix60_ix414 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_54_dup_246, QB=>OPEN, D=>nx4647, CLK=>
      clk);
   ix4648 : mux21_ni port map ( Y=>nx4647, A0=>bs_data_in(6), A1=>
      mem_Mem_block_modgen_ram_ix60_a_54_dup_246, S0=>nx5569);
   mem_Mem_block_modgen_ram_ix60_ix578 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_13_dup_287, QB=>OPEN, D=>nx4657, CLK=>
      clk);
   ix4658 : mux21_ni port map ( Y=>nx4657, A0=>
      mem_Mem_block_modgen_ram_ix60_a_13_dup_287, A1=>bs_data_in(6), S0=>
      nx1252);
   ix5111 : nand04 port map ( Y=>nx5110, A0=>nx7452, A1=>nx7460, A2=>nx7468, 
      A3=>nx7476);
   ix7453 : aoi22 port map ( Y=>nx7452, A0=>
      mem_Mem_block_modgen_ram_ix60_a_18_dup_282, A1=>nx1226, B0=>
      mem_Mem_block_modgen_ram_ix60_a_11_dup_289, B1=>nx1212);
   mem_Mem_block_modgen_ram_ix60_ix558 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_18_dup_282, QB=>OPEN, D=>nx4637, CLK=>
      clk);
   ix4638 : mux21_ni port map ( Y=>nx4637, A0=>bs_data_in(6), A1=>
      mem_Mem_block_modgen_ram_ix60_a_18_dup_282, S0=>nx5603);
   mem_Mem_block_modgen_ram_ix60_ix586 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_11_dup_289, QB=>OPEN, D=>nx4627, CLK=>
      clk);
   ix4628 : mux21_ni port map ( Y=>nx4627, A0=>
      mem_Mem_block_modgen_ram_ix60_a_11_dup_289, A1=>bs_data_in(6), S0=>
      nx1204);
   ix7461 : aoi22 port map ( Y=>nx7460, A0=>
      mem_Mem_block_modgen_ram_ix60_a_56_dup_244, A1=>nx1196, B0=>
      mem_Mem_block_modgen_ram_ix60_a_26_dup_274, B1=>nx1182);
   mem_Mem_block_modgen_ram_ix60_ix406 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_56_dup_244, QB=>OPEN, D=>nx4617, CLK=>
      clk);
   ix4618 : mux21_ni port map ( Y=>nx4617, A0=>
      mem_Mem_block_modgen_ram_ix60_a_56_dup_244, A1=>bs_data_in(6), S0=>
      nx1188);
   mem_Mem_block_modgen_ram_ix60_ix526 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_26_dup_274, QB=>OPEN, D=>nx4607, CLK=>
      clk);
   ix4608 : mux21_ni port map ( Y=>nx4607, A0=>
      mem_Mem_block_modgen_ram_ix60_a_26_dup_274, A1=>bs_data_in(6), S0=>
      nx1174);
   ix7469 : aoi22 port map ( Y=>nx7468, A0=>
      mem_Mem_block_modgen_ram_ix60_a_20_dup_280, A1=>nx1150, B0=>
      mem_Mem_block_modgen_ram_ix60_a_46_dup_254, B1=>nx1164);
   mem_Mem_block_modgen_ram_ix60_ix550 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_20_dup_280, QB=>OPEN, D=>nx4587, CLK=>
      clk);
   ix4588 : mux21_ni port map ( Y=>nx4587, A0=>bs_data_in(6), A1=>
      mem_Mem_block_modgen_ram_ix60_a_20_dup_280, S0=>nx5663);
   mem_Mem_block_modgen_ram_ix60_ix446 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_46_dup_254, QB=>OPEN, D=>nx4597, CLK=>
      clk);
   ix4598 : mux21_ni port map ( Y=>nx4597, A0=>
      mem_Mem_block_modgen_ram_ix60_a_46_dup_254, A1=>bs_data_in(6), S0=>
      nx1156);
   ix7477 : aoi22 port map ( Y=>nx7476, A0=>
      mem_Mem_block_modgen_ram_ix60_a_52_dup_248, A1=>nx1134, B0=>
      mem_Mem_block_modgen_ram_ix60_a_5_dup_295, B1=>nx1120);
   mem_Mem_block_modgen_ram_ix60_ix422 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_52_dup_248, QB=>OPEN, D=>nx4577, CLK=>
      clk);
   ix4578 : mux21_ni port map ( Y=>nx4577, A0=>bs_data_in(6), A1=>
      mem_Mem_block_modgen_ram_ix60_a_52_dup_248, S0=>nx5691);
   mem_Mem_block_modgen_ram_ix60_ix610 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_5_dup_295, QB=>OPEN, D=>nx4567, CLK=>
      clk);
   ix4568 : mux21_ni port map ( Y=>nx4567, A0=>bs_data_in(6), A1=>
      mem_Mem_block_modgen_ram_ix60_a_5_dup_295, S0=>nx5697);
   ix5031 : nand04 port map ( Y=>nx5030, A0=>nx7485, A1=>nx7493, A2=>nx7501, 
      A3=>nx7509);
   ix7486 : aoi22 port map ( Y=>nx7485, A0=>
      mem_Mem_block_modgen_ram_ix60_a_37_dup_263, A1=>nx1098, B0=>
      mem_Mem_block_modgen_ram_ix60_a_21_dup_279, B1=>nx1084);
   mem_Mem_block_modgen_ram_ix60_ix482 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_37_dup_263, QB=>OPEN, D=>nx4557, CLK=>
      clk);
   ix4558 : mux21_ni port map ( Y=>nx4557, A0=>bs_data_in(6), A1=>
      mem_Mem_block_modgen_ram_ix60_a_37_dup_263, S0=>nx5715);
   mem_Mem_block_modgen_ram_ix60_ix546 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_21_dup_279, QB=>OPEN, D=>nx4547, CLK=>
      clk);
   ix4548 : mux21_ni port map ( Y=>nx4547, A0=>bs_data_in(6), A1=>
      mem_Mem_block_modgen_ram_ix60_a_21_dup_279, S0=>nx5725);
   ix7494 : aoi22 port map ( Y=>nx7493, A0=>
      mem_Mem_block_modgen_ram_ix60_a_53_dup_247, A1=>nx1068, B0=>
      mem_Mem_block_modgen_ram_ix60_a_61_dup_239, B1=>nx1048);
   mem_Mem_block_modgen_ram_ix60_ix418 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_53_dup_247, QB=>OPEN, D=>nx4537, CLK=>
      clk);
   ix4538 : mux21_ni port map ( Y=>nx4537, A0=>bs_data_in(6), A1=>
      mem_Mem_block_modgen_ram_ix60_a_53_dup_247, S0=>nx5733);
   mem_Mem_block_modgen_ram_ix60_ix386 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_61_dup_239, QB=>OPEN, D=>nx4527, CLK=>
      clk);
   ix4528 : mux21_ni port map ( Y=>nx4527, A0=>
      mem_Mem_block_modgen_ram_ix60_a_61_dup_239, A1=>bs_data_in(6), S0=>
      nx1040);
   ix7502 : aoi22 port map ( Y=>nx7501, A0=>
      mem_Mem_block_modgen_ram_ix60_a_50_dup_250, A1=>nx1016, B0=>
      mem_Mem_block_modgen_ram_ix60_a_60_dup_240, B1=>nx1030);
   mem_Mem_block_modgen_ram_ix60_ix430 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_50_dup_250, QB=>OPEN, D=>nx4507, CLK=>
      clk);
   ix4508 : mux21_ni port map ( Y=>nx4507, A0=>bs_data_in(6), A1=>
      mem_Mem_block_modgen_ram_ix60_a_50_dup_250, S0=>nx5752);
   mem_Mem_block_modgen_ram_ix60_ix390 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_60_dup_240, QB=>OPEN, D=>nx4517, CLK=>
      clk);
   ix4518 : mux21_ni port map ( Y=>nx4517, A0=>
      mem_Mem_block_modgen_ram_ix60_a_60_dup_240, A1=>bs_data_in(6), S0=>
      nx1022);
   ix7510 : aoi22 port map ( Y=>nx7509, A0=>
      mem_Mem_block_modgen_ram_ix60_a_49_dup_251, A1=>nx1000, B0=>
      mem_Mem_block_modgen_ram_ix60_a_38_dup_262, B1=>nx986);
   mem_Mem_block_modgen_ram_ix60_ix434 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_49_dup_251, QB=>OPEN, D=>nx4497, CLK=>
      clk);
   ix4498 : mux21_ni port map ( Y=>nx4497, A0=>bs_data_in(6), A1=>
      mem_Mem_block_modgen_ram_ix60_a_49_dup_251, S0=>nx5771);
   mem_Mem_block_modgen_ram_ix60_ix478 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_38_dup_262, QB=>OPEN, D=>nx4487, CLK=>
      clk);
   ix4488 : mux21_ni port map ( Y=>nx4487, A0=>bs_data_in(6), A1=>
      mem_Mem_block_modgen_ram_ix60_a_38_dup_262, S0=>nx5779);
   ix4953 : nand04 port map ( Y=>nx4952, A0=>nx7518, A1=>nx7526, A2=>nx7534, 
      A3=>nx7542);
   ix7519 : aoi22 port map ( Y=>nx7518, A0=>
      mem_Mem_block_modgen_ram_ix60_a_2_dup_298, A1=>nx966, B0=>
      mem_Mem_block_modgen_ram_ix60_a_3_dup_297, B1=>nx952);
   mem_Mem_block_modgen_ram_ix60_ix622 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_2_dup_298, QB=>OPEN, D=>nx4477, CLK=>
      clk);
   ix4478 : mux21_ni port map ( Y=>nx4477, A0=>bs_data_in(6), A1=>
      mem_Mem_block_modgen_ram_ix60_a_2_dup_298, S0=>nx5790);
   mem_Mem_block_modgen_ram_ix60_ix618 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_3_dup_297, QB=>OPEN, D=>nx4467, CLK=>
      clk);
   ix4468 : mux21_ni port map ( Y=>nx4467, A0=>bs_data_in(6), A1=>
      mem_Mem_block_modgen_ram_ix60_a_3_dup_297, S0=>nx5799);
   ix7527 : aoi22 port map ( Y=>nx7526, A0=>
      mem_Mem_block_modgen_ram_ix60_a_31_dup_269, A1=>nx936, B0=>
      mem_Mem_block_modgen_ram_ix60_a_29_dup_271, B1=>nx922);
   mem_Mem_block_modgen_ram_ix60_ix506 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_31_dup_269, QB=>OPEN, D=>nx4457, CLK=>
      clk);
   ix4458 : mux21_ni port map ( Y=>nx4457, A0=>
      mem_Mem_block_modgen_ram_ix60_a_31_dup_269, A1=>bs_data_in(6), S0=>
      nx928);
   mem_Mem_block_modgen_ram_ix60_ix514 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_29_dup_271, QB=>OPEN, D=>nx4447, CLK=>
      clk);
   ix4448 : mux21_ni port map ( Y=>nx4447, A0=>
      mem_Mem_block_modgen_ram_ix60_a_29_dup_271, A1=>bs_data_in(6), S0=>
      nx914);
   ix7535 : aoi22 port map ( Y=>nx7534, A0=>
      mem_Mem_block_modgen_ram_ix60_a_40_dup_260, A1=>nx904, B0=>
      mem_Mem_block_modgen_ram_ix60_a_48_dup_252, B1=>nx890);
   mem_Mem_block_modgen_ram_ix60_ix470 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_40_dup_260, QB=>OPEN, D=>nx4437, CLK=>
      clk);
   ix4438 : mux21_ni port map ( Y=>nx4437, A0=>
      mem_Mem_block_modgen_ram_ix60_a_40_dup_260, A1=>bs_data_in(6), S0=>
      nx896);
   mem_Mem_block_modgen_ram_ix60_ix438 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_48_dup_252, QB=>OPEN, D=>nx4427, CLK=>
      clk);
   ix4428 : mux21_ni port map ( Y=>nx4427, A0=>bs_data_in(6), A1=>
      mem_Mem_block_modgen_ram_ix60_a_48_dup_252, S0=>nx5836);
   ix7543 : aoi22 port map ( Y=>nx7542, A0=>
      mem_Mem_block_modgen_ram_ix60_a_32_dup_268, A1=>nx874, B0=>
      mem_Mem_block_modgen_ram_ix60_a_44_dup_256, B1=>nx860);
   mem_Mem_block_modgen_ram_ix60_ix502 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_32_dup_268, QB=>OPEN, D=>nx4417, CLK=>
      clk);
   ix4418 : mux21_ni port map ( Y=>nx4417, A0=>bs_data_in(6), A1=>
      mem_Mem_block_modgen_ram_ix60_a_32_dup_268, S0=>nx5846);
   mem_Mem_block_modgen_ram_ix60_ix454 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_44_dup_256, QB=>OPEN, D=>nx4407, CLK=>
      clk);
   ix4408 : mux21_ni port map ( Y=>nx4407, A0=>
      mem_Mem_block_modgen_ram_ix60_a_44_dup_256, A1=>bs_data_in(6), S0=>
      nx852);
   ix7551 : nor04 port map ( Y=>nx7550, A0=>nx4870, A1=>nx4792, A2=>nx4712, 
      A3=>nx4634);
   ix4871 : nand04 port map ( Y=>nx4870, A0=>nx7553, A1=>nx7561, A2=>nx7569, 
      A3=>nx7577);
   ix7554 : aoi22 port map ( Y=>nx7553, A0=>
      mem_Mem_block_modgen_ram_ix60_a_55_dup_245, A1=>nx820, B0=>
      mem_Mem_block_modgen_ram_ix60_a_45_dup_255, B1=>nx836);
   mem_Mem_block_modgen_ram_ix60_ix410 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_55_dup_245, QB=>OPEN, D=>nx4387, CLK=>
      clk);
   ix4388 : mux21_ni port map ( Y=>nx4387, A0=>bs_data_in(6), A1=>
      mem_Mem_block_modgen_ram_ix60_a_55_dup_245, S0=>nx5864);
   mem_Mem_block_modgen_ram_ix60_ix450 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_45_dup_255, QB=>OPEN, D=>nx4397, CLK=>
      clk);
   ix4398 : mux21_ni port map ( Y=>nx4397, A0=>
      mem_Mem_block_modgen_ram_ix60_a_45_dup_255, A1=>bs_data_in(6), S0=>
      nx828);
   ix7562 : aoi22 port map ( Y=>nx7561, A0=>
      mem_Mem_block_modgen_ram_ix60_a_39_dup_261, A1=>nx804, B0=>
      mem_Mem_block_modgen_ram_ix60_a_8_dup_292, B1=>nx784);
   mem_Mem_block_modgen_ram_ix60_ix474 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_39_dup_261, QB=>OPEN, D=>nx4377, CLK=>
      clk);
   ix4378 : mux21_ni port map ( Y=>nx4377, A0=>bs_data_in(6), A1=>
      mem_Mem_block_modgen_ram_ix60_a_39_dup_261, S0=>nx5877);
   mem_Mem_block_modgen_ram_ix60_ix598 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_8_dup_292, QB=>OPEN, D=>nx4367, CLK=>
      clk);
   ix4368 : mux21_ni port map ( Y=>nx4367, A0=>
      mem_Mem_block_modgen_ram_ix60_a_8_dup_292, A1=>bs_data_in(6), S0=>
      nx774);
   ix7570 : aoi22 port map ( Y=>nx7569, A0=>
      mem_Mem_block_modgen_ram_ix60_a_12_dup_288, A1=>nx764, B0=>
      mem_Mem_block_modgen_ram_ix60_a_22_dup_278, B1=>nx748);
   mem_Mem_block_modgen_ram_ix60_ix582 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_12_dup_288, QB=>OPEN, D=>nx4357, CLK=>
      clk);
   ix4358 : mux21_ni port map ( Y=>nx4357, A0=>
      mem_Mem_block_modgen_ram_ix60_a_12_dup_288, A1=>bs_data_in(6), S0=>
      nx754);
   mem_Mem_block_modgen_ram_ix60_ix542 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_22_dup_278, QB=>OPEN, D=>nx4347, CLK=>
      clk);
   ix4348 : mux21_ni port map ( Y=>nx4347, A0=>bs_data_in(6), A1=>
      mem_Mem_block_modgen_ram_ix60_a_22_dup_278, S0=>nx5895);
   ix7578 : aoi22 port map ( Y=>nx7577, A0=>
      mem_Mem_block_modgen_ram_ix60_a_58_dup_242, A1=>nx712, B0=>
      mem_Mem_block_modgen_ram_ix60_a_6_dup_294, B1=>nx732);
   mem_Mem_block_modgen_ram_ix60_ix398 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_58_dup_242, QB=>OPEN, D=>nx4327, CLK=>
      clk);
   ix4328 : mux21_ni port map ( Y=>nx4327, A0=>
      mem_Mem_block_modgen_ram_ix60_a_58_dup_242, A1=>bs_data_in(6), S0=>
      nx704);
   mem_Mem_block_modgen_ram_ix60_ix606 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_6_dup_294, QB=>OPEN, D=>nx4337, CLK=>
      clk);
   ix4338 : mux21_ni port map ( Y=>nx4337, A0=>bs_data_in(6), A1=>
      mem_Mem_block_modgen_ram_ix60_a_6_dup_294, S0=>nx5908);
   ix4793 : nand04 port map ( Y=>nx4792, A0=>nx7586, A1=>nx7594, A2=>nx7602, 
      A3=>nx7610);
   ix7587 : aoi22 port map ( Y=>nx7586, A0=>
      mem_Mem_block_modgen_ram_ix60_a_25_dup_275, A1=>nx692, B0=>
      mem_Mem_block_modgen_ram_ix60_a_62_dup_238, B1=>nx678);
   mem_Mem_block_modgen_ram_ix60_ix530 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_25_dup_275, QB=>OPEN, D=>nx4317, CLK=>
      clk);
   ix4318 : mux21_ni port map ( Y=>nx4317, A0=>
      mem_Mem_block_modgen_ram_ix60_a_25_dup_275, A1=>bs_data_in(6), S0=>
      nx684);
   mem_Mem_block_modgen_ram_ix60_ix382 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_62_dup_238, QB=>OPEN, D=>nx4307, CLK=>
      clk);
   ix4308 : mux21_ni port map ( Y=>nx4307, A0=>
      mem_Mem_block_modgen_ram_ix60_a_62_dup_238, A1=>bs_data_in(6), S0=>
      nx670);
   ix7595 : aoi22 port map ( Y=>nx7594, A0=>
      mem_Mem_block_modgen_ram_ix60_a_33_dup_267, A1=>nx644, B0=>
      mem_Mem_block_modgen_ram_ix60_a_63_dup_237, B1=>nx662);
   mem_Mem_block_modgen_ram_ix60_ix498 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_33_dup_267, QB=>OPEN, D=>nx4287, CLK=>
      clk);
   ix4288 : mux21_ni port map ( Y=>nx4287, A0=>bs_data_in(6), A1=>
      mem_Mem_block_modgen_ram_ix60_a_33_dup_267, S0=>nx5929);
   mem_Mem_block_modgen_ram_ix60_ix378 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_63_dup_237, QB=>OPEN, D=>nx4297, CLK=>
      clk);
   ix4298 : mux21_ni port map ( Y=>nx4297, A0=>
      mem_Mem_block_modgen_ram_ix60_a_63_dup_237, A1=>bs_data_in(6), S0=>
      nx650);
   ix7603 : aoi22 port map ( Y=>nx7602, A0=>
      mem_Mem_block_modgen_ram_ix60_a_41_dup_259, A1=>nx626, B0=>
      mem_Mem_block_modgen_ram_ix60_a_1_dup_299, B1=>nx612);
   mem_Mem_block_modgen_ram_ix60_ix466 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_41_dup_259, QB=>OPEN, D=>nx4277, CLK=>
      clk);
   ix4278 : mux21_ni port map ( Y=>nx4277, A0=>
      mem_Mem_block_modgen_ram_ix60_a_41_dup_259, A1=>bs_data_in(6), S0=>
      nx618);
   mem_Mem_block_modgen_ram_ix60_ix626 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_1_dup_299, QB=>OPEN, D=>nx4267, CLK=>
      clk);
   ix4268 : mux21_ni port map ( Y=>nx4267, A0=>bs_data_in(6), A1=>
      mem_Mem_block_modgen_ram_ix60_a_1_dup_299, S0=>nx5947);
   ix7611 : aoi22 port map ( Y=>nx7610, A0=>
      mem_Mem_block_modgen_ram_ix60_a_43_dup_257, A1=>nx580, B0=>
      mem_Mem_block_modgen_ram_ix60_a_0_dup_300, B1=>nx596);
   mem_Mem_block_modgen_ram_ix60_ix458 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_43_dup_257, QB=>OPEN, D=>nx4247, CLK=>
      clk);
   ix4248 : mux21_ni port map ( Y=>nx4247, A0=>
      mem_Mem_block_modgen_ram_ix60_a_43_dup_257, A1=>bs_data_in(6), S0=>
      nx572);
   mem_Mem_block_modgen_ram_ix60_ix630 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_0_dup_300, QB=>OPEN, D=>nx4257, CLK=>
      clk);
   ix4258 : mux21_ni port map ( Y=>nx4257, A0=>bs_data_in(6), A1=>
      mem_Mem_block_modgen_ram_ix60_a_0_dup_300, S0=>nx5960);
   ix4713 : nand04 port map ( Y=>nx4712, A0=>nx7619, A1=>nx7627, A2=>nx7635, 
      A3=>nx7643);
   ix7620 : aoi22 port map ( Y=>nx7619, A0=>
      mem_Mem_block_modgen_ram_ix60_a_34_dup_266, A1=>nx558, B0=>
      mem_Mem_block_modgen_ram_ix60_a_47_dup_253, B1=>nx542);
   mem_Mem_block_modgen_ram_ix60_ix494 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_34_dup_266, QB=>OPEN, D=>nx4237, CLK=>
      clk);
   ix4238 : mux21_ni port map ( Y=>nx4237, A0=>bs_data_in(6), A1=>
      mem_Mem_block_modgen_ram_ix60_a_34_dup_266, S0=>nx5969);
   mem_Mem_block_modgen_ram_ix60_ix442 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_47_dup_253, QB=>OPEN, D=>nx4227, CLK=>
      clk);
   ix4228 : mux21_ni port map ( Y=>nx4227, A0=>
      mem_Mem_block_modgen_ram_ix60_a_47_dup_253, A1=>bs_data_in(6), S0=>
      nx532);
   ix7628 : aoi22 port map ( Y=>nx7627, A0=>
      mem_Mem_block_modgen_ram_ix60_a_59_dup_241, A1=>nx506, B0=>
      mem_Mem_block_modgen_ram_ix60_a_24_dup_276, B1=>nx522);
   mem_Mem_block_modgen_ram_ix60_ix394 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_59_dup_241, QB=>OPEN, D=>nx4207, CLK=>
      clk);
   ix4208 : mux21_ni port map ( Y=>nx4207, A0=>
      mem_Mem_block_modgen_ram_ix60_a_59_dup_241, A1=>bs_data_in(6), S0=>
      nx498);
   mem_Mem_block_modgen_ram_ix60_ix534 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_24_dup_276, QB=>OPEN, D=>nx4217, CLK=>
      clk);
   ix4218 : mux21_ni port map ( Y=>nx4217, A0=>
      mem_Mem_block_modgen_ram_ix60_a_24_dup_276, A1=>bs_data_in(6), S0=>
      nx514);
   ix7636 : aoi22 port map ( Y=>nx7635, A0=>
      mem_Mem_block_modgen_ram_ix60_a_57_dup_243, A1=>nx472, B0=>
      mem_Mem_block_modgen_ram_ix60_a_17_dup_283, B1=>nx488);
   mem_Mem_block_modgen_ram_ix60_ix402 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_57_dup_243, QB=>OPEN, D=>nx4187, CLK=>
      clk);
   ix4188 : mux21_ni port map ( Y=>nx4187, A0=>
      mem_Mem_block_modgen_ram_ix60_a_57_dup_243, A1=>bs_data_in(6), S0=>
      nx458);
   mem_Mem_block_modgen_ram_ix60_ix562 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_17_dup_283, QB=>OPEN, D=>nx4197, CLK=>
      clk);
   ix4198 : mux21_ni port map ( Y=>nx4197, A0=>bs_data_in(6), A1=>
      mem_Mem_block_modgen_ram_ix60_a_17_dup_283, S0=>nx5999);
   ix7644 : aoi22 port map ( Y=>nx7643, A0=>
      mem_Mem_block_modgen_ram_ix60_a_35_dup_265, A1=>nx444, B0=>
      mem_Mem_block_modgen_ram_ix60_a_28_dup_272, B1=>nx428);
   mem_Mem_block_modgen_ram_ix60_ix490 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_35_dup_265, QB=>OPEN, D=>nx4177, CLK=>
      clk);
   ix4178 : mux21_ni port map ( Y=>nx4177, A0=>bs_data_in(6), A1=>
      mem_Mem_block_modgen_ram_ix60_a_35_dup_265, S0=>nx6007);
   mem_Mem_block_modgen_ram_ix60_ix518 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_28_dup_272, QB=>OPEN, D=>nx4167, CLK=>
      clk);
   ix4168 : mux21_ni port map ( Y=>nx4167, A0=>
      mem_Mem_block_modgen_ram_ix60_a_28_dup_272, A1=>bs_data_in(6), S0=>
      nx420);
   ix4635 : nand04 port map ( Y=>nx4634, A0=>nx7652, A1=>nx7660, A2=>nx7668, 
      A3=>nx7676);
   ix7653 : aoi22 port map ( Y=>nx7652, A0=>
      mem_Mem_block_modgen_ram_ix60_a_51_dup_249, A1=>nx406, B0=>
      mem_Mem_block_modgen_ram_ix60_a_27_dup_273, B1=>nx384);
   mem_Mem_block_modgen_ram_ix60_ix426 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_51_dup_249, QB=>OPEN, D=>nx4157, CLK=>
      clk);
   ix4158 : mux21_ni port map ( Y=>nx4157, A0=>bs_data_in(6), A1=>
      mem_Mem_block_modgen_ram_ix60_a_51_dup_249, S0=>nx6021);
   mem_Mem_block_modgen_ram_ix60_ix522 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_27_dup_273, QB=>OPEN, D=>nx4147, CLK=>
      clk);
   ix4148 : mux21_ni port map ( Y=>nx4147, A0=>
      mem_Mem_block_modgen_ram_ix60_a_27_dup_273, A1=>bs_data_in(6), S0=>
      nx374);
   ix7661 : aoi22 port map ( Y=>nx7660, A0=>
      mem_Mem_block_modgen_ram_ix60_a_30_dup_270, A1=>nx348, B0=>
      mem_Mem_block_modgen_ram_ix60_a_16_dup_284, B1=>nx364);
   mem_Mem_block_modgen_ram_ix60_ix510 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_30_dup_270, QB=>OPEN, D=>nx4127, CLK=>
      clk);
   ix4128 : mux21_ni port map ( Y=>nx4127, A0=>
      mem_Mem_block_modgen_ram_ix60_a_30_dup_270, A1=>bs_data_in(6), S0=>
      nx336);
   mem_Mem_block_modgen_ram_ix60_ix566 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_16_dup_284, QB=>OPEN, D=>nx4137, CLK=>
      clk);
   ix4138 : mux21_ni port map ( Y=>nx4137, A0=>bs_data_in(6), A1=>
      mem_Mem_block_modgen_ram_ix60_a_16_dup_284, S0=>nx6039);
   ix7669 : aoi22 port map ( Y=>nx7668, A0=>
      mem_Mem_block_modgen_ram_ix60_a_42_dup_258, A1=>nx318, B0=>
      mem_Mem_block_modgen_ram_ix60_a_36_dup_264, B1=>nx284);
   mem_Mem_block_modgen_ram_ix60_ix462 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_42_dup_258, QB=>OPEN, D=>nx4117, CLK=>
      clk);
   ix4118 : mux21_ni port map ( Y=>nx4117, A0=>
      mem_Mem_block_modgen_ram_ix60_a_42_dup_258, A1=>bs_data_in(6), S0=>
      nx300);
   mem_Mem_block_modgen_ram_ix60_ix486 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_36_dup_264, QB=>OPEN, D=>nx4107, CLK=>
      clk);
   ix4108 : mux21_ni port map ( Y=>nx4107, A0=>bs_data_in(6), A1=>
      mem_Mem_block_modgen_ram_ix60_a_36_dup_264, S0=>nx6052);
   ix7677 : aoi22 port map ( Y=>nx7676, A0=>
      mem_Mem_block_modgen_ram_ix60_a_4_dup_296, A1=>nx212, B0=>
      mem_Mem_block_modgen_ram_ix60_a_19_dup_281, B1=>nx256);
   mem_Mem_block_modgen_ram_ix60_ix614 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_4_dup_296, QB=>OPEN, D=>nx4087, CLK=>
      clk);
   ix4088 : mux21_ni port map ( Y=>nx4087, A0=>bs_data_in(6), A1=>
      mem_Mem_block_modgen_ram_ix60_a_4_dup_296, S0=>nx6060);
   mem_Mem_block_modgen_ram_ix60_ix554 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_19_dup_281, QB=>OPEN, D=>nx4097, CLK=>
      clk);
   ix4098 : mux21_ni port map ( Y=>nx4097, A0=>bs_data_in(6), A1=>
      mem_Mem_block_modgen_ram_ix60_a_19_dup_281, S0=>nx6066);
   ix5833 : nand02 port map ( Y=>ds_data_out(7), A0=>nx7685, A1=>nx7819);
   ix7686 : nor04 port map ( Y=>nx7685, A0=>nx5826, A1=>nx5748, A2=>nx5668, 
      A3=>nx5590);
   ix5827 : nand04 port map ( Y=>nx5826, A0=>nx7688, A1=>nx7696, A2=>nx7704, 
      A3=>nx7712);
   ix7689 : aoi22 port map ( Y=>nx7688, A0=>
      mem_Mem_block_modgen_ram_ix60_a_14, A1=>nx1352, B0=>
      mem_Mem_block_modgen_ram_ix60_a_23, B1=>nx1338);
   mem_Mem_block_modgen_ram_ix60_ix314 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_14, QB=>OPEN, D=>nx5357, CLK=>clk);
   ix5358 : mux21_ni port map ( Y=>nx5357, A0=>
      mem_Mem_block_modgen_ram_ix60_a_14, A1=>bs_data_in(7), S0=>nx1344);
   mem_Mem_block_modgen_ram_ix60_ix278 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_23, QB=>OPEN, D=>nx5347, CLK=>clk);
   ix5348 : mux21_ni port map ( Y=>nx5347, A0=>bs_data_in(7), A1=>
      mem_Mem_block_modgen_ram_ix60_a_23, S0=>nx5474);
   ix7697 : aoi22 port map ( Y=>nx7696, A0=>
      mem_Mem_block_modgen_ram_ix60_a_15, A1=>nx1308, B0=>
      mem_Mem_block_modgen_ram_ix60_a_7, B1=>nx1322);
   mem_Mem_block_modgen_ram_ix60_ix310 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_15, QB=>OPEN, D=>nx5327, CLK=>clk);
   ix5328 : mux21_ni port map ( Y=>nx5327, A0=>
      mem_Mem_block_modgen_ram_ix60_a_15, A1=>bs_data_in(7), S0=>nx1300);
   mem_Mem_block_modgen_ram_ix60_ix342 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_7, QB=>OPEN, D=>nx5337, CLK=>clk);
   ix5338 : mux21_ni port map ( Y=>nx5337, A0=>bs_data_in(7), A1=>
      mem_Mem_block_modgen_ram_ix60_a_7, S0=>nx5527);
   ix7705 : aoi22 port map ( Y=>nx7704, A0=>
      mem_Mem_block_modgen_ram_ix60_a_10, A1=>nx1290, B0=>
      mem_Mem_block_modgen_ram_ix60_a_9, B1=>nx1276);
   mem_Mem_block_modgen_ram_ix60_ix330 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_10, QB=>OPEN, D=>nx5317, CLK=>clk);
   ix5318 : mux21_ni port map ( Y=>nx5317, A0=>
      mem_Mem_block_modgen_ram_ix60_a_10, A1=>bs_data_in(7), S0=>nx1282);
   mem_Mem_block_modgen_ram_ix60_ix334 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_9, QB=>OPEN, D=>nx5307, CLK=>clk);
   ix5308 : mux21_ni port map ( Y=>nx5307, A0=>
      mem_Mem_block_modgen_ram_ix60_a_9, A1=>bs_data_in(7), S0=>nx1268);
   ix7713 : aoi22 port map ( Y=>nx7712, A0=>
      mem_Mem_block_modgen_ram_ix60_a_54, A1=>nx1246, B0=>
      mem_Mem_block_modgen_ram_ix60_a_13, B1=>nx1260);
   mem_Mem_block_modgen_ram_ix60_ix154 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_54, QB=>OPEN, D=>nx5287, CLK=>clk);
   ix5288 : mux21_ni port map ( Y=>nx5287, A0=>bs_data_in(7), A1=>
      mem_Mem_block_modgen_ram_ix60_a_54, S0=>nx5569);
   mem_Mem_block_modgen_ram_ix60_ix318 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_13, QB=>OPEN, D=>nx5297, CLK=>clk);
   ix5298 : mux21_ni port map ( Y=>nx5297, A0=>
      mem_Mem_block_modgen_ram_ix60_a_13, A1=>bs_data_in(7), S0=>nx1252);
   ix5749 : nand04 port map ( Y=>nx5748, A0=>nx7721, A1=>nx7729, A2=>nx7737, 
      A3=>nx7745);
   ix7722 : aoi22 port map ( Y=>nx7721, A0=>
      mem_Mem_block_modgen_ram_ix60_a_18, A1=>nx1226, B0=>
      mem_Mem_block_modgen_ram_ix60_a_11, B1=>nx1212);
   mem_Mem_block_modgen_ram_ix60_ix298 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_18, QB=>OPEN, D=>nx5277, CLK=>clk);
   ix5278 : mux21_ni port map ( Y=>nx5277, A0=>bs_data_in(7), A1=>
      mem_Mem_block_modgen_ram_ix60_a_18, S0=>nx5603);
   mem_Mem_block_modgen_ram_ix60_ix326 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_11, QB=>OPEN, D=>nx5267, CLK=>clk);
   ix5268 : mux21_ni port map ( Y=>nx5267, A0=>
      mem_Mem_block_modgen_ram_ix60_a_11, A1=>bs_data_in(7), S0=>nx1204);
   ix7730 : aoi22 port map ( Y=>nx7729, A0=>
      mem_Mem_block_modgen_ram_ix60_a_56, A1=>nx1196, B0=>
      mem_Mem_block_modgen_ram_ix60_a_26, B1=>nx1182);
   mem_Mem_block_modgen_ram_ix60_ix146 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_56, QB=>OPEN, D=>nx5257, CLK=>clk);
   ix5258 : mux21_ni port map ( Y=>nx5257, A0=>
      mem_Mem_block_modgen_ram_ix60_a_56, A1=>bs_data_in(7), S0=>nx1188);
   mem_Mem_block_modgen_ram_ix60_ix266 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_26, QB=>OPEN, D=>nx5247, CLK=>clk);
   ix5248 : mux21_ni port map ( Y=>nx5247, A0=>
      mem_Mem_block_modgen_ram_ix60_a_26, A1=>bs_data_in(7), S0=>nx1174);
   ix7738 : aoi22 port map ( Y=>nx7737, A0=>
      mem_Mem_block_modgen_ram_ix60_a_20, A1=>nx1150, B0=>
      mem_Mem_block_modgen_ram_ix60_a_46, B1=>nx1164);
   mem_Mem_block_modgen_ram_ix60_ix290 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_20, QB=>OPEN, D=>nx5227, CLK=>clk);
   ix5228 : mux21_ni port map ( Y=>nx5227, A0=>bs_data_in(7), A1=>
      mem_Mem_block_modgen_ram_ix60_a_20, S0=>nx5663);
   mem_Mem_block_modgen_ram_ix60_ix186 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_46, QB=>OPEN, D=>nx5237, CLK=>clk);
   ix5238 : mux21_ni port map ( Y=>nx5237, A0=>
      mem_Mem_block_modgen_ram_ix60_a_46, A1=>bs_data_in(7), S0=>nx1156);
   ix7746 : aoi22 port map ( Y=>nx7745, A0=>
      mem_Mem_block_modgen_ram_ix60_a_52, A1=>nx1134, B0=>
      mem_Mem_block_modgen_ram_ix60_a_5_dup_231, B1=>nx1120);
   mem_Mem_block_modgen_ram_ix60_ix162 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_52, QB=>OPEN, D=>nx5217, CLK=>clk);
   ix5218 : mux21_ni port map ( Y=>nx5217, A0=>bs_data_in(7), A1=>
      mem_Mem_block_modgen_ram_ix60_a_52, S0=>nx5691);
   mem_Mem_block_modgen_ram_ix60_ix350 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_5_dup_231, QB=>OPEN, D=>nx5207, CLK=>
      clk);
   ix5208 : mux21_ni port map ( Y=>nx5207, A0=>bs_data_in(7), A1=>
      mem_Mem_block_modgen_ram_ix60_a_5_dup_231, S0=>nx5697);
   ix5669 : nand04 port map ( Y=>nx5668, A0=>nx7754, A1=>nx7762, A2=>nx7770, 
      A3=>nx7778);
   ix7755 : aoi22 port map ( Y=>nx7754, A0=>
      mem_Mem_block_modgen_ram_ix60_a_37, A1=>nx1098, B0=>
      mem_Mem_block_modgen_ram_ix60_a_21, B1=>nx1084);
   mem_Mem_block_modgen_ram_ix60_ix222 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_37, QB=>OPEN, D=>nx5197, CLK=>clk);
   ix5198 : mux21_ni port map ( Y=>nx5197, A0=>bs_data_in(7), A1=>
      mem_Mem_block_modgen_ram_ix60_a_37, S0=>nx5715);
   mem_Mem_block_modgen_ram_ix60_ix286 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_21, QB=>OPEN, D=>nx5187, CLK=>clk);
   ix5188 : mux21_ni port map ( Y=>nx5187, A0=>bs_data_in(7), A1=>
      mem_Mem_block_modgen_ram_ix60_a_21, S0=>nx5725);
   ix7763 : aoi22 port map ( Y=>nx7762, A0=>
      mem_Mem_block_modgen_ram_ix60_a_53, A1=>nx1068, B0=>
      mem_Mem_block_modgen_ram_ix60_a_61, B1=>nx1048);
   mem_Mem_block_modgen_ram_ix60_ix158 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_53, QB=>OPEN, D=>nx5177, CLK=>clk);
   ix5178 : mux21_ni port map ( Y=>nx5177, A0=>bs_data_in(7), A1=>
      mem_Mem_block_modgen_ram_ix60_a_53, S0=>nx5733);
   mem_Mem_block_modgen_ram_ix60_ix126 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_61, QB=>OPEN, D=>nx5167, CLK=>clk);
   ix5168 : mux21_ni port map ( Y=>nx5167, A0=>
      mem_Mem_block_modgen_ram_ix60_a_61, A1=>bs_data_in(7), S0=>nx1040);
   ix7771 : aoi22 port map ( Y=>nx7770, A0=>
      mem_Mem_block_modgen_ram_ix60_a_50, A1=>nx1016, B0=>
      mem_Mem_block_modgen_ram_ix60_a_60, B1=>nx1030);
   mem_Mem_block_modgen_ram_ix60_ix170 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_50, QB=>OPEN, D=>nx5147, CLK=>clk);
   ix5148 : mux21_ni port map ( Y=>nx5147, A0=>bs_data_in(7), A1=>
      mem_Mem_block_modgen_ram_ix60_a_50, S0=>nx5752);
   mem_Mem_block_modgen_ram_ix60_ix130 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_60, QB=>OPEN, D=>nx5157, CLK=>clk);
   ix5158 : mux21_ni port map ( Y=>nx5157, A0=>
      mem_Mem_block_modgen_ram_ix60_a_60, A1=>bs_data_in(7), S0=>nx1022);
   ix7779 : aoi22 port map ( Y=>nx7778, A0=>
      mem_Mem_block_modgen_ram_ix60_a_49, A1=>nx1000, B0=>
      mem_Mem_block_modgen_ram_ix60_a_38, B1=>nx986);
   mem_Mem_block_modgen_ram_ix60_ix174 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_49, QB=>OPEN, D=>nx5137, CLK=>clk);
   ix5138 : mux21_ni port map ( Y=>nx5137, A0=>bs_data_in(7), A1=>
      mem_Mem_block_modgen_ram_ix60_a_49, S0=>nx5771);
   mem_Mem_block_modgen_ram_ix60_ix218 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_38, QB=>OPEN, D=>nx5127, CLK=>clk);
   ix5128 : mux21_ni port map ( Y=>nx5127, A0=>bs_data_in(7), A1=>
      mem_Mem_block_modgen_ram_ix60_a_38, S0=>nx5779);
   ix5591 : nand04 port map ( Y=>nx5590, A0=>nx7787, A1=>nx7795, A2=>nx7803, 
      A3=>nx7811);
   ix7788 : aoi22 port map ( Y=>nx7787, A0=>
      mem_Mem_block_modgen_ram_ix60_a_2_dup_234, A1=>nx966, B0=>
      mem_Mem_block_modgen_ram_ix60_a_3_dup_233, B1=>nx952);
   mem_Mem_block_modgen_ram_ix60_ix362 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_2_dup_234, QB=>OPEN, D=>nx5117, CLK=>
      clk);
   ix5118 : mux21_ni port map ( Y=>nx5117, A0=>bs_data_in(7), A1=>
      mem_Mem_block_modgen_ram_ix60_a_2_dup_234, S0=>nx5790);
   mem_Mem_block_modgen_ram_ix60_ix358 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_3_dup_233, QB=>OPEN, D=>nx5107, CLK=>
      clk);
   ix5108 : mux21_ni port map ( Y=>nx5107, A0=>bs_data_in(7), A1=>
      mem_Mem_block_modgen_ram_ix60_a_3_dup_233, S0=>nx5799);
   ix7796 : aoi22 port map ( Y=>nx7795, A0=>
      mem_Mem_block_modgen_ram_ix60_a_31, A1=>nx936, B0=>
      mem_Mem_block_modgen_ram_ix60_a_29, B1=>nx922);
   mem_Mem_block_modgen_ram_ix60_ix246 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_31, QB=>OPEN, D=>nx5097, CLK=>clk);
   ix5098 : mux21_ni port map ( Y=>nx5097, A0=>
      mem_Mem_block_modgen_ram_ix60_a_31, A1=>bs_data_in(7), S0=>nx928);
   mem_Mem_block_modgen_ram_ix60_ix254 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_29, QB=>OPEN, D=>nx5087, CLK=>clk);
   ix5088 : mux21_ni port map ( Y=>nx5087, A0=>
      mem_Mem_block_modgen_ram_ix60_a_29, A1=>bs_data_in(7), S0=>nx914);
   ix7804 : aoi22 port map ( Y=>nx7803, A0=>
      mem_Mem_block_modgen_ram_ix60_a_40, A1=>nx904, B0=>
      mem_Mem_block_modgen_ram_ix60_a_48, B1=>nx890);
   mem_Mem_block_modgen_ram_ix60_ix210 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_40, QB=>OPEN, D=>nx5077, CLK=>clk);
   ix5078 : mux21_ni port map ( Y=>nx5077, A0=>
      mem_Mem_block_modgen_ram_ix60_a_40, A1=>bs_data_in(7), S0=>nx896);
   mem_Mem_block_modgen_ram_ix60_ix178 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_48, QB=>OPEN, D=>nx5067, CLK=>clk);
   ix5068 : mux21_ni port map ( Y=>nx5067, A0=>bs_data_in(7), A1=>
      mem_Mem_block_modgen_ram_ix60_a_48, S0=>nx5836);
   ix7812 : aoi22 port map ( Y=>nx7811, A0=>
      mem_Mem_block_modgen_ram_ix60_a_32, A1=>nx874, B0=>
      mem_Mem_block_modgen_ram_ix60_a_44, B1=>nx860);
   mem_Mem_block_modgen_ram_ix60_ix242 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_32, QB=>OPEN, D=>nx5057, CLK=>clk);
   ix5058 : mux21_ni port map ( Y=>nx5057, A0=>bs_data_in(7), A1=>
      mem_Mem_block_modgen_ram_ix60_a_32, S0=>nx5846);
   mem_Mem_block_modgen_ram_ix60_ix194 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_44, QB=>OPEN, D=>nx5047, CLK=>clk);
   ix5048 : mux21_ni port map ( Y=>nx5047, A0=>
      mem_Mem_block_modgen_ram_ix60_a_44, A1=>bs_data_in(7), S0=>nx852);
   ix7820 : nor04 port map ( Y=>nx7819, A0=>nx5508, A1=>nx5430, A2=>nx5350, 
      A3=>nx5272);
   ix5509 : nand04 port map ( Y=>nx5508, A0=>nx7822, A1=>nx7830, A2=>nx7838, 
      A3=>nx7846);
   ix7823 : aoi22 port map ( Y=>nx7822, A0=>
      mem_Mem_block_modgen_ram_ix60_a_55, A1=>nx820, B0=>
      mem_Mem_block_modgen_ram_ix60_a_45, B1=>nx836);
   mem_Mem_block_modgen_ram_ix60_ix150 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_55, QB=>OPEN, D=>nx5027, CLK=>clk);
   ix5028 : mux21_ni port map ( Y=>nx5027, A0=>bs_data_in(7), A1=>
      mem_Mem_block_modgen_ram_ix60_a_55, S0=>nx5864);
   mem_Mem_block_modgen_ram_ix60_ix190 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_45, QB=>OPEN, D=>nx5037, CLK=>clk);
   ix5038 : mux21_ni port map ( Y=>nx5037, A0=>
      mem_Mem_block_modgen_ram_ix60_a_45, A1=>bs_data_in(7), S0=>nx828);
   ix7831 : aoi22 port map ( Y=>nx7830, A0=>
      mem_Mem_block_modgen_ram_ix60_a_39, A1=>nx804, B0=>
      mem_Mem_block_modgen_ram_ix60_a_8, B1=>nx784);
   mem_Mem_block_modgen_ram_ix60_ix214 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_39, QB=>OPEN, D=>nx5017, CLK=>clk);
   ix5018 : mux21_ni port map ( Y=>nx5017, A0=>bs_data_in(7), A1=>
      mem_Mem_block_modgen_ram_ix60_a_39, S0=>nx5877);
   mem_Mem_block_modgen_ram_ix60_ix338 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_8, QB=>OPEN, D=>nx5007, CLK=>clk);
   ix5008 : mux21_ni port map ( Y=>nx5007, A0=>
      mem_Mem_block_modgen_ram_ix60_a_8, A1=>bs_data_in(7), S0=>nx774);
   ix7839 : aoi22 port map ( Y=>nx7838, A0=>
      mem_Mem_block_modgen_ram_ix60_a_12, A1=>nx764, B0=>
      mem_Mem_block_modgen_ram_ix60_a_22, B1=>nx748);
   mem_Mem_block_modgen_ram_ix60_ix322 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_12, QB=>OPEN, D=>nx4997, CLK=>clk);
   ix4998 : mux21_ni port map ( Y=>nx4997, A0=>
      mem_Mem_block_modgen_ram_ix60_a_12, A1=>bs_data_in(7), S0=>nx754);
   mem_Mem_block_modgen_ram_ix60_ix282 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_22, QB=>OPEN, D=>nx4987, CLK=>clk);
   ix4988 : mux21_ni port map ( Y=>nx4987, A0=>bs_data_in(7), A1=>
      mem_Mem_block_modgen_ram_ix60_a_22, S0=>nx5895);
   ix7847 : aoi22 port map ( Y=>nx7846, A0=>
      mem_Mem_block_modgen_ram_ix60_a_58, A1=>nx712, B0=>
      mem_Mem_block_modgen_ram_ix60_a_6, B1=>nx732);
   mem_Mem_block_modgen_ram_ix60_ix138 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_58, QB=>OPEN, D=>nx4967, CLK=>clk);
   ix4968 : mux21_ni port map ( Y=>nx4967, A0=>
      mem_Mem_block_modgen_ram_ix60_a_58, A1=>bs_data_in(7), S0=>nx704);
   mem_Mem_block_modgen_ram_ix60_ix346 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_6, QB=>OPEN, D=>nx4977, CLK=>clk);
   ix4978 : mux21_ni port map ( Y=>nx4977, A0=>bs_data_in(7), A1=>
      mem_Mem_block_modgen_ram_ix60_a_6, S0=>nx5908);
   ix5431 : nand04 port map ( Y=>nx5430, A0=>nx7855, A1=>nx7863, A2=>nx7871, 
      A3=>nx7879);
   ix7856 : aoi22 port map ( Y=>nx7855, A0=>
      mem_Mem_block_modgen_ram_ix60_a_25, A1=>nx692, B0=>
      mem_Mem_block_modgen_ram_ix60_a_62, B1=>nx678);
   mem_Mem_block_modgen_ram_ix60_ix270 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_25, QB=>OPEN, D=>nx4957, CLK=>clk);
   ix4958 : mux21_ni port map ( Y=>nx4957, A0=>
      mem_Mem_block_modgen_ram_ix60_a_25, A1=>bs_data_in(7), S0=>nx684);
   mem_Mem_block_modgen_ram_ix60_ix122 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_62, QB=>OPEN, D=>nx4947, CLK=>clk);
   ix4948 : mux21_ni port map ( Y=>nx4947, A0=>
      mem_Mem_block_modgen_ram_ix60_a_62, A1=>bs_data_in(7), S0=>nx670);
   ix7864 : aoi22 port map ( Y=>nx7863, A0=>
      mem_Mem_block_modgen_ram_ix60_a_33, A1=>nx644, B0=>
      mem_Mem_block_modgen_ram_ix60_a_63, B1=>nx662);
   mem_Mem_block_modgen_ram_ix60_ix238 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_33, QB=>OPEN, D=>nx4927, CLK=>clk);
   ix4928 : mux21_ni port map ( Y=>nx4927, A0=>bs_data_in(7), A1=>
      mem_Mem_block_modgen_ram_ix60_a_33, S0=>nx5929);
   mem_Mem_block_modgen_ram_ix60_ix118 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_63, QB=>OPEN, D=>nx4937, CLK=>clk);
   ix4938 : mux21_ni port map ( Y=>nx4937, A0=>
      mem_Mem_block_modgen_ram_ix60_a_63, A1=>bs_data_in(7), S0=>nx650);
   ix7872 : aoi22 port map ( Y=>nx7871, A0=>
      mem_Mem_block_modgen_ram_ix60_a_41, A1=>nx626, B0=>
      mem_Mem_block_modgen_ram_ix60_a_1_dup_235, B1=>nx612);
   mem_Mem_block_modgen_ram_ix60_ix206 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_41, QB=>OPEN, D=>nx4917, CLK=>clk);
   ix4918 : mux21_ni port map ( Y=>nx4917, A0=>
      mem_Mem_block_modgen_ram_ix60_a_41, A1=>bs_data_in(7), S0=>nx618);
   mem_Mem_block_modgen_ram_ix60_ix366 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_1_dup_235, QB=>OPEN, D=>nx4907, CLK=>
      clk);
   ix4908 : mux21_ni port map ( Y=>nx4907, A0=>bs_data_in(7), A1=>
      mem_Mem_block_modgen_ram_ix60_a_1_dup_235, S0=>nx5947);
   ix7880 : aoi22 port map ( Y=>nx7879, A0=>
      mem_Mem_block_modgen_ram_ix60_a_43, A1=>nx580, B0=>
      mem_Mem_block_modgen_ram_ix60_a_0_dup_236, B1=>nx596);
   mem_Mem_block_modgen_ram_ix60_ix198 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_43, QB=>OPEN, D=>nx4887, CLK=>clk);
   ix4888 : mux21_ni port map ( Y=>nx4887, A0=>
      mem_Mem_block_modgen_ram_ix60_a_43, A1=>bs_data_in(7), S0=>nx572);
   mem_Mem_block_modgen_ram_ix60_ix370 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_0_dup_236, QB=>OPEN, D=>nx4897, CLK=>
      clk);
   ix4898 : mux21_ni port map ( Y=>nx4897, A0=>bs_data_in(7), A1=>
      mem_Mem_block_modgen_ram_ix60_a_0_dup_236, S0=>nx5960);
   ix5351 : nand04 port map ( Y=>nx5350, A0=>nx7888, A1=>nx7896, A2=>nx7904, 
      A3=>nx7912);
   ix7889 : aoi22 port map ( Y=>nx7888, A0=>
      mem_Mem_block_modgen_ram_ix60_a_34, A1=>nx558, B0=>
      mem_Mem_block_modgen_ram_ix60_a_47, B1=>nx542);
   mem_Mem_block_modgen_ram_ix60_ix234 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_34, QB=>OPEN, D=>nx4877, CLK=>clk);
   ix4878 : mux21_ni port map ( Y=>nx4877, A0=>bs_data_in(7), A1=>
      mem_Mem_block_modgen_ram_ix60_a_34, S0=>nx5969);
   mem_Mem_block_modgen_ram_ix60_ix182 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_47, QB=>OPEN, D=>nx4867, CLK=>clk);
   ix4868 : mux21_ni port map ( Y=>nx4867, A0=>
      mem_Mem_block_modgen_ram_ix60_a_47, A1=>bs_data_in(7), S0=>nx532);
   ix7897 : aoi22 port map ( Y=>nx7896, A0=>
      mem_Mem_block_modgen_ram_ix60_a_59, A1=>nx506, B0=>
      mem_Mem_block_modgen_ram_ix60_a_24, B1=>nx522);
   mem_Mem_block_modgen_ram_ix60_ix134 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_59, QB=>OPEN, D=>nx4847, CLK=>clk);
   ix4848 : mux21_ni port map ( Y=>nx4847, A0=>
      mem_Mem_block_modgen_ram_ix60_a_59, A1=>bs_data_in(7), S0=>nx498);
   mem_Mem_block_modgen_ram_ix60_ix274 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_24, QB=>OPEN, D=>nx4857, CLK=>clk);
   ix4858 : mux21_ni port map ( Y=>nx4857, A0=>
      mem_Mem_block_modgen_ram_ix60_a_24, A1=>bs_data_in(7), S0=>nx514);
   ix7905 : aoi22 port map ( Y=>nx7904, A0=>
      mem_Mem_block_modgen_ram_ix60_a_57, A1=>nx472, B0=>
      mem_Mem_block_modgen_ram_ix60_a_17, B1=>nx488);
   mem_Mem_block_modgen_ram_ix60_ix142 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_57, QB=>OPEN, D=>nx4827, CLK=>clk);
   ix4828 : mux21_ni port map ( Y=>nx4827, A0=>
      mem_Mem_block_modgen_ram_ix60_a_57, A1=>bs_data_in(7), S0=>nx458);
   mem_Mem_block_modgen_ram_ix60_ix302 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_17, QB=>OPEN, D=>nx4837, CLK=>clk);
   ix4838 : mux21_ni port map ( Y=>nx4837, A0=>bs_data_in(7), A1=>
      mem_Mem_block_modgen_ram_ix60_a_17, S0=>nx5999);
   ix7913 : aoi22 port map ( Y=>nx7912, A0=>
      mem_Mem_block_modgen_ram_ix60_a_35, A1=>nx444, B0=>
      mem_Mem_block_modgen_ram_ix60_a_28, B1=>nx428);
   mem_Mem_block_modgen_ram_ix60_ix230 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_35, QB=>OPEN, D=>nx4817, CLK=>clk);
   ix4818 : mux21_ni port map ( Y=>nx4817, A0=>bs_data_in(7), A1=>
      mem_Mem_block_modgen_ram_ix60_a_35, S0=>nx6007);
   mem_Mem_block_modgen_ram_ix60_ix258 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_28, QB=>OPEN, D=>nx4807, CLK=>clk);
   ix4808 : mux21_ni port map ( Y=>nx4807, A0=>
      mem_Mem_block_modgen_ram_ix60_a_28, A1=>bs_data_in(7), S0=>nx420);
   ix5273 : nand04 port map ( Y=>nx5272, A0=>nx7921, A1=>nx7929, A2=>nx7937, 
      A3=>nx7945);
   ix7922 : aoi22 port map ( Y=>nx7921, A0=>
      mem_Mem_block_modgen_ram_ix60_a_51, A1=>nx406, B0=>
      mem_Mem_block_modgen_ram_ix60_a_27, B1=>nx384);
   mem_Mem_block_modgen_ram_ix60_ix166 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_51, QB=>OPEN, D=>nx4797, CLK=>clk);
   ix4798 : mux21_ni port map ( Y=>nx4797, A0=>bs_data_in(7), A1=>
      mem_Mem_block_modgen_ram_ix60_a_51, S0=>nx6021);
   mem_Mem_block_modgen_ram_ix60_ix262 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_27, QB=>OPEN, D=>nx4787, CLK=>clk);
   ix4788 : mux21_ni port map ( Y=>nx4787, A0=>
      mem_Mem_block_modgen_ram_ix60_a_27, A1=>bs_data_in(7), S0=>nx374);
   ix7930 : aoi22 port map ( Y=>nx7929, A0=>
      mem_Mem_block_modgen_ram_ix60_a_30, A1=>nx348, B0=>
      mem_Mem_block_modgen_ram_ix60_a_16, B1=>nx364);
   mem_Mem_block_modgen_ram_ix60_ix250 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_30, QB=>OPEN, D=>nx4767, CLK=>clk);
   ix4768 : mux21_ni port map ( Y=>nx4767, A0=>
      mem_Mem_block_modgen_ram_ix60_a_30, A1=>bs_data_in(7), S0=>nx336);
   mem_Mem_block_modgen_ram_ix60_ix306 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_16, QB=>OPEN, D=>nx4777, CLK=>clk);
   ix4778 : mux21_ni port map ( Y=>nx4777, A0=>bs_data_in(7), A1=>
      mem_Mem_block_modgen_ram_ix60_a_16, S0=>nx6039);
   ix7938 : aoi22 port map ( Y=>nx7937, A0=>
      mem_Mem_block_modgen_ram_ix60_a_42, A1=>nx318, B0=>
      mem_Mem_block_modgen_ram_ix60_a_36, B1=>nx284);
   mem_Mem_block_modgen_ram_ix60_ix202 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_42, QB=>OPEN, D=>nx4757, CLK=>clk);
   ix4758 : mux21_ni port map ( Y=>nx4757, A0=>
      mem_Mem_block_modgen_ram_ix60_a_42, A1=>bs_data_in(7), S0=>nx300);
   mem_Mem_block_modgen_ram_ix60_ix226 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_36, QB=>OPEN, D=>nx4747, CLK=>clk);
   ix4748 : mux21_ni port map ( Y=>nx4747, A0=>bs_data_in(7), A1=>
      mem_Mem_block_modgen_ram_ix60_a_36, S0=>nx6052);
   ix7946 : aoi22 port map ( Y=>nx7945, A0=>
      mem_Mem_block_modgen_ram_ix60_a_4_dup_232, A1=>nx212, B0=>
      mem_Mem_block_modgen_ram_ix60_a_19, B1=>nx256);
   mem_Mem_block_modgen_ram_ix60_ix354 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_4_dup_232, QB=>OPEN, D=>nx4727, CLK=>
      clk);
   ix4728 : mux21_ni port map ( Y=>nx4727, A0=>bs_data_in(7), A1=>
      mem_Mem_block_modgen_ram_ix60_a_4_dup_232, S0=>nx6060);
   mem_Mem_block_modgen_ram_ix60_ix294 : dff port map ( Q=>
      mem_Mem_block_modgen_ram_ix60_a_19, QB=>OPEN, D=>nx4737, CLK=>clk);
   ix4738 : mux21_ni port map ( Y=>nx4737, A0=>bs_data_in(7), A1=>
      mem_Mem_block_modgen_ram_ix60_a_19, S0=>nx6066);
   ix315 : inv01 port map ( Y=>nx314, A=>nx5549);
   ix283 : inv01 port map ( Y=>nx282, A=>nx5721);
   ix253 : inv01 port map ( Y=>nx252, A=>nx5613);
   ix207 : inv01 port map ( Y=>nx206, A=>nx5642);
   ix145 : inv01 port map ( Y=>nx144, A=>nx5461);
   ix127 : inv01 port map ( Y=>nx126, A=>nx5452);
   ix99 : inv01 port map ( Y=>nx98, A=>nx5413);
   ix91 : inv01 port map ( Y=>nx90, A=>nx5422);
   ix81 : inv01 port map ( Y=>nx80, A=>nx5415);
   ix59 : inv01 port map ( Y=>nx58, A=>nx5395);
   ix5632 : inv01 port map ( Y=>nx5631, A=>nx26);
   ix7957 : inv01 port map ( Y=>nx7958, A=>nx8162);
   ix7961 : inv01 port map ( Y=>nx7962, A=>nx8234);
   ix7965 : inv01 port map ( Y=>nx7966, A=>nx8248);
   ix7983 : inv01 port map ( Y=>nx7984, A=>nx8220);
   ix7985 : inv01 port map ( Y=>nx7986, A=>nx8220);
   ix8161 : inv01 port map ( Y=>nx8162, A=>nx8402);
   ix8173 : nand02 port map ( Y=>nx8174, A0=>nx8340, A1=>nx8408);
   ix8175 : nand02 port map ( Y=>nx8176, A0=>nx8360, A1=>nx7962);
   ix8179 : nand02 port map ( Y=>nx8180, A0=>nx8362, A1=>nx8426);
   ix8187 : nand02 port map ( Y=>nx8188, A0=>nx8360, A1=>nx7958);
   ix8191 : buf02 port map ( Y=>nx8192, A=>nx5547);
   ix8193 : buf02 port map ( Y=>nx8194, A=>nx5547);
   ix8203 : nand02 port map ( Y=>nx8204, A0=>nx8368, A1=>nx7984);
   ix8209 : nand02 port map ( Y=>nx8210, A0=>nx8364, A1=>nx8448);
   ix8211 : nand02 port map ( Y=>nx8212, A0=>nx8370, A1=>nx7962);
   ix8213 : buf02 port map ( Y=>nx8214, A=>nx5611);
   ix8215 : buf02 port map ( Y=>nx8216, A=>nx5611);
   ix8219 : inv01 port map ( Y=>nx8220, A=>nx390);
   ix8229 : nand02 port map ( Y=>nx8230, A0=>nx314, A1=>nx402);
   ix8233 : inv01 port map ( Y=>nx8234, A=>nx230);
   ix8237 : buf02 port map ( Y=>nx8238, A=>nx5657);
   ix8239 : buf02 port map ( Y=>nx8240, A=>nx5657);
   ix8241 : nand02 port map ( Y=>nx8242, A0=>nx8372, A1=>nx7962);
   ix8247 : inv01 port map ( Y=>nx8248, A=>nx266);
   ix8251 : nand02 port map ( Y=>nx8252, A0=>nx176, A1=>nx8444);
   ix8253 : nand02 port map ( Y=>nx8254, A0=>nx8372, A1=>nx7984);
   ix8255 : nand02 port map ( Y=>nx8256, A0=>nx8374, A1=>nx7958);
   ix8257 : nand02 port map ( Y=>nx8258, A0=>nx8364, A1=>nx8468);
   ix8259 : nand02 port map ( Y=>nx8260, A0=>nx8374, A1=>nx7966);
   ix8265 : nand02 port map ( Y=>nx8266, A0=>nx5699, A1=>nx7962);
   ix8267 : nand02 port map ( Y=>nx8268, A0=>nx5699, A1=>nx7984);
   ix8269 : nand02 port map ( Y=>nx8270, A0=>nx176, A1=>nx8478);
   ix8271 : nand02 port map ( Y=>nx8272, A0=>nx8370, A1=>nx7984);
   ix8273 : nand02 port map ( Y=>nx8274, A0=>nx252, A1=>nx402);
   ix8275 : nand02 port map ( Y=>nx8276, A0=>nx8376, A1=>nx7984);
   ix8277 : nand02 port map ( Y=>nx8278, A0=>nx8368, A1=>nx7966);
   ix8279 : nand02 port map ( Y=>nx8280, A0=>nx5605, A1=>nx7958);
   ix8281 : buf02 port map ( Y=>nx8282, A=>nx5795);
   ix8283 : buf02 port map ( Y=>nx8284, A=>nx5795);
   ix8285 : nand02 port map ( Y=>nx8286, A0=>nx8378, A1=>nx7958);
   ix8287 : nand02 port map ( Y=>nx8288, A0=>nx176, A1=>nx8458);
   ix8289 : nand02 port map ( Y=>nx8290, A0=>nx314, A1=>nx280);
   ix8291 : nand02 port map ( Y=>nx8292, A0=>nx8380, A1=>nx7984);
   ix8293 : nand02 port map ( Y=>nx8294, A0=>nx8380, A1=>nx7966);
   ix8295 : nand02 port map ( Y=>nx8296, A0=>nx252, A1=>nx280);
   ix8297 : nand02 port map ( Y=>nx8298, A0=>nx5477, A1=>nx7986);
   ix8299 : nand02 port map ( Y=>nx8300, A0=>nx5477, A1=>nx7966);
   ix8301 : nand02 port map ( Y=>nx8302, A0=>nx5571, A1=>nx7962);
   ix8303 : nand02 port map ( Y=>nx8304, A0=>nx5571, A1=>nx7958);
   ix8305 : nand02 port map ( Y=>nx8306, A0=>nx8376, A1=>nx7966);
   ix8307 : nand02 port map ( Y=>nx8308, A0=>nx5773, A1=>nx7958);
   ix8309 : nand02 port map ( Y=>nx8310, A0=>nx5838, A1=>nx8402);
   ix8311 : nand02 port map ( Y=>nx8312, A0=>nx5605, A1=>nx7966);
   ix8313 : nand02 port map ( Y=>nx8314, A0=>nx5773, A1=>nx7962);
   ix8315 : nand02 port map ( Y=>nx8316, A0=>nx8378, A1=>nx8436);
   ix8317 : nand02 port map ( Y=>nx8318, A0=>nx5801, A1=>nx7986);
   ix8319 : nand02 port map ( Y=>nx8320, A0=>nx5838, A1=>nx8416);
   ix8321 : nand02 port map ( Y=>nx8322, A0=>nx5665, A1=>nx8436);
   ix8323 : nand02 port map ( Y=>nx8324, A0=>nx5665, A1=>nx8402);
   ix8325 : nand02 port map ( Y=>nx8326, A0=>nx5801, A1=>nx8416);
   ix8327 : inv01 port map ( Y=>nx8328, A=>nx8162);
   ix8329 : inv01 port map ( Y=>nx8330, A=>nx8234);
   ix8331 : inv01 port map ( Y=>nx8332, A=>nx8248);
   ix8333 : inv01 port map ( Y=>nx8334, A=>nx8220);
   ix8339 : inv01 port map ( Y=>nx8340, A=>nx8364);
   ix8341 : nand02 port map ( Y=>nx8342, A0=>nx8366, A1=>nx8482);
   ix8343 : nand02 port map ( Y=>nx8344, A0=>nx8482, A1=>nx8358);
   ix8345 : nand02 port map ( Y=>nx8346, A0=>nx8366, A1=>nx8490);
   ix8347 : nand02 port map ( Y=>nx8348, A0=>nx5631, A1=>nx8358);
   ix8349 : nand02 port map ( Y=>nx8350, A0=>nx5542, A1=>nx8492);
   ix8351 : nand02 port map ( Y=>nx8352, A0=>nx5542, A1=>nx5631);
   ix8353 : nand02 port map ( Y=>nx8354, A0=>nx8490, A1=>nx5393);
   ix8355 : nand02 port map ( Y=>nx8356, A0=>nx8492, A1=>nx5393);
   ix8357 : nor02 port map ( Y=>nx8358, A0=>nx5395, A1=>nx8390);
   ix8361 : inv01 port map ( Y=>nx8362, A=>nx176);
   ix8363 : inv01 port map ( Y=>nx8364, A=>nx176);
   ix8371 : nor02 port map ( Y=>nx8372, A0=>nx62, A1=>nx26);
   ix8379 : nor02 port map ( Y=>nx8380, A0=>nx222, A1=>nx26);
   ix8385 : nand02 port map ( Y=>nx8386, A0=>nx58, A1=>nx8392);
   ix8387 : nand02 port map ( Y=>nx8388, A0=>nx5395, A1=>nx8392);
   ix8389 : buf02 port map ( Y=>nx8390, A=>nx5402);
   ix8391 : buf02 port map ( Y=>nx8392, A=>nx5402);
   ix1345 : nor02ii port map ( Y=>nx1344, A0=>nx8344, A1=>nx8402);
   ix5380 : nor02ii port map ( Y=>nx5379, A0=>nx5384, A1=>nx5487);
   ix53 : and03 port map ( Y=>nx52, A0=>nx8398, A1=>bs_ng_cte_incr, A2=>
      nx5405);
   ix8397 : inv01 port map ( Y=>nx8398, A=>nx5399);
   ix1353 : nor02ii port map ( Y=>nx1352, A0=>nx8174, A1=>nx8448);
   ix5428 : nor02ii port map ( Y=>nx310, A0=>nx5511, A1=>nx5429);
   ix121 : and03 port map ( Y=>nx120, A0=>nx8400, A1=>ds_ng_cte_incr, A2=>
      nx5443);
   ix8399 : inv01 port map ( Y=>nx8400, A=>nx5455);
   ix5478 : nor02ii port map ( Y=>nx5477, A0=>nx8386, A1=>nx8490);
   ix1339 : nor02ii port map ( Y=>nx1338, A0=>nx8180, A1=>nx8458);
   ix5508 : ao21 port map ( Y=>nx176, A0=>ds_from_cte(3), A1=>nx5434, B0=>
      nx170);
   ix1301 : nor02ii port map ( Y=>nx1300, A0=>nx8354, A1=>nx8404);
   ix1309 : nor02ii port map ( Y=>nx1308, A0=>nx8174, A1=>nx8426);
   ix1323 : nor02ii port map ( Y=>nx1322, A0=>nx8180, A1=>nx8408);
   ix1283 : nor02ii port map ( Y=>nx1282, A0=>nx8342, A1=>nx8404);
   ix5543 : nor02ii port map ( Y=>nx5542, A0=>nx8390, A1=>nx5395);
   ix1291 : nor02ii port map ( Y=>nx1290, A0=>nx8192, A1=>nx8448);
   ix1269 : nor02ii port map ( Y=>nx1268, A0=>nx8350, A1=>nx8404);
   ix5557 : nor02ii port map ( Y=>nx5556, A0=>nx5487, A1=>nx5384);
   ix1277 : nor02ii port map ( Y=>nx1276, A0=>nx8192, A1=>nx8468);
   ix5562 : nor02ii port map ( Y=>nx468, A0=>nx5429, A1=>nx5511);
   ix5572 : nor02ii port map ( Y=>nx5571, A0=>nx8386, A1=>nx8482);
   ix1247 : nor02ii port map ( Y=>nx1246, A0=>nx8210, A1=>nx8478);
   ix5578 : nor02ii port map ( Y=>nx658, A0=>nx8486, A1=>nx402);
   ix1253 : nor02ii port map ( Y=>nx1252, A0=>nx8356, A1=>nx8404);
   ix1261 : nor02ii port map ( Y=>nx1260, A0=>nx8174, A1=>nx8468);
   ix5606 : nor02ii port map ( Y=>nx5605, A0=>nx8388, A1=>nx8482);
   ix1227 : nor02ii port map ( Y=>nx1226, A0=>nx8214, A1=>nx8448);
   ix1205 : nor02ii port map ( Y=>nx1204, A0=>nx8346, A1=>nx8404);
   ix1213 : nor02ii port map ( Y=>nx1212, A0=>nx8192, A1=>nx8426);
   ix1189 : nor02ii port map ( Y=>nx1188, A0=>nx8352, A1=>nx8460);
   ix1197 : nor02ii port map ( Y=>nx1196, A0=>nx8230, A1=>nx8410);
   ix1175 : nor02ii port map ( Y=>nx1174, A0=>nx8342, A1=>nx8416);
   ix5653 : and03 port map ( Y=>nx230, A0=>nx80, A1=>bs_mem_wr_en, A2=>
      nx5422);
   ix1183 : nor02ii port map ( Y=>nx1182, A0=>nx8238, A1=>nx8448);
   ix1151 : nor02ii port map ( Y=>nx1150, A0=>nx8244, A1=>nx8458);
   ix5672 : or02 port map ( Y=>nx5671, A0=>nx176, A1=>nx5642);
   ix1157 : nor02ii port map ( Y=>nx1156, A0=>nx8344, A1=>nx8436);
   ix5678 : and03 port map ( Y=>nx266, A0=>nx5415, A1=>bs_mem_wr_en, A2=>
      nx90);
   ix1165 : nor02ii port map ( Y=>nx1164, A0=>nx8252, A1=>nx8450);
   ix5682 : or02 port map ( Y=>nx5681, A0=>nx8364, A1=>nx5721);
   ix281 : nor02ii port map ( Y=>nx280, A0=>nx5469, A1=>nx5461);
   ix1135 : nor02ii port map ( Y=>nx1134, A0=>nx8244, A1=>nx8478);
   ix5700 : nor02ii port map ( Y=>nx5699, A0=>nx8386, A1=>nx8492);
   ix1121 : nor02ii port map ( Y=>nx1120, A0=>nx8258, A1=>nx8408);
   ix1099 : nor02ii port map ( Y=>nx1098, A0=>nx8258, A1=>nx8444);
   ix1085 : nor02ii port map ( Y=>nx1084, A0=>nx8258, A1=>nx8458);
   ix1069 : nor02ii port map ( Y=>nx1068, A0=>nx8258, A1=>nx8478);
   ix1041 : nor02ii port map ( Y=>nx1040, A0=>nx8356, A1=>nx8460);
   ix1049 : nor02ii port map ( Y=>nx1048, A0=>nx8270, A1=>nx8468);
   ix1017 : nor02ii port map ( Y=>nx1016, A0=>nx8274, A1=>nx8450);
   ix1023 : nor02ii port map ( Y=>nx1022, A0=>nx8348, A1=>nx8460);
   ix1031 : nor02ii port map ( Y=>nx1030, A0=>nx8270, A1=>nx8410);
   ix5774 : nor02ii port map ( Y=>nx5773, A0=>nx8388, A1=>nx8492);
   ix1001 : nor02ii port map ( Y=>nx1000, A0=>nx8274, A1=>nx8468);
   ix987 : nor02ii port map ( Y=>nx986, A0=>nx8210, A1=>nx8444);
   ix967 : nor02ii port map ( Y=>nx966, A0=>nx8282, A1=>nx8450);
   ix5802 : nor02ii port map ( Y=>nx5801, A0=>nx8388, A1=>nx8490);
   ix953 : nor02ii port map ( Y=>nx952, A0=>nx8282, A1=>nx8426);
   ix929 : nor02ii port map ( Y=>nx928, A0=>nx8354, A1=>nx8416);
   ix937 : nor02ii port map ( Y=>nx936, A0=>nx8288, A1=>nx8426);
   ix915 : nor02ii port map ( Y=>nx914, A0=>nx8356, A1=>nx8418);
   ix923 : nor02ii port map ( Y=>nx922, A0=>nx8288, A1=>nx8470);
   ix897 : nor02ii port map ( Y=>nx896, A0=>nx8352, A1=>nx8436);
   ix905 : nor02ii port map ( Y=>nx904, A0=>nx8290, A1=>nx8410);
   ix891 : nor02ii port map ( Y=>nx890, A0=>nx8274, A1=>nx8410);
   ix875 : nor02ii port map ( Y=>nx874, A0=>nx8296, A1=>nx8410);
   ix853 : nor02ii port map ( Y=>nx852, A0=>nx8348, A1=>nx8438);
   ix861 : nor02ii port map ( Y=>nx860, A0=>nx8252, A1=>nx8410);
   ix821 : nor02ii port map ( Y=>nx820, A0=>nx8180, A1=>nx8478);
   ix829 : nor02ii port map ( Y=>nx828, A0=>nx8356, A1=>nx8438);
   ix837 : nor02ii port map ( Y=>nx836, A0=>nx8252, A1=>nx8470);
   ix805 : nor02ii port map ( Y=>nx804, A0=>nx8180, A1=>nx8444);
   ix775 : nor02ii port map ( Y=>nx774, A0=>nx8352, A1=>nx8404);
   ix785 : nor02ii port map ( Y=>nx784, A0=>nx8192, A1=>nx8412);
   ix755 : nor02ii port map ( Y=>nx754, A0=>nx8348, A1=>nx8406);
   ix765 : nor02ii port map ( Y=>nx764, A0=>nx8174, A1=>nx8412);
   ix749 : nor02ii port map ( Y=>nx748, A0=>nx8210, A1=>nx8458);
   ix705 : nor02ii port map ( Y=>nx704, A0=>nx8342, A1=>nx8460);
   ix713 : nor02ii port map ( Y=>nx712, A0=>nx8230, A1=>nx8450);
   ix733 : nor02ii port map ( Y=>nx732, A0=>nx8210, A1=>nx8408);
   ix685 : nor02ii port map ( Y=>nx684, A0=>nx8350, A1=>nx8418);
   ix693 : nor02ii port map ( Y=>nx692, A0=>nx8238, A1=>nx8470);
   ix671 : nor02ii port map ( Y=>nx670, A0=>nx8344, A1=>nx8460);
   ix679 : nor02ii port map ( Y=>nx678, A0=>nx8270, A1=>nx8450);
   ix645 : nor02ii port map ( Y=>nx644, A0=>nx8296, A1=>nx8470);
   ix651 : nor02ii port map ( Y=>nx650, A0=>nx8354, A1=>nx8460);
   ix663 : nor02ii port map ( Y=>nx662, A0=>nx8270, A1=>nx8428);
   ix619 : nor02ii port map ( Y=>nx618, A0=>nx8350, A1=>nx8438);
   ix627 : nor02ii port map ( Y=>nx626, A0=>nx8290, A1=>nx8470);
   ix613 : nor02ii port map ( Y=>nx612, A0=>nx8282, A1=>nx8470);
   ix573 : nor02ii port map ( Y=>nx572, A0=>nx8346, A1=>nx8438);
   ix581 : nor02ii port map ( Y=>nx580, A0=>nx8290, A1=>nx8428);
   ix597 : nor02ii port map ( Y=>nx596, A0=>nx8282, A1=>nx8412);
   ix559 : nor02ii port map ( Y=>nx558, A0=>nx8296, A1=>nx8450);
   ix533 : nor02ii port map ( Y=>nx532, A0=>nx8354, A1=>nx8438);
   ix543 : nor02ii port map ( Y=>nx542, A0=>nx8252, A1=>nx8428);
   ix499 : nor02ii port map ( Y=>nx498, A0=>nx8346, A1=>nx8462);
   ix507 : nor02ii port map ( Y=>nx506, A0=>nx8230, A1=>nx8428);
   ix515 : nor02ii port map ( Y=>nx514, A0=>nx8352, A1=>nx8418);
   ix523 : nor02ii port map ( Y=>nx522, A0=>nx8238, A1=>nx8412);
   ix459 : nor02ii port map ( Y=>nx458, A0=>nx8350, A1=>nx8462);
   ix473 : nor02ii port map ( Y=>nx472, A0=>nx8230, A1=>nx8472);
   ix489 : nor02ii port map ( Y=>nx488, A0=>nx8214, A1=>nx8472);
   ix445 : nor02ii port map ( Y=>nx444, A0=>nx8296, A1=>nx8428);
   ix421 : nor02ii port map ( Y=>nx420, A0=>nx8348, A1=>nx8418);
   ix429 : nor02ii port map ( Y=>nx428, A0=>nx8288, A1=>nx8412);
   ix407 : nor02ii port map ( Y=>nx406, A0=>nx8274, A1=>nx8428);
   ix375 : nor02ii port map ( Y=>nx374, A0=>nx8346, A1=>nx8418);
   ix385 : nor02ii port map ( Y=>nx384, A0=>nx8238, A1=>nx8430);
   ix337 : nor02ii port map ( Y=>nx336, A0=>nx8344, A1=>nx8418);
   ix349 : nor02ii port map ( Y=>nx348, A0=>nx8288, A1=>nx8452);
   ix365 : nor02ii port map ( Y=>nx364, A0=>nx8214, A1=>nx8412);
   ix301 : nor02ii port map ( Y=>nx300, A0=>nx8342, A1=>nx8438);
   ix319 : nor02ii port map ( Y=>nx318, A0=>nx8290, A1=>nx8452);
   ix285 : nor02ii port map ( Y=>nx284, A0=>nx8244, A1=>nx8444);
   ix213 : nor02ii port map ( Y=>nx212, A0=>nx8244, A1=>nx8408);
   ix257 : nor02ii port map ( Y=>nx256, A0=>nx8214, A1=>nx8430);
   ix7959 : nor02ii port map ( Y=>nx7960, A0=>nx8244, A1=>nx162);
   ix7963 : nor02ii port map ( Y=>nx7964, A0=>nx8214, A1=>nx8430);
   ix7967 : nor02ii port map ( Y=>nx7968, A0=>nx8244, A1=>nx8444);
   ix7969 : nor02ii port map ( Y=>nx7970, A0=>nx8342, A1=>nx8440);
   ix7971 : nor02ii port map ( Y=>nx7972, A0=>nx8290, A1=>nx8452);
   ix7973 : nor02ii port map ( Y=>nx7974, A0=>nx8344, A1=>nx8420);
   ix7975 : nor02ii port map ( Y=>nx7976, A0=>nx8288, A1=>nx8452);
   ix7977 : nor02ii port map ( Y=>nx7978, A0=>nx8214, A1=>nx8414);
   ix7979 : nor02ii port map ( Y=>nx7980, A0=>nx8346, A1=>nx8420);
   ix7981 : nor02ii port map ( Y=>nx7982, A0=>nx8238, A1=>nx8430);
   ix7987 : nor02ii port map ( Y=>nx7988, A0=>nx8274, A1=>nx8430);
   ix7989 : nor02ii port map ( Y=>nx7990, A0=>nx8348, A1=>nx8420);
   ix7991 : nor02ii port map ( Y=>nx7992, A0=>nx8288, A1=>nx8414);
   ix7993 : nor02ii port map ( Y=>nx7994, A0=>nx8296, A1=>nx8430);
   ix7995 : nor02ii port map ( Y=>nx7996, A0=>nx8350, A1=>nx8462);
   ix7997 : nor02ii port map ( Y=>nx7998, A0=>nx8230, A1=>nx8472);
   ix7999 : nor02ii port map ( Y=>nx8000, A0=>nx8216, A1=>nx8472);
   ix8001 : nor02ii port map ( Y=>nx8002, A0=>nx8346, A1=>nx8462);
   ix8003 : nor02ii port map ( Y=>nx8004, A0=>nx8230, A1=>nx8432);
   ix8005 : nor02ii port map ( Y=>nx8006, A0=>nx8352, A1=>nx8420);
   ix8007 : nor02ii port map ( Y=>nx8008, A0=>nx8238, A1=>nx8414);
   ix8009 : nor02ii port map ( Y=>nx8010, A0=>nx8354, A1=>nx8440);
   ix8011 : nor02ii port map ( Y=>nx8012, A0=>nx8252, A1=>nx8432);
   ix8013 : nor02ii port map ( Y=>nx8014, A0=>nx8296, A1=>nx8452);
   ix8015 : nor02ii port map ( Y=>nx8016, A0=>nx370, A1=>nx8440);
   ix8017 : nor02ii port map ( Y=>nx8018, A0=>nx8290, A1=>nx8432);
   ix8019 : nor02ii port map ( Y=>nx8020, A0=>nx8282, A1=>nx8414);
   ix8021 : nor02ii port map ( Y=>nx8022, A0=>nx8282, A1=>nx8472);
   ix8023 : nor02ii port map ( Y=>nx8024, A0=>nx8350, A1=>nx8440);
   ix8025 : nor02ii port map ( Y=>nx8026, A0=>nx5831, A1=>nx8472);
   ix8027 : nor02ii port map ( Y=>nx8028, A0=>nx5850, A1=>nx8474);
   ix8029 : nor02ii port map ( Y=>nx8030, A0=>nx8354, A1=>nx8462);
   ix8031 : nor02ii port map ( Y=>nx8032, A0=>nx8270, A1=>nx8432);
   ix8033 : nor02ii port map ( Y=>nx8034, A0=>nx8344, A1=>nx8462);
   ix8035 : nor02ii port map ( Y=>nx8036, A0=>nx8270, A1=>nx8452);
   ix8037 : nor02ii port map ( Y=>nx8038, A0=>nx454, A1=>nx8420);
   ix8039 : nor02ii port map ( Y=>nx8040, A0=>nx8240, A1=>nx8474);
   ix8041 : nor02ii port map ( Y=>nx8042, A0=>nx8342, A1=>nx8464);
   ix8043 : nor02ii port map ( Y=>nx8044, A0=>nx5645, A1=>nx8454);
   ix8045 : nor02ii port map ( Y=>nx8046, A0=>nx8210, A1=>nx162);
   ix8047 : nor02ii port map ( Y=>nx8048, A0=>nx8210, A1=>nx344);
   ix8049 : nor02ii port map ( Y=>nx8050, A0=>nx8348, A1=>nx8406);
   ix8051 : nor02ii port map ( Y=>nx8052, A0=>nx8174, A1=>nx8414);
   ix8053 : nor02ii port map ( Y=>nx8054, A0=>nx8352, A1=>nx8406);
   ix8055 : nor02ii port map ( Y=>nx8056, A0=>nx8192, A1=>nx8414);
   ix8057 : nor02ii port map ( Y=>nx8058, A0=>nx8180, A1=>nx282);
   ix8059 : nor02ii port map ( Y=>nx8060, A0=>nx8180, A1=>nx8480);
   ix8061 : nor02ii port map ( Y=>nx8062, A0=>nx8356, A1=>nx8440);
   ix8063 : nor02ii port map ( Y=>nx8064, A0=>nx8252, A1=>nx8474);
   ix8065 : nor02ii port map ( Y=>nx8066, A0=>nx416, A1=>nx8440);
   ix8067 : nor02ii port map ( Y=>nx8068, A0=>nx5681, A1=>nx206);
   ix8069 : nor02ii port map ( Y=>nx8070, A0=>nx5850, A1=>nx206);
   ix8071 : nor02ii port map ( Y=>nx8072, A0=>nx8274, A1=>nx206);
   ix8073 : nor02ii port map ( Y=>nx8074, A0=>nx510, A1=>nx8442);
   ix8075 : nor02ii port map ( Y=>nx8076, A0=>nx5831, A1=>nx206);
   ix8077 : nor02ii port map ( Y=>nx8078, A0=>nx8356, A1=>nx8420);
   ix8079 : nor02ii port map ( Y=>nx8080, A0=>nx5813, A1=>nx8474);
   ix8081 : nor02ii port map ( Y=>nx8082, A0=>nx528, A1=>nx8422);
   ix8083 : nor02ii port map ( Y=>nx8084, A0=>nx5813, A1=>nx8432);
   ix8085 : nor02ii port map ( Y=>nx8086, A0=>nx8284, A1=>nx8432);
   ix8087 : nor02ii port map ( Y=>nx8088, A0=>nx8284, A1=>nx8454);
   ix8089 : nor02ii port map ( Y=>nx8090, A0=>nx5585, A1=>nx282);
   ix8091 : nor02ii port map ( Y=>nx8092, A0=>nx5757, A1=>nx8474);
   ix8093 : nor02ii port map ( Y=>nx8094, A0=>nx5757, A1=>nx8454);
   ix8095 : nor02ii port map ( Y=>nx8096, A0=>nx416, A1=>nx8464);
   ix8097 : nor02ii port map ( Y=>nx8098, A0=>nx5743, A1=>nx206);
   ix8099 : nor02ii port map ( Y=>nx8100, A0=>nx824, A1=>nx8464);
   ix8101 : nor02ii port map ( Y=>nx8102, A0=>nx5743, A1=>nx8474);
   ix8103 : nor02ii port map ( Y=>nx8104, A0=>nx8258, A1=>nx8480);
   ix8105 : nor02ii port map ( Y=>nx8106, A0=>nx8258, A1=>nx344);
   ix8107 : nor02ii port map ( Y=>nx8108, A0=>nx5705, A1=>nx282);
   ix8109 : nor02ii port map ( Y=>nx8110, A0=>nx5705, A1=>nx162);
   ix8111 : nor02ii port map ( Y=>nx8112, A0=>nx5671, A1=>nx8480);
   ix8113 : nor02ii port map ( Y=>nx8114, A0=>nx5671, A1=>nx344);
   ix8115 : nor02ii port map ( Y=>nx8116, A0=>nx332, A1=>nx8442);
   ix8117 : nor02ii port map ( Y=>nx8118, A0=>nx5681, A1=>nx8454);
   ix8119 : nor02ii port map ( Y=>nx8120, A0=>nx296, A1=>nx8422);
   ix8121 : nor02ii port map ( Y=>nx8122, A0=>nx8240, A1=>nx8454);
   ix8123 : nor02ii port map ( Y=>nx8124, A0=>nx510, A1=>nx8464);
   ix8125 : nor02ii port map ( Y=>nx8126, A0=>nx5645, A1=>nx206);
   ix8127 : nor02ii port map ( Y=>nx8128, A0=>nx370, A1=>nx8406);
   ix8129 : nor02ii port map ( Y=>nx8130, A0=>nx8192, A1=>nx8434);
   ix8131 : nor02ii port map ( Y=>nx8132, A0=>nx8216, A1=>nx8454);
   ix8133 : nor02ii port map ( Y=>nx8134, A0=>nx5585, A1=>nx8480);
   ix8135 : nor02ii port map ( Y=>nx8136, A0=>nx824, A1=>nx8406);
   ix8137 : nor02ii port map ( Y=>nx8138, A0=>nx8174, A1=>nx8476);
   ix8139 : nor02ii port map ( Y=>nx8140, A0=>nx454, A1=>nx8406);
   ix8141 : nor02ii port map ( Y=>nx8142, A0=>nx8194, A1=>nx8476);
   ix8143 : nor02ii port map ( Y=>nx8144, A0=>nx296, A1=>nx98);
   ix8145 : nor02ii port map ( Y=>nx8146, A0=>nx8194, A1=>nx8456);
   ix8147 : nor02ii port map ( Y=>nx8148, A0=>nx528, A1=>nx98);
   ix8149 : nor02ii port map ( Y=>nx8150, A0=>nx5439, A1=>nx8434);
   ix8151 : nor02ii port map ( Y=>nx8152, A0=>nx5505, A1=>nx162);
   ix8153 : nor02ii port map ( Y=>nx8154, A0=>nx5505, A1=>nx344);
   ix8155 : nor02ii port map ( Y=>nx8156, A0=>nx332, A1=>nx98);
   ix8157 : nor02ii port map ( Y=>nx8158, A0=>nx5439, A1=>nx8456);
   ix8243 : or02 port map ( Y=>nx8244, A0=>nx176, A1=>nx5642);
   ix8359 : nor02ii port map ( Y=>nx8360, A0=>nx8386, A1=>nx5519);
   ix8365 : nor02ii port map ( Y=>nx8366, A0=>nx8390, A1=>nx5395);
   ix8367 : nor02ii port map ( Y=>nx8368, A0=>nx8386, A1=>nx8484);
   ix8369 : nor02ii port map ( Y=>nx8370, A0=>nx8388, A1=>nx8484);
   ix8373 : nor02ii port map ( Y=>nx8374, A0=>nx62, A1=>nx8494);
   ix8375 : nor02ii port map ( Y=>nx8376, A0=>nx8388, A1=>nx8494);
   ix8377 : nor02ii port map ( Y=>nx8378, A0=>nx222, A1=>nx5519);
   ix8401 : inv01 port map ( Y=>nx8402, A=>nx5413);
   ix8403 : inv01 port map ( Y=>nx8404, A=>nx5413);
   ix8405 : inv01 port map ( Y=>nx8406, A=>nx5413);
   ix8407 : nor02 port map ( Y=>nx8408, A0=>nx8486, A1=>nx5459);
   ix8409 : inv01 port map ( Y=>nx8410, A=>nx5642);
   ix8411 : inv01 port map ( Y=>nx8412, A=>nx5642);
   ix8413 : inv01 port map ( Y=>nx8414, A=>nx5642);
   ix8415 : inv01 port map ( Y=>nx8416, A=>nx8234);
   ix8417 : inv01 port map ( Y=>nx8418, A=>nx8234);
   ix8419 : inv01 port map ( Y=>nx8420, A=>nx8234);
   ix8421 : inv01 port map ( Y=>nx8422, A=>nx8234);
   ix8423 : inv01 port map ( Y=>nx8424, A=>nx242);
   ix8425 : inv01 port map ( Y=>nx8426, A=>nx8424);
   ix8427 : inv01 port map ( Y=>nx8428, A=>nx8424);
   ix8429 : inv01 port map ( Y=>nx8430, A=>nx8424);
   ix8431 : inv01 port map ( Y=>nx8432, A=>nx8424);
   ix8433 : inv01 port map ( Y=>nx8434, A=>nx8424);
   ix8435 : inv01 port map ( Y=>nx8436, A=>nx8248);
   ix8437 : inv01 port map ( Y=>nx8438, A=>nx8248);
   ix8439 : inv01 port map ( Y=>nx8440, A=>nx8248);
   ix8441 : inv01 port map ( Y=>nx8442, A=>nx8248);
   ix8443 : inv01 port map ( Y=>nx8444, A=>nx5721);
   ix8445 : inv01 port map ( Y=>nx8446, A=>nx310);
   ix8447 : inv01 port map ( Y=>nx8448, A=>nx8446);
   ix8449 : inv01 port map ( Y=>nx8450, A=>nx8446);
   ix8451 : inv01 port map ( Y=>nx8452, A=>nx8446);
   ix8453 : inv01 port map ( Y=>nx8454, A=>nx8446);
   ix8455 : inv01 port map ( Y=>nx8456, A=>nx8446);
   ix8457 : nor02 port map ( Y=>nx8458, A0=>nx8488, A1=>nx5497);
   ix8459 : inv01 port map ( Y=>nx8460, A=>nx8220);
   ix8461 : inv01 port map ( Y=>nx8462, A=>nx8220);
   ix8463 : inv01 port map ( Y=>nx8464, A=>nx8220);
   ix8465 : inv01 port map ( Y=>nx8466, A=>nx468);
   ix8467 : inv01 port map ( Y=>nx8468, A=>nx8466);
   ix8469 : inv01 port map ( Y=>nx8470, A=>nx8466);
   ix8471 : inv01 port map ( Y=>nx8472, A=>nx8466);
   ix8473 : inv01 port map ( Y=>nx8474, A=>nx8466);
   ix8475 : inv01 port map ( Y=>nx8476, A=>nx8466);
   ix8477 : buf02 port map ( Y=>nx8478, A=>nx658);
   ix8479 : buf02 port map ( Y=>nx8480, A=>nx658);
   ix8481 : buf02 port map ( Y=>nx8482, A=>nx5379);
   ix8483 : buf02 port map ( Y=>nx8484, A=>nx5379);
   ix8485 : inv01 port map ( Y=>nx8486, A=>nx126);
   ix8487 : inv01 port map ( Y=>nx8488, A=>nx126);
   ix8489 : nor02 port map ( Y=>nx8490, A0=>nx5487, A1=>nx5384);
   ix8491 : buf02 port map ( Y=>nx8492, A=>nx5556);
   ix8493 : buf02 port map ( Y=>nx8494, A=>nx5556);
end add_mux ;

