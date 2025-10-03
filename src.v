`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Alfici & Acuça
// 
// Create Date: 03.10.2025 10:54:54
// Design Name: 
// Module Name: src
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
module src
    #(
        parameter NB_data1 = 3,
        parameter NB_data2 = 3,
        parameter NB_Max1 = 4,
        parameter NB_o_mux = 4,
        parameter NB_o_sum2 = 6,
        parameter NB_Max2 = 7
        
    )
    (
        input clk,
        input i_rst_n,
        input [1:0] i_sel,
        input [2:0] i_data1,
        input [2:0] i_data2,
        output [5:0] o_data,
        output o_overflow
    );
    
    wire [3:0]sum1_to_mux;
    wire ovfsum1;
    wire [3:0]c_data1_mux;
    wire [3:0]c_data2_mux;
    wire [3:0]connectm2s;
    wire [5:0]connects2r;
    wire ovfsum2;
    wire [5:0]connect_fbk;
    sum1
    #(
        .NB_data1(NB_data1),
        .NB_data2(NB_data2),
        .NB_Max(NB_Max1)
    )
        u_sum1(
            .data1(i_data1),
            .data2(i_data2),
            .o_sum(sum1_to_mux),
            .o_ovf(ovfsum1)
        );
    sum1
    #(
        .NB_data1(NB_o_mux),
        .NB_data2(NB_o_sum2),
        .NB_Max(NB_Max2)
    )
        u_sum2(
            .data1(connectm2s),
            .data2(connect_fbk),
            .o_sum(connects2r),
            .o_ovf(ovfsum2)
        );
     mux
        u_mux(
            .i_sel(i_sel),
            .c_data1(i_data1),
            .c_data2(i_data2),
            .c_data3(sum1_to_mux),
            .ovf(ovfsum1),
            .o_mux(connectm2s)
        );
     output_reg
        u_output_reg(
            .i_reg(connects2r),
            .ovf(ovfsum2),
            .clk(clk),
            .i_rst_n(i_rst_n),
            .o_data(o_data),
            .o_ovf(o_overflow),
            .o_fbk(connect_fbk)
        );
endmodule
