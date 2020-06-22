`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2019 06:20:26 PM
// Design Name: 
// Module Name: test_bench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module test_bench;
  
    // clock
    wire clk;
    // pc
    wire [31:0] next_pc;
    wire [31:0] current_pc;
    
    // 32 bit Instruction
    wire [31:0] do_in;
    wire [31:0] do_out;
    
    // Control unit inputs and outputs
    wire regWrite;
    wire memToreg;
    wire memWrite;
    wire [3:0] aluOp;
    wire aluSrc;
    wire [4:0] mrnCU_in; 
    wire mm2regCU_in;
    wire mwregCU_in;
    wire [4:0] ernCU_in;
    wire em2regCU_in;
    wire ewregCU_in;
    
    wire eregWrite;
    wire ememToreg;
    wire ememWrite;
    wire [3:0] ealuc;
    wire ealuimm;
    wire [1:0] fwdb;
    wire [1:0] fwda;
    wire regrt;
    
    // 1st multiplexer
    wire [4:0] mux;
    wire [4:0] mux_out;
    
    // sign extend
    wire [31:0] sign_extend;
    wire [31:0] sign_extend_out;
    
    //regfile inputs
    wire [4:0] rna;
    wire [4:0] rnb;
    wire [4:0] wn_regfile;
    wire [31:0] do_regfile;
    wire we;
    
    // regfile and ID/EXE outputs
    wire [31:0] qa;
    wire [31:0] qb;
    // 4 Way mux outputs
    wire [31:0] forwarded_qb_rt;
    wire [31:0] forwarded_qa_rs;
    
    // ID/EXE outputs
    wire [31:0] qa_out;
    wire [31:0] qb_out;
    
    
    
    // 2nd multiplexer
    wire [31:0] mux2_out;
   
    // ALU
    wire [31:0] ALU_out;
    
    // EXE/MEM outputs
    wire mwreg;
    wire mm2reg;
    wire mwmem;
    wire [4:0] mux1_exemem_out;
    wire [31:0] r_exemem_out;
    wire [31:0] qb_exemem_out;
    
    //data memory
    wire [31:0] datamem_out;
    
    // MEM/WB
    wire wwreg;
    wire wm2reg;
    wire[4:0] mux1_memwb_out;
    wire[31:0] r_memwb_out;
    wire[31:0] do_memwb_out;
    
    // WB multiplexer
    wire [31:0] wbmux_to_regfile;
    
    
    
    
    test_clk test_clk(clk);
    // Tick the clock
    
    adder adder(current_pc, next_pc);
    // adder gives PC register new pc
    
    PC_register PC_register(clk, next_pc, current_pc);
    // PC register outputs old pc while taking in new pc
    
    Instruction_memory Instruction_memory(current_pc, do_in);
    // IM takes in current inst address, outputs instruction at that address     
    
    IF_ID IF_ID(clk, do_in, do_out);
    // Takes in the 32 bit instruction, outputs 32 bit instruction
    
    assign mrnCU_in = mux1_exemem_out;
    assign mm2regCU_in = mm2reg;
    assign mwregCU_in = mwreg;
    assign ernCU_in = mux_out;
    assign em2regCU_in = ememToreg;
    assign ewregCU_in = eregWrite;
    
    controlunit controlunit(do_out, mrnCU_in, mm2regCU_in, mwregCU_in, ernCU_in, em2regCU_in, ewregCU_in, regWrite, memToreg, memWrite, aluOp, aluSrc, fwdb, fwda, regrt);
    // Takes in instruction, outputs hard-coded values
    
    mux muxmodule(do_out, regrt, mux);
    // Get rd and rt from do_out. If 0, output rd, if 1, output rt
    
    assign rna = do_out[25:21]; //rs
    assign rnb = do_out[20:16]; //rt
    assign wn_regfile = mux1_memwb_out;
    assign do_regfile = wbmux_to_regfile;
    assign we = wwreg;
    Reg_file Reg_file(clk, we, rna, rnb, wn_regfile, do_regfile, qa, qb);
    // Get rs and rt from instruction, put into qa and qb
    
    
    MuxFourWay mux4qb_rt(fwdb, qb, ALU_out, r_exemem_out, datamem_out, forwarded_qb_rt);
        
    MuxFourWay mux4qa_rs(fwda, qa, ALU_out, r_exemem_out, datamem_out, forwarded_qa_rs);
    
    
    sign_ext sign_ext_module(do_out, sign_extend);
    // Sign extend the instruction
    
    ID_EXE ID_EXE(clk, regWrite, memToreg, memWrite, aluOp, aluSrc, mux,
    forwarded_qa_rs, forwarded_qb_rt, sign_extend, eregWrite, ememToreg, ememWrite, ealuc, ealuimm, 
    mux_out, qa_out, qb_out, sign_extend_out);
    // Many inputs and outputs for ID/EXE
    
    mux2 mux2(ealuimm, qb_out, sign_extend_out, mux2_out);
    
    ALU ALU(qa_out, ealuc, mux2_out, ALU_out); 
    
    EXE_MEM EXE_MEM(clk, eregWrite, ememToreg, ememWrite, mux_out, ALU_out, qb_out,
    mwreg, mm2reg, mwmem, mux1_exemem_out, r_exemem_out, qb_exemem_out);
    
    Data_memory Data_memory(mwmem, r_exemem_out, qb_exemem_out, datamem_out);
    
    MEM_WB MEM_WB(clk, mwreg, mm2reg, mux1_exemem_out, r_exemem_out, datamem_out,
    wwreg, wm2reg, mux1_memwb_out, r_memwb_out, do_memwb_out);
    
    mux2 wbmux(wm2reg, r_memwb_out, do_memwb_out, wbmux_to_regfile);
        
endmodule

