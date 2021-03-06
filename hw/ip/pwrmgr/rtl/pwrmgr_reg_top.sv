// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Register Top module auto-generated by `reggen`

`include "prim_assert.sv"

module pwrmgr_reg_top (
  input clk_i,
  input rst_ni,

  // Below Regster interface can be changed
  input  tlul_pkg::tl_h2d_t tl_i,
  output tlul_pkg::tl_d2h_t tl_o,
  // To HW
  output pwrmgr_reg_pkg::pwrmgr_reg2hw_t reg2hw, // Write
  input  pwrmgr_reg_pkg::pwrmgr_hw2reg_t hw2reg, // Read

  // Config
  input devmode_i // If 1, explicit error return for unmapped register access
);

  import pwrmgr_reg_pkg::* ;

  localparam int AW = 6;
  localparam int DW = 32;
  localparam int DBW = DW/8;                    // Byte Width

  // register signals
  logic           reg_we;
  logic           reg_re;
  logic [AW-1:0]  reg_addr;
  logic [DW-1:0]  reg_wdata;
  logic [DBW-1:0] reg_be;
  logic [DW-1:0]  reg_rdata;
  logic           reg_error;

  logic          addrmiss, wr_err;

  logic [DW-1:0] reg_rdata_next;

  tlul_pkg::tl_h2d_t tl_reg_h2d;
  tlul_pkg::tl_d2h_t tl_reg_d2h;

  assign tl_reg_h2d = tl_i;
  assign tl_o       = tl_reg_d2h;

  tlul_adapter_reg #(
    .RegAw(AW),
    .RegDw(DW)
  ) u_reg_if (
    .clk_i,
    .rst_ni,

    .tl_i (tl_reg_h2d),
    .tl_o (tl_reg_d2h),

    .we_o    (reg_we),
    .re_o    (reg_re),
    .addr_o  (reg_addr),
    .wdata_o (reg_wdata),
    .be_o    (reg_be),
    .rdata_i (reg_rdata),
    .error_i (reg_error)
  );

  assign reg_rdata = reg_rdata_next ;
  assign reg_error = (devmode_i & addrmiss) | wr_err ;

  // Define SW related signals
  // Format: <reg>_<field>_{wd|we|qs}
  //        or <reg>_{wd|we|qs} if field == 1 or 0
  logic intr_state_qs;
  logic intr_state_wd;
  logic intr_state_we;
  logic intr_enable_qs;
  logic intr_enable_wd;
  logic intr_enable_we;
  logic intr_test_wd;
  logic intr_test_we;
  logic ctrl_cfg_regwen_qs;
  logic ctrl_cfg_regwen_re;
  logic control_low_power_hint_qs;
  logic control_low_power_hint_wd;
  logic control_low_power_hint_we;
  logic control_core_clk_en_qs;
  logic control_core_clk_en_wd;
  logic control_core_clk_en_we;
  logic control_io_clk_en_qs;
  logic control_io_clk_en_wd;
  logic control_io_clk_en_we;
  logic control_main_pd_n_qs;
  logic control_main_pd_n_wd;
  logic control_main_pd_n_we;
  logic cfg_cdc_sync_qs;
  logic cfg_cdc_sync_wd;
  logic cfg_cdc_sync_we;
  logic wakeup_en_regwen_qs;
  logic wakeup_en_regwen_wd;
  logic wakeup_en_regwen_we;
  logic wakeup_en_en0_qs;
  logic wakeup_en_en0_wd;
  logic wakeup_en_en0_we;
  logic wakeup_en_en1_qs;
  logic wakeup_en_en1_wd;
  logic wakeup_en_en1_we;
  logic wakeup_en_en2_qs;
  logic wakeup_en_en2_wd;
  logic wakeup_en_en2_we;
  logic wakeup_en_en3_qs;
  logic wakeup_en_en3_wd;
  logic wakeup_en_en3_we;
  logic wakeup_en_en4_qs;
  logic wakeup_en_en4_wd;
  logic wakeup_en_en4_we;
  logic wakeup_en_en5_qs;
  logic wakeup_en_en5_wd;
  logic wakeup_en_en5_we;
  logic wakeup_en_en6_qs;
  logic wakeup_en_en6_wd;
  logic wakeup_en_en6_we;
  logic wakeup_en_en7_qs;
  logic wakeup_en_en7_wd;
  logic wakeup_en_en7_we;
  logic wakeup_en_en8_qs;
  logic wakeup_en_en8_wd;
  logic wakeup_en_en8_we;
  logic wakeup_en_en9_qs;
  logic wakeup_en_en9_wd;
  logic wakeup_en_en9_we;
  logic wakeup_en_en10_qs;
  logic wakeup_en_en10_wd;
  logic wakeup_en_en10_we;
  logic wakeup_en_en11_qs;
  logic wakeup_en_en11_wd;
  logic wakeup_en_en11_we;
  logic wakeup_en_en12_qs;
  logic wakeup_en_en12_wd;
  logic wakeup_en_en12_we;
  logic wakeup_en_en13_qs;
  logic wakeup_en_en13_wd;
  logic wakeup_en_en13_we;
  logic wakeup_en_en14_qs;
  logic wakeup_en_en14_wd;
  logic wakeup_en_en14_we;
  logic wakeup_en_en15_qs;
  logic wakeup_en_en15_wd;
  logic wakeup_en_en15_we;
  logic wake_status_val0_qs;
  logic wake_status_val1_qs;
  logic wake_status_val2_qs;
  logic wake_status_val3_qs;
  logic wake_status_val4_qs;
  logic wake_status_val5_qs;
  logic wake_status_val6_qs;
  logic wake_status_val7_qs;
  logic wake_status_val8_qs;
  logic wake_status_val9_qs;
  logic wake_status_val10_qs;
  logic wake_status_val11_qs;
  logic wake_status_val12_qs;
  logic wake_status_val13_qs;
  logic wake_status_val14_qs;
  logic wake_status_val15_qs;
  logic reset_en_regwen_qs;
  logic reset_en_regwen_wd;
  logic reset_en_regwen_we;
  logic [1:0] reset_en_qs;
  logic [1:0] reset_en_wd;
  logic reset_en_we;
  logic [1:0] reset_status_qs;
  logic wake_info_capture_dis_qs;
  logic wake_info_capture_dis_wd;
  logic wake_info_capture_dis_we;
  logic [15:0] wake_info_reasons_qs;
  logic [15:0] wake_info_reasons_wd;
  logic wake_info_reasons_we;
  logic wake_info_reasons_re;
  logic wake_info_fall_through_qs;
  logic wake_info_fall_through_wd;
  logic wake_info_fall_through_we;
  logic wake_info_fall_through_re;
  logic wake_info_abort_qs;
  logic wake_info_abort_wd;
  logic wake_info_abort_we;
  logic wake_info_abort_re;

  // Register instances
  // R[intr_state]: V(False)

  prim_subreg #(
    .DW      (1),
    .SWACCESS("W1C"),
    .RESVAL  (1'h0)
  ) u_intr_state (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (intr_state_we),
    .wd     (intr_state_wd),

    // from internal hardware
    .de     (hw2reg.intr_state.de),
    .d      (hw2reg.intr_state.d ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.intr_state.q ),

    // to register interface (read)
    .qs     (intr_state_qs)
  );


  // R[intr_enable]: V(False)

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_intr_enable (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (intr_enable_we),
    .wd     (intr_enable_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.intr_enable.q ),

    // to register interface (read)
    .qs     (intr_enable_qs)
  );


  // R[intr_test]: V(True)

  prim_subreg_ext #(
    .DW    (1)
  ) u_intr_test (
    .re     (1'b0),
    .we     (intr_test_we),
    .wd     (intr_test_wd),
    .d      ('0),
    .qre    (),
    .qe     (reg2hw.intr_test.qe),
    .q      (reg2hw.intr_test.q ),
    .qs     ()
  );


  // R[ctrl_cfg_regwen]: V(True)

  prim_subreg_ext #(
    .DW    (1)
  ) u_ctrl_cfg_regwen (
    .re     (ctrl_cfg_regwen_re),
    .we     (1'b0),
    .wd     ('0),
    .d      (hw2reg.ctrl_cfg_regwen.d),
    .qre    (),
    .qe     (),
    .q      (),
    .qs     (ctrl_cfg_regwen_qs)
  );


  // R[control]: V(False)

  //   F[low_power_hint]: 0:0
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_control_low_power_hint (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface (qualified with register enable)
    .we     (control_low_power_hint_we & ctrl_cfg_regwen_qs),
    .wd     (control_low_power_hint_wd),

    // from internal hardware
    .de     (hw2reg.control.low_power_hint.de),
    .d      (hw2reg.control.low_power_hint.d ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.control.low_power_hint.q ),

    // to register interface (read)
    .qs     (control_low_power_hint_qs)
  );


  //   F[core_clk_en]: 4:4
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_control_core_clk_en (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface (qualified with register enable)
    .we     (control_core_clk_en_we & ctrl_cfg_regwen_qs),
    .wd     (control_core_clk_en_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.control.core_clk_en.q ),

    // to register interface (read)
    .qs     (control_core_clk_en_qs)
  );


  //   F[io_clk_en]: 5:5
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_control_io_clk_en (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface (qualified with register enable)
    .we     (control_io_clk_en_we & ctrl_cfg_regwen_qs),
    .wd     (control_io_clk_en_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.control.io_clk_en.q ),

    // to register interface (read)
    .qs     (control_io_clk_en_qs)
  );


  //   F[main_pd_n]: 6:6
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h1)
  ) u_control_main_pd_n (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface (qualified with register enable)
    .we     (control_main_pd_n_we & ctrl_cfg_regwen_qs),
    .wd     (control_main_pd_n_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.control.main_pd_n.q ),

    // to register interface (read)
    .qs     (control_main_pd_n_qs)
  );


  // R[cfg_cdc_sync]: V(False)

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_cfg_cdc_sync (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (cfg_cdc_sync_we),
    .wd     (cfg_cdc_sync_wd),

    // from internal hardware
    .de     (hw2reg.cfg_cdc_sync.de),
    .d      (hw2reg.cfg_cdc_sync.d ),

    // to internal hardware
    .qe     (reg2hw.cfg_cdc_sync.qe),
    .q      (reg2hw.cfg_cdc_sync.q ),

    // to register interface (read)
    .qs     (cfg_cdc_sync_qs)
  );


  // R[wakeup_en_regwen]: V(False)

  prim_subreg #(
    .DW      (1),
    .SWACCESS("W0C"),
    .RESVAL  (1'h1)
  ) u_wakeup_en_regwen (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (wakeup_en_regwen_we),
    .wd     (wakeup_en_regwen_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (wakeup_en_regwen_qs)
  );



  // Subregister 0 of Multireg wakeup_en
  // R[wakeup_en]: V(False)

  // F[en0]: 0:0
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_wakeup_en_en0 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface (qualified with register enable)
    .we     (wakeup_en_en0_we & wakeup_en_regwen_qs),
    .wd     (wakeup_en_en0_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.wakeup_en[0].q ),

    // to register interface (read)
    .qs     (wakeup_en_en0_qs)
  );


  // F[en1]: 1:1
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_wakeup_en_en1 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface (qualified with register enable)
    .we     (wakeup_en_en1_we & wakeup_en_regwen_qs),
    .wd     (wakeup_en_en1_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.wakeup_en[1].q ),

    // to register interface (read)
    .qs     (wakeup_en_en1_qs)
  );


  // F[en2]: 2:2
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_wakeup_en_en2 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface (qualified with register enable)
    .we     (wakeup_en_en2_we & wakeup_en_regwen_qs),
    .wd     (wakeup_en_en2_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.wakeup_en[2].q ),

    // to register interface (read)
    .qs     (wakeup_en_en2_qs)
  );


  // F[en3]: 3:3
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_wakeup_en_en3 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface (qualified with register enable)
    .we     (wakeup_en_en3_we & wakeup_en_regwen_qs),
    .wd     (wakeup_en_en3_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.wakeup_en[3].q ),

    // to register interface (read)
    .qs     (wakeup_en_en3_qs)
  );


  // F[en4]: 4:4
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_wakeup_en_en4 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface (qualified with register enable)
    .we     (wakeup_en_en4_we & wakeup_en_regwen_qs),
    .wd     (wakeup_en_en4_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.wakeup_en[4].q ),

    // to register interface (read)
    .qs     (wakeup_en_en4_qs)
  );


  // F[en5]: 5:5
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_wakeup_en_en5 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface (qualified with register enable)
    .we     (wakeup_en_en5_we & wakeup_en_regwen_qs),
    .wd     (wakeup_en_en5_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.wakeup_en[5].q ),

    // to register interface (read)
    .qs     (wakeup_en_en5_qs)
  );


  // F[en6]: 6:6
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_wakeup_en_en6 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface (qualified with register enable)
    .we     (wakeup_en_en6_we & wakeup_en_regwen_qs),
    .wd     (wakeup_en_en6_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.wakeup_en[6].q ),

    // to register interface (read)
    .qs     (wakeup_en_en6_qs)
  );


  // F[en7]: 7:7
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_wakeup_en_en7 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface (qualified with register enable)
    .we     (wakeup_en_en7_we & wakeup_en_regwen_qs),
    .wd     (wakeup_en_en7_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.wakeup_en[7].q ),

    // to register interface (read)
    .qs     (wakeup_en_en7_qs)
  );


  // F[en8]: 8:8
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_wakeup_en_en8 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface (qualified with register enable)
    .we     (wakeup_en_en8_we & wakeup_en_regwen_qs),
    .wd     (wakeup_en_en8_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.wakeup_en[8].q ),

    // to register interface (read)
    .qs     (wakeup_en_en8_qs)
  );


  // F[en9]: 9:9
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_wakeup_en_en9 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface (qualified with register enable)
    .we     (wakeup_en_en9_we & wakeup_en_regwen_qs),
    .wd     (wakeup_en_en9_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.wakeup_en[9].q ),

    // to register interface (read)
    .qs     (wakeup_en_en9_qs)
  );


  // F[en10]: 10:10
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_wakeup_en_en10 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface (qualified with register enable)
    .we     (wakeup_en_en10_we & wakeup_en_regwen_qs),
    .wd     (wakeup_en_en10_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.wakeup_en[10].q ),

    // to register interface (read)
    .qs     (wakeup_en_en10_qs)
  );


  // F[en11]: 11:11
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_wakeup_en_en11 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface (qualified with register enable)
    .we     (wakeup_en_en11_we & wakeup_en_regwen_qs),
    .wd     (wakeup_en_en11_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.wakeup_en[11].q ),

    // to register interface (read)
    .qs     (wakeup_en_en11_qs)
  );


  // F[en12]: 12:12
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_wakeup_en_en12 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface (qualified with register enable)
    .we     (wakeup_en_en12_we & wakeup_en_regwen_qs),
    .wd     (wakeup_en_en12_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.wakeup_en[12].q ),

    // to register interface (read)
    .qs     (wakeup_en_en12_qs)
  );


  // F[en13]: 13:13
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_wakeup_en_en13 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface (qualified with register enable)
    .we     (wakeup_en_en13_we & wakeup_en_regwen_qs),
    .wd     (wakeup_en_en13_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.wakeup_en[13].q ),

    // to register interface (read)
    .qs     (wakeup_en_en13_qs)
  );


  // F[en14]: 14:14
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_wakeup_en_en14 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface (qualified with register enable)
    .we     (wakeup_en_en14_we & wakeup_en_regwen_qs),
    .wd     (wakeup_en_en14_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.wakeup_en[14].q ),

    // to register interface (read)
    .qs     (wakeup_en_en14_qs)
  );


  // F[en15]: 15:15
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_wakeup_en_en15 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface (qualified with register enable)
    .we     (wakeup_en_en15_we & wakeup_en_regwen_qs),
    .wd     (wakeup_en_en15_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.wakeup_en[15].q ),

    // to register interface (read)
    .qs     (wakeup_en_en15_qs)
  );




  // Subregister 0 of Multireg wake_status
  // R[wake_status]: V(False)

  // F[val0]: 0:0
  // constant-only read
  assign wake_status_val0_qs = 1'h0;


  // F[val1]: 1:1
  // constant-only read
  assign wake_status_val1_qs = 1'h0;


  // F[val2]: 2:2
  // constant-only read
  assign wake_status_val2_qs = 1'h0;


  // F[val3]: 3:3
  // constant-only read
  assign wake_status_val3_qs = 1'h0;


  // F[val4]: 4:4
  // constant-only read
  assign wake_status_val4_qs = 1'h0;


  // F[val5]: 5:5
  // constant-only read
  assign wake_status_val5_qs = 1'h0;


  // F[val6]: 6:6
  // constant-only read
  assign wake_status_val6_qs = 1'h0;


  // F[val7]: 7:7
  // constant-only read
  assign wake_status_val7_qs = 1'h0;


  // F[val8]: 8:8
  // constant-only read
  assign wake_status_val8_qs = 1'h0;


  // F[val9]: 9:9
  // constant-only read
  assign wake_status_val9_qs = 1'h0;


  // F[val10]: 10:10
  // constant-only read
  assign wake_status_val10_qs = 1'h0;


  // F[val11]: 11:11
  // constant-only read
  assign wake_status_val11_qs = 1'h0;


  // F[val12]: 12:12
  // constant-only read
  assign wake_status_val12_qs = 1'h0;


  // F[val13]: 13:13
  // constant-only read
  assign wake_status_val13_qs = 1'h0;


  // F[val14]: 14:14
  // constant-only read
  assign wake_status_val14_qs = 1'h0;


  // F[val15]: 15:15
  // constant-only read
  assign wake_status_val15_qs = 1'h0;



  // R[reset_en_regwen]: V(False)

  prim_subreg #(
    .DW      (1),
    .SWACCESS("W0C"),
    .RESVAL  (1'h1)
  ) u_reset_en_regwen (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (reset_en_regwen_we),
    .wd     (reset_en_regwen_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (reset_en_regwen_qs)
  );


  // R[reset_en]: V(False)

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_reset_en (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface (qualified with register enable)
    .we     (reset_en_we & reset_en_regwen_qs),
    .wd     (reset_en_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.reset_en.q ),

    // to register interface (read)
    .qs     (reset_en_qs)
  );


  // R[reset_status]: V(False)

  // constant-only read
  assign reset_status_qs = 2'h0;


  // R[wake_info_capture_dis]: V(False)

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_wake_info_capture_dis (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (wake_info_capture_dis_we),
    .wd     (wake_info_capture_dis_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.wake_info_capture_dis.q ),

    // to register interface (read)
    .qs     (wake_info_capture_dis_qs)
  );


  // R[wake_info]: V(True)

  //   F[reasons]: 15:0
  prim_subreg_ext #(
    .DW    (16)
  ) u_wake_info_reasons (
    .re     (wake_info_reasons_re),
    .we     (wake_info_reasons_we),
    .wd     (wake_info_reasons_wd),
    .d      (hw2reg.wake_info.reasons.d),
    .qre    (),
    .qe     (reg2hw.wake_info.reasons.qe),
    .q      (reg2hw.wake_info.reasons.q ),
    .qs     (wake_info_reasons_qs)
  );


  //   F[fall_through]: 16:16
  prim_subreg_ext #(
    .DW    (1)
  ) u_wake_info_fall_through (
    .re     (wake_info_fall_through_re),
    .we     (wake_info_fall_through_we),
    .wd     (wake_info_fall_through_wd),
    .d      (hw2reg.wake_info.fall_through.d),
    .qre    (),
    .qe     (reg2hw.wake_info.fall_through.qe),
    .q      (reg2hw.wake_info.fall_through.q ),
    .qs     (wake_info_fall_through_qs)
  );


  //   F[abort]: 17:17
  prim_subreg_ext #(
    .DW    (1)
  ) u_wake_info_abort (
    .re     (wake_info_abort_re),
    .we     (wake_info_abort_we),
    .wd     (wake_info_abort_wd),
    .d      (hw2reg.wake_info.abort.d),
    .qre    (),
    .qe     (reg2hw.wake_info.abort.qe),
    .q      (reg2hw.wake_info.abort.q ),
    .qs     (wake_info_abort_qs)
  );




  logic [13:0] addr_hit;
  always_comb begin
    addr_hit = '0;
    addr_hit[ 0] = (reg_addr == PWRMGR_INTR_STATE_OFFSET);
    addr_hit[ 1] = (reg_addr == PWRMGR_INTR_ENABLE_OFFSET);
    addr_hit[ 2] = (reg_addr == PWRMGR_INTR_TEST_OFFSET);
    addr_hit[ 3] = (reg_addr == PWRMGR_CTRL_CFG_REGWEN_OFFSET);
    addr_hit[ 4] = (reg_addr == PWRMGR_CONTROL_OFFSET);
    addr_hit[ 5] = (reg_addr == PWRMGR_CFG_CDC_SYNC_OFFSET);
    addr_hit[ 6] = (reg_addr == PWRMGR_WAKEUP_EN_REGWEN_OFFSET);
    addr_hit[ 7] = (reg_addr == PWRMGR_WAKEUP_EN_OFFSET);
    addr_hit[ 8] = (reg_addr == PWRMGR_WAKE_STATUS_OFFSET);
    addr_hit[ 9] = (reg_addr == PWRMGR_RESET_EN_REGWEN_OFFSET);
    addr_hit[10] = (reg_addr == PWRMGR_RESET_EN_OFFSET);
    addr_hit[11] = (reg_addr == PWRMGR_RESET_STATUS_OFFSET);
    addr_hit[12] = (reg_addr == PWRMGR_WAKE_INFO_CAPTURE_DIS_OFFSET);
    addr_hit[13] = (reg_addr == PWRMGR_WAKE_INFO_OFFSET);
  end

  assign addrmiss = (reg_re || reg_we) ? ~|addr_hit : 1'b0 ;

  // Check sub-word write is permitted
  always_comb begin
    wr_err = 1'b0;
    if (addr_hit[ 0] && reg_we && (PWRMGR_PERMIT[ 0] != (PWRMGR_PERMIT[ 0] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[ 1] && reg_we && (PWRMGR_PERMIT[ 1] != (PWRMGR_PERMIT[ 1] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[ 2] && reg_we && (PWRMGR_PERMIT[ 2] != (PWRMGR_PERMIT[ 2] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[ 3] && reg_we && (PWRMGR_PERMIT[ 3] != (PWRMGR_PERMIT[ 3] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[ 4] && reg_we && (PWRMGR_PERMIT[ 4] != (PWRMGR_PERMIT[ 4] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[ 5] && reg_we && (PWRMGR_PERMIT[ 5] != (PWRMGR_PERMIT[ 5] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[ 6] && reg_we && (PWRMGR_PERMIT[ 6] != (PWRMGR_PERMIT[ 6] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[ 7] && reg_we && (PWRMGR_PERMIT[ 7] != (PWRMGR_PERMIT[ 7] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[ 8] && reg_we && (PWRMGR_PERMIT[ 8] != (PWRMGR_PERMIT[ 8] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[ 9] && reg_we && (PWRMGR_PERMIT[ 9] != (PWRMGR_PERMIT[ 9] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[10] && reg_we && (PWRMGR_PERMIT[10] != (PWRMGR_PERMIT[10] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[11] && reg_we && (PWRMGR_PERMIT[11] != (PWRMGR_PERMIT[11] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[12] && reg_we && (PWRMGR_PERMIT[12] != (PWRMGR_PERMIT[12] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[13] && reg_we && (PWRMGR_PERMIT[13] != (PWRMGR_PERMIT[13] & reg_be))) wr_err = 1'b1 ;
  end

  assign intr_state_we = addr_hit[0] & reg_we & ~wr_err;
  assign intr_state_wd = reg_wdata[0];

  assign intr_enable_we = addr_hit[1] & reg_we & ~wr_err;
  assign intr_enable_wd = reg_wdata[0];

  assign intr_test_we = addr_hit[2] & reg_we & ~wr_err;
  assign intr_test_wd = reg_wdata[0];

  assign ctrl_cfg_regwen_re = addr_hit[3] && reg_re;

  assign control_low_power_hint_we = addr_hit[4] & reg_we & ~wr_err;
  assign control_low_power_hint_wd = reg_wdata[0];

  assign control_core_clk_en_we = addr_hit[4] & reg_we & ~wr_err;
  assign control_core_clk_en_wd = reg_wdata[4];

  assign control_io_clk_en_we = addr_hit[4] & reg_we & ~wr_err;
  assign control_io_clk_en_wd = reg_wdata[5];

  assign control_main_pd_n_we = addr_hit[4] & reg_we & ~wr_err;
  assign control_main_pd_n_wd = reg_wdata[6];

  assign cfg_cdc_sync_we = addr_hit[5] & reg_we & ~wr_err;
  assign cfg_cdc_sync_wd = reg_wdata[0];

  assign wakeup_en_regwen_we = addr_hit[6] & reg_we & ~wr_err;
  assign wakeup_en_regwen_wd = reg_wdata[0];

  assign wakeup_en_en0_we = addr_hit[7] & reg_we & ~wr_err;
  assign wakeup_en_en0_wd = reg_wdata[0];

  assign wakeup_en_en1_we = addr_hit[7] & reg_we & ~wr_err;
  assign wakeup_en_en1_wd = reg_wdata[1];

  assign wakeup_en_en2_we = addr_hit[7] & reg_we & ~wr_err;
  assign wakeup_en_en2_wd = reg_wdata[2];

  assign wakeup_en_en3_we = addr_hit[7] & reg_we & ~wr_err;
  assign wakeup_en_en3_wd = reg_wdata[3];

  assign wakeup_en_en4_we = addr_hit[7] & reg_we & ~wr_err;
  assign wakeup_en_en4_wd = reg_wdata[4];

  assign wakeup_en_en5_we = addr_hit[7] & reg_we & ~wr_err;
  assign wakeup_en_en5_wd = reg_wdata[5];

  assign wakeup_en_en6_we = addr_hit[7] & reg_we & ~wr_err;
  assign wakeup_en_en6_wd = reg_wdata[6];

  assign wakeup_en_en7_we = addr_hit[7] & reg_we & ~wr_err;
  assign wakeup_en_en7_wd = reg_wdata[7];

  assign wakeup_en_en8_we = addr_hit[7] & reg_we & ~wr_err;
  assign wakeup_en_en8_wd = reg_wdata[8];

  assign wakeup_en_en9_we = addr_hit[7] & reg_we & ~wr_err;
  assign wakeup_en_en9_wd = reg_wdata[9];

  assign wakeup_en_en10_we = addr_hit[7] & reg_we & ~wr_err;
  assign wakeup_en_en10_wd = reg_wdata[10];

  assign wakeup_en_en11_we = addr_hit[7] & reg_we & ~wr_err;
  assign wakeup_en_en11_wd = reg_wdata[11];

  assign wakeup_en_en12_we = addr_hit[7] & reg_we & ~wr_err;
  assign wakeup_en_en12_wd = reg_wdata[12];

  assign wakeup_en_en13_we = addr_hit[7] & reg_we & ~wr_err;
  assign wakeup_en_en13_wd = reg_wdata[13];

  assign wakeup_en_en14_we = addr_hit[7] & reg_we & ~wr_err;
  assign wakeup_en_en14_wd = reg_wdata[14];

  assign wakeup_en_en15_we = addr_hit[7] & reg_we & ~wr_err;
  assign wakeup_en_en15_wd = reg_wdata[15];

















  assign reset_en_regwen_we = addr_hit[9] & reg_we & ~wr_err;
  assign reset_en_regwen_wd = reg_wdata[0];

  assign reset_en_we = addr_hit[10] & reg_we & ~wr_err;
  assign reset_en_wd = reg_wdata[1:0];


  assign wake_info_capture_dis_we = addr_hit[12] & reg_we & ~wr_err;
  assign wake_info_capture_dis_wd = reg_wdata[0];

  assign wake_info_reasons_we = addr_hit[13] & reg_we & ~wr_err;
  assign wake_info_reasons_wd = reg_wdata[15:0];
  assign wake_info_reasons_re = addr_hit[13] && reg_re;

  assign wake_info_fall_through_we = addr_hit[13] & reg_we & ~wr_err;
  assign wake_info_fall_through_wd = reg_wdata[16];
  assign wake_info_fall_through_re = addr_hit[13] && reg_re;

  assign wake_info_abort_we = addr_hit[13] & reg_we & ~wr_err;
  assign wake_info_abort_wd = reg_wdata[17];
  assign wake_info_abort_re = addr_hit[13] && reg_re;

  // Read data return
  always_comb begin
    reg_rdata_next = '0;
    unique case (1'b1)
      addr_hit[0]: begin
        reg_rdata_next[0] = intr_state_qs;
      end

      addr_hit[1]: begin
        reg_rdata_next[0] = intr_enable_qs;
      end

      addr_hit[2]: begin
        reg_rdata_next[0] = '0;
      end

      addr_hit[3]: begin
        reg_rdata_next[0] = ctrl_cfg_regwen_qs;
      end

      addr_hit[4]: begin
        reg_rdata_next[0] = control_low_power_hint_qs;
        reg_rdata_next[4] = control_core_clk_en_qs;
        reg_rdata_next[5] = control_io_clk_en_qs;
        reg_rdata_next[6] = control_main_pd_n_qs;
      end

      addr_hit[5]: begin
        reg_rdata_next[0] = cfg_cdc_sync_qs;
      end

      addr_hit[6]: begin
        reg_rdata_next[0] = wakeup_en_regwen_qs;
      end

      addr_hit[7]: begin
        reg_rdata_next[0] = wakeup_en_en0_qs;
        reg_rdata_next[1] = wakeup_en_en1_qs;
        reg_rdata_next[2] = wakeup_en_en2_qs;
        reg_rdata_next[3] = wakeup_en_en3_qs;
        reg_rdata_next[4] = wakeup_en_en4_qs;
        reg_rdata_next[5] = wakeup_en_en5_qs;
        reg_rdata_next[6] = wakeup_en_en6_qs;
        reg_rdata_next[7] = wakeup_en_en7_qs;
        reg_rdata_next[8] = wakeup_en_en8_qs;
        reg_rdata_next[9] = wakeup_en_en9_qs;
        reg_rdata_next[10] = wakeup_en_en10_qs;
        reg_rdata_next[11] = wakeup_en_en11_qs;
        reg_rdata_next[12] = wakeup_en_en12_qs;
        reg_rdata_next[13] = wakeup_en_en13_qs;
        reg_rdata_next[14] = wakeup_en_en14_qs;
        reg_rdata_next[15] = wakeup_en_en15_qs;
      end

      addr_hit[8]: begin
        reg_rdata_next[0] = wake_status_val0_qs;
        reg_rdata_next[1] = wake_status_val1_qs;
        reg_rdata_next[2] = wake_status_val2_qs;
        reg_rdata_next[3] = wake_status_val3_qs;
        reg_rdata_next[4] = wake_status_val4_qs;
        reg_rdata_next[5] = wake_status_val5_qs;
        reg_rdata_next[6] = wake_status_val6_qs;
        reg_rdata_next[7] = wake_status_val7_qs;
        reg_rdata_next[8] = wake_status_val8_qs;
        reg_rdata_next[9] = wake_status_val9_qs;
        reg_rdata_next[10] = wake_status_val10_qs;
        reg_rdata_next[11] = wake_status_val11_qs;
        reg_rdata_next[12] = wake_status_val12_qs;
        reg_rdata_next[13] = wake_status_val13_qs;
        reg_rdata_next[14] = wake_status_val14_qs;
        reg_rdata_next[15] = wake_status_val15_qs;
      end

      addr_hit[9]: begin
        reg_rdata_next[0] = reset_en_regwen_qs;
      end

      addr_hit[10]: begin
        reg_rdata_next[1:0] = reset_en_qs;
      end

      addr_hit[11]: begin
        reg_rdata_next[1:0] = reset_status_qs;
      end

      addr_hit[12]: begin
        reg_rdata_next[0] = wake_info_capture_dis_qs;
      end

      addr_hit[13]: begin
        reg_rdata_next[15:0] = wake_info_reasons_qs;
        reg_rdata_next[16] = wake_info_fall_through_qs;
        reg_rdata_next[17] = wake_info_abort_qs;
      end

      default: begin
        reg_rdata_next = '1;
      end
    endcase
  end

  // Assertions for Register Interface
  `ASSERT_PULSE(wePulse, reg_we)
  `ASSERT_PULSE(rePulse, reg_re)

  `ASSERT(reAfterRv, $rose(reg_re || reg_we) |=> tl_o.d_valid)

  `ASSERT(en2addrHit, (reg_we || reg_re) |-> $onehot0(addr_hit))

  // this is formulated as an assumption such that the FPV testbenches do disprove this
  // property by mistake
  `ASSUME(reqParity, tl_reg_h2d.a_valid |-> tl_reg_h2d.a_user.parity_en == 1'b0)

endmodule
