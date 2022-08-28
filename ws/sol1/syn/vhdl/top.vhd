-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
-- Version: 2021.1
-- Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity top is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    data : IN STD_LOGIC_VECTOR (7 downto 0);
    load : IN STD_LOGIC_VECTOR (0 downto 0);
    write_r : IN STD_LOGIC_VECTOR (0 downto 0);
    full : OUT STD_LOGIC_VECTOR (0 downto 0);
    empty : OUT STD_LOGIC_VECTOR (0 downto 0);
    tx : OUT STD_LOGIC_VECTOR (0 downto 0) );
end;


architecture behav of top is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "top_top,hls_ip_2021_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7a15t-cpg236-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=5.606000,HLS_SYN_LAT=0,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=129,HLS_SYN_LUT=192,HLS_VERSION=2021_1}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_lv11_0 : STD_LOGIC_VECTOR (10 downto 0) := "00000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv2_1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_const_lv2_2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv2_3 : STD_LOGIC_VECTOR (1 downto 0) := "11";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_9 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001001";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv4_1 : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    constant ap_const_lv11_4E0 : STD_LOGIC_VECTOR (10 downto 0) := "10011100000";
    constant ap_const_lv4_A : STD_LOGIC_VECTOR (3 downto 0) := "1010";
    constant ap_const_lv11_1 : STD_LOGIC_VECTOR (10 downto 0) := "00000000001";

    signal load_d : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal write_d : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal state : STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal shift_reg_V : STD_LOGIC_VECTOR (9 downto 0) := "1111111111";
    signal bits_shifted_V : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal bit_counter_V : STD_LOGIC_VECTOR (10 downto 0) := "00000000000";
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal data_fifo_dout : STD_LOGIC_VECTOR (9 downto 0);
    signal data_fifo_empty_n : STD_LOGIC;
    signal data_fifo_read : STD_LOGIC;
    signal state_load_load_fu_215_p1 : STD_LOGIC_VECTOR (1 downto 0);
    signal data_fifo_din : STD_LOGIC_VECTOR (9 downto 0);
    signal data_fifo_full_n : STD_LOGIC;
    signal data_fifo_write : STD_LOGIC;
    signal or_ln93_1_fu_406_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_state1 : BOOLEAN;
    signal select_ln72_fu_320_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal icmp_ln1057_fu_302_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln59_1_fu_376_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal p_Result_s_fu_262_p5 : STD_LOGIC_VECTOR (9 downto 0);
    signal add_ln870_fu_280_p2 : STD_LOGIC_VECTOR (3 downto 0);
    signal add_ln870_1_fu_334_p2 : STD_LOGIC_VECTOR (10 downto 0);
    signal xor_ln140_fu_190_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_1_nbreadreq_fu_138_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln136_fu_197_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln140_fu_190_p0 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_2_fu_227_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln708_fu_223_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln53_fu_235_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_3_fu_252_p4 : STD_LOGIC_VECTOR (8 downto 0);
    signal icmp_ln70_fu_314_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln59_fu_364_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln59_fu_370_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln93_fu_394_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln93_fu_400_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_condition_178 : BOOLEAN;
    signal ap_condition_53 : BOOLEAN;
    signal ap_ce_reg : STD_LOGIC;

    component top_fifo_w10_d8_S IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (9 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (9 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;



begin
    data_fifo_fifo_U : component top_fifo_w10_d8_S
    port map (
        clk => ap_clk,
        reset => ap_rst,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => data_fifo_din,
        if_full_n => data_fifo_full_n,
        if_write => data_fifo_write,
        if_dout => data_fifo_dout,
        if_empty_n => data_fifo_empty_n,
        if_read => data_fifo_read);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    bit_counter_V_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_1 = ap_condition_178)) then
                if ((icmp_ln1057_fu_302_p2 = ap_const_lv1_1)) then 
                    bit_counter_V <= add_ln870_1_fu_334_p2;
                elsif ((icmp_ln1057_fu_302_p2 = ap_const_lv1_0)) then 
                    bit_counter_V <= ap_const_lv11_0;
                end if;
            end if; 
        end if;
    end process;

    bits_shifted_V_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_1 = ap_condition_53)) then
                if ((state_load_load_fu_215_p1 = ap_const_lv2_0)) then 
                    bits_shifted_V <= ap_const_lv4_0;
                elsif ((state_load_load_fu_215_p1 = ap_const_lv2_3)) then 
                    bits_shifted_V <= add_ln870_fu_280_p2;
                end if;
            end if; 
        end if;
    end process;

    shift_reg_V_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_1 = ap_condition_53)) then
                if ((state = ap_const_lv2_1)) then 
                    shift_reg_V <= data_fifo_dout;
                elsif ((state_load_load_fu_215_p1 = ap_const_lv2_3)) then 
                    shift_reg_V <= p_Result_s_fu_262_p5;
                end if;
            end if; 
        end if;
    end process;

    state_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (not((ap_const_boolean_1 = ap_const_boolean_1))) then 
                state <= ap_const_lv2_0;
            elsif ((not((((or_ln93_1_fu_406_p2 = ap_const_lv1_0) and (data_fifo_full_n = ap_const_logic_0)) or ((state = ap_const_lv2_1) and (data_fifo_empty_n = ap_const_logic_0)))) and (or_ln59_1_fu_376_p2 = ap_const_lv1_0) and (state_load_load_fu_215_p1 = ap_const_lv2_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                state <= ap_const_lv2_1;
            elsif ((not((((or_ln93_1_fu_406_p2 = ap_const_lv1_0) and (data_fifo_full_n = ap_const_logic_0)) or ((state = ap_const_lv2_1) and (data_fifo_empty_n = ap_const_logic_0)))) and (icmp_ln1057_fu_302_p2 = ap_const_lv1_0) and (state_load_load_fu_215_p1 = ap_const_lv2_2) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                state <= select_ln72_fu_320_p3;
            elsif (((not((((or_ln93_1_fu_406_p2 = ap_const_lv1_0) and (data_fifo_full_n = ap_const_logic_0)) or ((state = ap_const_lv2_1) and (data_fifo_empty_n = ap_const_logic_0)))) and (state_load_load_fu_215_p1 = ap_const_lv2_3) and (ap_const_logic_1 = ap_CS_fsm_state1)) or (not((((or_ln93_1_fu_406_p2 = ap_const_lv1_0) and (data_fifo_full_n = ap_const_logic_0)) or ((state = ap_const_lv2_1) and (data_fifo_empty_n = ap_const_logic_0)))) and (state = ap_const_lv2_1) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
                state <= ap_const_lv2_2;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not((((or_ln93_1_fu_406_p2 = ap_const_lv1_0) and (data_fifo_full_n = ap_const_logic_0)) or ((state = ap_const_lv2_1) and (data_fifo_empty_n = ap_const_logic_0)))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                load_d <= load;
                write_d <= write_r;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (state, ap_CS_fsm, ap_CS_fsm_state1, data_fifo_empty_n, data_fifo_full_n, or_ln93_1_fu_406_p2)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    add_ln870_1_fu_334_p2 <= std_logic_vector(unsigned(bit_counter_V) + unsigned(ap_const_lv11_1));
    add_ln870_fu_280_p2 <= std_logic_vector(unsigned(bits_shifted_V) + unsigned(ap_const_lv4_1));
    ap_CS_fsm_state1 <= ap_CS_fsm(0);

    ap_ST_fsm_state1_blk_assign_proc : process(state, data_fifo_empty_n, data_fifo_full_n, or_ln93_1_fu_406_p2)
    begin
        if ((((or_ln93_1_fu_406_p2 = ap_const_lv1_0) and (data_fifo_full_n = ap_const_logic_0)) or ((state = ap_const_lv2_1) and (data_fifo_empty_n = ap_const_logic_0)))) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_block_state1_assign_proc : process(state, data_fifo_empty_n, data_fifo_full_n, or_ln93_1_fu_406_p2)
    begin
                ap_block_state1 <= (((or_ln93_1_fu_406_p2 = ap_const_lv1_0) and (data_fifo_full_n = ap_const_logic_0)) or ((state = ap_const_lv2_1) and (data_fifo_empty_n = ap_const_logic_0)));
    end process;


    ap_condition_178_assign_proc : process(state, ap_CS_fsm_state1, data_fifo_empty_n, state_load_load_fu_215_p1, data_fifo_full_n, or_ln93_1_fu_406_p2)
    begin
                ap_condition_178 <= (not((((or_ln93_1_fu_406_p2 = ap_const_lv1_0) and (data_fifo_full_n = ap_const_logic_0)) or ((state = ap_const_lv2_1) and (data_fifo_empty_n = ap_const_logic_0)))) and (state_load_load_fu_215_p1 = ap_const_lv2_2) and (ap_const_logic_1 = ap_CS_fsm_state1));
    end process;


    ap_condition_53_assign_proc : process(state, ap_CS_fsm_state1, data_fifo_empty_n, data_fifo_full_n, or_ln93_1_fu_406_p2)
    begin
                ap_condition_53 <= (not((((or_ln93_1_fu_406_p2 = ap_const_lv1_0) and (data_fifo_full_n = ap_const_logic_0)) or ((state = ap_const_lv2_1) and (data_fifo_empty_n = ap_const_logic_0)))) and (ap_const_logic_1 = ap_CS_fsm_state1));
    end process;

    data_fifo_din <= ((ap_const_lv1_1 & data) & ap_const_lv1_0);

    data_fifo_read_assign_proc : process(state, ap_CS_fsm_state1, data_fifo_empty_n, data_fifo_full_n, or_ln93_1_fu_406_p2)
    begin
        if ((not((((or_ln93_1_fu_406_p2 = ap_const_lv1_0) and (data_fifo_full_n = ap_const_logic_0)) or ((state = ap_const_lv2_1) and (data_fifo_empty_n = ap_const_logic_0)))) and (state = ap_const_lv2_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            data_fifo_read <= ap_const_logic_1;
        else 
            data_fifo_read <= ap_const_logic_0;
        end if; 
    end process;


    data_fifo_write_assign_proc : process(state, ap_CS_fsm_state1, data_fifo_empty_n, data_fifo_full_n, or_ln93_1_fu_406_p2)
    begin
        if ((not((((or_ln93_1_fu_406_p2 = ap_const_lv1_0) and (data_fifo_full_n = ap_const_logic_0)) or ((state = ap_const_lv2_1) and (data_fifo_empty_n = ap_const_logic_0)))) and (or_ln93_1_fu_406_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            data_fifo_write <= ap_const_logic_1;
        else 
            data_fifo_write <= ap_const_logic_0;
        end if; 
    end process;

    empty <= xor_ln136_fu_197_p2;
    full <= xor_ln140_fu_190_p2;
    icmp_ln1057_fu_302_p2 <= "1" when (unsigned(bit_counter_V) < unsigned(ap_const_lv11_4E0)) else "0";
    icmp_ln70_fu_314_p2 <= "0" when (bits_shifted_V = ap_const_lv4_A) else "1";
    or_ln59_1_fu_376_p2 <= (write_d or or_ln59_fu_370_p2);
    or_ln59_fu_370_p2 <= (xor_ln59_fu_364_p2 or xor_ln136_fu_197_p2);
    or_ln93_1_fu_406_p2 <= (or_ln93_fu_400_p2 or load_d);
    or_ln93_fu_400_p2 <= (xor_ln93_fu_394_p2 or xor_ln140_fu_190_p2);
    p_Result_s_fu_262_p5 <= (shift_reg_V(9 downto 9) & tmp_3_fu_252_p4);
    select_ln72_fu_320_p3 <= 
        ap_const_lv2_3 when (icmp_ln70_fu_314_p2(0) = '1') else 
        ap_const_lv2_0;
    state_load_load_fu_215_p1 <= state;
    tmp_1_nbreadreq_fu_138_p3 <= (0=>(data_fifo_empty_n), others=>'-');
    tmp_2_fu_227_p3 <= state(1 downto 1);
    tmp_3_fu_252_p4 <= shift_reg_V(9 downto 1);
    trunc_ln708_fu_223_p1 <= shift_reg_V(1 - 1 downto 0);
    tx <= (xor_ln53_fu_235_p2 or trunc_ln708_fu_223_p1);
    xor_ln136_fu_197_p2 <= (tmp_1_nbreadreq_fu_138_p3 xor ap_const_lv1_1);
    xor_ln140_fu_190_p0 <= (0=>data_fifo_full_n, others=>'-');
    xor_ln140_fu_190_p2 <= (xor_ln140_fu_190_p0 xor ap_const_lv1_1);
    xor_ln53_fu_235_p2 <= (tmp_2_fu_227_p3 xor ap_const_lv1_1);
    xor_ln59_fu_364_p2 <= (write_r xor ap_const_lv1_1);
    xor_ln93_fu_394_p2 <= (load xor ap_const_lv1_1);
end behav;