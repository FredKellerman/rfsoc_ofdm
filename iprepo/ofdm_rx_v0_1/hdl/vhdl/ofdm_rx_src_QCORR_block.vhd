-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\OFDM_rx\hdlsrc\OFDM_Tx_Rx_HW\ofdm_rx_src_QCORR_block.vhd
-- Created: 2021-01-08 12:41:57
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: ofdm_rx_src_QCORR_block
-- Source Path: OFDM_Tx_Rx_HW/OFDMRx/PhaseTracking_2/CordicRotate/QCORR
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY ofdm_rx_src_QCORR_block IS
  PORT( X_in                              :   IN    std_logic_vector(20 DOWNTO 0);  -- sfix21_En15
        Y_in                              :   IN    std_logic_vector(20 DOWNTO 0);  -- sfix21_En15
        Ctrl_in                           :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
        X_out                             :   OUT   std_logic_vector(20 DOWNTO 0);  -- sfix21_En15
        Y_out                             :   OUT   std_logic_vector(20 DOWNTO 0)  -- sfix21_En15
        );
END ofdm_rx_src_QCORR_block;


ARCHITECTURE rtl OF ofdm_rx_src_QCORR_block IS

  -- Component Declarations
  COMPONENT ofdm_rx_src_QUAD_MAP1_block
    PORT( xin                             :   IN    std_logic_vector(20 DOWNTO 0);  -- sfix21_En15
          yin                             :   IN    std_logic_vector(20 DOWNTO 0);  -- sfix21_En15
          ctrl                            :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
          xout                            :   OUT   std_logic_vector(20 DOWNTO 0);  -- sfix21_En15
          yout                            :   OUT   std_logic_vector(20 DOWNTO 0)  -- sfix21_En15
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : ofdm_rx_src_QUAD_MAP1_block
    USE ENTITY work.ofdm_rx_src_QUAD_MAP1_block(rtl);

  -- Signals
  SIGNAL xout                             : std_logic_vector(20 DOWNTO 0);  -- ufix21
  SIGNAL yout                             : std_logic_vector(20 DOWNTO 0);  -- ufix21

BEGIN
  u_QUAD_MAP1 : ofdm_rx_src_QUAD_MAP1_block
    PORT MAP( xin => X_in,  -- sfix21_En15
              yin => Y_in,  -- sfix21_En15
              ctrl => Ctrl_in,  -- ufix2
              xout => xout,  -- sfix21_En15
              yout => yout  -- sfix21_En15
              );

  X_out <= xout;

  Y_out <= yout;

END rtl;

