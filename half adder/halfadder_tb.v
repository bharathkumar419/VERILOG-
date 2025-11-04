module halfadder_tb;
    // Inputs
    reg a, b;
    
    // Outputs
    wire sum, carry;
    
    // Instantiate the half adder module
    halfadder DUT (
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );
    
    integer i;
    
    initial 
    begin
        {a,b} = 0;
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
        $monitor("Time=%0t, a=%b, b=%b | SUM=%b, CARRY=%b", 
                $time, a, b, sum, carry);
    end
endmodule 
