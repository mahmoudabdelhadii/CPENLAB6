module eighttoonemux(data_out, decoded_read_num, R0,R1,R2,R3,R4,R5,R6,R7);

input [7:0]  decoded_read_num; //The eight bit selection line 

input [15:0] R0; //the eight registers
input [15:0] R1;
input [15:0] R2;
input [15:0] R3;
input [15:0] R4;
input [15:0] R5;
input [15:0] R6;
input [15:0] R7;

output reg [15:0] data_out; //16-bit output



always @ (*) 

begin 

 case (decoded_read_num) 

  8'b00000001 : data_out = R0; 

  8'b00000010 : data_out = R1; 

  8'b00000100 : data_out = R2; 

  8'b00001000 : data_out = R3; 

  8'b00010000 : data_out = R4; 

  8'b00100000 : data_out = R5; 

  8'b01000000 : data_out = R6; 

  8'b10000000 : data_out = R7; 

  

  default : data_out = 8'bxxxxxxxx; 

  

 endcase 

end  

endmodule