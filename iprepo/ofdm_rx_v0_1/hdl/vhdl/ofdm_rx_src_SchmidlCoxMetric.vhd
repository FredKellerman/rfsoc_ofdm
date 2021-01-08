-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\OFDM_rx\hdlsrc\OFDM_Tx_Rx_HW\ofdm_rx_src_SchmidlCoxMetric.vhd
-- Created: 2021-01-08 12:41:57
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: ofdm_rx_src_SchmidlCoxMetric
-- Source Path: OFDM_Tx_Rx_HW/OFDMRx/Synchronisation/SchmidlCoxMetric 
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.ofdm_rx_src_OFDMRx_pkg.ALL;

ENTITY ofdm_rx_src_SchmidlCoxMetric IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_192_0                       :   IN    std_logic;
        dataIn_re                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        dataIn_im                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        left                              :   OUT   std_logic_vector(35 DOWNTO 0);  -- sfix36_En32
        right                             :   OUT   std_logic_vector(32 DOWNTO 0);  -- sfix33_En23
        phase                             :   OUT   std_logic_vector(24 DOWNTO 0)  -- sfix25_En22
        );
END ofdm_rx_src_SchmidlCoxMetric;


ARCHITECTURE rtl OF ofdm_rx_src_SchmidlCoxMetric IS

  -- Component Declarations
  COMPONENT ofdm_rx_src_AutoCorr
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_192_0                     :   IN    std_logic;
          AcorrIn_re                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          AcorrIn_im                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          AcorrOut_re                     :   OUT   std_logic_vector(24 DOWNTO 0);  -- sfix25_En23
          AcorrOut_im                     :   OUT   std_logic_vector(24 DOWNTO 0)  -- sfix25_En23
          );
  END COMPONENT;

  COMPONENT ofdm_rx_src_CIC_ma_block
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_192_0                     :   IN    std_logic;
          In1_re                          :   IN    std_logic_vector(24 DOWNTO 0);  -- sfix25_En23
          In1_im                          :   IN    std_logic_vector(24 DOWNTO 0);  -- sfix25_En23
          Out1_re                         :   OUT   std_logic_vector(17 DOWNTO 0);  -- sfix18_En16
          Out1_im                         :   OUT   std_logic_vector(17 DOWNTO 0)  -- sfix18_En16
          );
  END COMPONENT;

  COMPONENT ofdm_rx_src_MagPhase
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_192_0                     :   IN    std_logic;
          dataIn_re                       :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En16
          dataIn_im                       :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En16
          Phase                           :   OUT   std_logic_vector(24 DOWNTO 0);  -- sfix25_En22
          Mag                             :   OUT   std_logic_vector(17 DOWNTO 0)  -- sfix18_En16
          );
  END COMPONENT;

  COMPONENT ofdm_rx_src_Sq
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_192_0                     :   IN    std_logic;
          In1                             :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En16
          Out1                            :   OUT   std_logic_vector(35 DOWNTO 0)  -- sfix36_En32
          );
  END COMPONENT;

  COMPONENT ofdm_rx_src_Abs2_block
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_192_0                     :   IN    std_logic;
          Abs2In_re                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          Abs2In_im                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          Abs2Out                         :   OUT   std_logic_vector(24 DOWNTO 0)  -- ufix25_En23
          );
  END COMPONENT;

  COMPONENT ofdm_rx_src_CIC_ma1
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_192_0                     :   IN    std_logic;
          In1                             :   IN    std_logic_vector(24 DOWNTO 0);  -- ufix25_En23
          Out1                            :   OUT   std_logic_vector(17 DOWNTO 0)  -- sfix18_En15
          );
  END COMPONENT;

  COMPONENT ofdm_rx_src_Sq1
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_192_0                     :   IN    std_logic;
          In1                             :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En15
          Out1                            :   OUT   std_logic_vector(35 DOWNTO 0)  -- sfix36_En30
          );
  END COMPONENT;

  COMPONENT ofdm_rx_src_ThreshMult
    PORT( In1                             :   IN    std_logic_vector(35 DOWNTO 0);  -- sfix36_En30
          Out1                            :   OUT   std_logic_vector(32 DOWNTO 0)  -- sfix33_En23
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : ofdm_rx_src_AutoCorr
    USE ENTITY work.ofdm_rx_src_AutoCorr(rtl);

  FOR ALL : ofdm_rx_src_CIC_ma_block
    USE ENTITY work.ofdm_rx_src_CIC_ma_block(rtl);

  FOR ALL : ofdm_rx_src_MagPhase
    USE ENTITY work.ofdm_rx_src_MagPhase(rtl);

  FOR ALL : ofdm_rx_src_Sq
    USE ENTITY work.ofdm_rx_src_Sq(rtl);

  FOR ALL : ofdm_rx_src_Abs2_block
    USE ENTITY work.ofdm_rx_src_Abs2_block(rtl);

  FOR ALL : ofdm_rx_src_CIC_ma1
    USE ENTITY work.ofdm_rx_src_CIC_ma1(rtl);

  FOR ALL : ofdm_rx_src_Sq1
    USE ENTITY work.ofdm_rx_src_Sq1(rtl);

  FOR ALL : ofdm_rx_src_ThreshMult
    USE ENTITY work.ofdm_rx_src_ThreshMult(rtl);

  -- Signals
  SIGNAL AutoCorr_out1_re                 : std_logic_vector(24 DOWNTO 0);  -- ufix25
  SIGNAL AutoCorr_out1_im                 : std_logic_vector(24 DOWNTO 0);  -- ufix25
  SIGNAL CIC_ma_out1_re                   : std_logic_vector(17 DOWNTO 0);  -- ufix18
  SIGNAL CIC_ma_out1_im                   : std_logic_vector(17 DOWNTO 0);  -- ufix18
  SIGNAL MagPhase_out1                    : std_logic_vector(24 DOWNTO 0);  -- ufix25
  SIGNAL MagPhase_out2                    : std_logic_vector(17 DOWNTO 0);  -- ufix18
  SIGNAL Sq_out1                          : std_logic_vector(35 DOWNTO 0);  -- ufix36
  SIGNAL Abs2_out1                        : std_logic_vector(24 DOWNTO 0);  -- ufix25
  SIGNAL CIC_ma1_out1                     : std_logic_vector(17 DOWNTO 0);  -- ufix18
  SIGNAL CIC_ma1_out1_signed              : signed(17 DOWNTO 0);  -- sfix18_En15
  SIGNAL Delay_reg                        : vector_of_signed18(0 TO 13);  -- sfix18 [14]
  SIGNAL Delay_out1                       : signed(17 DOWNTO 0);  -- sfix18_En15
  SIGNAL Sq1_out1                         : std_logic_vector(35 DOWNTO 0);  -- ufix36
  SIGNAL ThreshMult_out1                  : std_logic_vector(32 DOWNTO 0);  -- ufix33
  SIGNAL MagPhase_out1_signed             : signed(24 DOWNTO 0);  -- sfix25_En22
  SIGNAL Delay2_reg                       : vector_of_signed25(0 TO 1);  -- sfix25 [2]
  SIGNAL Delay2_out1                      : signed(24 DOWNTO 0);  -- sfix25_En22

BEGIN
  -- (R(d))^2 x thresh
  -- 
  -- |P(d)|^2
  -- 
  -- The Schmidl & Cox timing metric is used for frame detection. The timing metric, M(d), is compared to a threshold
  -- to determine if a frame is present. In order to avoid division, we re-arrange the timing metric as |P(d)|^2 > (R(d))^2 
  -- x thresh
  -- The phase of the averaged autocorrelation is also determined for Carrier Frequency Offset (CFO) estimation purposes. 
  

  u_AutoCorr : ofdm_rx_src_AutoCorr
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_192_0 => enb_1_192_0,
              AcorrIn_re => dataIn_re,  -- sfix16_En14
              AcorrIn_im => dataIn_im,  -- sfix16_En14
              AcorrOut_re => AutoCorr_out1_re,  -- sfix25_En23
              AcorrOut_im => AutoCorr_out1_im  -- sfix25_En23
              );

  u_CIC_ma : ofdm_rx_src_CIC_ma_block
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_192_0 => enb_1_192_0,
              In1_re => AutoCorr_out1_re,  -- sfix25_En23
              In1_im => AutoCorr_out1_im,  -- sfix25_En23
              Out1_re => CIC_ma_out1_re,  -- sfix18_En16
              Out1_im => CIC_ma_out1_im  -- sfix18_En16
              );

  u_MagPhase : ofdm_rx_src_MagPhase
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_192_0 => enb_1_192_0,
              dataIn_re => CIC_ma_out1_re,  -- sfix18_En16
              dataIn_im => CIC_ma_out1_im,  -- sfix18_En16
              Phase => MagPhase_out1,  -- sfix25_En22
              Mag => MagPhase_out2  -- sfix18_En16
              );

  u_Sq : ofdm_rx_src_Sq
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_192_0 => enb_1_192_0,
              In1 => MagPhase_out2,  -- sfix18_En16
              Out1 => Sq_out1  -- sfix36_En32
              );

  u_Abs2 : ofdm_rx_src_Abs2_block
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_192_0 => enb_1_192_0,
              Abs2In_re => dataIn_re,  -- sfix16_En14
              Abs2In_im => dataIn_im,  -- sfix16_En14
              Abs2Out => Abs2_out1  -- ufix25_En23
              );

  u_CIC_ma1 : ofdm_rx_src_CIC_ma1
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_192_0 => enb_1_192_0,
              In1 => Abs2_out1,  -- ufix25_En23
              Out1 => CIC_ma1_out1  -- sfix18_En15
              );

  u_Sq1 : ofdm_rx_src_Sq1
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_192_0 => enb_1_192_0,
              In1 => std_logic_vector(Delay_out1),  -- sfix18_En15
              Out1 => Sq1_out1  -- sfix36_En30
              );

  u_ThreshMult : ofdm_rx_src_ThreshMult
    PORT MAP( In1 => Sq1_out1,  -- sfix36_En30
              Out1 => ThreshMult_out1  -- sfix33_En23
              );

  CIC_ma1_out1_signed <= signed(CIC_ma1_out1);

  Delay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay_reg <= (OTHERS => to_signed(16#00000#, 18));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_192_0 = '1' THEN
        Delay_reg(0) <= CIC_ma1_out1_signed;
        Delay_reg(1 TO 13) <= Delay_reg(0 TO 12);
      END IF;
    END IF;
  END PROCESS Delay_process;

  Delay_out1 <= Delay_reg(13);

  MagPhase_out1_signed <= signed(MagPhase_out1);

  Delay2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay2_reg <= (OTHERS => to_signed(16#0000000#, 25));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_192_0 = '1' THEN
        Delay2_reg(0) <= MagPhase_out1_signed;
        Delay2_reg(1) <= Delay2_reg(0);
      END IF;
    END IF;
  END PROCESS Delay2_process;

  Delay2_out1 <= Delay2_reg(1);

  phase <= std_logic_vector(Delay2_out1);

  left <= Sq_out1;

  right <= ThreshMult_out1;

END rtl;

