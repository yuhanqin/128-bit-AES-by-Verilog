module keyexpansion(
    input clk,
    input [128:1] key,
    input [4:1] counter_t,
    input ok_add,
    output [128:1] newkey,
    output reg ok_key
);

    wire [128:1] key_processed;
    reg [128:1] prekey;
    reg [4:1] counter_buf;

xbox xbox_uut (prekey,counter_buf,key_processed);

    assign newkey = (counter_t==4'b0001)?key:key_processed;

    always @(posedge ok_add) 
    begin
        prekey <= newkey;
        counter_buf <= counter_t;
    end


endmodule