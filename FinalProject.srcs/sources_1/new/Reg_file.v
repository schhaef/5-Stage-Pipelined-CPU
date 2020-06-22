`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2019 06:12:16 PM
// Design Name: 
// Module Name: Reg_file
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


//Register file initialized to 0. Output rs and rt
module Reg_file(clk, we, rna, rnb, wn, data, qa, qb);
    input clk;
    input we;
    input [4:0] rna;
    input [4:0] rnb;
    input [4:0] wn;
    input [31:0] data;
    output reg [31:0] qa;
    output reg [31:0] qb;
    reg [31:0] regs [0:31];   // 32 bit array of 32 bit arrays 
    
    integer i;
    // Initialize all regs to 0 with for loop
    initial begin
    
        for (i = 0; i < 32; i = i + 1)
        begin
            regs[i] = 0;
        end
        regs[0] = 32'h00000000;
        regs[1] = 32'hA00000AA;
        regs[2] = 32'h10000011;
        regs[3] = 32'h20000022;
        regs[4] = 32'h30000033;
        regs[5] = 32'h40000044;
        regs[6] = 32'h50000055;
        regs[7] = 32'h60000066;
        regs[8] = 32'h70000077;
        regs[9] = 32'h80000088;
        regs[10] = 32'h90000099;

        
    end
    
    
    always @(*) begin
        qa = regs[rna];
        qb = regs[rnb];
    end
    always @(posedge clk) begin     // Change to posedge so that it writes back to register before reading
        if(we) begin regs[wn] = data; end
    end
endmodule

