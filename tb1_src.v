`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.10.2025 17:16:31
// Design Name: 
// Module Name: tb1_src
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
module tb_src;

    // Parámetros
    parameter NB_data1   = 3;
    parameter NB_data2   = 3;
    parameter NB_o_mux   = 4;
    parameter NB_o_sum2  = 6;

    // Entradas
    reg clk;
    reg i_rst_n;
    reg [1:0] i_sel;
    reg [NB_data1-1:0] i_data1;
    reg [NB_data2-1:0] i_data2;

    // Salidas
    wire [NB_o_sum2-1:0] o_data;
    wire o_overflow;

    // Instancia del módulo
    src #(
        .NB_data1(NB_data1),
        .NB_data2(NB_data2),
        .NB_o_mux(NB_o_mux),
        .NB_o_sum2(NB_o_sum2)
    ) dut (
        .clk(clk),
        .i_rst_n(i_rst_n),
        .i_sel(i_sel),
        .i_data1(i_data1),
        .i_data2(i_data2),
        .o_data(o_data),
        .o_overflow(o_overflow)
    );
        // Generador de reloj
    initial clk = 0;
    always #5 clk = ~clk;

    // Estímulos
    initial begin
        $display("Inicio de simulación");
        i_rst_n = 0;
        i_sel   = 2'b00;
        i_data1 = 3'b000;
        i_data2 = 3'b000;

        #12 i_rst_n = 1;

        // Caso 1: suma sin overflow
        #10 i_data1 = 3'b011;
            i_data2 = 3'b010;
            i_sel   = 2'b10;

        // Caso 2: suma con overflow
        #10 i_data1 = 3'b111;
            i_data2 = 3'b111;
            i_sel   = 2'b01;

        // Caso 3: cambio de selección
        #10 i_sel = 2'b00;

        // Reset en medio de la simulación
        #10 i_rst_n = 0;
        #10 i_rst_n = 1;

        // Fin
        #50 $finish;
    end
endmodule
