-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\OFDM_rx\hdlsrc\OFDM_Tx_Rx_HW\ofdm_rx_src_pilotGen_block.vhd
-- Created: 2021-01-08 12:41:57
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: ofdm_rx_src_pilotGen_block
-- Source Path: OFDM_Tx_Rx_HW/OFDMRx/PhaseTracking_2/PilotCtrlGen/pilotGen
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.ofdm_rx_src_OFDMRx_pkg.ALL;

ENTITY ofdm_rx_src_pilotGen_block IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_192_0                       :   IN    std_logic;
        symbCount                         :   IN    std_logic_vector(6 DOWNTO 0);  -- ufix7
        sampleCount                       :   IN    std_logic_vector(5 DOWNTO 0);  -- ufix6
        valid                             :   IN    std_logic;
        pilOut_re                         :   OUT   std_logic_vector(1 DOWNTO 0);  -- sfix2
        pilOut_im                         :   OUT   std_logic_vector(1 DOWNTO 0)  -- sfix2
        );
END ofdm_rx_src_pilotGen_block;


ARCHITECTURE rtl OF ofdm_rx_src_pilotGen_block IS

  -- Component Declarations
  COMPONENT ofdm_rx_src_ToComplex1_block
    PORT( In1                             :   IN    std_logic_vector(1 DOWNTO 0);  -- sfix2
          Out1_re                         :   OUT   std_logic_vector(1 DOWNTO 0);  -- sfix2
          Out1_im                         :   OUT   std_logic_vector(1 DOWNTO 0)  -- sfix2
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : ofdm_rx_src_ToComplex1_block
    USE ENTITY work.ofdm_rx_src_ToComplex1_block(rtl);

  -- Constants
  CONSTANT Polarity_LUT1_data             : vector_of_signed2(0 TO 126) := 
    (to_signed(16#1#, 2), to_signed(16#1#, 2), to_signed(16#1#, 2), to_signed(16#1#, 2), to_signed(-16#1#, 2),
     to_signed(-16#1#, 2), to_signed(-16#1#, 2), to_signed(16#1#, 2), to_signed(-16#1#, 2), to_signed(-16#1#, 2),
     to_signed(-16#1#, 2), to_signed(-16#1#, 2), to_signed(16#1#, 2), to_signed(16#1#, 2), to_signed(-16#1#, 2),
     to_signed(16#1#, 2), to_signed(-16#1#, 2), to_signed(-16#1#, 2), to_signed(16#1#, 2), to_signed(16#1#, 2),
     to_signed(-16#1#, 2), to_signed(16#1#, 2), to_signed(16#1#, 2), to_signed(-16#1#, 2), to_signed(16#1#, 2),
     to_signed(16#1#, 2), to_signed(16#1#, 2), to_signed(16#1#, 2), to_signed(16#1#, 2), to_signed(16#1#, 2),
     to_signed(-16#1#, 2), to_signed(16#1#, 2), to_signed(16#1#, 2), to_signed(16#1#, 2), to_signed(-16#1#, 2),
     to_signed(16#1#, 2), to_signed(16#1#, 2), to_signed(-16#1#, 2), to_signed(-16#1#, 2), to_signed(16#1#, 2),
     to_signed(16#1#, 2), to_signed(16#1#, 2), to_signed(-16#1#, 2), to_signed(16#1#, 2), to_signed(-16#1#, 2),
     to_signed(-16#1#, 2), to_signed(-16#1#, 2), to_signed(16#1#, 2), to_signed(-16#1#, 2), to_signed(16#1#, 2),
     to_signed(-16#1#, 2), to_signed(-16#1#, 2), to_signed(16#1#, 2), to_signed(-16#1#, 2), to_signed(-16#1#, 2),
     to_signed(16#1#, 2), to_signed(16#1#, 2), to_signed(16#1#, 2), to_signed(16#1#, 2), to_signed(16#1#, 2),
     to_signed(-16#1#, 2), to_signed(-16#1#, 2), to_signed(16#1#, 2), to_signed(16#1#, 2), to_signed(-16#1#, 2),
     to_signed(-16#1#, 2), to_signed(16#1#, 2), to_signed(-16#1#, 2), to_signed(16#1#, 2), to_signed(-16#1#, 2),
     to_signed(16#1#, 2), to_signed(16#1#, 2), to_signed(-16#1#, 2), to_signed(-16#1#, 2), to_signed(-16#1#, 2),
     to_signed(16#1#, 2), to_signed(16#1#, 2), to_signed(-16#1#, 2), to_signed(-16#1#, 2), to_signed(-16#1#, 2),
     to_signed(-16#1#, 2), to_signed(16#1#, 2), to_signed(-16#1#, 2), to_signed(-16#1#, 2), to_signed(16#1#, 2),
     to_signed(-16#1#, 2), to_signed(16#1#, 2), to_signed(16#1#, 2), to_signed(16#1#, 2), to_signed(16#1#, 2),
     to_signed(-16#1#, 2), to_signed(16#1#, 2), to_signed(-16#1#, 2), to_signed(16#1#, 2), to_signed(-16#1#, 2),
     to_signed(16#1#, 2), to_signed(-16#1#, 2), to_signed(-16#1#, 2), to_signed(-16#1#, 2), to_signed(-16#1#, 2),
     to_signed(-16#1#, 2), to_signed(16#1#, 2), to_signed(-16#1#, 2), to_signed(16#1#, 2), to_signed(16#1#, 2),
     to_signed(-16#1#, 2), to_signed(16#1#, 2), to_signed(-16#1#, 2), to_signed(16#1#, 2), to_signed(16#1#, 2),
     to_signed(16#1#, 2), to_signed(-16#1#, 2), to_signed(-16#1#, 2), to_signed(16#1#, 2), to_signed(-16#1#, 2),
     to_signed(-16#1#, 2), to_signed(-16#1#, 2), to_signed(16#1#, 2), to_signed(16#1#, 2), to_signed(16#1#, 2),
     to_signed(-16#1#, 2), to_signed(-16#1#, 2), to_signed(-16#1#, 2), to_signed(-16#1#, 2), to_signed(-16#1#, 2),
     to_signed(-16#1#, 2), to_signed(-16#1#, 2));  -- sfix2 [127]
  CONSTANT PilotValue_LUT1_data           : vector_of_signed2(0 TO 3) := 
    (to_signed(16#1#, 2), to_signed(16#1#, 2), to_signed(16#1#, 2), to_signed(-16#1#, 2));  -- sfix2 [4]

  -- Signals
  SIGNAL symbCount_unsigned               : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL Polarity_LUT1_k                  : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL Polarity_LUT1_out1               : signed(1 DOWNTO 0);  -- sfix2
  SIGNAL Polarity_LUT1_out1_1             : signed(1 DOWNTO 0) := to_signed(16#0#, 2);  -- sfix2
  SIGNAL Compare_To_Constant_out1         : std_logic;
  SIGNAL Compare_To_Constant2_out1        : std_logic;
  SIGNAL sampleCount_unsigned             : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Compare_To_Constant3_out1        : std_logic;
  SIGNAL Logical_Operator1_out1           : std_logic;
  SIGNAL Logical_Operator3_out1           : std_logic;
  SIGNAL Logical_Operator3_out1_1         : std_logic;
  SIGNAL Constant_out1                    : signed(1 DOWNTO 0);  -- sfix2
  SIGNAL HDL_Counter1_out1                : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL PilotValue_LUT1_k                : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL PilotValue_LUT1_out1             : signed(1 DOWNTO 0);  -- sfix2
  SIGNAL PilotValue_LUT1_out1_1           : signed(1 DOWNTO 0) := to_signed(16#0#, 2);  -- sfix2
  SIGNAL Switch1_out1                     : signed(1 DOWNTO 0);  -- sfix2
  SIGNAL Unary_Minus_in0                  : signed(2 DOWNTO 0);  -- sfix3
  SIGNAL Unary_Minus_out1                 : signed(1 DOWNTO 0);  -- sfix2
  SIGNAL Switch_out1                      : signed(1 DOWNTO 0);  -- sfix2
  SIGNAL ToComplex1_out1_re               : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL ToComplex1_out1_im               : std_logic_vector(1 DOWNTO 0);  -- ufix2

BEGIN
  u_ToComplex1 : ofdm_rx_src_ToComplex1_block
    PORT MAP( In1 => std_logic_vector(Switch_out1),  -- sfix2
              Out1_re => ToComplex1_out1_re,  -- sfix2
              Out1_im => ToComplex1_out1_im  -- sfix2
              );

  symbCount_unsigned <= unsigned(symbCount);

  
  Polarity_LUT1_k <= to_unsigned(16#00#, 7) WHEN symbCount_unsigned = to_unsigned(16#00#, 7) ELSE
      to_unsigned(16#7E#, 7) WHEN symbCount_unsigned >= to_unsigned(16#7E#, 7) ELSE
      symbCount_unsigned;
  Polarity_LUT1_out1 <= Polarity_LUT1_data(to_integer(Polarity_LUT1_k));

  PipelineRegister1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_192_0 = '1' THEN
        Polarity_LUT1_out1_1 <= Polarity_LUT1_out1;
      END IF;
    END IF;
  END PROCESS PipelineRegister1_process;


  
  Compare_To_Constant_out1 <= '1' WHEN Polarity_LUT1_out1_1 > to_signed(16#0#, 2) ELSE
      '0';

  Compare_To_Constant2_out1 <= '1';

  sampleCount_unsigned <= unsigned(sampleCount);

  
  Compare_To_Constant3_out1 <= '1' WHEN sampleCount_unsigned < to_unsigned(16#04#, 6) ELSE
      '0';

  Logical_Operator1_out1 <= Compare_To_Constant2_out1 AND Compare_To_Constant3_out1;

  Logical_Operator3_out1 <= valid AND Logical_Operator1_out1;

  delayMatch_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Logical_Operator3_out1_1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_192_0 = '1' THEN
        Logical_Operator3_out1_1 <= Logical_Operator3_out1;
      END IF;
    END IF;
  END PROCESS delayMatch_process;


  Constant_out1 <= to_signed(16#0#, 2);

  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 3
  HDL_Counter1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      HDL_Counter1_out1 <= to_unsigned(16#0#, 2);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_192_0 = '1' AND Logical_Operator3_out1 = '1' THEN
        HDL_Counter1_out1 <= HDL_Counter1_out1 + to_unsigned(16#1#, 2);
      END IF;
    END IF;
  END PROCESS HDL_Counter1_process;


  
  PilotValue_LUT1_k <= to_unsigned(16#0#, 2) WHEN HDL_Counter1_out1 = to_unsigned(16#0#, 2) ELSE
      to_unsigned(16#3#, 2) WHEN HDL_Counter1_out1 = to_unsigned(16#3#, 2) ELSE
      HDL_Counter1_out1;
  PilotValue_LUT1_out1 <= PilotValue_LUT1_data(to_integer(PilotValue_LUT1_k));

  PipelineRegister_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_192_0 = '1' THEN
        PilotValue_LUT1_out1_1 <= PilotValue_LUT1_out1;
      END IF;
    END IF;
  END PROCESS PipelineRegister_process;


  
  Switch1_out1 <= Constant_out1 WHEN Logical_Operator3_out1_1 = '0' ELSE
      PilotValue_LUT1_out1_1;

  Unary_Minus_in0 <=  - (resize(Switch1_out1, 3));
  Unary_Minus_out1 <= Unary_Minus_in0(1 DOWNTO 0);

  
  Switch_out1 <= Unary_Minus_out1 WHEN Compare_To_Constant_out1 = '0' ELSE
      Switch1_out1;

  pilOut_re <= ToComplex1_out1_re;

  pilOut_im <= ToComplex1_out1_im;

END rtl;

