module tbox(
    input [32:1] w,
    input [8:1] rcon,
    output [32:1] t
);

    wire [32:1] w_sub;

sbox sbox_key_uut1(w[24:17],w_sub[32:25]);
sbox sbox_key_uut2(w[16:9],w_sub[24:17]);
sbox sbox_key_uut3(w[8:1],w_sub[16:9]);
sbox sbox_key_uut4(w[32:25],w_sub[8:1]);

    assign t = {w_sub[32:25]^rcon,w_sub[24:1]};


endmodule