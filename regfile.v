module regfile(data_in,writenum,write,readnum,clk,data_out); 
input [15:0] data_in;
input [2:0] writenum, readnum;
input write, clk;
output wire [15:0] data_out;
    
 wire [7:0] hotcode;
 wire [15:0] R0,R1,R2,R3,R4,R5,R6,R7;
 

 wire [7:0] result_hotcodeANDEDwrite;
 wire[7:0] decoded_read_num;
   
 Decoder #(3,8) U1(writenum,hotcode);
 assign result_hotcodeANDEDwrite = (hotcode & {8{write}});


 vDFFE Reg0(clk,result_hotcodeANDEDwrite[0], data_in, R0);
 vDFFE Reg1(clk,result_hotcodeANDEDwrite[1], data_in, R1);
 vDFFE Reg2(clk,result_hotcodeANDEDwrite[2], data_in, R2);
 vDFFE Reg3(clk,result_hotcodeANDEDwrite[3], data_in, R3);
 vDFFE Reg4(clk,result_hotcodeANDEDwrite[4], data_in, R4);
 vDFFE Reg5(clk,result_hotcodeANDEDwrite[5], data_in, R5);
 vDFFE Reg6(clk,result_hotcodeANDEDwrite[6], data_in, R6);
 vDFFE Reg7(clk,result_hotcodeANDEDwrite[7], data_in, R7);

Decoder #(3,8) U2(readnum,decoded_read_num);
eighttoonemux M1(data_out, decoded_read_num, R0,R1,R2,R3,R4,R5,R6,R7);

endmodule
