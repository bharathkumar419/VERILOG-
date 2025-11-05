module mux_2x1(
    input a, b, sel,
    output y
);
    reg y_reg;
    always @(*) begin
        case(sel)
            1'b0: y_reg = a;
            1'b1: y_reg = b;
            default: y_reg = a;
        endcase
    end
    assign y = y_reg;
endmodule

