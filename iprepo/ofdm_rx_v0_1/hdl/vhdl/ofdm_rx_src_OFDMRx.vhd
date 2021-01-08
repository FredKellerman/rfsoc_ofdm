-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\OFDM_rx\hdlsrc\OFDM_Tx_Rx_HW\ofdm_rx_src_OFDMRx.vhd
-- Created: 2021-01-08 12:41:57
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- 
-- -------------------------------------------------------------
-- Rate and Clocking Details
-- -------------------------------------------------------------
-- Model base rate: 5.20833e-09
-- Target subsystem base rate: 1e-06
-- 
-- 
-- Clock Enable  Sample Time
-- -------------------------------------------------------------
-- ce_out        1e-06
-- -------------------------------------------------------------
-- 
-- 
-- Output Signal                 Clock Enable  Sample Time
-- -------------------------------------------------------------
-- m_axis_re_tdata               ce_out        1e-06
-- m_axis_re_tvalid              ce_out        1e-06
-- m_axis_im_tdata               ce_out        1e-06
-- m_axis_im_tvalid              ce_out        1e-06
-- -------------------------------------------------------------
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: ofdm_rx_src_OFDMRx
-- Source Path: OFDM_Tx_Rx_HW/OFDMRx
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY ofdm_rx_src_OFDMRx IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        s_axis_re_tdata                   :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        s_axis_im_tdata                   :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        ce_out                            :   OUT   std_logic;
        m_axis_re_tdata                   :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        m_axis_re_tvalid                  :   OUT   std_logic;
        m_axis_im_tdata                   :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        m_axis_im_tvalid                  :   OUT   std_logic
        );
END ofdm_rx_src_OFDMRx;


ARCHITECTURE rtl OF ofdm_rx_src_OFDMRx IS

  -- Component Declarations
  COMPONENT ofdm_rx_src_Synchronisation
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_192_0                     :   IN    std_logic;
          dataIn_re                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          dataIn_im                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          DataOut_re                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          DataOut_im                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          FFTValidOut                     :   OUT   std_logic;
          dataValid                       :   OUT   std_logic;
          preambleValid                   :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT ofdm_rx_src_FFT
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_192_0                     :   IN    std_logic;
          dataIn_re                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          dataIn_im                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          FFTValidIn                      :   IN    std_logic;
          dataValid                       :   IN    std_logic;
          preambleValid                   :   IN    std_logic;
          dataOut_re                      :   OUT   std_logic_vector(21 DOWNTO 0);  -- sfix22_En14
          dataOut_im                      :   OUT   std_logic_vector(21 DOWNTO 0);  -- sfix22_En14
          dataValidOut                    :   OUT   std_logic;
          preambleValidOut                :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT ofdm_rx_src_ChannelEstEq
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_192_0                     :   IN    std_logic;
          dataIn_re                       :   IN    std_logic_vector(21 DOWNTO 0);  -- sfix22_En14
          dataIn_im                       :   IN    std_logic_vector(21 DOWNTO 0);  -- sfix22_En14
          dataValid                       :   IN    std_logic;
          preambleValid                   :   IN    std_logic;
          dataOut_re                      :   OUT   std_logic_vector(17 DOWNTO 0);  -- sfix18_En15
          dataOut_im                      :   OUT   std_logic_vector(17 DOWNTO 0);  -- sfix18_En15
          dataValidOut                    :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT ofdm_rx_src_PhaseTracking_1
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_192_0                     :   IN    std_logic;
          dataIn_re                       :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En15
          dataIn_im                       :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En15
          dataValidIn                     :   IN    std_logic;
          dataOut_re                      :   OUT   std_logic_vector(17 DOWNTO 0);  -- sfix18_En15
          dataOut_im                      :   OUT   std_logic_vector(17 DOWNTO 0);  -- sfix18_En15
          dataValidOut                    :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT ofdm_rx_src_PhaseTracking_2
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_192_0                     :   IN    std_logic;
          dataIn_re                       :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En15
          dataIn_im                       :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En15
          dataValidIn                     :   IN    std_logic;
          dataOut_re                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          dataOut_im                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          validOut                        :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : ofdm_rx_src_Synchronisation
    USE ENTITY work.ofdm_rx_src_Synchronisation(rtl);

  FOR ALL : ofdm_rx_src_FFT
    USE ENTITY work.ofdm_rx_src_FFT(rtl);

  FOR ALL : ofdm_rx_src_ChannelEstEq
    USE ENTITY work.ofdm_rx_src_ChannelEstEq(rtl);

  FOR ALL : ofdm_rx_src_PhaseTracking_1
    USE ENTITY work.ofdm_rx_src_PhaseTracking_1(rtl);

  FOR ALL : ofdm_rx_src_PhaseTracking_2
    USE ENTITY work.ofdm_rx_src_PhaseTracking_2(rtl);

  -- Signals
  SIGNAL enb_1_192_0                      : std_logic;
  SIGNAL Synchronisation_out1_re          : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Synchronisation_out1_im          : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Synchronisation_out2             : std_logic;
  SIGNAL Synchronisation_out3             : std_logic;
  SIGNAL Synchronisation_out4             : std_logic;
  SIGNAL FFT_out1_re                      : std_logic_vector(21 DOWNTO 0);  -- ufix22
  SIGNAL FFT_out1_im                      : std_logic_vector(21 DOWNTO 0);  -- ufix22
  SIGNAL FFT_out2                         : std_logic;
  SIGNAL FFT_out3                         : std_logic;
  SIGNAL ChannelEstEq_out1_re             : std_logic_vector(17 DOWNTO 0);  -- ufix18
  SIGNAL ChannelEstEq_out1_im             : std_logic_vector(17 DOWNTO 0);  -- ufix18
  SIGNAL ChannelEstEq_out2                : std_logic;
  SIGNAL PhaseTracking_1_out1_re          : std_logic_vector(17 DOWNTO 0);  -- ufix18
  SIGNAL PhaseTracking_1_out1_im          : std_logic_vector(17 DOWNTO 0);  -- ufix18
  SIGNAL PhaseTracking_1_out2             : std_logic;
  SIGNAL PhaseTracking_2_out1_re          : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL PhaseTracking_2_out1_im          : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL PhaseTracking_2_out2             : std_logic;
  SIGNAL reduced_reg                      : std_logic_vector(0 TO 51);  -- ufix1 [52]
  SIGNAL PhaseTracking_2_out2_1           : std_logic;

BEGIN
  -- Phase Tracking
  -- 
  -- One Tap Equaliser 
  -- 
  -- FFT Demodulation
  -- 
  -- Timing and Frequency 
  -- synchronisation  

  u_Synchronisation : ofdm_rx_src_Synchronisation
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_192_0 => clk_enable,
              dataIn_re => s_axis_re_tdata,  -- sfix16_En14
              dataIn_im => s_axis_im_tdata,  -- sfix16_En14
              DataOut_re => Synchronisation_out1_re,  -- sfix16_En14
              DataOut_im => Synchronisation_out1_im,  -- sfix16_En14
              FFTValidOut => Synchronisation_out2,
              dataValid => Synchronisation_out3,
              preambleValid => Synchronisation_out4
              );

  u_FFT : ofdm_rx_src_FFT
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_192_0 => clk_enable,
              dataIn_re => Synchronisation_out1_re,  -- sfix16_En14
              dataIn_im => Synchronisation_out1_im,  -- sfix16_En14
              FFTValidIn => Synchronisation_out2,
              dataValid => Synchronisation_out3,
              preambleValid => Synchronisation_out4,
              dataOut_re => FFT_out1_re,  -- sfix22_En14
              dataOut_im => FFT_out1_im,  -- sfix22_En14
              dataValidOut => FFT_out2,
              preambleValidOut => FFT_out3
              );

  u_ChannelEstEq : ofdm_rx_src_ChannelEstEq
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_192_0 => clk_enable,
              dataIn_re => FFT_out1_re,  -- sfix22_En14
              dataIn_im => FFT_out1_im,  -- sfix22_En14
              dataValid => FFT_out2,
              preambleValid => FFT_out3,
              dataOut_re => ChannelEstEq_out1_re,  -- sfix18_En15
              dataOut_im => ChannelEstEq_out1_im,  -- sfix18_En15
              dataValidOut => ChannelEstEq_out2
              );

  u_PhaseTracking_1 : ofdm_rx_src_PhaseTracking_1
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_192_0 => clk_enable,
              dataIn_re => ChannelEstEq_out1_re,  -- sfix18_En15
              dataIn_im => ChannelEstEq_out1_im,  -- sfix18_En15
              dataValidIn => ChannelEstEq_out2,
              dataOut_re => PhaseTracking_1_out1_re,  -- sfix18_En15
              dataOut_im => PhaseTracking_1_out1_im,  -- sfix18_En15
              dataValidOut => PhaseTracking_1_out2
              );

  u_PhaseTracking_2 : ofdm_rx_src_PhaseTracking_2
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_192_0 => clk_enable,
              dataIn_re => PhaseTracking_1_out1_re,  -- sfix18_En15
              dataIn_im => PhaseTracking_1_out1_im,  -- sfix18_En15
              dataValidIn => PhaseTracking_1_out2,
              dataOut_re => PhaseTracking_2_out1_re,  -- sfix16_En14
              dataOut_im => PhaseTracking_2_out1_im,  -- sfix16_En14
              validOut => PhaseTracking_2_out2
              );

  enb_1_192_0 <= clk_enable;

  reduced_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      reduced_reg <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_192_0 = '1' THEN
        reduced_reg(0) <= PhaseTracking_2_out2;
        reduced_reg(1 TO 51) <= reduced_reg(0 TO 50);
      END IF;
    END IF;
  END PROCESS reduced_process;

  PhaseTracking_2_out2_1 <= reduced_reg(51);

  ce_out <= clk_enable;

  m_axis_re_tdata <= PhaseTracking_2_out1_re;

  m_axis_re_tvalid <= PhaseTracking_2_out2_1;

  m_axis_im_tdata <= PhaseTracking_2_out1_im;

  m_axis_im_tvalid <= PhaseTracking_2_out2_1;

END rtl;

