module ALU_tb();
reg[15:0] Ain, Bin;
reg[1:0] ALUop;
wire[15:0] out;
wire Z;
reg err;


ALU DUT(.Ain(Ain), .Bin(Bin), .out(out), .ALUop(ALUop), .Z(Z));


initial begin

err = 1'b0;
//Part 1: Testing (Z) value
//Test 1 ALUop = 2'b00 and Ain = 16'b0; Bin = 16'b0
ALUop = 2'b00;
Ain = 16'b0;
Bin = 16'b0; 
#10;

$display ("ALUop = %d, Ain = %d, Bin = %d, Z = %d, out = %d", ALUop, Ain, Bin, ALU_tb.DUT.Z, out);
if(Z !==1)
err = 1'b1;
else
err = 1'b0;
//Test 2 ALUop = 2'b01 and Ain = 16'b0; Bin = 16'b0

ALUop = 2'b01;
Ain = 16'b0;
Bin = 16'b0; 
#10;

$display ("ALUop = %d, Ain = %d, Bin = %d, Z = %d, out = %d", ALUop, Ain, Bin, ALU_tb.DUT.Z, out);
if(Z !==1)
err = 1'b1;
else
err = 1'b0;

//Test 3 ALUop = 2'b10 and Ain = 16'b0; Bin = 16'b0000_0000_0000_0001;

ALUop = 2'b10;
Ain = 16'b0000_0000_0000_0000;
Bin = 16'b0000_0000_0000_0001;
#10;

$display ("ALUop = %d, Ain = %d, Bin = %d, Z = %d, out = %d", ALUop, Ain, Bin, ALU_tb.DUT.Z, out);
if(Z !==1)
err = 1'b1;
else
err = 1'b0;

//Test 4 ALUop = 2'b11 and Ain = 16'b0; Bin = 16'b1111_1111_1111_1111;

ALUop = 2'b11;
Ain = 16'b0;
Bin = 16'b1111_1111_1111_1111;
#10;

$display ("ALUop = %d, Ain = %d, Bin = %b, Z = %d, out = %b", ALUop, Ain, Bin, ALU_tb.DUT.Z, out);
if(Z !==1)
err = 1'b1;
else
err = 1'b0;

//Part 2: Testing (out) value
//Test 1 ALUop = 2'b00 and Ain = 16'b0000_0000_0000_0010 (2);  Bin = 16'b0000_0000_0000_0001 (1); 

ALUop = 2'b00;
Ain = 16'b0000_0000_0000_0010;
Bin = 16'b0000_0000_0000_0001;
#10;

$display ("ALUop = %d, Ain = %d, Bin = %d, Z = %d, expected out = 3, actual out = %d", ALUop, Ain, Bin, ALU_tb.DUT.Z, out);
if(out !==3)
err = 1'b1;
else
err = 1'b0;



//Test 2 ALUop = 2'b01 and Ain = 16'b0000_0000_0000_0011 (3);  Bin = 16'b0000_0000_0000_0001 (1); 

ALUop = 2'b01;
Ain = 16'b0000_0000_0000_0011;
Bin = 16'b0000_0000_0000_0001;
#10;

$display ("ALUop = %d, Ain = %d, Bin = %d, Z = %d, expected out = 2, actual out = %d", ALUop, Ain, Bin, ALU_tb.DUT.Z, out);
if(out !==2)
err = 1'b1;
else
err = 1'b0;

//Test 3 ALUop = 2'b10 and Ain = 16'b0000_0000_0000_0010 (2);  Bin = 16'b0000_0000_0000_0010 (2); 

ALUop = 2'b10;
Ain = 16'b0000_0000_0000_0010;
Bin = 16'b0000_0000_0000_0010;
#10;

$display ("ALUop = %d, Ain = %b, Bin = %b, Z = %d, expected out = 0000_0000_0000_0010, actual out = %b", ALUop, Ain, Bin, ALU_tb.DUT.Z, out);
if(out !==16'b0000_0000_0000_0010)
err = 1'b1;
else
err = 1'b0;

//Test 4 ALUop = 2'b11 and Ain = 16'b0000_0000_0000_0010 (2);  Bin = 16'b0101_0101_0101_0101 (1); 

ALUop = 2'b11;
Ain = 16'b0000_0000_0000_0010;
Bin = 16'b0101_0101_0101_0101;
#10;

$display ("ALUop = %d, Ain = %b, Bin = %b, Z = %d, expected out = 1010_1010_1010_1010, actual out = %b", ALUop, Ain, Bin, ALU_tb.DUT.Z, out);
if(out !== 16'b1010_1010_1010_1010)
err = 1'b1;
else
err = 1'b0;

end

endmodule