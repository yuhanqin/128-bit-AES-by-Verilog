module shiftrow(
    input clk,
    input [128:1] plain_sub,
    input ok_sub,
    input is_first,
    output [128:1]plain_row,
    output ok_row
);


    assign ok_row = ok_sub;
    assign plain_row = (is_first)?plain_sub:{plain_sub[128:121],plain_sub[88:81],plain_sub[48:41],plain_sub[8:1],plain_sub[96:89],plain_sub[56:49],plain_sub[16:9],plain_sub[104:97],plain_sub[64:57],plain_sub[24:17],plain_sub[112:105],plain_sub[72:65],plain_sub[32:25],plain_sub[120:113],plain_sub[80:73],plain_sub[40:33]};


endmodule