module regfile_tb;
reg[15:0] data_in;
reg[2:0] writenum, readnum;
reg write, clk;
wire [15:0] data_out;
reg err;

regfile DUT(.data_in(data_in), .writenum(writenum), .write(write), .readnum(readnum), .clk(clk), .data_out(data_out));

task my_checker;
    input[15:0] expected_data_out;
    
begin
    if(data_out!==expected_data_out)begin
        $display("ERROR! Data out is %b, expected %b", data_out, expected_data_out);

        err = 1'b1;
end

end
endtask

initial begin   //forever switches the key input between 0 and 1
    clk = 1'b1; 
    #5;
        forever begin
            clk = 1'b0; #5;
            clk = 1'b1; #5;
        end
end

initial begin 
//Test 1: Checking Register [0]:  
    $display("checking reg0");
    writenum = 3'b000;
    write = 1'b1;
    readnum = 3'b000;
    data_in = 16'b1000_0000_0000_0000;
    err = 1'b0;
    
   

    #10;

    my_checker(16'b1000_0000_0000_0000);

    $display("checking reg1");
    #5;
    writenum = 3'b001;
    write = 1'b1;
    readnum = 3'b001;
    data_in = 16'b1111_1111_1111_1111;
    err = 1'b0;
    
   

    #10;

    my_checker(16'b1);

     $display("checking reg1 - false");
    #5;
    writenum = 3'b011;
    write = 1'b1;
    readnum = 3'b001;
    data_in = 16'b1;
    err = 1'b0;
    
   

    #10;

    my_checker(16'b0);

    $display("checking reg2");
    #5;
    writenum = 3'b001;
    write = 1'b1;
    readnum = 3'b001;
    data_in = 16'b1;
    err = 1'b0;
    
   

    #10;

    my_checker(16'b1000_1111_0000_0000);
    $display("checking reg3");
    #5;
    writenum = 3'b010;
    write = 1'b1;
    readnum = 3'b001;
    data_in = 16'b1;
    err = 1'b0;
    
   

    #10;

    my_checker(16'b1000_0000_0000_0000);



    if( ~err ) $display("PASSED");
    else $display("FAILED");
    $stop;

  end

endmodule

