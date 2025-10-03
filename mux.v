`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Alfici & Acuça
// 
// Create Date: 03.10.2025 12:52:34
// Design Name: 
// Module Name: mux
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


module mux
    (
    input [1:0] i_sel,
    input [2:0] c_data1,
    input [2:0] c_data3,
    input ovf,
    input [2:0] c_data2,
    output [3:0] o_mux
    );
    //Variables y registros
    wire [3:0] c_data1_ext;
    wire [3:0] c_data2_ext;
    //Asignaciones de las entradas del mux
    assign c_data1_ext = {{1'b0},c_data1};
    assign c_data2_ext = {{1'b0},c_data2};
    //Lógica del programa
    assign o_mux = (i_sel == 2'b00)? c_data1_ext:
                   (i_sel == 2'b01)? {ovf,c_data3}:
                   (i_sel == 2'b10)? c_data2_ext: 4'b0000;
endmodule
