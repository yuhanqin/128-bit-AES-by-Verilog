module top(
    input clk,
    input rst_,
    input [8:1] din,
    input [2:1] cmd,
    output [8:1]dout,
    output ok,
    output ready
);

    wire [128:1] plain;
    wire [128:1] key;
    wire [128:1] cipher;

input_interface input_uut(clk,rst_,din,cmd,ready,plain,key,start);

engine engine_uut(clk,rst_,plain,key,start,cipher,ok);

output_interface output_uut(clk,rst_,cipher,ok,dout,ready);


endmodule