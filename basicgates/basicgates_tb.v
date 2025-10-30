// Testbench with Tasks
module tb_basic_gates;
    
    // Testbench signals
    reg a, b;
    wire and_out, or_out, xor_out, nand_out, nor_out, xnor_out, not_a, not_b;
    
    // Instantiate the design
    basic_gates uut (
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
    
    // Initialize simulation
    initial begin
        $display("=== Basic Gates Simulation Started ===");
        $display("Time\t a  b | AND OR XOR NAND NOR XNOR ~a ~b");
        $display("------------------------------------------------");
        
        // Test all input combinations using tasks
        test_input(1'b0, 1'b0);
        test_input(1'b0, 1'b1);
        test_input(1'b1, 1'b0);
        test_input(1'b1, 1'b1);
        
        // Additional test patterns
        $display("\n=== Additional Pattern Testing ===");
        test_pattern_sequence();
        
        $display("\n=== Simulation Completed ===");
        $finish;
    end
    
    // Task to test specific input combination
    task test_input;
        input reg in_a;
        input reg in_b;
        begin
            a = in_a;
            b = in_b;
            #10; // Wait for propagation
            $display("%0t\t %b  %b |  %b   %b   %b    %b    %b    %b    %b   %b", 
                    $time, a, b, and_out, or_out, xor_out, nand_out, 
                    nor_out, xnor_out, not_a, not_b);
        end
    endtask
    
    // Task to test a sequence of patterns
    task test_pattern_sequence;
        begin
            $display("Testing pattern sequence...");
            
            // Test alternating patterns
            repeat(3) begin
                test_input(1'b0, 1'b1);
                test_input(1'b1, 1'b0);
            end
            
            // Test same inputs
            repeat(2) begin
                test_input(1'b0, 1'b0);
                test_input(1'b1, 1'b1);
            end
        end
    endtask
    
    // Monitor to track changes automatically
    initial begin
        $monitor("Monitor: Time=%0t, a=%b, b=%b, AND=%b", $time, a, b, and_out);
    end
    
endmodule
