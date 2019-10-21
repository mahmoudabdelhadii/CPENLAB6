module shifter_tb;
reg[15:0] in;
reg[1:0] shift;
wire[15:0] sout;

reg err;

shifter DUT(.in(in), .shift(shift), .sout(sout));

initial begin
    
    err = 1'b0;
    //Test 1: shift = 2'b00: expected: sout = in; in = 16'b0000_0000_0000_0001;
    in = 16'b0000_0000_0000_0001;
    shift = 2'b00;

    #10;

    $display("shift = %b, expected: sout = %b, actual: sout = %b", shift, in, sout );

    if (sout!==in)
    err = 1'b1;
    else
    err = 1'b0;

    
    //Test 2 (Left Shift): shift = 2'b01: expected: sout = 0000_0000_0000_0010; in = 16'b0000_0000_0000_0001;
    in = 16'b0000_0000_0000_0001;
    shift = 2'b01;

    #10;

    $display("shift = %b, expected: sout = 0000_0000_0000_0010, actual: sout = %b", shift, sout );

    if (sout!==16'b0000_0000_0000_0010)
    err = 1'b1;
    else
    err = 1'b0;

  

 //Test 3 (Right Shift): shift = 2'b10: expected: sout = 0000_0000_0000_0110; in = 16'b0000_0000_0000_1100;
    in = 16'b0000_0000_0000_1100;
    shift = 2'b10;

    #10;

    $display("shift = %b, expected: sout = 0000_0000_0000_0110, actual: sout = %b", shift, sout );

    if (sout!==16'b0000_0000_0000_0110)
    err = 1'b1;
    else
    err = 1'b0;

  

 //Test 4 (Most Significant bit remains the same + (Right Shift)): shift = 2'b10: expected: sout = 0000_0000_0001_0110; in = 16'b0000_0000_0010_1100;
    in = 16'b0000_0000_0010_1100;
    shift = 2'b11;

    #10;

    $display("shift = %b, expected: sout = 0000_0000_0001_0110, actual: sout = %b", shift, sout );

    if (sout!==16'b0000_0000_0001_0110)
    err = 1'b1;
    else
    err = 1'b0;

  
    
end




endmodule