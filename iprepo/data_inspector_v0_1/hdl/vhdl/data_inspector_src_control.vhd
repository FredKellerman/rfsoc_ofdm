-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\data_inspector\hdlsrc\OFDM_Tx_Rx_HW\data_inspector_src_control.vhd
-- Created: 2021-01-08 12:51:53
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: data_inspector_src_control
-- Source Path: OFDM_Tx_Rx_HW/data_inspector/control
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.data_inspector_src_data_inspector_pkg.ALL;

ENTITY data_inspector_src_control IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_192_0                       :   IN    std_logic;
        dma_tready                        :   IN    std_logic;
        frame_size                        :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        rx_tvalid                         :   IN    std_logic;
        push                              :   OUT   std_logic;
        pop                               :   OUT   std_logic;
        out_tvalid                        :   OUT   std_logic
        );
END data_inspector_src_control;


ARCHITECTURE rtl OF data_inspector_src_control IS

  -- Functions
  -- HDLCODER_TO_STDLOGIC 
  FUNCTION hdlcoder_to_stdlogic(arg: boolean) RETURN std_logic IS
  BEGIN
    IF arg THEN
      RETURN '1';
    ELSE
      RETURN '0';
    END IF;
  END FUNCTION;


  -- Signals
  SIGNAL frame_size_unsigned              : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL data_count                       : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL controlMode                      : T_controlModeType;  -- enum type controlModeType (7 enums)
  SIGNAL push_reg                         : std_logic;
  SIGNAL pop_reg                          : std_logic;
  SIGNAL out_tvalid_reg                   : std_logic;
  SIGNAL controlMode_reg                  : T_controlModeType;  -- enum type controlModeType (7 enums)
  SIGNAL data_count_next                  : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL push_reg_next                    : std_logic;
  SIGNAL pop_reg_next                     : std_logic;
  SIGNAL out_tvalid_reg_next              : std_logic;
  SIGNAL controlMode_reg_next             : T_controlModeType;  -- enum type controlModeType (7 enums)

BEGIN
  frame_size_unsigned <= unsigned(frame_size);

  data_inspector_c3_control_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      controlMode_reg <= init;
      -- variables
      data_count <= to_unsigned(16#0000#, 16);
      -- outputs
      push_reg <= '0';
      pop_reg <= '0';
      out_tvalid_reg <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_192_0 = '1' THEN
        data_count <= data_count_next;
        push_reg <= push_reg_next;
        pop_reg <= pop_reg_next;
        out_tvalid_reg <= out_tvalid_reg_next;
        controlMode_reg <= controlMode_reg_next;
      END IF;
    END IF;
  END PROCESS data_inspector_c3_control_process;

  data_inspector_c3_control_output : PROCESS (controlMode_reg, data_count, dma_tready, frame_size_unsigned, out_tvalid_reg,
       pop_reg, push_reg, rx_tvalid)
    VARIABLE sf_internal_predicateOutput : std_logic;
    VARIABLE b_sf_internal_predicateOutput : std_logic;
    VARIABLE sf_internal_predicateoutput_0 : std_logic;
    VARIABLE b_sf_internal_predicateoutput_0 : std_logic;
    VARIABLE sf_internal_predicateoutput_1 : std_logic;
    VARIABLE b_sf_internal_predicateoutput_1 : std_logic;
    VARIABLE c_sf_internal_predicateOutput : std_logic;
    VARIABLE add_temp : unsigned(16 DOWNTO 0);
    VARIABLE sub_cast : signed(16 DOWNTO 0);
    VARIABLE sub_temp : signed(16 DOWNTO 0);
    VARIABLE sub_cast_0 : signed(16 DOWNTO 0);
    VARIABLE sub_temp_0 : signed(16 DOWNTO 0);
    VARIABLE add_temp_0 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_1 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_2 : unsigned(16 DOWNTO 0);
    VARIABLE sub_cast_1 : signed(16 DOWNTO 0);
    VARIABLE sub_temp_1 : signed(16 DOWNTO 0);
    VARIABLE sub_cast_2 : signed(16 DOWNTO 0);
    VARIABLE sub_temp_2 : signed(16 DOWNTO 0);
  BEGIN
    sf_internal_predicateOutput := '0';
    b_sf_internal_predicateOutput := '0';
    sf_internal_predicateoutput_0 := '0';
    b_sf_internal_predicateoutput_0 := '0';
    sf_internal_predicateoutput_1 := '0';
    b_sf_internal_predicateoutput_1 := '0';
    c_sf_internal_predicateOutput := '0';
    add_temp := to_unsigned(16#00000#, 17);
    sub_temp := to_signed(16#00000#, 17);
    sub_temp_0 := to_signed(16#00000#, 17);
    add_temp_0 := to_unsigned(16#00000#, 17);
    add_temp_1 := to_unsigned(16#00000#, 17);
    add_temp_2 := to_unsigned(16#00000#, 17);
    sub_temp_1 := to_signed(16#00000#, 17);
    sub_temp_2 := to_signed(16#00000#, 17);
    sub_cast := to_signed(16#00000#, 17);
    sub_cast_0 := to_signed(16#00000#, 17);
    sub_cast_1 := to_signed(16#00000#, 17);
    sub_cast_2 := to_signed(16#00000#, 17);
    push_reg_next <= push_reg;
    pop_reg_next <= pop_reg;
    out_tvalid_reg_next <= out_tvalid_reg;
    controlMode_reg_next <= controlMode_reg;
    data_count_next <= data_count;
    CASE controlMode_reg IS
      WHEN init =>
        IF rx_tvalid = '1' THEN 
          controlMode_reg_next <= fill_frame;
          -- variables
          add_temp := resize(data_count, 17) + to_unsigned(16#00001#, 17);
          IF add_temp(16) /= '0' THEN 
            data_count_next <= X"FFFF";
          ELSE 
            data_count_next <= add_temp(15 DOWNTO 0);
          END IF;
          -- outputs
          push_reg_next <= '1';
          pop_reg_next <= '0';
          out_tvalid_reg_next <= '0';
        ELSE 
          -- variables
          data_count_next <= to_unsigned(16#0000#, 16);
          -- outputs
          push_reg_next <= '0';
          pop_reg_next <= '0';
          out_tvalid_reg_next <= '0';
        END IF;
      WHEN fill_frame =>
        IF ( NOT rx_tvalid) = '1' THEN 
          controlMode_reg_next <= idle1;
          -- outputs
          push_reg_next <= '0';
          pop_reg_next <= '0';
          out_tvalid_reg_next <= '0';
        ELSE 
          sf_internal_predicateOutput := hdlcoder_to_stdlogic((hdlcoder_to_stdlogic(resize(data_count, 32) = frame_size_unsigned) AND ( NOT dma_tready)) = '1');
          IF sf_internal_predicateOutput = '1' THEN 
            controlMode_reg_next <= update;
            -- outputs
            push_reg_next <= '1';
            pop_reg_next <= '1';
            out_tvalid_reg_next <= '0';
          ELSE 
            b_sf_internal_predicateOutput := hdlcoder_to_stdlogic((hdlcoder_to_stdlogic(resize(data_count, 32) = frame_size_unsigned) AND dma_tready) = '1');
            IF b_sf_internal_predicateOutput = '1' THEN 
              controlMode_reg_next <= dma_read;
              -- variables
              sub_cast_1 := signed(resize(data_count, 17));
              sub_temp_1 := sub_cast_1 - to_signed(16#00001#, 17);
              IF sub_temp_1(16) = '1' THEN 
                data_count_next <= X"0000";
              ELSE 
                data_count_next <= unsigned(sub_temp_1(15 DOWNTO 0));
              END IF;
              -- outputs
              push_reg_next <= '0';
              pop_reg_next <= '1';
              out_tvalid_reg_next <= '1';
            ELSE 
              -- variables
              add_temp_2 := resize(data_count, 17) + to_unsigned(16#00001#, 17);
              IF add_temp_2(16) /= '0' THEN 
                data_count_next <= X"FFFF";
              ELSE 
                data_count_next <= add_temp_2(15 DOWNTO 0);
              END IF;
              -- outputs
              push_reg_next <= '1';
              pop_reg_next <= '0';
              out_tvalid_reg_next <= '0';
            END IF;
          END IF;
        END IF;
      WHEN idle1 =>
        sf_internal_predicateoutput_0 := hdlcoder_to_stdlogic((rx_tvalid AND hdlcoder_to_stdlogic(resize(data_count, 32) < frame_size_unsigned)) = '1');
        IF sf_internal_predicateoutput_0 = '1' THEN 
          controlMode_reg_next <= fill_frame;
          -- variables
          add_temp_0 := resize(data_count, 17) + to_unsigned(16#00001#, 17);
          IF add_temp_0(16) /= '0' THEN 
            data_count_next <= X"FFFF";
          ELSE 
            data_count_next <= add_temp_0(15 DOWNTO 0);
          END IF;
          -- outputs
          push_reg_next <= '1';
          pop_reg_next <= '0';
          out_tvalid_reg_next <= '0';
        ELSE 
          b_sf_internal_predicateoutput_0 := hdlcoder_to_stdlogic((rx_tvalid AND hdlcoder_to_stdlogic(resize(data_count, 32) = frame_size_unsigned)) = '1');
          IF b_sf_internal_predicateoutput_0 = '1' THEN 
            controlMode_reg_next <= update;
            -- outputs
            push_reg_next <= '1';
            pop_reg_next <= '1';
            out_tvalid_reg_next <= '0';
          ELSE 
            -- outputs
            push_reg_next <= '0';
            pop_reg_next <= '0';
            out_tvalid_reg_next <= '0';
          END IF;
        END IF;
      WHEN update =>
        IF dma_tready = '1' THEN 
          controlMode_reg_next <= dma_read;
          -- variables
          sub_cast := signed(resize(data_count, 17));
          sub_temp := sub_cast - to_signed(16#00001#, 17);
          IF sub_temp(16) = '1' THEN 
            data_count_next <= X"0000";
          ELSE 
            data_count_next <= unsigned(sub_temp(15 DOWNTO 0));
          END IF;
          -- outputs
          push_reg_next <= '0';
          pop_reg_next <= '1';
          out_tvalid_reg_next <= '1';
        ELSIF ( NOT rx_tvalid) = '1' THEN 
          controlMode_reg_next <= idle1;
          -- outputs
          push_reg_next <= '0';
          pop_reg_next <= '0';
          out_tvalid_reg_next <= '0';
        ELSE 
          -- outputs
          push_reg_next <= '1';
          pop_reg_next <= '1';
          out_tvalid_reg_next <= '0';
        END IF;
      WHEN dma_read =>
        sf_internal_predicateoutput_1 := hdlcoder_to_stdlogic((hdlcoder_to_stdlogic(data_count = to_unsigned(16#0000#, 16)) AND rx_tvalid) = '1');
        IF sf_internal_predicateoutput_1 = '1' THEN 
          controlMode_reg_next <= fill_frame;
          -- variables
          add_temp_1 := resize(data_count, 17) + to_unsigned(16#00001#, 17);
          IF add_temp_1(16) /= '0' THEN 
            data_count_next <= X"FFFF";
          ELSE 
            data_count_next <= add_temp_1(15 DOWNTO 0);
          END IF;
          -- outputs
          push_reg_next <= '1';
          pop_reg_next <= '0';
          out_tvalid_reg_next <= '0';
        ELSE 
          b_sf_internal_predicateoutput_1 := hdlcoder_to_stdlogic((hdlcoder_to_stdlogic(data_count = to_unsigned(16#0000#, 16)) AND ( NOT rx_tvalid)) = '1');
          IF b_sf_internal_predicateoutput_1 = '1' THEN 
            controlMode_reg_next <= idle1;
            -- outputs
            push_reg_next <= '0';
            pop_reg_next <= '0';
            out_tvalid_reg_next <= '0';
          ELSE 
            c_sf_internal_predicateOutput := hdlcoder_to_stdlogic((( NOT dma_tready) AND hdlcoder_to_stdlogic(data_count > to_unsigned(16#0000#, 16))) = '1');
            IF c_sf_internal_predicateOutput = '1' THEN 
              controlMode_reg_next <= idle;
              -- outputs
              push_reg_next <= '0';
              pop_reg_next <= '0';
              out_tvalid_reg_next <= '0';
            ELSE 
              -- variables
              sub_cast_2 := signed(resize(data_count, 17));
              sub_temp_2 := sub_cast_2 - to_signed(16#00001#, 17);
              IF sub_temp_2(16) = '1' THEN 
                data_count_next <= X"0000";
              ELSE 
                data_count_next <= unsigned(sub_temp_2(15 DOWNTO 0));
              END IF;
              -- outputs
              push_reg_next <= '0';
              pop_reg_next <= '1';
              out_tvalid_reg_next <= '1';
            END IF;
          END IF;
        END IF;
      WHEN OTHERS => 
        --State idle
        IF dma_tready = '1' THEN 
          controlMode_reg_next <= dma_read;
          -- variables
          sub_cast_0 := signed(resize(data_count, 17));
          sub_temp_0 := sub_cast_0 - to_signed(16#00001#, 17);
          IF sub_temp_0(16) = '1' THEN 
            data_count_next <= X"0000";
          ELSE 
            data_count_next <= unsigned(sub_temp_0(15 DOWNTO 0));
          END IF;
          -- outputs
          push_reg_next <= '0';
          pop_reg_next <= '1';
          out_tvalid_reg_next <= '1';
        ELSE 
          -- outputs
          push_reg_next <= '0';
          pop_reg_next <= '0';
          out_tvalid_reg_next <= '0';
        END IF;
    END CASE;
  END PROCESS data_inspector_c3_control_output;

  push <= push_reg_next;
  pop <= pop_reg_next;
  out_tvalid <= out_tvalid_reg_next;
  controlMode <= controlMode_reg_next;

END rtl;

