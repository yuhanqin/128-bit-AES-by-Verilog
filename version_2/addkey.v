module addkey(
    input clk,
    input [128:1] plain_col,
    input ok_col,
    input [4:1] counter_t,
    input [128:1] key,
    input is_first,
    output reg [128:1] plain_add,
    output reg ok_add
);

    wire ok_key;
    wire [128:1] newkey;
    reg refresh_col, refresh_key;

keyexpansion key_uut(clk,key,counter_t,ok_add,newkey,ok_key);

    always @(posedge ok_col) refresh_col <= 1;
    always @(posedge ok_key) refresh_key <= 1;

    always @(posedge clk) 
    begin
        if (~ok_col)
        begin
            refresh_col <= 0;
            refresh_key <= 0;
            ok_add <= 0;
        end
        else if (refresh_col)
        begin
            plain_add <= plain_col ^ newkey;
            ok_add <= 1;
            refresh_col <= 0;
            refresh_key <= 0;
        end
        else ok_add <= 0;
    end


endmodule