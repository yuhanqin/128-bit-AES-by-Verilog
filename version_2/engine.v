module engine(
    input clk,
    input rst_,
    input [128:1] plain,
    input [128:1] key,
    input start,
    output [128:1] cipher,
    output ok
);

	reg initial_trig, is_start;
	reg [4:1] counter_t;
	reg add_cnt, trigger;
	wire [128:1] plain_t;
	wire [128:1] plain_sub;
	wire [128:1] plain_row;
	wire [128:1] plain_col;
	wire [128:1] plain_add;
	wire ok_t, ok_sub, ok_row, ok_col, ak_add;
	wire is_first,is_final;

	assign plain_t = (counter_t==4'b0001)?plain:plain_add; 
	//可能需要考虑其他情况

	assign is_final = (counter_t==4'b1011);
	assign is_first = (counter_t==4'b0001);
	assign cipher = plain_add;
	assign ok = (counter_t==4'b1100);
	assign ok_t = ~(counter_t==4'b0 | counter_t==4'b1100) & start;
	assign trigger_final = initial_trig | trigger;


srd srd_uut(clk,plain_t,ok_t,trigger_final,is_first,plain_sub,ok_sub);
shiftrow shiftrow_uut(clk,plain_sub,ok_sub,is_first,plain_row,ok_row);
mixcol mixcol_uut(clk,plain_row,ok_row,is_first,is_final,plain_col,ok_col);
addkey addkey_uut(clk,plain_col,ok_col,counter_t,key,is_first,plain_add,ok_add);

	always @(posedge start) 
	begin
		counter_t <= 4'b0001;
		is_start <= 1;
	end

	always @(posedge ok_add)
	begin
		add_cnt <= 1;
		trigger <= 0;
	end

	always @(posedge clk)
	begin
		if (~rst_ | ~start)
		begin
			counter_t <= 4'b0;
			add_cnt <= 0;
			trigger <= 0;
			is_start <= 0;
			initial_trig <= 0;
		end
		else if (counter_t == 4'b1100) counter_t <= counter_t;
		else if (is_start==1)
		begin
			initial_trig <= 1;
			is_start <= 0;
		end
		else if (initial_trig==1) initial_trig <= 0;
		else if (add_cnt)
		begin
			counter_t <= counter_t + 1'b1;
			add_cnt <= 0;
			trigger <= 1;
		end
		else counter_t <= counter_t;
	end


endmodule