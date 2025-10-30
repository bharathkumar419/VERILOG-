module basic_gates_tb;
    // Inputs
    reg a, b;
    
    // Outputs
    wire and_out, or_out, xor_out, nand_out, nor_out, xnor_out, not_a, not_b;
    
    // Instantiate the basic gates module
    basic_gates DUT (
        .a(a),
        .b(b),
        .and_out(and_out),
        .or_out(or_out),
        .xor_out(xor_out),
        .nand_out(nand_out),
        .nor_out(nor_out),
        .xnor_out(xnor_out),
        .not_a(not_a),
        .not_b(not_b)
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
        $monitor("Time=%0t, a=%b, b=%b | AND=%b, OR=%b, XOR=%b, NAND=%b, NOR=%b, XNOR=%b, NOT_a=%b, NOT_b=%b", 
                $time, a, b, and_out, or_out, xor_out, nand_out, nor_out, xnor_out, not_a, not_b);
    end
endmodule
