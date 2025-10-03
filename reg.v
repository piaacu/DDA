`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.10.2025 13:21:46
// Design Name: 
// Module Name: reg
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
module output_reg(
    input [5:0] i_reg,
    input ovf,
    output [5:0] o_data,
    input clk,
    input i_rst_n,
    output o_ovf,
    output [5:0] o_fbk
    );
    //Variables y registros
    reg [5:0] salida;
    always@(posedge clk) begin
        if(~i_rst_n)begin
        salida <= 0;
        end
        else begin
        salida <= i_reg;
        end
    end
    assign o_ovf = ovf;
    assign o_data = salida;
    assign o_fbk = salida;
endmodule
