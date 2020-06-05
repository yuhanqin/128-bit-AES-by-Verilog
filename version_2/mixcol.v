module mixcol(
    input clk,
    input [128:1] plain_row,
    input ok_row,
    input is_first,
    input is_final,
    output [128:1]plain_col,
    output ok_col
);

    reg [2:1] counter_col;
    wire [128:1] plain_buf2;

dbox dbox_uut(plain_row,plain_buf2);

    assign ok_col = ok_row;

    assign plain_col = (is_first | is_final)?plain_row:{{plain_buf2[128:121]^plain_row[120:113]^plain_buf2[120:113]^plain_row[112:105]^plain_row[104:97]},{plain_row[128:121]^plain_buf2[120:113]^plain_row[112:105]^plain_buf2[112:105]^plain_row[104:97]},{plain_row[128:121]^plain_row[120:113]^plain_buf2[112:105]^plain_row[104:97]^plain_buf2[104:97]},{plain_row[128:121]^plain_buf2[128:121]^plain_row[120:113]^plain_row[112:105]^plain_buf2[104:97]},{plain_buf2[96:89]^plain_row[88:81]^plain_buf2[88:81]^plain_row[80:73]^plain_row[72:65]},{plain_row[96:89]^plain_buf2[88:81]^plain_row[80:73]^plain_buf2[80:73]^plain_row[72:65]},{plain_row[96:89]^plain_row[88:81]^plain_buf2[80:73]^plain_row[72:65]^plain_buf2[72:65]},{plain_row[96:89]^plain_buf2[96:89]^plain_row[88:81]^plain_row[80:73]^plain_buf2[72:65]},{plain_buf2[64:57]^plain_row[56:49]^plain_buf2[56:49]^plain_row[48:41]^plain_row[40:33]},{plain_row[64:57]^plain_buf2[56:49]^plain_row[48:41]^plain_buf2[48:41]^plain_row[40:33]},{plain_row[64:57]^plain_row[56:49]^plain_buf2[48:41]^plain_row[40:33]^plain_buf2[40:33]},{plain_row[64:57]^plain_buf2[64:57]^plain_row[56:49]^plain_row[48:41]^plain_buf2[40:33]},{plain_buf2[32:25]^plain_row[24:17]^plain_buf2[24:17]^plain_row[16:9]^plain_row[8:1]},{plain_row[32:25]^plain_buf2[24:17]^plain_row[16:9]^plain_buf2[16:9]^plain_row[8:1]},{plain_row[32:25]^plain_row[24:17]^plain_buf2[16:9]^plain_row[8:1]^plain_buf2[8:1]},{plain_row[32:25]^plain_buf2[32:25]^plain_row[24:17]^plain_row[16:9]^plain_buf2[8:1]}};


endmodule