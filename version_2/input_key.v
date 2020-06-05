module input_key(
    input clk,
    input rst_,
    input [8:1] din,
    input cmd_sk,
    output reg [128:1] key,
    output key_ok_
);

    reg [5:1] counter;
    reg is_working;

    assign key_ok_ = ~(counter == 5'b10000);

    always @(posedge cmd_sk) is_working <= 1;

    always @(posedge clk)
    begin
	if (~rst_ | ((is_working==0)&~cmd_sk))
	begin
		is_working <= 0;
	    counter <= 5'b0;
	    key <= 128'b0;
	end
	else if (counter == 5'b10000)
	begin
	    counter <= counter;
	    key <= key;
	end
	else
	begin
	    counter <= counter + 1'b1;
	    key <= {key[120:1],din};
	end
    end


endmodule