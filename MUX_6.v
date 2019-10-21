module mux_6(Ain,val1,val2,asel);

input [15:0] val1,val2;
	input asel;
	output [15:0] Ain;

	assign Ain = (asel == 1'b0) ? val1 : ((asel == 1'b1) ? val2 : 16'bzzzz_zzzz_zzzz_zzzz);
					

endmodule