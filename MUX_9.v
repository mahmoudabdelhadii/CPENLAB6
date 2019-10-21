module mux_9(mux_out,mdata,val2,vsel);

	input [15:0] madata,sximm8,C;
	input []vsel;
	output [15:0] mux_out;

	assign mux_out = (vsel == 1'b0) ? val1 : ((vsel == 1'b1) ? val2 : 16'bzzzz_zzzz_zzzz_zzzz);
					

endmodule
