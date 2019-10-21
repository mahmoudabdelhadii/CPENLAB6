module shifter(in,shift,sout);
input [15:0] in;
input [1:0] shift;
output reg[15:0] sout;


always @(*) begin
case(shift)
     
        2'b00:
        sout=in;
        2'b01: 
        sout = in<<1;
        2'b10:
        sout = in>>1;
        2'b11: 
        begin 
        sout[15]= in[15];
        sout[14:0] = in[15:1]>>1; //if it doesnt work then change 0 to 1
        end
    
endcase
end
endmodule