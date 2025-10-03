`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: ALFICI & ACUÇA
// 
// Create Date: 03.10.2025 11:03:07
// Design Name: 
// Module Name: sum1
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


module sum1
    #(    
    parameter NB_data1 = 3,
    parameter NB_data2 = 3
    )
    (
    input [NB_data1-1:0] data1,
    input [NB_data2-1:0] data2,
    output [NB_Sum-1:0] o_sum,
    output o_ovf
    );
    //Parametros locales
    localparam NB_Sum = (NB_data1 > NB_data2)? NB_data1 : NB_data2;
    // Lógica
    wire [NB_Sum-1 : 0] data1_ext;
    wire [NB_Sum-1 : 0] data2_ext;
    
    assign data1_ext = {{(NB_Sum-NB_data1){1'b0}}, data1};
    assign data2_ext = {{(NB_Sum-NB_data2){1'b0}}, data2};
    
    assign o_sum = data1_ext+data2_ext;
    assign o_ovf = (o_sum < data1_ext) || (o_sum < data2_ext);
    
endmodule
