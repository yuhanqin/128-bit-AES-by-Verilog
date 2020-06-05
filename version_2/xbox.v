module xbox(
    input [128:1] prekey,
    input [4:1] counter_t,
    output [128:1] key_processed
);

    wire [8:1] rcon;
    wire [32:1] t;

tbox tbox_uut(prekey[32:1],rcon,t);

    assign rcon = (counter_t==4'b0001)?8'h01:(counter_t==4'b0010)?8'h02:(counter_t==4'b0011)?8'h04:(counter_t==4'b0100)?8'h08:(counter_t==4'b0101)?8'h10:(counter_t==4'b0110)?8'h20:(counter_t==4'b0111)?8'h40:(counter_t==4'b1000)?8'h80:(counter_t==4'b1001)?8'h1b:(counter_t==4'b1010)?8'h36:8'h0;

    assign key_processed = {t^prekey[128:97],t^prekey[128:97]^prekey[96:65],t^prekey[128:97]^prekey[96:65]^prekey[64:33],t^prekey[128:97]^prekey[96:65]^prekey[64:33]^prekey[32:1]};


endmodule