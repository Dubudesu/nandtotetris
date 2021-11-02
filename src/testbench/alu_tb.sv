`timescale 1ns/1ns

module mux_tb ();
    
    logic [15:0] x,y,o;

    logic zx, nx, zy, ny, f, no;
    logic clk, rst;

    ALU DUT_ALU
    (   // wildcard (.*) connection not supported in XSIM for VHDL
        .clk(clk),
        .rst(rst),

        .x(x),
        .y(y),

        .zx(zx),
        .nx(nx),
        .zy(zy),
        .ny(ny),
        .f(f),
        .no(no),
        .o(o)
    );


    initial begin
        
        #1
        rst = 0;

        x = 27;
        y = 0;

        zx = 0;
        nx = 0;
        zy = 1;
        ny = 1;
        f  = 1;
        no = 0;

        #10
        #100

    	assert (o == 26) else
    	    $fatal(1, "You fucking SUCK! Lololo");

        $finish;
    end
    
    always begin
        clk <= 1; #5;
        clk <= 0; #5;
    end
endmodule : mux_tb
