module srd(
    input clk,
    input [128:1] plain_t,
    input ok_t,
    input trigger,
    input is_first,
    output [128:1]plain_sub,
    output ok_sub
);

    reg counter_srd;
    reg refresh_t, refresh_add;
    wire refresh;
    wire [128:1] plain_buf;

    //sbox sbox_test_uut(plain_t[8:1],plain_buf[8:1])

    genvar i;
    generate
        for (i=1;i<122;i=i+8)
        begin: generate_srd
            sbox sbox_uut(plain_t[i+7:i],plain_buf[i+7:i]);
        end
    endgenerate


    //assign ok_sub = (counter_srd == 2'b10)|(counter_srd == 2'b01);
    //assign ok_sub = counter_srd;
    //assign ok_sub = (ok_t==0)?0:(is_first==1)?1:trigger;
    assign ok_sub = (ok_t==0)?0:trigger;
    assign refresh = refresh_t | refresh_add;
    assign plain_sub = (is_first==1)?plain_t:plain_buf;


endmodule