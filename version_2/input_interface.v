module input_interface(
    input clk,
    input rst_,
    input [8:1] din,
    input [2:1] cmd,
    input ready,
    output [128:1] plain,
    output [128:1] key,
    output start
);

    wire cmd_sp;
    wire plain_ok_;
    wire cmd_sk;
    wire key_ok_;
    wire cmd_st;

    assign cmd_sp = (cmd == 2'b01);
    assign cmd_sk = (cmd == 2'b10);
    assign cmd_st = (cmd == 2'b11);
    assign start = cmd_st;

input_plain plain_uut(clk,rst_,din,cmd_sp,plain,plain_ok_);
input_key key_uut(clk,rst_,din,cmd_sk,key,key_ok_);

    parameter S_ID = 0;
    parameter S_SP = 1;
    parameter S_SK = 2;
    parameter S_ST = 3;

    reg [2:1] state, next_state;

    always@(*)
    begin
	if(~rst_) state = S_ID;
	else case(state)
	    S_ID: next_state = cmd_sp?S_SP : cmd_sk?S_SK : cmd_st?S_ST : state;
	    S_SP: next_state = plain_ok_?state : S_ID;
	    S_SK: next_state = key_ok_?state : S_ID;
	    S_ST: next_state = ready?S_ID : state;
	    default: next_state = S_ID;
	endcase
    end

    always@(posedge clk) state <= next_state;


endmodule