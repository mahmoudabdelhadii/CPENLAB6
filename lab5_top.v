module lock(reset,clk,A,unlock); input reset, clk;
input [1:0] A;
output unlock;
reg unlock;
`define STATE_SIZE 3 `define SR 3'b000 `define S0 3'b001 `define S1 3'b010 `define S2 3'b011 `define SU 3'b101 `define SW 3'b110
wire [`STATE_SIZE-1:0] cur, nxt_rst; reg [`STATE_SIZE-1:0] nxt;
vDFF #(`STATE_SIZE) STATE(clk,nxt_rst,cur);
always @*

casex ({A,cur})
{2'b10,`SR}: {nxt,unlock} = {`S0,1'b0}; 
{2'b01,`S0}:{nxt,unlock} = {`S1,1'b0}; 
{2'b11,`S1}: {nxt,unlock} = {`S2,1'b0}; 
{2'b01,`S2}: {nxt,unlock} = {`SU,1'b0}; 
{2'bxx,`SU}:{nxt,unlock} = {`SU,1'b1}; 
{2'bxx,`SW}: {nxt,unlock} = {`SW,1'b0}; 
default:{nxt,unlock} = {`SW,1'b0};

 endcase
assign nxt_rst = reset ? `SR : nxt;

endmodule


module vDFF(clk,D,Q);
  parameter n=1;
  input clk;
  input [n-1:0] D;
  output [n-1:0] Q;
  reg [n-1:0] Q;

  always @(posedge clk)
    Q <= D;
endmodule
