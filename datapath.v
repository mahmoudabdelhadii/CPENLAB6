module datapath(datapath_out,Z_out, datapath_in,vsel,loada,loadb, asel,bsel,loads,loadc,write, clk,writenum, readnum,shift,ALUop);
input wire[15:0] datapath_in;
input wire[1:0] shift,ALUop;
input wire vsel,loada,loadb, asel,bsel,loads,loadc,write, clk;
output reg [15:0] datapath_out;
output reg Z_out;
input wire[2:0] writenum, readnum;
wire[15:0] outinA,outinB,stream1,stream2,sout;
wire Z;

mux_9 mux9(data_in,datapath_in,datapath_out,vsel);
regfile registerfiles(data_in, writenum,write,readnum,data_out);
assign stream1 = data_out;
assign stream2 = data_out;

vDFFE vDFFEA (clk,loada,stream1,outinA);
vDFFE vDFFEB (clk,loadb,stream2,outinB);

mux_6 mux6(Ain,outinA,16'b0,asel);
shifter U1 (outinB,shift,sout);


mux_7 mux7(Bin,outinB,{11'b0, datapath_in[4:0]});

 ALU U2(Ain,Bin,out,ALUop,Z);

vDFFE vDFFEC (clk,loadc,out,datapath_out);
vDFFE vDFFEstatus (clk,loads,Z,Z_out);

endmodule




