-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\OFDM_rx\hdlsrc\OFDM_Tx_Rx_HW\ofdm_rx_src_SymbolCounter.vhd
-- Created: 2021-01-08 12:41:57
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: ofdm_rx_src_SymbolCounter
-- Source Path: OFDM_Tx_Rx_HW/OFDMRx/PhaseTracking_1/PilotCtrlGen/SymbolCounter
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY ofdm_rx_src_SymbolCounter IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_192_0                       :   IN    std_logic;
        ValidIn                           :   IN    std_logic;
        Symbl_cnt                         :   OUT   std_logic_vector(6 DOWNTO 0)  -- ufix7
        );
END ofdm_rx_src_SymbolCounter;


ARCHITECTURE rtl OF ofdm_rx_src_SymbolCounter IS

  -- Signals
  SIGNAL Delay_out1                       : std_logic;
  SIGNAL Relational_Operator_relop1       : std_logic;
  SIGNAL HDL_Counter_out1                 : unsigned(6 DOWNTO 0);  -- ufix7

BEGIN
  Delay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_192_0 = '1' THEN
        Delay_out1 <= ValidIn;
      END IF;
    END IF;
  END PROCESS Delay_process;


  
  Relational_Operator_relop1 <= '1' WHEN ValidIn < Delay_out1 ELSE
      '0';

  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 126
  HDL_Counter_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      HDL_Counter_out1 <= to_unsigned(16#00#, 7);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_192_0 = '1' THEN
        IF Relational_Operator_relop1 = '1' THEN 
          IF HDL_Counter_out1 >= to_unsigned(16#7E#, 7) THEN 
            HDL_Counter_out1 <= to_unsigned(16#00#, 7);
          ELSE 
            HDL_Counter_out1 <= HDL_Counter_out1 + to_unsigned(16#01#, 7);
          END IF;
        END IF;
      END IF;
    END IF;
  END PROCESS HDL_Counter_process;


  Symbl_cnt <= std_logic_vector(HDL_Counter_out1);

END rtl;

