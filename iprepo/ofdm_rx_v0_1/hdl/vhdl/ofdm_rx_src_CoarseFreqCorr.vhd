-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\OFDM_rx\hdlsrc\OFDM_Tx_Rx_HW\ofdm_rx_src_CoarseFreqCorr.vhd
-- Created: 2021-01-08 12:41:57
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: ofdm_rx_src_CoarseFreqCorr
-- Source Path: OFDM_Tx_Rx_HW/OFDMRx/Synchronisation/CoarseFreqCorr
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.ofdm_rx_src_OFDMRx_pkg.ALL;

ENTITY ofdm_rx_src_CoarseFreqCorr IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_192_0                       :   IN    std_logic;
        dataIn_re                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        dataIn_im                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        frameDet                          :   IN    std_logic;
        phaseIn                           :   IN    std_logic_vector(24 DOWNTO 0);  -- sfix25_En22
        dataOut_re                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        dataOut_im                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        frameDetOut                       :   OUT   std_logic
        );
END ofdm_rx_src_CoarseFreqCorr;


ARCHITECTURE rtl OF ofdm_rx_src_CoarseFreqCorr IS

  -- Component Declarations
  COMPONENT ofdm_rx_src_RsingEdge
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_192_0                     :   IN    std_logic;
          In1                             :   IN    std_logic;
          Out1                            :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT ofdm_rx_src_NCO_HDL_Optimized
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_192_0                     :   IN    std_logic;
          inc                             :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          validIn                         :   IN    std_logic;
          complexexp_re                   :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          complexexp_im                   :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          validOut                        :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : ofdm_rx_src_RsingEdge
    USE ENTITY work.ofdm_rx_src_RsingEdge(rtl);

  FOR ALL : ofdm_rx_src_NCO_HDL_Optimized
    USE ENTITY work.ofdm_rx_src_NCO_HDL_Optimized(rtl);

  -- Signals
  SIGNAL dataIn_re_signed                 : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL dataIn_im_signed                 : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Delay_reg_re                     : vector_of_signed16(0 TO 7);  -- sfix16_En14 [8]
  SIGNAL Delay_reg_im                     : vector_of_signed16(0 TO 7);  -- sfix16_En14 [8]
  SIGNAL Delay_out1_re                    : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Delay_out1_im                    : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL reduced_reg                      : vector_of_signed16(0 TO 2);  -- sfix16 [3]
  SIGNAL Product_C2ReIm_1_C2ReIm_A        : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL RsingEdge_out1                   : std_logic;
  SIGNAL phaseIn_signed                   : signed(24 DOWNTO 0);  -- sfix25_En22
  SIGNAL phaseIn_1                        : signed(24 DOWNTO 0);  -- sfix25_En22
  SIGNAL Unit_Delay_Enabled_Synchronous_out1 : signed(24 DOWNTO 0);  -- sfix25_En22
  SIGNAL Unit_Delay_Enabled_Synchronous_ectrl : signed(24 DOWNTO 0);  -- sfix25_En22
  SIGNAL Gain_cast                        : signed(49 DOWNTO 0);  -- sfix50_En34
  SIGNAL Gain_out1                        : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Constant_out1                    : std_logic;
  SIGNAL NCO_HDL_Optimized_out1_re        : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL NCO_HDL_Optimized_out1_im        : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL NCO_HDL_Optimized_out2           : std_logic;
  SIGNAL NCO_HDL_Optimized_out1_re_signed : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL NCO_HDL_Optimized_out1_im_signed : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL conj_cast                        : signed(16 DOWNTO 0);  -- sfix17_En14
  SIGNAL conj_cast_1                      : signed(16 DOWNTO 0);  -- sfix17_En14
  SIGNAL Math_Function_out1_re            : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Math_Function_out1_im            : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Delay5_out1_re                   : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Delay5_out1_im                   : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Product_C2ReIm_2_C2ReIm_A        : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Product_mul_temp                 : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Product_Re_AC                    : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Product_Re_AC_1                  : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL reduced_reg_1                    : vector_of_signed16(0 TO 2);  -- sfix16 [3]
  SIGNAL Product_C2ReIm_1_C2ReIm_B        : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Product_C2ReIm_2_C2ReIm_B        : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Product2_mul_temp                : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Product_Re_BD                    : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Product_Re_BD_1                  : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL mulOutput                        : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Product1_mul_temp                : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Product_Im_AD                    : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Product_Im_AD_1                  : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Product3_mul_temp                : signed(31 DOWNTO 0);  -- sfix32_En28
  SIGNAL Product_Im_BC                    : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Product_Im_BC_1                  : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL mulOutput_1                      : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Delay1_reg                       : std_logic_vector(0 TO 8);  -- ufix1 [9]
  SIGNAL Delay1_out1                      : std_logic;

BEGIN
  -- Generate complex sinusoid with a frequency equal 
  -- to the estimated frequency offset. 
  -- 
  -- Correct frequency offset
  -- 
  -- Reccord the phase of the averaged autocorrelation at the coarse
  -- timing point.  

  u_RsingEdge : ofdm_rx_src_RsingEdge
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_192_0 => enb_1_192_0,
              In1 => frameDet,
              Out1 => RsingEdge_out1
              );

  u_NCO_HDL_Optimized : ofdm_rx_src_NCO_HDL_Optimized
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_192_0 => enb_1_192_0,
              inc => std_logic_vector(Gain_out1),  -- uint16
              validIn => Constant_out1,
              complexexp_re => NCO_HDL_Optimized_out1_re,  -- sfix16_En14
              complexexp_im => NCO_HDL_Optimized_out1_im,  -- sfix16_En14
              validOut => NCO_HDL_Optimized_out2
              );

  dataIn_re_signed <= signed(dataIn_re);

  dataIn_im_signed <= signed(dataIn_im);

  Delay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay_reg_re <= (OTHERS => to_signed(16#0000#, 16));
      Delay_reg_im <= (OTHERS => to_signed(16#0000#, 16));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_192_0 = '1' THEN
        Delay_reg_im(0) <= dataIn_im_signed;
        Delay_reg_im(1 TO 7) <= Delay_reg_im(0 TO 6);
        Delay_reg_re(0) <= dataIn_re_signed;
        Delay_reg_re(1 TO 7) <= Delay_reg_re(0 TO 6);
      END IF;
    END IF;
  END PROCESS Delay_process;

  Delay_out1_re <= Delay_reg_re(7);
  Delay_out1_im <= Delay_reg_im(7);

  reduced_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      reduced_reg <= (OTHERS => to_signed(16#0000#, 16));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_192_0 = '1' THEN
        reduced_reg(0) <= Delay_out1_re;
        reduced_reg(1 TO 2) <= reduced_reg(0 TO 1);
      END IF;
    END IF;
  END PROCESS reduced_process;

  Product_C2ReIm_1_C2ReIm_A <= reduced_reg(2);

  phaseIn_signed <= signed(phaseIn);

  delayMatch_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      phaseIn_1 <= to_signed(16#0000000#, 25);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_192_0 = '1' THEN
        phaseIn_1 <= phaseIn_signed;
      END IF;
    END IF;
  END PROCESS delayMatch_process;


  
  Unit_Delay_Enabled_Synchronous_ectrl <= Unit_Delay_Enabled_Synchronous_out1 WHEN RsingEdge_out1 = '0' ELSE
      phaseIn_1;

  Unit_Delay_Enabled_Synchronous_lowered_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay_Enabled_Synchronous_out1 <= to_signed(16#0000000#, 25);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_192_0 = '1' THEN
        Unit_Delay_Enabled_Synchronous_out1 <= Unit_Delay_Enabled_Synchronous_ectrl;
      END IF;
    END IF;
  END PROCESS Unit_Delay_Enabled_Synchronous_lowered_process;


  Gain_cast <= resize(Unit_Delay_Enabled_Synchronous_out1 & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 50);
  Gain_out1 <= unsigned(Gain_cast(49 DOWNTO 34));

  Constant_out1 <= '1';

  NCO_HDL_Optimized_out1_re_signed <= signed(NCO_HDL_Optimized_out1_re);

  NCO_HDL_Optimized_out1_im_signed <= signed(NCO_HDL_Optimized_out1_im);

  Math_Function_out1_re <= NCO_HDL_Optimized_out1_re_signed;
  conj_cast <= resize(NCO_HDL_Optimized_out1_im_signed, 17);
  conj_cast_1 <=  - (conj_cast);
  
  Math_Function_out1_im <= X"7FFF" WHEN (conj_cast_1(16) = '0') AND (conj_cast_1(15) /= '0') ELSE
      X"8000" WHEN (conj_cast_1(16) = '1') AND (conj_cast_1(15) /= '1') ELSE
      conj_cast_1(15 DOWNTO 0);

  Delay5_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay5_out1_re <= to_signed(16#0000#, 16);
      Delay5_out1_im <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_192_0 = '1' THEN
        Delay5_out1_re <= Math_Function_out1_re;
        Delay5_out1_im <= Math_Function_out1_im;
      END IF;
    END IF;
  END PROCESS Delay5_process;


  reduced_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Product_C2ReIm_2_C2ReIm_A <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_192_0 = '1' THEN
        Product_C2ReIm_2_C2ReIm_A <= Delay5_out1_re;
      END IF;
    END IF;
  END PROCESS reduced_1_process;


  Product_mul_temp <= Product_C2ReIm_1_C2ReIm_A * Product_C2ReIm_2_C2ReIm_A;
  Product_Re_AC <= Product_mul_temp(29 DOWNTO 14);

  PipelineRegister_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Product_Re_AC_1 <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_192_0 = '1' THEN
        Product_Re_AC_1 <= Product_Re_AC;
      END IF;
    END IF;
  END PROCESS PipelineRegister_process;


  reduced_2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      reduced_reg_1 <= (OTHERS => to_signed(16#0000#, 16));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_192_0 = '1' THEN
        reduced_reg_1(0) <= Delay_out1_im;
        reduced_reg_1(1 TO 2) <= reduced_reg_1(0 TO 1);
      END IF;
    END IF;
  END PROCESS reduced_2_process;

  Product_C2ReIm_1_C2ReIm_B <= reduced_reg_1(2);

  reduced_3_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Product_C2ReIm_2_C2ReIm_B <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_192_0 = '1' THEN
        Product_C2ReIm_2_C2ReIm_B <= Delay5_out1_im;
      END IF;
    END IF;
  END PROCESS reduced_3_process;


  Product2_mul_temp <= Product_C2ReIm_1_C2ReIm_B * Product_C2ReIm_2_C2ReIm_B;
  Product_Re_BD <= Product2_mul_temp(29 DOWNTO 14);

  PipelineRegister2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Product_Re_BD_1 <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_192_0 = '1' THEN
        Product_Re_BD_1 <= Product_Re_BD;
      END IF;
    END IF;
  END PROCESS PipelineRegister2_process;


  mulOutput <= Product_Re_AC_1 - Product_Re_BD_1;

  dataOut_re <= std_logic_vector(mulOutput);

  Product1_mul_temp <= Product_C2ReIm_1_C2ReIm_A * Product_C2ReIm_2_C2ReIm_B;
  Product_Im_AD <= Product1_mul_temp(29 DOWNTO 14);

  PipelineRegister1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Product_Im_AD_1 <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_192_0 = '1' THEN
        Product_Im_AD_1 <= Product_Im_AD;
      END IF;
    END IF;
  END PROCESS PipelineRegister1_process;


  Product3_mul_temp <= Product_C2ReIm_1_C2ReIm_B * Product_C2ReIm_2_C2ReIm_A;
  Product_Im_BC <= Product3_mul_temp(29 DOWNTO 14);

  PipelineRegister3_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Product_Im_BC_1 <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_192_0 = '1' THEN
        Product_Im_BC_1 <= Product_Im_BC;
      END IF;
    END IF;
  END PROCESS PipelineRegister3_process;


  mulOutput_1 <= Product_Im_AD_1 + Product_Im_BC_1;

  dataOut_im <= std_logic_vector(mulOutput_1);

  Delay1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay1_reg <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_192_0 = '1' THEN
        Delay1_reg(0) <= frameDet;
        Delay1_reg(1 TO 8) <= Delay1_reg(0 TO 7);
      END IF;
    END IF;
  END PROCESS Delay1_process;

  Delay1_out1 <= Delay1_reg(8);

  frameDetOut <= Delay1_out1;

END rtl;

