
module cl2_csr_field #(
    parameter int FIELD_WIDTH = 1
) (
    input  logic                   clk_i,
    input  logic                   rst_n_i,
    input  logic                   wr_en_i,
    input  logic [FIELD_WIDTH-1:0] wr_dat_i,
    output logic [FIELD_WIDTH-1:0] rd_dat_o
);

  dffer #(FIELD_WIDTH) u_csr_field_dffer (
      clk_i,
      rst_n_i,
      wr_en_i,
      wr_dat_i,
      rd_dat_o
  );
endmodule
