module mux_7(Bin,val1,val2,bsel);

input [15:0] val1,val2;
	input bsel;
	output [15:0] Bin;

	assign Bin = (bsel == 1'b0) ? val1 : ((bsel == 1'b1) ? val2 : 16'bzzzz_zzzz_zzzz_zzzz);
					

endmodule