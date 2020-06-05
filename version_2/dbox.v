module dbox(
    input [128:1] plain_row,
    output [128:1] plain_double
);

	assign plain_double = {(plain_row[128])?{plain_row[127:121],1'b0}^8'h1b:{plain_row[127:121],1'b0},(plain_row[120])?{plain_row[119:113],1'b0}^8'h1b:{plain_row[119:113],1'b0},(plain_row[112])?{plain_row[111:105],1'b0}^8'h1b:{plain_row[111:105],1'b0},(plain_row[104])?{plain_row[103:97],1'b0}^8'h1b:{plain_row[103:97],1'b0},(plain_row[96])?{plain_row[95:89],1'b0}^8'h1b:{plain_row[95:89],1'b0},(plain_row[88])?{plain_row[87:81],1'b0}^8'h1b:{plain_row[87:81],1'b0},(plain_row[80])?{plain_row[79:73],1'b0}^8'h1b:{plain_row[79:73],1'b0},(plain_row[72])?{plain_row[71:65],1'b0}^8'h1b:{plain_row[71:65],1'b0},(plain_row[64])?{plain_row[63:57],1'b0}^8'h1b:{plain_row[63:57],1'b0},(plain_row[56])?{plain_row[55:49],1'b0}^8'h1b:{plain_row[55:49],1'b0},(plain_row[48])?{plain_row[47:41],1'b0}^8'h1b:{plain_row[47:41],1'b0},(plain_row[40])?{plain_row[39:33],1'b0}^8'h1b:{plain_row[39:33],1'b0},(plain_row[32])?{plain_row[31:25],1'b0}^8'h1b:{plain_row[31:25],1'b0},(plain_row[24])?{plain_row[23:17],1'b0}^8'h1b:{plain_row[23:17],1'b0},(plain_row[16])?{plain_row[15:9],1'b0}^8'h1b:{plain_row[15:9],1'b0},(plain_row[8])?{plain_row[7:1],1'b0}^8'h1b:{plain_row[7:1],1'b0}};

endmodule