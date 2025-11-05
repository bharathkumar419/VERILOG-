// Testbench
module mux_2x1_tb;
    // Inputs
    reg a, b, sel;
    
    // Outputs
    wire y;
    
    // Instantiate the mux module
    mux_2x1 DUT (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
    );
    
    integer i;
    
    initial 
    begin
        {a, b, sel} = 0;
    end
    
    initial
    begin
        for (i = 0; i < 8; i = i + 1)
        begin 
            {a, b, sel} = i;
            #10;
        end
        #30 $finish();
    end
    
    initial
    begin
        $monitor("Time=%0t, a=%b, b=%b, sel=%b | Y=%b", 
                $time, a, b, sel, y);
    end
endmodule
