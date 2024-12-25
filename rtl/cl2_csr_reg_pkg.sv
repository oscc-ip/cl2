package cl2_csr_reg_pkg;

  // Address widths within the block
  parameter int BlockAw = 6;


  // Typedefs for registers //
  typedef struct packed {
    logic       sd;
    logic       rsv_30_23;
    logic       tsr;
    logic       tw;
    logic       tvm;
    logic       mxr;
    logic       sum;
    logic       mprv;
    logic [1:0] xs;
    logic [1:0] fs;
    logic [1:0] mpp;
    logic       rsv_10_9;
    logic       spp;
    logic       mpie;
    logic       rsv_6;
    logic       spie;
    logic       upie;
    logic       mie;
    logic       rsv_2;
    logic       sie;
    logic       uie;
  } cl2_csr_mstatus_reg_t;


  typedef struct packed {
    logic [31:30] mxl;
    logic [29:26] rsv_29_26;
    logic [25:0]  extn;
  } cl2_csr_misa_reg_t;

  typedef struct packed {
    logic [15:0] rsv_31_16;
    logic [1:0]  zero_15_14;
    logic        lcofie;
    logic        zero_12;
    logic        meie;
    logic        zero_10;
    logic        seie;
    logic        zero_8;
    logic        mtie;
    logic        zero_6;
    logic        stie;
    logic        zero_4;
    logic        msie;
    logic        zero_2;
    logic        ssie;
    logic        zero_0;
  } cl2_csr_mie_reg_t;

  typedef struct packed {
    logic [15:0] rsv_31_16;
    logic [1:0]  zero_15_14;
    logic        lcofip;
    logic        zero_12;
    logic        meip;
    logic        zero_10;
    logic        seip;
    logic        zero_8;
    logic        mtip;
    logic        zero_6;
    logic        stip;
    logic        zero_4;
    logic        msip;
    logic        zero_2;
    logic        ssip;
    logic        zero_0;
  } cl2_csr_mip_reg_t;

  // Register -> HW type
  typedef struct packed {
    axi_vga_reg2hw_control_reg_t               control;
    axi_vga_reg2hw_clk_div_reg_t               clk_div;
    axi_vga_reg2hw_hori_visible_size_reg_t     hori_visible_size;
    axi_vga_reg2hw_hori_front_porch_size_reg_t hori_front_porch_size;
    axi_vga_reg2hw_hori_sync_size_reg_t        hori_sync_size;
    axi_vga_reg2hw_hori_back_porch_size_reg_t  hori_back_porch_size;
    axi_vga_reg2hw_vert_visible_size_reg_t     vert_visible_size;
    axi_vga_reg2hw_vert_front_porch_size_reg_t vert_front_porch_size;
    axi_vga_reg2hw_vert_sync_size_reg_t        vert_sync_size;
    axi_vga_reg2hw_vert_back_porch_size_reg_t  vert_back_porch_size;
    axi_vga_reg2hw_start_addr_low_reg_t        start_addr_low;
    axi_vga_reg2hw_start_addr_high_reg_t       start_addr_high;
    axi_vga_reg2hw_frame_size_reg_t            frame_size;
    axi_vga_reg2hw_burst_len_reg_t             burst_len;
  } axi_vga_reg2hw_t;

  // Register offsets
  parameter logic [BlockAw-1:0] AXI_VGA_CONTROL_OFFSET = 6'h0;
  parameter logic [BlockAw-1:0] AXI_VGA_CLK_DIV_OFFSET = 6'h4;
  parameter logic [BlockAw-1:0] AXI_VGA_HORI_VISIBLE_SIZE_OFFSET = 6'h8;
  parameter logic [BlockAw-1:0] AXI_VGA_HORI_FRONT_PORCH_SIZE_OFFSET = 6'hc;
  parameter logic [BlockAw-1:0] AXI_VGA_HORI_SYNC_SIZE_OFFSET = 6'h10;
  parameter logic [BlockAw-1:0] AXI_VGA_HORI_BACK_PORCH_SIZE_OFFSET = 6'h14;
  parameter logic [BlockAw-1:0] AXI_VGA_VERT_VISIBLE_SIZE_OFFSET = 6'h18;
  parameter logic [BlockAw-1:0] AXI_VGA_VERT_FRONT_PORCH_SIZE_OFFSET = 6'h1c;
  parameter logic [BlockAw-1:0] AXI_VGA_VERT_SYNC_SIZE_OFFSET = 6'h20;
  parameter logic [BlockAw-1:0] AXI_VGA_VERT_BACK_PORCH_SIZE_OFFSET = 6'h24;
  parameter logic [BlockAw-1:0] AXI_VGA_START_ADDR_LOW_OFFSET = 6'h28;
  parameter logic [BlockAw-1:0] AXI_VGA_START_ADDR_HIGH_OFFSET = 6'h2c;
  parameter logic [BlockAw-1:0] AXI_VGA_FRAME_SIZE_OFFSET = 6'h30;
  parameter logic [BlockAw-1:0] AXI_VGA_BURST_LEN_OFFSET = 6'h34;

  // register index
  typedef enum int {
    AXI_VGA_CONTROL,
    AXI_VGA_CLK_DIV,
    AXI_VGA_HORI_VISIBLE_SIZE,
    AXI_VGA_HORI_FRONT_PORCH_SIZE,
    AXI_VGA_HORI_SYNC_SIZE,
    AXI_VGA_HORI_BACK_PORCH_SIZE,
    AXI_VGA_VERT_VISIBLE_SIZE,
    AXI_VGA_VERT_FRONT_PORCH_SIZE,
    AXI_VGA_VERT_SYNC_SIZE,
    AXI_VGA_VERT_BACK_PORCH_SIZE,
    AXI_VGA_START_ADDR_LOW,
    AXI_VGA_START_ADDR_HIGH,
    AXI_VGA_FRAME_SIZE,
    AXI_VGA_BURST_LEN
  } axi_vga_id_e;

  // Register width information to check illegal writes
  parameter logic [3:0] AXI_VGA_PERMIT[14] = '{
      4'b0001,  // index[ 0] AXI_VGA_CONTROL
      4'b0001,  // index[ 1] AXI_VGA_CLK_DIV
      4'b1111,  // index[ 2] AXI_VGA_HORI_VISIBLE_SIZE
      4'b1111,  // index[ 3] AXI_VGA_HORI_FRONT_PORCH_SIZE
      4'b1111,  // index[ 4] AXI_VGA_HORI_SYNC_SIZE
      4'b1111,  // index[ 5] AXI_VGA_HORI_BACK_PORCH_SIZE
      4'b1111,  // index[ 6] AXI_VGA_VERT_VISIBLE_SIZE
      4'b1111,  // index[ 7] AXI_VGA_VERT_FRONT_PORCH_SIZE
      4'b1111,  // index[ 8] AXI_VGA_VERT_SYNC_SIZE
      4'b1111,  // index[ 9] AXI_VGA_VERT_BACK_PORCH_SIZE
      4'b1111,  // index[10] AXI_VGA_START_ADDR_LOW
      4'b1111,  // index[11] AXI_VGA_START_ADDR_HIGH
      4'b1111,  // index[12] AXI_VGA_FRAME_SIZE
      4'b0001  // index[13] AXI_VGA_BURST_LEN
  };

endpackage
