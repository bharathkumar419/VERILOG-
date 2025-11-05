// Half Subtractor Module
module half_subtractor(
    input a, b,
    output diff, bout
);
    assign diff = a ^ b;
    assign bout = (~a) & b;
endmodule

// Full Subtractor using Half Subtractors
module full_subtractor_using_half_subtractor(
    input a, b, bin,
    output diff, bout
);
    wire diff1, bout1, bout2;
    
    // First half subtractor: a - b
    half_subtractor HS1 (
        .a(a),
        .b(b),
        .diff(diff1),
        .bout(bout1)
    );
    
    // Second half subtractor: diff1 - bin
    half_subtractor HS2 (
        .a(diff1),
        .b(bin),
        .diff(diff),
        .bout(bout2)
    );
    
    // Final borrow = bout1 OR bout2
    assign bout = bout1 | bout2;
endmodule

