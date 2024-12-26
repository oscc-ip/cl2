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

  typedef struct packed {
    logic [1:0] mxl;
    logic [3:0] rsv_29_26;
    logic       z;
    logic       y;
    logic       x;
    logic       w;
    logic       v;
    logic       u;
    logic       t;
    logic       s;
    logic       r;
    logic       q;
    logic       p;
    logic       o;
    logic       n;
    logic       m;
    logic       l;
    logic       k;
    logic       j;
    logic       i;
    logic       h;
    logic       g;
    logic       f;
    logic       e;
    logic       d;
    logic       c;
    logic       b;
    logic       a;
  } cl2_csr_misa_reg_t;

  typedef struct packed {logic [31:0] mtvec;} cl2_csr_mtvec_reg_t;
  typedef struct packed {logic [31:0] mscratch;} cl2_csr_mscratch_reg_t;
  typedef struct packed {logic [31:0] mepc;} cl2_csr_mepc_reg_t;
  typedef struct packed {logic [31:0] mcause;} cl2_csr_mcause_reg_t;
  typedef struct packed {logic [31:0] mtval;} cl2_csr_mtval_reg_t;


endpackage
