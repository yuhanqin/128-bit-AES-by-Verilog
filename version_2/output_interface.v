module output_interface(
    input clk,
    input rst_,
    input [128:1] cipher,
    input ok,
    output [8:1] dout,
    output ready
);

    reg [5:1] counter;
    reg [128:1] cipher_buf;
    reg is_working;

    assign ready = (counter == 5'b10000);
    assign dout = cipher_buf[128:121];

    always @(posedge ok) 
    begin
        is_working <= 1;
    	counter <= 5'b0;
    	cipher_buf <= cipher;
    end

    always @(posedge clk)
    begin
	if (~rst_ | (~is_working&~ok))
	begin
        is_working <= 0;
	    counter <= 5'b00000;
	    cipher_buf <= 128'b0;
	end
	else if (counter == 5'b10000)
	begin
	    counter <= counter;
	    cipher_buf <= cipher_buf;
	end
	else
	begin
	    counter <= counter + 1'b1;
	    cipher_buf <= {cipher_buf[120:1],8'b0}; //可能需要延迟一个周期再移位
	end
    end


endmodule