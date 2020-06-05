module input_plain(
    input clk,
    input rst_,
    input [8:1] din,
    input cmd_sp,
    output reg [128:1] plain,
    output plain_ok_
);

    reg [5:1] counter;
    reg is_working;

    assign plain_ok_ = ~(counter == 5'b10000);

    always @(posedge cmd_sp) is_working <= 1;

    always @(posedge clk)
    begin
	if (~rst_ | ((is_working==0)&~cmd_sp)) 
	begin
		is_working <= 0;
	    counter <= 5'b0;
	    plain <= 128'b0;
	end
	else if (counter == 5'b10000)
	begin
	    counter <= counter;
	    plain <= plain;
	end
	else
	begin
	    counter <= counter + 1'b1;
	    plain <= {plain[120:1],din};
	end
    end


endmodule