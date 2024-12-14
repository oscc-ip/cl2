`include "cl2_arch_desc.svh"

module cl2_pl_exu_regfile (
    input  logic                          clk_i,
    input  logic                          rst_n_i,
    input  logic                          tm_i,
    input  logic [`CL2_REGFILE_WIDTH-1:0] rs1_idx_i,
    output logic [         `CL2_XLEN-1:0] rs1_dat_o,
    input  logic [`CL2_REGFILE_WIDTH-1:0] rs2_idx_i,
    output logic [         `CL2_XLEN-1:0] rs2_dat_o,
    input  logic                          wd_wen_i,
    input  logic [`CL2_REGFILE_WIDTH-1:0] wd_idx_i,
    input  logic [         `CL2_XLEN-1:0] wd_dat_i
);

  logic [       `CL2_XLEN-1:0] r_regfile_val [`CL2_REGFILE_NUM-1:0];
  logic [`CL2_REGFILE_NUM-1:0] s_regfile_wen;

  for (genvar i = 0; i < `CL2_REGFILE_NUM; i++) begin : REGFILE_GEN_BLOCK
    if (i == 0) begin : REGFILE_0_GEN_BLOCK
      assign s_regfile_wen[i] = '0;
      assign r_regfile_val[i] = '0;
    end else begin : REGFILE_NO0_GEN_BLOCK
      assign s_regfile_wen[i] = wd_wen_i & (wd_idx_i == i);
      cc_dffer u_regfile_cc_dffer (
          clk_i,
          rst_n_i,
          s_regfile_wen[i],
          wd_dat_i[i],
          r_regfile_val[i]
      );
    end
  end

  assign rs1_dat_o = r_regfile_val[rs1_idx_i];
  assign rs2_dat_o = r_regfile_val[rs2_idx_i];

endmodule

