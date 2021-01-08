-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\OFDM_rx\hdlsrc\OFDM_Tx_Rx_HW\ofdm_rx_src_MoveAvg.vhd
-- Created: 2021-01-08 12:41:57
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: ofdm_rx_src_MoveAvg
-- Source Path: OFDM_Tx_Rx_HW/OFDMRx/PhaseTracking_1/GradientEstimate /MoveAvg
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.ofdm_rx_src_OFDMRx_pkg.ALL;

ENTITY ofdm_rx_src_MoveAvg IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_192_0                       :   IN    std_logic;
        mvAvgIn                           :   IN    std_logic_vector(22 DOWNTO 0);  -- sfix23_En20
        mvAvgOut                          :   OUT   std_logic_vector(22 DOWNTO 0)  -- sfix23_En20
        );
END ofdm_rx_src_MoveAvg;


ARCHITECTURE rtl OF ofdm_rx_src_MoveAvg IS

  -- Signals
  SIGNAL kconst                           : signed(24 DOWNTO 0);  -- sfix25_En25
  SIGNAL kconst_1                         : signed(24 DOWNTO 0);  -- sfix25_En25
  SIGNAL mvAvgIn_signed                   : signed(22 DOWNTO 0);  -- sfix23_En20
  SIGNAL Delay1_reg                       : vector_of_signed23(0 TO 2);  -- sfix23 [3]
  SIGNAL Delay1_out1                      : signed(22 DOWNTO 0);  -- sfix23_En20
  SIGNAL Add_sub_cast                     : signed(24 DOWNTO 0);  -- sfix25_En20
  SIGNAL Add_sub_cast_1                   : signed(24 DOWNTO 0);  -- sfix25_En20
  SIGNAL Add_out1                         : signed(24 DOWNTO 0);  -- sfix25_En20
  SIGNAL Delay2_out1                      : signed(24 DOWNTO 0);  -- sfix25_En20
  SIGNAL Add1_out1                        : signed(24 DOWNTO 0);  -- sfix25_En20
  SIGNAL Delay2_out1_1                    : signed(24 DOWNTO 0);  -- sfix25_En20
  SIGNAL Gain_mul_temp                    : signed(49 DOWNTO 0);  -- sfix50_En45
  SIGNAL Gain_out1                        : signed(22 DOWNTO 0);  -- sfix23_En20
  SIGNAL Gain_out1_1                      : signed(22 DOWNTO 0);  -- sfix23_En20

BEGIN
  -- Average the gradient estimates to reduce 
  -- effects of noise as much as possible. 

  kconst <= to_signed(16#0AAAAAB#, 25);

  HwModeRegister_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      kconst_1 <= to_signed(16#0000000#, 25);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_192_0 = '1' THEN
        kconst_1 <= kconst;
      END IF;
    END IF;
  END PROCESS HwModeRegister_process;


  mvAvgIn_signed <= signed(mvAvgIn);

  Delay1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay1_reg <= (OTHERS => to_signed(16#000000#, 23));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_192_0 = '1' THEN
        Delay1_reg(0) <= mvAvgIn_signed;
        Delay1_reg(1 TO 2) <= Delay1_reg(0 TO 1);
      END IF;
    END IF;
  END PROCESS Delay1_process;

  Delay1_out1 <= Delay1_reg(2);

  Add_sub_cast <= resize(mvAvgIn_signed, 25);
  Add_sub_cast_1 <= resize(Delay1_out1, 25);
  Add_out1 <= Add_sub_cast - Add_sub_cast_1;

  Add1_out1 <= Delay2_out1 + Add_out1;

  Delay2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay2_out1 <= to_signed(16#0000000#, 25);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_192_0 = '1' THEN
        Delay2_out1 <= Add1_out1;
      END IF;
    END IF;
  END PROCESS Delay2_process;


  HwModeRegister1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay2_out1_1 <= to_signed(16#0000000#, 25);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_192_0 = '1' THEN
        Delay2_out1_1 <= Delay2_out1;
      END IF;
    END IF;
  END PROCESS HwModeRegister1_process;


  Gain_mul_temp <= kconst_1 * Delay2_out1_1;
  Gain_out1 <= Gain_mul_temp(47 DOWNTO 25);

  PipelineRegister_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Gain_out1_1 <= to_signed(16#000000#, 23);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_192_0 = '1' THEN
        Gain_out1_1 <= Gain_out1;
      END IF;
    END IF;
  END PROCESS PipelineRegister_process;


  mvAvgOut <= std_logic_vector(Gain_out1_1);

END rtl;

