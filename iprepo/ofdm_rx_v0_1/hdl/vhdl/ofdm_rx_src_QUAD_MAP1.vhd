-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\OFDM_rx\hdlsrc\OFDM_Tx_Rx_HW\ofdm_rx_src_QUAD_MAP1.vhd
-- Created: 2021-01-08 12:41:57
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: ofdm_rx_src_QUAD_MAP1
-- Source Path: OFDM_Tx_Rx_HW/OFDMRx/PhaseTracking_1/CordicRotate/QCORR/QUAD_MAP1
-- Hierarchy Level: 4
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY ofdm_rx_src_QUAD_MAP1 IS
  PORT( xin                               :   IN    std_logic_vector(20 DOWNTO 0);  -- sfix21_En15
        yin                               :   IN    std_logic_vector(20 DOWNTO 0);  -- sfix21_En15
        ctrl                              :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
        xout                              :   OUT   std_logic_vector(20 DOWNTO 0);  -- sfix21_En15
        yout                              :   OUT   std_logic_vector(20 DOWNTO 0)  -- sfix21_En15
        );
END ofdm_rx_src_QUAD_MAP1;


ARCHITECTURE rtl OF ofdm_rx_src_QUAD_MAP1 IS

  -- Signals
  SIGNAL xin_signed                       : signed(20 DOWNTO 0);  -- sfix21_En15
  SIGNAL yin_signed                       : signed(20 DOWNTO 0);  -- sfix21_En15
  SIGNAL ctrl_unsigned                    : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL xout_tmp                         : signed(20 DOWNTO 0);  -- sfix21_En15
  SIGNAL yout_tmp                         : signed(20 DOWNTO 0);  -- sfix21_En15

BEGIN
  xin_signed <= signed(xin);

  yin_signed <= signed(yin);

  ctrl_unsigned <= unsigned(ctrl);

  OFDM_Rx_c2_QUAD_MAP1_output : PROCESS (ctrl_unsigned, xin_signed, yin_signed)
    VARIABLE cast : signed(21 DOWNTO 0);
    VARIABLE cast_0 : signed(21 DOWNTO 0);
    VARIABLE cast_1 : signed(21 DOWNTO 0);
    VARIABLE cast_2 : signed(21 DOWNTO 0);
  BEGIN
    cast_0 := to_signed(16#000000#, 22);
    cast_2 := to_signed(16#000000#, 22);
    cast := to_signed(16#000000#, 22);
    cast_1 := to_signed(16#000000#, 22);
    -- Process to perform final rotation 
    -- by pi/2 if the original angle was 
    -- in 3rd or 4th quadrants    
    IF ctrl_unsigned = to_unsigned(16#0#, 2) THEN 
      -- 1st or 2nd quadrants 
      xout_tmp <= xin_signed;
      yout_tmp <= yin_signed;
    ELSIF ctrl_unsigned = to_unsigned(16#1#, 2) THEN 
      -- 3rd quadrant (rotate pi/2 clockwise)
      xout_tmp <= yin_signed;
      cast_1 := resize(xin_signed, 22);
      cast_2 :=  - (cast_1);
      IF (cast_2(21) = '0') AND (cast_2(20) /= '0') THEN 
        yout_tmp <= "011111111111111111111";
      ELSIF (cast_2(21) = '1') AND (cast_2(20) /= '1') THEN 
        yout_tmp <= "100000000000000000000";
      ELSE 
        yout_tmp <= cast_2(20 DOWNTO 0);
      END IF;
    ELSIF ctrl_unsigned = to_unsigned(16#2#, 2) THEN 
      -- 4th quadrant (rotate pi/2 anti-clockwise) 
      cast := resize(yin_signed, 22);
      cast_0 :=  - (cast);
      IF (cast_0(21) = '0') AND (cast_0(20) /= '0') THEN 
        xout_tmp <= "011111111111111111111";
      ELSIF (cast_0(21) = '1') AND (cast_0(20) /= '1') THEN 
        xout_tmp <= "100000000000000000000";
      ELSE 
        xout_tmp <= cast_0(20 DOWNTO 0);
      END IF;
      yout_tmp <= xin_signed;
    ELSE 
      -- others clause
      xout_tmp <= xin_signed;
      yout_tmp <= yin_signed;
    END IF;
  END PROCESS OFDM_Rx_c2_QUAD_MAP1_output;


  xout <= std_logic_vector(xout_tmp);

  yout <= std_logic_vector(yout_tmp);

END rtl;

