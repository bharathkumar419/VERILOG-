module full_adder_using_half_adder_tb;
    // Inputs
    reg a, b, cin;
    
    // Outputs
    wire sum, cout;
    
    // Instantiate the full adder module
    full_adder_using_half_adder DUT (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );
    
    integer i;
    
    initial 
    begin
        {a, b, cin} = 0;
    end
    
    initial
    begin
        for (i = 0; i < 8; i = i + 1)
        begin 
            {a, b, cin} = i;
            #10;
        end
        #30 $finish();
    end
    
    initial
    begin
        $monitor("Time=%0t, a=%b, b=%b, cin=%b | SUM=%b, COUT=%b", 
                $time, a, b, cin, sum, cout);
    end
endmodule 
