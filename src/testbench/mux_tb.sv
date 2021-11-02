`timescale 1ns/1ns

module mux_tb ();
    
    logic [15:0] a,b,c,d,e,f,g,h,o1,o2; //16bit io
    logic [1:0] sel1;
    logic [2:0] sel2;

    logic dm4_in;
    logic [1:0] dm4_sel;
    logic [3:0] dm4_out;

    logic dm8_in;
    logic [2:0] dm8_sel;
    logic [7:0] dm8_out;

    logic clk;

    Mux4Way16 DUT_Mux4Way16
    (   // wildcard (.*) connection not supported in XSIM for VHDL
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .o(o1),
        .sel(sel1)
    );
    Mux8Way16 DUT_Mux8Way16
    (   // wildcard (.*) connection not supported in XSIM for VHDL
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .e(e),
        .f(f),
        .g(g),
        .h(h),
        .o(o2),
        .sel(sel2)
    );
    DMux4Way DUT_DMux4Way
    (
        .i(dm4_in),
        .sel(dm4_sel),
        .o(dm4_out)
    );
    DMux8Way DUT_DMux8Way
    (
        .i(dm8_in),
        .sel(dm8_sel),
        .o(dm8_out)
    );

    initial begin
        
        #1
        a = 1;
        b = 2;
        c = 3;
        d = 4;
        e = 5;
        f = 6;
        g = 7;
        h = 8;
        #1
        
        //Mux4Way16
        sel1 <= 2'b00; #10
    	assert (o1 == 1) else
    	    $fatal(1, "Mux4Way16 failed");
        sel1 <= 2'b01; #10
    	assert (o1 == 2) else
    	    $fatal(1, "Mux4Way16 failed");
        sel1 <= 2'b10; #10
    	assert (o1 == 3) else
    	    $fatal(1, "Mux4Way16 failed");
        sel1 <= 2'b11; #10
    	assert (o1 == 4) else
    	    $fatal(1, "Mux4Way16 failed");
        $display("Mux4Way16 PASSED");

        //Mux8Way16
        sel2 <= 3'b000; #10
    	assert (o2 == 1) else
    	    $fatal(1, "Mux8Way16 failed");
        sel2 <= 3'b001; #10
    	assert (o2 == 2) else
    	    $fatal(1, "Mux8Way16 failed");
        sel2 <= 3'b010; #10
    	assert (o2 == 3) else
    	    $fatal(1, "Mux8Way16 failed");
        sel2 <= 3'b011; #10
    	assert (o2 == 4) else
    	    $fatal(1, "Mux8Way16 failed");
        sel2 <= 3'b100; #10
    	assert (o2 == 5) else
    	    $fatal(1, "Mux8Way16 failed");
        sel2 <= 3'b101; #10
    	assert (o2 == 6) else
    	    $fatal(1, "Mux8Way16 failed");
        sel2 <= 3'b110; #10
    	assert (o2 == 7) else
    	    $fatal(1, "Mux8Way16 failed");
        sel2 <= 3'b111; #10
    	assert (o2 == 8) else
    	    $fatal(1, "Mux8Way16 failed");

    	$display("Mux8Way16 PASSED");

        //DMux4Way
        dm4_sel <= 2'b00; #10
    	assert (dm4_out == 4'b1000) else
    	    $fatal(1, "DMux4Way failed");
        dm4_sel <= 2'b01; #10
    	assert (dm4_out == 4'b0100) else
    	    $fatal(1, "DMux4Way failed");
        dm4_sel <= 2'b10; #10
    	assert (dm4_out == 4'b0010) else
    	    $fatal(1, "DMux4Way failed");
        dm4_sel <= 2'b11; #10
    	assert (dm4_out == 4'b0001) else
    	    $fatal(1, "DMux4Way failed");
        $display("DMux4Way PASSED");

        //DMux8Way
        dm8_sel <= 3'b000; #10
    	assert (dm8_out == 8'b10000000) else
    	    $fatal(1, "DMux8Way failed");
        dm8_sel <= 3'b001; #10
    	assert (dm8_out == 8'b01000000) else
    	    $fatal(1, "DMux8Way failed");
        dm8_sel <= 3'b010; #10
    	assert (dm8_out == 8'b00100000) else
    	    $fatal(1, "DMux8Way failed");
        dm8_sel <= 3'b011; #10
    	assert (dm8_out == 8'b00010000) else
    	    $fatal(1, "DMux8Way failed");
        dm8_sel <= 3'b100; #10
    	assert (dm8_out == 8'b00001000) else
    	    $fatal(1, "DMux8Way failed");
        dm8_sel <= 3'b101; #10
    	assert (dm8_out == 8'b00000100) else
    	    $fatal(1, "DMux8Way failed");
        dm8_sel <= 3'b110; #10
    	assert (dm8_out == 8'b00000010) else
    	    $fatal(1, "DMux8Way failed");
        dm8_sel <= 3'b111; #10
    	assert (dm8_out == 8'b00000001) else
    	    $fatal(1, "DMux8Way failed");
        $display("DMux8Way PASSED");


        $finish;
    end
    
    always begin
        clk <= 1; #5;
        clk <= 0; #5;
    end
endmodule : mux_tb
