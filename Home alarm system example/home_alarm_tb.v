`timescale 1ns / 1ps

module tb_home_alarm();
    // Inputs
    reg [3:0] s;
    reg m;
    
    // Output
    wire a;
    
    // Instantiate the Unit Under Test (UUT)
    home_alarm uut (
        .s(s),
        .m(m),
        .a(a)
    );
    
    initial begin
        // Initialize Inputs
        s = 4'b0000;
        m = 0;
        
        // Monitor changes
        $monitor("Time = %0t, s = %b, m = %b, a = %b", $time, s, m, a);
        
        // Test cases
        #10 s = 4'b0000; m = 0;  // All sensors off, master off
        #10 s = 4'b0000; m = 1;  // All sensors off, master on
        #10 s = 4'b0001; m = 0;  // Sensor 0 on, master off
        #10 s = 4'b0001; m = 1;  // Sensor 0 on, master on
        #10 s = 4'b0010; m = 1;  // Sensor 1 on, master on
        #10 s = 4'b0100; m = 1;  // Sensor 2 on, master on
        #10 s = 4'b1000; m = 1;  // Sensor 3 on, master on
        #10 s = 4'b1100; m = 0;  // Multiple sensors on, master off
        #10 s = 4'b1100; m = 1;  // Multiple sensors on, master on
        #10 s = 4'b1111; m = 1;  // All sensors on, master on
        
        #10 $finish;
    end
    
endmodule
