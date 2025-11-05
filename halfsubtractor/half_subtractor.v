
module half_subtractor(
    input a, b,
    output diff, bout
);
    assign diff = a ^ b;          // XOR gate for difference
    assign bout = (~a) & b;    // AND gate with inverted A for borrow
endmodule
