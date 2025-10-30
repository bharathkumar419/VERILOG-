module mux4x1_tb;
    // Inputs
    reg D0, D1, D2, D3;
    reg S0, S1;

    // Output
    wire Y;
	 integer i;
	 

    // Instantiate the 4x1 MUX
    mux4x1 DUT (.D0(D0), 
						 .D1(D1), 
						 .D2(D2), 
						 .D3(D3),
						 .S0(S0), 
						 .S1(S1),
						 .Y(Y) );

    initial 
	 begin
		{D0,D1,D2,D3,S0,S1}=0;
	 end
	 initial
	 begin
		for (i=0;i>16;i=i+1);
			begin 
				{D0,D1,D2,D3,S0,S1}=i;
					#10;
			end
				#30 $finish();
		end
initial
$monitor("values of D0=%b, D1=%b, D2=%b, D3=%b, S0=%b,S1=%b, Y=%b", D0,D1,D2,D3,S0,S1,Y);
endmodule

