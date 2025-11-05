module half_subtractor_tb;
    // Inputs
    reg a, b;
    
    // Outputs
    wire diff, bout;
    
    // Instantiate the half subtractor module
    half_subtractor DUT (
        .a(a),
        .b(b),
        .diff(diff),
        .bout(bout)
    );
    
    integer i;
    
    initial 
    begin
        {a, b} = 0;
    end
    
    initial
    begin
        for (i = 0; i < 4; i = i + 1)
        begin 
            {a, b} = i;
            #10;
        end
        #30 $finish();
    end
    
    initial
    begin
        $monitor("Time=%0t, a=%b, b=%b | DIFF=%b, BOUT=%b", 
                $time, a, b, diff, bout);
    end
endmodule

