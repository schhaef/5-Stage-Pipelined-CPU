`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2019 06:11:02 PM
// Design Name: 
// Module Name: controlunit
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

// Output control based on OP field
module controlunit(
    input [31:0] do_in,
    input [4:0] mrnCU_in,
    input mm2regCU_in,
    input mwregCU_in,
    input [4:0] ernCU_in,
    input em2regCU_in,
    input ewregCU_in,
    output reg regWrite,
    output reg memToReg,
    output reg memWrite,
    output reg [3:0] aluOP,     // aluc
    output reg aluSrc,          // aluimm
    output reg [1:0] fwdb,
    output reg [1:0] fwda,
    output reg regrt
    );
    
    // wires for opcode and func
    wire [5:0] op = do_in[31:26];
    wire [5:0] func = do_in[5:0];
    wire [4:0] rs = do_in[25:21]; 
    wire [4:0] rt = do_in[20:16];
        
    always @(*) begin
    
        if (op == 6'b100011) // lw
        begin
            regWrite <= 1;
            memToReg <= 1;
            memWrite <= 0;
            aluOP <= 4'b0000;
            aluSrc <= 1;
            regrt <= 1;
        end
        
        else if (op == 6'b000000) //  r-type
        begin

            regWrite = 1;
            memToReg <= 0;
            memWrite <= 0;
            aluSrc <= 0;
            regrt <= 0;
            
            if (func == 6'b100000) // add
                aluOP = 4'b0010;

            else if (func == 6'b100010) // sub
                aluOP = 4'b0110;

            else if (func == 6'b100101) // or
                aluOP = 4'b0001;

            else if (func == 6'b100110) // xor
                aluOP = 4'b1101;

            else if (func == 6'b100100) // and
                aluOP = 4'b0000;
        end
        
        
        if (rs == ernCU_in) begin
            fwda = 1;
        end
        else if (rs == mrnCU_in && mwregCU_in == 1 && mm2regCU_in == 0) begin
            fwda = 2; 
        end
        else if (rs == mrnCU_in && mwregCU_in == 0 && mm2regCU_in == 1) begin
            fwda = 3; 
        end
        else begin 
            fwda = 0; 
        end
        
        if (rt == ernCU_in) begin
            fwdb = 1;
        end
        else if (rt == mrnCU_in && mwregCU_in == 1 && mm2regCU_in == 0) begin
            fwdb = 2; 
        end
        else if (rt == mrnCU_in && mwregCU_in == 0 && mm2regCU_in == 1) begin
            fwdb = 3; 
        end
        else begin 
            fwdb = 0; 
        end
end
    
    
endmodule
