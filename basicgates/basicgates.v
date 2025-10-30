// Basic Gates Module
module basic_gates(
    input a,
    input b,
    output and_out,
    output or_out,
    output xor_out,
    output nand_out,
    output nor_out,
    output xnor_out,
    output not_a,
    output not_b
);
    
    // AND gate
    assign and_out = a & b;
    
    // OR gate
    assign or_out = a | b;
    
    // XOR gate
    assign xor_out = a ^ b;
    
    // NAND gate
    assign nand_out = ~(a & b);
    
    // NOR gate
    assign nor_out = ~(a | b);
    
    // XNOR gate
    assign xnor_out = ~(a ^ b);
    
    // NOT gates
    assign not_a = ~a;
    assign not_b = ~b;
    
endmodule
