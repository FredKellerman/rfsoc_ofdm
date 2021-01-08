-- Generated from Simulink block OFDM_Rx_HW/Decimate/HB_SSR_im
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity ofdm_rx_hw_hb_ssr_im is
  port (
    tvi : in std_logic_vector( 1-1 downto 0 );
    tdi_1 : in std_logic_vector( 16-1 downto 0 );
    tdi_2 : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tdo : out std_logic_vector( 32-1 downto 0 )
  );
end ofdm_rx_hw_hb_ssr_im;
architecture structural of ofdm_rx_hw_hb_ssr_im is 
  signal src_clk_net : std_logic;
  signal register1_q_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_real_net : std_logic_vector( 32-1 downto 0 );
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic;
  signal src_ce_net : std_logic;
  signal register1_q_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal register0_q_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
begin
  tdo <= fir_compiler_7_2_m_axis_data_tdata_real_net;
  register1_q_net_x0 <= tvi;
  register0_q_net <= tdi_1;
  register1_q_net <= tdi_2;
  src_clk_net <= clk_1;
  src_ce_net <= ce_1;
  fir_compiler_7_2 : entity xil_defaultlib.xlfir_compiler_e8dc71ec8d034b6b5e724df7b7203c5d 
  port map (
    s_axis_data_tvalid => register1_q_net_x0(0),
    s_axis_data_tdata_vect1 => register1_q_net,
    s_axis_data_tdata_vect0 => register0_q_net,
    src_clk => src_clk_net,
    src_ce => src_ce_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s_axis_data_tready => fir_compiler_7_2_s_axis_data_tready_net,
    m_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net,
    m_axis_data_tdata_real => fir_compiler_7_2_m_axis_data_tdata_real_net
  );
end structural;
-- Generated from Simulink block OFDM_Rx_HW/Decimate/HB_SSR_re
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity ofdm_rx_hw_hb_ssr_re is
  port (
    tvi : in std_logic_vector( 1-1 downto 0 );
    tdi_1 : in std_logic_vector( 16-1 downto 0 );
    tdi_2 : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tdo : out std_logic_vector( 32-1 downto 0 )
  );
end ofdm_rx_hw_hb_ssr_re;
architecture structural of ofdm_rx_hw_hb_ssr_re is 
  signal src_ce_net : std_logic;
  signal src_clk_net : std_logic;
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal register1_q_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_real_net : std_logic_vector( 32-1 downto 0 );
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
  signal register0_q_net : std_logic_vector( 16-1 downto 0 );
begin
  tdo <= fir_compiler_7_2_m_axis_data_tdata_real_net;
  register_q_net <= tvi;
  register0_q_net <= tdi_1;
  register1_q_net <= tdi_2;
  src_clk_net <= clk_1;
  src_ce_net <= ce_1;
  fir_compiler_7_2 : entity xil_defaultlib.xlfir_compiler_e8dc71ec8d034b6b5e724df7b7203c5d 
  port map (
    s_axis_data_tvalid => register_q_net(0),
    s_axis_data_tdata_vect1 => register1_q_net,
    s_axis_data_tdata_vect0 => register0_q_net,
    src_clk => src_clk_net,
    src_ce => src_ce_net,
    clk => src_clk_net,
    ce => src_ce_net,
    s_axis_data_tready => fir_compiler_7_2_s_axis_data_tready_net,
    m_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net,
    m_axis_data_tdata_real => fir_compiler_7_2_m_axis_data_tdata_real_net
  );
end structural;
-- Generated from Simulink block OFDM_Rx_HW/Decimate/Vector Register
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity ofdm_rx_hw_vector_register is
  port (
    d_1 : in std_logic_vector( 16-1 downto 0 );
    d_2 : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    q_1 : out std_logic_vector( 16-1 downto 0 );
    q_2 : out std_logic_vector( 16-1 downto 0 )
  );
end ofdm_rx_hw_vector_register;
architecture structural of ofdm_rx_hw_vector_register is 
  signal s_axis_im_tdata_1_net : std_logic_vector( 16-1 downto 0 );
  signal src_clk_net : std_logic;
  signal register0_q_net : std_logic_vector( 16-1 downto 0 );
  signal s_axis_im_tdata_0_net : std_logic_vector( 16-1 downto 0 );
  signal src_ce_net : std_logic;
  signal register1_q_net : std_logic_vector( 16-1 downto 0 );
begin
  q_1 <= register0_q_net;
  q_2 <= register1_q_net;
  s_axis_im_tdata_0_net <= d_1;
  s_axis_im_tdata_1_net <= d_2;
  src_clk_net <= clk_1;
  src_ce_net <= ce_1;
  register0 : entity xil_defaultlib.ofdm_rx_hw_xlregister 
  generic map (
    d_width => 16,
    init_value => b"0000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => s_axis_im_tdata_0_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register0_q_net
  );
  register1 : entity xil_defaultlib.ofdm_rx_hw_xlregister 
  generic map (
    d_width => 16,
    init_value => b"0000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => s_axis_im_tdata_1_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register1_q_net
  );
end structural;
-- Generated from Simulink block OFDM_Rx_HW/Decimate/Vector Register1
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity ofdm_rx_hw_vector_register1 is
  port (
    d_1 : in std_logic_vector( 16-1 downto 0 );
    d_2 : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    q_1 : out std_logic_vector( 16-1 downto 0 );
    q_2 : out std_logic_vector( 16-1 downto 0 )
  );
end ofdm_rx_hw_vector_register1;
architecture structural of ofdm_rx_hw_vector_register1 is 
  signal register0_q_net : std_logic_vector( 16-1 downto 0 );
  signal register1_q_net : std_logic_vector( 16-1 downto 0 );
  signal s_axis_re_tdata_1_net : std_logic_vector( 16-1 downto 0 );
  signal src_ce_net : std_logic;
  signal s_axis_re_tdata_0_net : std_logic_vector( 16-1 downto 0 );
  signal src_clk_net : std_logic;
begin
  q_1 <= register0_q_net;
  q_2 <= register1_q_net;
  s_axis_re_tdata_0_net <= d_1;
  s_axis_re_tdata_1_net <= d_2;
  src_clk_net <= clk_1;
  src_ce_net <= ce_1;
  register0 : entity xil_defaultlib.ofdm_rx_hw_xlregister 
  generic map (
    d_width => 16,
    init_value => b"0000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => s_axis_re_tdata_0_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register0_q_net
  );
  register1 : entity xil_defaultlib.ofdm_rx_hw_xlregister 
  generic map (
    d_width => 16,
    init_value => b"0000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => s_axis_re_tdata_1_net,
    clk => src_clk_net,
    ce => src_ce_net,
    q => register1_q_net
  );
end structural;
-- Generated from Simulink block OFDM_Rx_HW/Decimate/s_axis_im_tdata
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity ofdm_rx_hw_s_axis_im_tdata is
  port (
    s_axis_im_tdata_0 : in std_logic_vector( 16-1 downto 0 );
    s_axis_im_tdata_1 : in std_logic_vector( 16-1 downto 0 )
  );
end ofdm_rx_hw_s_axis_im_tdata;
architecture structural of ofdm_rx_hw_s_axis_im_tdata is 
  signal s_axis_im_tdata_0_net : std_logic_vector( 16-1 downto 0 );
  signal s_axis_im_tdata_1_net : std_logic_vector( 16-1 downto 0 );
begin
  s_axis_im_tdata_0_net <= s_axis_im_tdata_0;
  s_axis_im_tdata_1_net <= s_axis_im_tdata_1;
end structural;
-- Generated from Simulink block OFDM_Rx_HW/Decimate/s_axis_re_tdata
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity ofdm_rx_hw_s_axis_re_tdata is
  port (
    s_axis_re_tdata_0 : in std_logic_vector( 16-1 downto 0 );
    s_axis_re_tdata_1 : in std_logic_vector( 16-1 downto 0 )
  );
end ofdm_rx_hw_s_axis_re_tdata;
architecture structural of ofdm_rx_hw_s_axis_re_tdata is 
  signal s_axis_re_tdata_0_net : std_logic_vector( 16-1 downto 0 );
  signal s_axis_re_tdata_1_net : std_logic_vector( 16-1 downto 0 );
begin
  s_axis_re_tdata_0_net <= s_axis_re_tdata_0;
  s_axis_re_tdata_1_net <= s_axis_re_tdata_1;
end structural;
-- Generated from Simulink block OFDM_Rx_HW/Decimate
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity ofdm_rx_hw_decimate is
  port (
    s_axis_im_tvalid : in std_logic_vector( 1-1 downto 0 );
    s_axis_re_tvalid : in std_logic_vector( 1-1 downto 0 );
    s_axis_im_tdata_0 : in std_logic_vector( 16-1 downto 0 );
    s_axis_im_tdata_1 : in std_logic_vector( 16-1 downto 0 );
    s_axis_re_tdata_0 : in std_logic_vector( 16-1 downto 0 );
    s_axis_re_tdata_1 : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    clk_48 : in std_logic;
    ce_48 : in std_logic;
    clk_96 : in std_logic;
    ce_96 : in std_logic;
    clk_192 : in std_logic;
    ce_192 : in std_logic;
    m_axis_im_tdata : out std_logic_vector( 16-1 downto 0 );
    m_axis_re_tdata : out std_logic_vector( 16-1 downto 0 )
  );
end ofdm_rx_hw_decimate;
architecture structural of ofdm_rx_hw_decimate is 
  signal register8_q_net : std_logic_vector( 16-1 downto 0 );
  signal register9_q_net : std_logic_vector( 16-1 downto 0 );
  signal src_clk_net_x0 : std_logic;
  signal cic_comp_im_m_axis_data_tvalid_net : std_logic;
  signal cic_comp_im_m_axis_data_tdata_real_net : std_logic_vector( 33-1 downto 0 );
  signal ce_net : std_logic;
  signal s_axis_re_tdata_0_net : std_logic_vector( 16-1 downto 0 );
  signal register0_q_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
  signal s_axis_re_tdata_1_net : std_logic_vector( 16-1 downto 0 );
  signal src_clk_net : std_logic;
  signal ce_96_net : std_logic;
  signal register1_q_net_x1 : std_logic_vector( 1-1 downto 0 );
  signal s_axis_im_tvalid_net : std_logic_vector( 1-1 downto 0 );
  signal src_ce_net : std_logic;
  signal clk_net : std_logic;
  signal register1_q_net : std_logic_vector( 16-1 downto 0 );
  signal clk_96_net : std_logic;
  signal cic_comp_im_s_axis_data_tready_net : std_logic;
  signal register5_q_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_real_net_x0 : std_logic_vector( 32-1 downto 0 );
  signal register1_q_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal s_axis_re_tvalid_net : std_logic_vector( 1-1 downto 0 );
  signal s_axis_im_tdata_0_net : std_logic_vector( 16-1 downto 0 );
  signal s_axis_im_tdata_1_net : std_logic_vector( 16-1 downto 0 );
  signal src_ce_net_x0 : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_real_net : std_logic_vector( 32-1 downto 0 );
  signal register0_q_net : std_logic_vector( 16-1 downto 0 );
  signal cic_decimation_re_m_axis_data_tdata_real_net : std_logic_vector( 44-1 downto 0 );
  signal cic_decimation_re_s_axis_data_tready_net : std_logic;
  signal cic_fine1_p_net : std_logic_vector( 16-1 downto 0 );
  signal cic_shift_im_op_net : std_logic_vector( 44-1 downto 0 );
  signal cic_fine_p_net : std_logic_vector( 16-1 downto 0 );
  signal cic_decimation_re_m_axis_data_tvalid_net : std_logic;
  signal register2_q_net : std_logic_vector( 16-1 downto 0 );
  signal cic_comp_re_m_axis_data_tdata_real_net : std_logic_vector( 33-1 downto 0 );
  signal register3_q_net : std_logic_vector( 16-1 downto 0 );
  signal cic_decimation_im_m_axis_data_tvalid_net : std_logic;
  signal cic_shift_re_op_net : std_logic_vector( 44-1 downto 0 );
  signal cic_comp_re_m_axis_data_tvalid_net : std_logic;
  signal register4_q_net : std_logic_vector( 16-1 downto 0 );
  signal cic_decimation_im_m_axis_data_tdata_real_net : std_logic_vector( 44-1 downto 0 );
  signal cic_decimation_im_s_axis_data_tready_net : std_logic;
  signal cic_comp_re_s_axis_data_tready_net : std_logic;
  signal convert4_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert5_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert3_dout_net : std_logic_vector( 16-1 downto 0 );
  signal hb_re_m_axis_data_tdata_real_net : std_logic_vector( 32-1 downto 0 );
  signal hb_im_m_axis_data_tdata_real_net : std_logic_vector( 32-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal hb_im_s_axis_data_tready_net : std_logic;
  signal convert2_dout_net : std_logic_vector( 16-1 downto 0 );
  signal hb_im_m_axis_data_tvalid_net : std_logic;
  signal hb_re_s_axis_data_tready_net : std_logic;
  signal register6_q_net : std_logic_vector( 16-1 downto 0 );
  signal register7_q_net : std_logic_vector( 16-1 downto 0 );
  signal hb_re_m_axis_data_tvalid_net : std_logic;
begin
  m_axis_im_tdata <= register9_q_net;
  m_axis_re_tdata <= register8_q_net;
  s_axis_im_tvalid_net <= s_axis_im_tvalid;
  s_axis_re_tvalid_net <= s_axis_re_tvalid;
  s_axis_im_tdata_0_net <= s_axis_im_tdata_0;
  s_axis_im_tdata_1_net <= s_axis_im_tdata_1;
  s_axis_re_tdata_0_net <= s_axis_re_tdata_0;
  s_axis_re_tdata_1_net <= s_axis_re_tdata_1;
  src_clk_net_x0 <= clk_1;
  src_ce_net <= ce_1;
  src_clk_net <= clk_48;
  src_ce_net_x0 <= ce_48;
  clk_96_net <= clk_96;
  ce_96_net <= ce_96;
  clk_net <= clk_192;
  ce_net <= ce_192;
  hb_ssr_im : entity xil_defaultlib.ofdm_rx_hw_hb_ssr_im 
  port map (
    tvi => register1_q_net_x1,
    tdi_1 => register0_q_net_x0,
    tdi_2 => register1_q_net_x0,
    clk_1 => src_clk_net_x0,
    ce_1 => src_ce_net,
    tdo => fir_compiler_7_2_m_axis_data_tdata_real_net_x0
  );
  hb_ssr_re : entity xil_defaultlib.ofdm_rx_hw_hb_ssr_re 
  port map (
    tvi => register_q_net,
    tdi_1 => register0_q_net,
    tdi_2 => register1_q_net,
    clk_1 => src_clk_net_x0,
    ce_1 => src_ce_net,
    tdo => fir_compiler_7_2_m_axis_data_tdata_real_net
  );
  vector_register : entity xil_defaultlib.ofdm_rx_hw_vector_register 
  port map (
    d_1 => s_axis_im_tdata_0_net,
    d_2 => s_axis_im_tdata_1_net,
    clk_1 => src_clk_net_x0,
    ce_1 => src_ce_net,
    q_1 => register0_q_net_x0,
    q_2 => register1_q_net_x0
  );
  vector_register1 : entity xil_defaultlib.ofdm_rx_hw_vector_register1 
  port map (
    d_1 => s_axis_re_tdata_0_net,
    d_2 => s_axis_re_tdata_1_net,
    clk_1 => src_clk_net_x0,
    ce_1 => src_ce_net,
    q_1 => register0_q_net,
    q_2 => register1_q_net
  );
  s_axis_im_tdata : entity xil_defaultlib.ofdm_rx_hw_s_axis_im_tdata 
  port map (
    s_axis_im_tdata_0 => s_axis_im_tdata_0_net,
    s_axis_im_tdata_1 => s_axis_im_tdata_1_net
  );
  s_axis_re_tdata : entity xil_defaultlib.ofdm_rx_hw_s_axis_re_tdata 
  port map (
    s_axis_re_tdata_0 => s_axis_re_tdata_0_net,
    s_axis_re_tdata_1 => s_axis_re_tdata_1_net
  );
  cic_comp_im : entity xil_defaultlib.xlfir_compiler_4efbbd68e9311f13ed1758aa590eb2e2 
  port map (
    s_axis_data_tdata_real => register5_q_net,
    src_clk => src_clk_net,
    src_ce => src_ce_net_x0,
    clk => src_clk_net_x0,
    ce => src_ce_net,
    clk_48 => src_clk_net,
    ce_48 => src_ce_net_x0,
    clk_96 => clk_96_net,
    ce_96 => ce_96_net,
    clk_logic_48 => src_clk_net,
    ce_logic_48 => src_ce_net_x0,
    s_axis_data_tready => cic_comp_im_s_axis_data_tready_net,
    m_axis_data_tvalid => cic_comp_im_m_axis_data_tvalid_net,
    m_axis_data_tdata_real => cic_comp_im_m_axis_data_tdata_real_net
  );
  cic_comp_re : entity xil_defaultlib.xlfir_compiler_4efbbd68e9311f13ed1758aa590eb2e2 
  port map (
    s_axis_data_tdata_real => register4_q_net,
    src_clk => src_clk_net,
    src_ce => src_ce_net_x0,
    clk => src_clk_net_x0,
    ce => src_ce_net,
    clk_48 => src_clk_net,
    ce_48 => src_ce_net_x0,
    clk_96 => clk_96_net,
    ce_96 => ce_96_net,
    clk_logic_48 => src_clk_net,
    ce_logic_48 => src_ce_net_x0,
    s_axis_data_tready => cic_comp_re_s_axis_data_tready_net,
    m_axis_data_tvalid => cic_comp_re_m_axis_data_tvalid_net,
    m_axis_data_tdata_real => cic_comp_re_m_axis_data_tdata_real_net
  );
  cic_decimation_im : entity xil_defaultlib.xlcic_compiler_9ecfb8996ad92f8f7bbc9691ccad48d6 
  port map (
    s_axis_data_tdata_real => register3_q_net,
    clk => src_clk_net_x0,
    ce => src_ce_net,
    clk_48 => src_clk_net,
    ce_48 => src_ce_net_x0,
    clk_logic_1 => src_clk_net_x0,
    ce_logic_1 => src_ce_net,
    s_axis_data_tready => cic_decimation_im_s_axis_data_tready_net,
    m_axis_data_tvalid => cic_decimation_im_m_axis_data_tvalid_net,
    m_axis_data_tdata_real => cic_decimation_im_m_axis_data_tdata_real_net
  );
  cic_decimation_re : entity xil_defaultlib.xlcic_compiler_9ecfb8996ad92f8f7bbc9691ccad48d6 
  port map (
    s_axis_data_tdata_real => register2_q_net,
    clk => src_clk_net_x0,
    ce => src_ce_net,
    clk_48 => src_clk_net,
    ce_48 => src_ce_net_x0,
    clk_logic_1 => src_clk_net_x0,
    ce_logic_1 => src_ce_net,
    s_axis_data_tready => cic_decimation_re_s_axis_data_tready_net,
    m_axis_data_tvalid => cic_decimation_re_m_axis_data_tvalid_net,
    m_axis_data_tdata_real => cic_decimation_re_m_axis_data_tdata_real_net
  );
  cic_fine : entity xil_defaultlib.ofdm_rx_hw_xlcmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 14,
    a_width => 44,
    b_bin_pt => 14,
    c_a_type => 0,
    c_a_width => 44,
    c_b_type => 1,
    c_b_width => 16,
    c_output_width => 60,
    core_name0 => "ofdm_rx_hw_mult_gen_v12_0_i0",
    extra_registers => 0,
    multsign => 2,
    overflow => 3,
    p_arith => xlSigned,
    p_bin_pt => 14,
    p_width => 16,
    quantization => 1,
    zero_const => 0
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => cic_shift_re_op_net,
    clk => src_clk_net,
    ce => src_ce_net_x0,
    core_clk => src_clk_net,
    core_ce => src_ce_net_x0,
    p => cic_fine_p_net
  );
  cic_fine1 : entity xil_defaultlib.ofdm_rx_hw_xlcmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 14,
    a_width => 44,
    b_bin_pt => 14,
    c_a_type => 0,
    c_a_width => 44,
    c_b_type => 1,
    c_b_width => 16,
    c_output_width => 60,
    core_name0 => "ofdm_rx_hw_mult_gen_v12_0_i0",
    extra_registers => 0,
    multsign => 2,
    overflow => 3,
    p_arith => xlSigned,
    p_bin_pt => 14,
    p_width => 16,
    quantization => 1,
    zero_const => 0
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => cic_shift_im_op_net,
    clk => src_clk_net,
    ce => src_ce_net_x0,
    core_clk => src_clk_net,
    core_ce => src_ce_net_x0,
    p => cic_fine1_p_net
  );
  cic_shift_im : entity xil_defaultlib.sysgen_shift_b94c376db9 
  port map (
    clr => '0',
    ip => cic_decimation_im_m_axis_data_tdata_real_net,
    clk => src_clk_net,
    ce => src_ce_net_x0,
    op => cic_shift_im_op_net
  );
  cic_shift_re : entity xil_defaultlib.sysgen_shift_b94c376db9 
  port map (
    clr => '0',
    ip => cic_decimation_re_m_axis_data_tdata_real_net,
    clk => src_clk_net,
    ce => src_ce_net_x0,
    op => cic_shift_re_op_net
  );
  convert : entity xil_defaultlib.ofdm_rx_hw_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 29,
    din_width => 33,
    dout_arith => 2,
    dout_bin_pt => 14,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => cic_comp_re_m_axis_data_tdata_real_net,
    clk => clk_96_net,
    ce => ce_96_net,
    dout => convert_dout_net
  );
  convert1 : entity xil_defaultlib.ofdm_rx_hw_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 29,
    din_width => 33,
    dout_arith => 2,
    dout_bin_pt => 14,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => cic_comp_im_m_axis_data_tdata_real_net,
    clk => clk_96_net,
    ce => ce_96_net,
    dout => convert1_dout_net
  );
  convert2 : entity xil_defaultlib.ofdm_rx_hw_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 29,
    din_width => 32,
    dout_arith => 2,
    dout_bin_pt => 14,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_real_net,
    clk => src_clk_net_x0,
    ce => src_ce_net,
    dout => convert2_dout_net
  );
  convert3 : entity xil_defaultlib.ofdm_rx_hw_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 29,
    din_width => 32,
    dout_arith => 2,
    dout_bin_pt => 14,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_real_net_x0,
    clk => src_clk_net_x0,
    ce => src_ce_net,
    dout => convert3_dout_net
  );
  convert4 : entity xil_defaultlib.ofdm_rx_hw_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 29,
    din_width => 32,
    dout_arith => 2,
    dout_bin_pt => 14,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => hb_re_m_axis_data_tdata_real_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert4_dout_net
  );
  convert5 : entity xil_defaultlib.ofdm_rx_hw_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 29,
    din_width => 32,
    dout_arith => 2,
    dout_bin_pt => 14,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => hb_im_m_axis_data_tdata_real_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert5_dout_net
  );
  hb_im : entity xil_defaultlib.xlfir_compiler_6a6802021feee6948bc00bcd4ca377bd 
  port map (
    s_axis_data_tdata_real => register7_q_net,
    src_clk => clk_96_net,
    src_ce => ce_96_net,
    clk => src_clk_net_x0,
    ce => src_ce_net,
    clk_96 => clk_96_net,
    ce_96 => ce_96_net,
    clk_192 => clk_net,
    ce_192 => ce_net,
    clk_logic_96 => clk_96_net,
    ce_logic_96 => ce_96_net,
    s_axis_data_tready => hb_im_s_axis_data_tready_net,
    m_axis_data_tvalid => hb_im_m_axis_data_tvalid_net,
    m_axis_data_tdata_real => hb_im_m_axis_data_tdata_real_net
  );
  hb_re : entity xil_defaultlib.xlfir_compiler_6a6802021feee6948bc00bcd4ca377bd 
  port map (
    s_axis_data_tdata_real => register6_q_net,
    src_clk => clk_96_net,
    src_ce => ce_96_net,
    clk => src_clk_net_x0,
    ce => src_ce_net,
    clk_96 => clk_96_net,
    ce_96 => ce_96_net,
    clk_192 => clk_net,
    ce_192 => ce_net,
    clk_logic_96 => clk_96_net,
    ce_logic_96 => ce_96_net,
    s_axis_data_tready => hb_re_s_axis_data_tready_net,
    m_axis_data_tvalid => hb_re_m_axis_data_tvalid_net,
    m_axis_data_tdata_real => hb_re_m_axis_data_tdata_real_net
  );
  register_x0 : entity xil_defaultlib.ofdm_rx_hw_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => s_axis_re_tvalid_net,
    clk => src_clk_net_x0,
    ce => src_ce_net,
    q => register_q_net
  );
  register1 : entity xil_defaultlib.ofdm_rx_hw_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => s_axis_im_tvalid_net,
    clk => src_clk_net_x0,
    ce => src_ce_net,
    q => register1_q_net_x1
  );
  register2 : entity xil_defaultlib.ofdm_rx_hw_xlregister 
  generic map (
    d_width => 16,
    init_value => b"0000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => convert2_dout_net,
    clk => src_clk_net_x0,
    ce => src_ce_net,
    q => register2_q_net
  );
  register3 : entity xil_defaultlib.ofdm_rx_hw_xlregister 
  generic map (
    d_width => 16,
    init_value => b"0000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => convert3_dout_net,
    clk => src_clk_net_x0,
    ce => src_ce_net,
    q => register3_q_net
  );
  register4 : entity xil_defaultlib.ofdm_rx_hw_xlregister 
  generic map (
    d_width => 16,
    init_value => b"0000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => cic_fine_p_net,
    clk => src_clk_net,
    ce => src_ce_net_x0,
    q => register4_q_net
  );
  register5 : entity xil_defaultlib.ofdm_rx_hw_xlregister 
  generic map (
    d_width => 16,
    init_value => b"0000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => cic_fine1_p_net,
    clk => src_clk_net,
    ce => src_ce_net_x0,
    q => register5_q_net
  );
  register6 : entity xil_defaultlib.ofdm_rx_hw_xlregister 
  generic map (
    d_width => 16,
    init_value => b"0000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => convert_dout_net,
    clk => clk_96_net,
    ce => ce_96_net,
    q => register6_q_net
  );
  register7 : entity xil_defaultlib.ofdm_rx_hw_xlregister 
  generic map (
    d_width => 16,
    init_value => b"0000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => convert1_dout_net,
    clk => clk_96_net,
    ce => ce_96_net,
    q => register7_q_net
  );
  register8 : entity xil_defaultlib.ofdm_rx_hw_xlregister 
  generic map (
    d_width => 16,
    init_value => b"0000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => convert4_dout_net,
    clk => clk_net,
    ce => ce_net,
    q => register8_q_net
  );
  register9 : entity xil_defaultlib.ofdm_rx_hw_xlregister 
  generic map (
    d_width => 16,
    init_value => b"0000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => convert5_dout_net,
    clk => clk_net,
    ce => ce_net,
    q => register9_q_net
  );
end structural;
-- Generated from Simulink block OFDM_Rx_HW_struct
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity ofdm_rx_hw_struct is
  port (
    s_axis_im_tvalid : in std_logic_vector( 1-1 downto 0 );
    s_axis_re_tvalid : in std_logic_vector( 1-1 downto 0 );
    s_axis_im_tdata_0 : in std_logic_vector( 16-1 downto 0 );
    s_axis_im_tdata_1 : in std_logic_vector( 16-1 downto 0 );
    s_axis_re_tdata_0 : in std_logic_vector( 16-1 downto 0 );
    s_axis_re_tdata_1 : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    clk_48 : in std_logic;
    ce_48 : in std_logic;
    clk_96 : in std_logic;
    ce_96 : in std_logic;
    clk_192 : in std_logic;
    ce_192 : in std_logic;
    m_axis_im_tdata : out std_logic_vector( 16-1 downto 0 );
    m_axis_re_tdata : out std_logic_vector( 16-1 downto 0 )
  );
end ofdm_rx_hw_struct;
architecture structural of ofdm_rx_hw_struct is 
  signal register9_q_net : std_logic_vector( 16-1 downto 0 );
  signal s_axis_re_tdata_1_net : std_logic_vector( 16-1 downto 0 );
  signal ce_net : std_logic;
  signal src_ce_net : std_logic;
  signal s_axis_im_tvalid_net : std_logic_vector( 1-1 downto 0 );
  signal s_axis_re_tvalid_net : std_logic_vector( 1-1 downto 0 );
  signal src_ce_net_x0 : std_logic;
  signal s_axis_re_tdata_0_net : std_logic_vector( 16-1 downto 0 );
  signal clk_96_net : std_logic;
  signal src_clk_net_x0 : std_logic;
  signal s_axis_im_tdata_1_net : std_logic_vector( 16-1 downto 0 );
  signal s_axis_im_tdata_0_net : std_logic_vector( 16-1 downto 0 );
  signal src_clk_net : std_logic;
  signal register8_q_net : std_logic_vector( 16-1 downto 0 );
  signal ce_96_net : std_logic;
  signal clk_net : std_logic;
begin
  m_axis_im_tdata <= register9_q_net;
  m_axis_re_tdata <= register8_q_net;
  s_axis_im_tvalid_net <= s_axis_im_tvalid;
  s_axis_re_tvalid_net <= s_axis_re_tvalid;
  s_axis_im_tdata_0_net <= s_axis_im_tdata_0;
  s_axis_im_tdata_1_net <= s_axis_im_tdata_1;
  s_axis_re_tdata_0_net <= s_axis_re_tdata_0;
  s_axis_re_tdata_1_net <= s_axis_re_tdata_1;
  src_clk_net_x0 <= clk_1;
  src_ce_net_x0 <= ce_1;
  src_clk_net <= clk_48;
  src_ce_net <= ce_48;
  clk_96_net <= clk_96;
  ce_96_net <= ce_96;
  clk_net <= clk_192;
  ce_net <= ce_192;
  decimate : entity xil_defaultlib.ofdm_rx_hw_decimate 
  port map (
    s_axis_im_tvalid => s_axis_im_tvalid_net,
    s_axis_re_tvalid => s_axis_re_tvalid_net,
    s_axis_im_tdata_0 => s_axis_im_tdata_0_net,
    s_axis_im_tdata_1 => s_axis_im_tdata_1_net,
    s_axis_re_tdata_0 => s_axis_re_tdata_0_net,
    s_axis_re_tdata_1 => s_axis_re_tdata_1_net,
    clk_1 => src_clk_net_x0,
    ce_1 => src_ce_net_x0,
    clk_48 => src_clk_net,
    ce_48 => src_ce_net,
    clk_96 => clk_96_net,
    ce_96 => ce_96_net,
    clk_192 => clk_net,
    ce_192 => ce_net,
    m_axis_im_tdata => register9_q_net,
    m_axis_re_tdata => register8_q_net
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity ofdm_rx_hw_default_clock_driver is
  port (
    ofdm_rx_hw_sysclk : in std_logic;
    ofdm_rx_hw_sysce : in std_logic;
    ofdm_rx_hw_sysclr : in std_logic;
    ofdm_rx_hw_clk1 : out std_logic;
    ofdm_rx_hw_ce1 : out std_logic;
    ofdm_rx_hw_clk48 : out std_logic;
    ofdm_rx_hw_ce48 : out std_logic;
    ofdm_rx_hw_clk96 : out std_logic;
    ofdm_rx_hw_ce96 : out std_logic;
    ofdm_rx_hw_clk192 : out std_logic;
    ofdm_rx_hw_ce192 : out std_logic
  );
end ofdm_rx_hw_default_clock_driver;
architecture structural of ofdm_rx_hw_default_clock_driver is 
begin
  clockdriver_x2 : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 1,
    log_2_period => 1
  )
  port map (
    sysclk => ofdm_rx_hw_sysclk,
    sysce => ofdm_rx_hw_sysce,
    sysclr => ofdm_rx_hw_sysclr,
    clk => ofdm_rx_hw_clk1,
    ce => ofdm_rx_hw_ce1
  );
  clockdriver_x1 : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 48,
    log_2_period => 6
  )
  port map (
    sysclk => ofdm_rx_hw_sysclk,
    sysce => ofdm_rx_hw_sysce,
    sysclr => ofdm_rx_hw_sysclr,
    clk => ofdm_rx_hw_clk48,
    ce => ofdm_rx_hw_ce48
  );
  clockdriver_x0 : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 96,
    log_2_period => 7
  )
  port map (
    sysclk => ofdm_rx_hw_sysclk,
    sysce => ofdm_rx_hw_sysce,
    sysclr => ofdm_rx_hw_sysclr,
    clk => ofdm_rx_hw_clk96,
    ce => ofdm_rx_hw_ce96
  );
  clockdriver : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 192,
    log_2_period => 8
  )
  port map (
    sysclk => ofdm_rx_hw_sysclk,
    sysce => ofdm_rx_hw_sysce,
    sysclr => ofdm_rx_hw_sysclr,
    clk => ofdm_rx_hw_clk192,
    ce => ofdm_rx_hw_ce192
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity ofdm_rx_hw is
  port (
    s_axis_im_tvalid : in std_logic_vector( 1-1 downto 0 );
    s_axis_re_tvalid : in std_logic_vector( 1-1 downto 0 );
    s_axis_im_tdata_0 : in std_logic_vector( 16-1 downto 0 );
    s_axis_im_tdata_1 : in std_logic_vector( 16-1 downto 0 );
    s_axis_re_tdata_0 : in std_logic_vector( 16-1 downto 0 );
    s_axis_re_tdata_1 : in std_logic_vector( 16-1 downto 0 );
    clk : in std_logic;
    m_axis_im_tdata : out std_logic_vector( 16-1 downto 0 );
    m_axis_re_tdata : out std_logic_vector( 16-1 downto 0 )
  );
end ofdm_rx_hw;
architecture structural of ofdm_rx_hw is 
  attribute core_generation_info : string;
  attribute core_generation_info of structural : architecture is "ofdm_rx_hw,sysgen_core_2020_1,{,compilation=IP Catalog,block_icon_display=Default,family=zynquplusRFSOC,part=xczu28dr,speed=-2-e,package=ffvg1517,synthesis_language=vhdl,hdl_library=xil_defaultlib,synthesis_strategy=Vivado Synthesis Defaults,implementation_strategy=Vivado Implementation Defaults,testbench=0,interface_doc=0,ce_clr=0,clock_period=5.20833,system_simulink_period=5.20833e-09,waveform_viewer=0,axilite_interface=0,ip_catalog_plugin=0,hwcosim_burst_mode=0,simulation_time=inf,cic_compiler_v4_0=2,cmult=2,convert=6,fir_compiler_v7_2=6,register=14,shift=2,}";
  signal clk_1_net : std_logic;
  signal ce_1_net : std_logic;
  signal clk_48_net : std_logic;
  signal ce_48_net : std_logic;
  signal clk_96_net : std_logic;
  signal ce_96_net : std_logic;
  signal clk_192_net : std_logic;
  signal ce_192_net : std_logic;
begin
  ofdm_rx_hw_default_clock_driver : entity xil_defaultlib.ofdm_rx_hw_default_clock_driver 
  port map (
    ofdm_rx_hw_sysclk => clk,
    ofdm_rx_hw_sysce => '1',
    ofdm_rx_hw_sysclr => '0',
    ofdm_rx_hw_clk1 => clk_1_net,
    ofdm_rx_hw_ce1 => ce_1_net,
    ofdm_rx_hw_clk48 => clk_48_net,
    ofdm_rx_hw_ce48 => ce_48_net,
    ofdm_rx_hw_clk96 => clk_96_net,
    ofdm_rx_hw_ce96 => ce_96_net,
    ofdm_rx_hw_clk192 => clk_192_net,
    ofdm_rx_hw_ce192 => ce_192_net
  );
  ofdm_rx_hw_struct : entity xil_defaultlib.ofdm_rx_hw_struct 
  port map (
    s_axis_im_tvalid => s_axis_im_tvalid,
    s_axis_re_tvalid => s_axis_re_tvalid,
    s_axis_im_tdata_0 => s_axis_im_tdata_0,
    s_axis_im_tdata_1 => s_axis_im_tdata_1,
    s_axis_re_tdata_0 => s_axis_re_tdata_0,
    s_axis_re_tdata_1 => s_axis_re_tdata_1,
    clk_1 => clk_1_net,
    ce_1 => ce_1_net,
    clk_48 => clk_48_net,
    ce_48 => ce_48_net,
    clk_96 => clk_96_net,
    ce_96 => ce_96_net,
    clk_192 => clk_192_net,
    ce_192 => ce_192_net,
    m_axis_im_tdata => m_axis_im_tdata,
    m_axis_re_tdata => m_axis_re_tdata
  );
end structural;
