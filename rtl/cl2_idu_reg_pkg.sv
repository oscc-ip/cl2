package cl2_idu_reg_pkg;
  typedef struct packed {
    logic is_rv32;
    logic is_jump;
    logic is_prdt_taken;
    logic is_dec_bxx;
    logic is_dec_beq;
    logic is_dec_bne;
    logic is_dec_blt;
    logic is_dec_bgt;
    logic is_dec_bltu;
    logic is_dec_bgtu;
    logic is_dec_mret;
    logic is_dec_fence;
    logic is_dec_fencei;
  } cl2_idu_bpu_info_t;

  typedef struct packed {
    logic is_rv32;
    logic is_dec_add;
    logic is_dec_slt;
    logic is_dec_sltu;
    logic is_dec_xor;
    logic is_dec_sll;
    logic is_dec_srl;
    logic is_dec_sra;
    logic is_dec_or;
    logic is_dec_and;
    logic is_dec_lui;
    logic is_dec_op2imm;
    logic is_dec_op1pc;
    logic is_dec_nop;
    logic is_dec_ecall;
    logic is_dec_ebreak;
    logic is_dec_wfi;
  } cl2_idu_alu_info_t;

  typedef struct packed {
    logic        is_rv32;
    logic        is_dec_csrrw;
    logic        is_dec_csrrs;
    logic        is_dec_csrrc;
    logic        is_dec_rs1imm;
    logic        is_dec_zimm;
    logic        is_dec_rs1_zero;
    logic [11:0] csridx;
  } cl2_idu_csr_info_t;

  typedef struct packed {
    logic is_rv32;
    logic is_dec_mul;
    logic is_dec_mulh;
    logic is_dec_mulhsu;
    logic is_dec_mulhu;
    logic is_dec_div;
    logic is_dec_divu;
    logic is_dec_rem;
    logic is_dec_remu;
  } cl2_idu_mdu_info_t;

  typedef struct packed {
    logic       is_rv32;
    logic       is_dec_load;
    logic       is_dec_store;
    logic [1:0] size;
    logic       unsign;
    logic       is_dec_op2imm;
  } cl2_idu_agu_info_t;
endpackage
