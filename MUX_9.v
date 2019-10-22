module mux_9(mux_out,mdata,val2,vsel);

	input [15:0] madata,sximm8,C;
	input [7:0] PC;
	input [3:0]vsel;
	output [15:0] mux_out;

	case(vsel)
		0001: mux_out=mdata;
		0010: mux_out = sximm8; 
		0100: mux_out= {8'b0,PC};
		1000: mux_out= C;
		default:16'bxxxxxxxxxxxxxxxx;
endmodule
