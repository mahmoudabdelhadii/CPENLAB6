module ALU(Ain,Bin,out,ALUop,Z);

input [15:0] Ain,Bin;
input[1:0] ALUop;
output reg[15:0] out;
output reg Z;


	always @(*)
		begin
		Z = 0;
		case(ALUop)
               
					2'b00:
					begin

					out = Ain + Bin;
					if(out== 16'b0)
					Z=1; 
					else 
					Z=0;
					
				
					end
					2'b01:
					begin
					
					out = Ain - Bin;
					if(out== 16'b0)
					Z=1; 
					else 
					Z=0;
					end

					2'b10:
					begin
					out = Ain & Bin;
					if(out== 16'b0)
					Z=1; 
					else 
					Z=0;	
					end

					2'b11:
					begin
					out = ~Bin;
					if(out== 16'b0)
					Z=1; 
					else 
					Z=0;
					end
		endcase
	end
endmodule