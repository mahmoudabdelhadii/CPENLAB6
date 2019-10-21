module clock(clk);
	output reg clk;

	initial begin
    clk = 0; #5;
    forever begin
      clk = 1; #5;
      clk = 0; #5;
    end
  end
endmodule

