module halfadder (
    input a,
    input b,
    output sum,
    output carry
);

    // Half adder logic
    assign sum = a ^ b;   // XOR operation for sum
    assign carry = a & b; // AND operation for carry

endmodule 
