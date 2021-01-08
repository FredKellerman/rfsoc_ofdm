-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\OFDM_rx\hdlsrc\OFDM_Tx_Rx_HW\ofdm_rx_src_DataArrange.vhd
-- Created: 2021-01-08 12:41:57
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: ofdm_rx_src_DataArrange
-- Source Path: OFDM_Tx_Rx_HW/OFDMRx/PhaseTracking_1/DataArrange
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.ofdm_rx_src_OFDMRx_pkg.ALL;

ENTITY ofdm_rx_src_DataArrange IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_192_0                       :   IN    std_logic;
        dataIn_re                         :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En15
        dataIn_im                         :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En15
        dataValidIn                       :   IN    std_logic;
        dataOut_re                        :   OUT   std_logic_vector(17 DOWNTO 0);  -- sfix18_En15
        dataOut_im                        :   OUT   std_logic_vector(17 DOWNTO 0);  -- sfix18_En15
        dataValidOut                      :   OUT   std_logic
        );
END ofdm_rx_src_DataArrange;


ARCHITECTURE rtl OF ofdm_rx_src_DataArrange IS

  -- Component Declarations
  COMPONENT ofdm_rx_src_READ_CTRL
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_192_0                     :   IN    std_logic;
          In1                             :   IN    std_logic_vector(6 DOWNTO 0);  -- ufix7
          In2                             :   IN    std_logic;
          Out1                            :   OUT   std_logic_vector(6 DOWNTO 0)  -- ufix7
          );
  END COMPONENT;

  COMPONENT ofdm_rx_src_DualPortRAM_generic
    GENERIC( AddrWidth                    : integer;
             DataWidth                    : integer
             );
    PORT( clk                             :   IN    std_logic;
          enb_1_192_0                     :   IN    std_logic;
          wr_din_re                       :   IN    std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
          wr_din_im                       :   IN    std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
          wr_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          wr_en                           :   IN    std_logic;
          rd_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          wr_dout_re                      :   OUT   std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
          wr_dout_im                      :   OUT   std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
          rd_dout_re                      :   OUT   std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
          rd_dout_im                      :   OUT   std_logic_vector(DataWidth - 1 DOWNTO 0)  -- generic width
          );
  END COMPONENT;

  COMPONENT ofdm_rx_src_dataValidGen
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_192_0                     :   IN    std_logic;
          enb                             :   IN    std_logic;
          dataValidOut                    :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : ofdm_rx_src_READ_CTRL
    USE ENTITY work.ofdm_rx_src_READ_CTRL(rtl);

  FOR ALL : ofdm_rx_src_DualPortRAM_generic
    USE ENTITY work.ofdm_rx_src_DualPortRAM_generic(rtl);

  FOR ALL : ofdm_rx_src_dataValidGen
    USE ENTITY work.ofdm_rx_src_dataValidGen(rtl);

  -- Constants
  CONSTANT READ_ADDRESS_data              : vector_of_unsigned7(0 TO 127) := 
    (to_unsigned(16#00#, 7), to_unsigned(16#1B#, 7), to_unsigned(16#1C#, 7), to_unsigned(16#1D#, 7),
     to_unsigned(16#1E#, 7), to_unsigned(16#1F#, 7), to_unsigned(16#20#, 7), to_unsigned(16#21#, 7),
     to_unsigned(16#22#, 7), to_unsigned(16#23#, 7), to_unsigned(16#24#, 7), to_unsigned(16#25#, 7),
     to_unsigned(16#2B#, 7), to_unsigned(16#39#, 7), to_unsigned(16#07#, 7), to_unsigned(16#15#, 7),
     to_unsigned(16#26#, 7), to_unsigned(16#27#, 7), to_unsigned(16#28#, 7), to_unsigned(16#29#, 7),
     to_unsigned(16#2A#, 7), to_unsigned(16#2C#, 7), to_unsigned(16#2D#, 7), to_unsigned(16#2E#, 7),
     to_unsigned(16#2F#, 7), to_unsigned(16#30#, 7), to_unsigned(16#31#, 7), to_unsigned(16#32#, 7),
     to_unsigned(16#33#, 7), to_unsigned(16#34#, 7), to_unsigned(16#35#, 7), to_unsigned(16#36#, 7),
     to_unsigned(16#37#, 7), to_unsigned(16#38#, 7), to_unsigned(16#3A#, 7), to_unsigned(16#3B#, 7),
     to_unsigned(16#3C#, 7), to_unsigned(16#3D#, 7), to_unsigned(16#3E#, 7), to_unsigned(16#3F#, 7),
     to_unsigned(16#01#, 7), to_unsigned(16#02#, 7), to_unsigned(16#03#, 7), to_unsigned(16#04#, 7),
     to_unsigned(16#05#, 7), to_unsigned(16#06#, 7), to_unsigned(16#08#, 7), to_unsigned(16#09#, 7),
     to_unsigned(16#0A#, 7), to_unsigned(16#0B#, 7), to_unsigned(16#0C#, 7), to_unsigned(16#0D#, 7),
     to_unsigned(16#0E#, 7), to_unsigned(16#0F#, 7), to_unsigned(16#10#, 7), to_unsigned(16#11#, 7),
     to_unsigned(16#12#, 7), to_unsigned(16#13#, 7), to_unsigned(16#14#, 7), to_unsigned(16#16#, 7),
     to_unsigned(16#17#, 7), to_unsigned(16#18#, 7), to_unsigned(16#19#, 7), to_unsigned(16#1A#, 7),
     to_unsigned(16#40#, 7), to_unsigned(16#5B#, 7), to_unsigned(16#5C#, 7), to_unsigned(16#5D#, 7),
     to_unsigned(16#5E#, 7), to_unsigned(16#5F#, 7), to_unsigned(16#60#, 7), to_unsigned(16#61#, 7),
     to_unsigned(16#62#, 7), to_unsigned(16#63#, 7), to_unsigned(16#64#, 7), to_unsigned(16#65#, 7),
     to_unsigned(16#6B#, 7), to_unsigned(16#79#, 7), to_unsigned(16#47#, 7), to_unsigned(16#55#, 7),
     to_unsigned(16#66#, 7), to_unsigned(16#67#, 7), to_unsigned(16#68#, 7), to_unsigned(16#69#, 7),
     to_unsigned(16#6A#, 7), to_unsigned(16#6C#, 7), to_unsigned(16#6D#, 7), to_unsigned(16#6E#, 7),
     to_unsigned(16#6F#, 7), to_unsigned(16#70#, 7), to_unsigned(16#71#, 7), to_unsigned(16#72#, 7),
     to_unsigned(16#73#, 7), to_unsigned(16#74#, 7), to_unsigned(16#75#, 7), to_unsigned(16#76#, 7),
     to_unsigned(16#77#, 7), to_unsigned(16#78#, 7), to_unsigned(16#7A#, 7), to_unsigned(16#7B#, 7),
     to_unsigned(16#7C#, 7), to_unsigned(16#7D#, 7), to_unsigned(16#7E#, 7), to_unsigned(16#7F#, 7),
     to_unsigned(16#41#, 7), to_unsigned(16#42#, 7), to_unsigned(16#43#, 7), to_unsigned(16#44#, 7),
     to_unsigned(16#45#, 7), to_unsigned(16#46#, 7), to_unsigned(16#48#, 7), to_unsigned(16#49#, 7),
     to_unsigned(16#4A#, 7), to_unsigned(16#4B#, 7), to_unsigned(16#4C#, 7), to_unsigned(16#4D#, 7),
     to_unsigned(16#4E#, 7), to_unsigned(16#4F#, 7), to_unsigned(16#50#, 7), to_unsigned(16#51#, 7),
     to_unsigned(16#52#, 7), to_unsigned(16#53#, 7), to_unsigned(16#54#, 7), to_unsigned(16#56#, 7),
     to_unsigned(16#57#, 7), to_unsigned(16#58#, 7), to_unsigned(16#59#, 7), to_unsigned(16#5A#, 7));  -- ufix7 [128]

  -- Signals
  SIGNAL dataIn_re_signed                 : signed(17 DOWNTO 0);  -- sfix18_En15
  SIGNAL dataIn_im_signed                 : signed(17 DOWNTO 0);  -- sfix18_En15
  SIGNAL dataIn_re_1                      : signed(17 DOWNTO 0);  -- sfix18_En15
  SIGNAL dataIn_im_1                      : signed(17 DOWNTO 0);  -- sfix18_En15
  SIGNAL dataValidIn_1                    : std_logic;
  SIGNAL HDL_Counter1_out1                : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL delayMatch_reg                   : vector_of_unsigned7(0 TO 40);  -- ufix7 [41]
  SIGNAL HDL_Counter1_out1_1              : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL reduced_reg                      : std_logic_vector(0 TO 40);  -- ufix1 [41]
  SIGNAL dataValidIn_2                    : std_logic;
  SIGNAL reduced_reg_1                    : std_logic_vector(0 TO 22);  -- ufix1 [23]
  SIGNAL dataValidIn_3                    : std_logic;
  SIGNAL HDL_Counter_out1                 : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL READ_ADDRESS_k                   : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL READ_ADDRESS_out1                : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL READ_ADDRESS_out1_1              : unsigned(6 DOWNTO 0) := to_unsigned(16#00#, 7);  -- ufix7
  SIGNAL READ_CTRL_out1                   : std_logic_vector(6 DOWNTO 0);  -- ufix7
  SIGNAL READ_CTRL_out1_unsigned          : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL delayMatch2_reg                  : vector_of_unsigned7(0 TO 39);  -- ufix7 [40]
  SIGNAL READ_CTRL_out1_1                 : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL Dual_Port_RAM_out1_re            : std_logic_vector(17 DOWNTO 0);  -- ufix18
  SIGNAL Dual_Port_RAM_out1_im            : std_logic_vector(17 DOWNTO 0);  -- ufix18
  SIGNAL Dual_Port_RAM_out2_re            : std_logic_vector(17 DOWNTO 0);  -- ufix18
  SIGNAL Dual_Port_RAM_out2_im            : std_logic_vector(17 DOWNTO 0);  -- ufix18
  SIGNAL Dual_Port_RAM_out2_re_signed     : signed(17 DOWNTO 0);  -- sfix18_En15
  SIGNAL Dual_Port_RAM_out2_im_signed     : signed(17 DOWNTO 0);  -- sfix18_En15
  SIGNAL Dual_Port_RAM_out2_re_1          : signed(17 DOWNTO 0);  -- sfix18_En15
  SIGNAL Dual_Port_RAM_out2_im_1          : signed(17 DOWNTO 0);  -- sfix18_En15
  SIGNAL Delay3_out1                      : std_logic;
  SIGNAL dataValidGen_out1                : std_logic;
  SIGNAL dataValidGen_out1_1              : std_logic;

BEGIN
  -- Re-arrange data symbols

  u_READ_CTRL : ofdm_rx_src_READ_CTRL
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_192_0 => enb_1_192_0,
              In1 => std_logic_vector(READ_ADDRESS_out1_1),  -- ufix7
              In2 => dataValidIn_3,
              Out1 => READ_CTRL_out1  -- ufix7
              );

  u_Dual_Port_RAM : ofdm_rx_src_DualPortRAM_generic
    GENERIC MAP( AddrWidth => 7,
                 DataWidth => 18
                 )
    PORT MAP( clk => clk,
              enb_1_192_0 => enb_1_192_0,
              wr_din_re => std_logic_vector(dataIn_re_1),
              wr_din_im => std_logic_vector(dataIn_im_1),
              wr_addr => std_logic_vector(HDL_Counter1_out1_1),
              wr_en => dataValidIn_2,
              rd_addr => std_logic_vector(READ_CTRL_out1_1),
              wr_dout_re => Dual_Port_RAM_out1_re,
              wr_dout_im => Dual_Port_RAM_out1_im,
              rd_dout_re => Dual_Port_RAM_out2_re,
              rd_dout_im => Dual_Port_RAM_out2_im
              );

  u_dataValidGen : ofdm_rx_src_dataValidGen
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_192_0 => enb_1_192_0,
              enb => Delay3_out1,
              dataValidOut => dataValidGen_out1
              );

  dataIn_re_signed <= signed(dataIn_re);

  dataIn_im_signed <= signed(dataIn_im);

  in_0_pipe_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      dataIn_re_1 <= to_signed(16#00000#, 18);
      dataIn_im_1 <= to_signed(16#00000#, 18);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_192_0 = '1' THEN
        dataIn_re_1 <= dataIn_re_signed;
        dataIn_im_1 <= dataIn_im_signed;
      END IF;
    END IF;
  END PROCESS in_0_pipe_process;


  in_1_pipe_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      dataValidIn_1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_192_0 = '1' THEN
        dataValidIn_1 <= dataValidIn;
      END IF;
    END IF;
  END PROCESS in_1_pipe_process;


  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 127
  HDL_Counter1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      HDL_Counter1_out1 <= to_unsigned(16#00#, 7);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_192_0 = '1' AND dataValidIn_1 = '1' THEN
        HDL_Counter1_out1 <= HDL_Counter1_out1 + to_unsigned(16#01#, 7);
      END IF;
    END IF;
  END PROCESS HDL_Counter1_process;


  delayMatch_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      delayMatch_reg <= (OTHERS => to_unsigned(16#00#, 7));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_192_0 = '1' THEN
        delayMatch_reg(0) <= HDL_Counter1_out1;
        delayMatch_reg(1 TO 40) <= delayMatch_reg(0 TO 39);
      END IF;
    END IF;
  END PROCESS delayMatch_process;

  HDL_Counter1_out1_1 <= delayMatch_reg(40);

  reduced_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      reduced_reg <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_192_0 = '1' THEN
        reduced_reg(0) <= dataValidIn_1;
        reduced_reg(1 TO 40) <= reduced_reg(0 TO 39);
      END IF;
    END IF;
  END PROCESS reduced_process;

  dataValidIn_2 <= reduced_reg(40);

  reduced_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      reduced_reg_1 <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_192_0 = '1' THEN
        reduced_reg_1(0) <= dataValidIn_2;
        reduced_reg_1(1 TO 22) <= reduced_reg_1(0 TO 21);
      END IF;
    END IF;
  END PROCESS reduced_1_process;

  dataValidIn_3 <= reduced_reg_1(22);

  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 127
  HDL_Counter_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      HDL_Counter_out1 <= to_unsigned(16#00#, 7);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_192_0 = '1' AND dataValidIn_3 = '1' THEN
        HDL_Counter_out1 <= HDL_Counter_out1 + to_unsigned(16#01#, 7);
      END IF;
    END IF;
  END PROCESS HDL_Counter_process;


  
  READ_ADDRESS_k <= to_unsigned(16#00#, 7) WHEN HDL_Counter_out1 = to_unsigned(16#00#, 7) ELSE
      to_unsigned(16#7F#, 7) WHEN HDL_Counter_out1 = to_unsigned(16#7F#, 7) ELSE
      HDL_Counter_out1;
  READ_ADDRESS_out1 <= READ_ADDRESS_data(to_integer(READ_ADDRESS_k));

  PipelineRegister_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_192_0 = '1' THEN
        READ_ADDRESS_out1_1 <= READ_ADDRESS_out1;
      END IF;
    END IF;
  END PROCESS PipelineRegister_process;


  READ_CTRL_out1_unsigned <= unsigned(READ_CTRL_out1);

  delayMatch2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      delayMatch2_reg <= (OTHERS => to_unsigned(16#00#, 7));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_192_0 = '1' THEN
        delayMatch2_reg(0) <= READ_CTRL_out1_unsigned;
        delayMatch2_reg(1 TO 39) <= delayMatch2_reg(0 TO 38);
      END IF;
    END IF;
  END PROCESS delayMatch2_process;

  READ_CTRL_out1_1 <= delayMatch2_reg(39);

  Dual_Port_RAM_out2_re_signed <= signed(Dual_Port_RAM_out2_re);

  Dual_Port_RAM_out2_im_signed <= signed(Dual_Port_RAM_out2_im);

  out_0_pipe_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Dual_Port_RAM_out2_re_1 <= to_signed(16#00000#, 18);
      Dual_Port_RAM_out2_im_1 <= to_signed(16#00000#, 18);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_192_0 = '1' THEN
        Dual_Port_RAM_out2_re_1 <= Dual_Port_RAM_out2_re_signed;
        Dual_Port_RAM_out2_im_1 <= Dual_Port_RAM_out2_im_signed;
      END IF;
    END IF;
  END PROCESS out_0_pipe_process;


  dataOut_re <= std_logic_vector(Dual_Port_RAM_out2_re_1);

  dataOut_im <= std_logic_vector(Dual_Port_RAM_out2_im_1);

  Delay3_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay3_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_192_0 = '1' THEN
        Delay3_out1 <= dataValidIn_3;
      END IF;
    END IF;
  END PROCESS Delay3_process;


  out_1_pipe_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      dataValidGen_out1_1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_192_0 = '1' THEN
        dataValidGen_out1_1 <= dataValidGen_out1;
      END IF;
    END IF;
  END PROCESS out_1_pipe_process;


  dataValidOut <= dataValidGen_out1_1;

END rtl;

