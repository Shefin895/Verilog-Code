//serial in parallel out
module nbit_shift_register#(parameter N=4)(input clk,rst,in,output reg [N-1:0]out);
reg [N-1:0]temp;
always@(posedge clk)begin
if(rst)begin
temp<={N{1'b0}};
out<={N{1'b0}};
end
else begin
     temp<={temp[N-2:0],in};
     out=temp;
end
end
endmodule

module nbit_shift_register_tb;
reg clk,rst,in;
wire [3:0]out;

nbit_shift_register #(4)dut( .clk(clk),
        .rst(rst),
        .in(in),
        .out(out)
    );

initial begin
        clk = 0;
        forever #5 clk = ~clk;   
    end

    
    initial begin
        
        rst = 1; in = 0;
        #12 rst = 0;

        in = 1; #10;
        in = 1; #10;
        in = 0; #10;
        in = 1; #10;
	#10;
        $stop;
    end

    initial begin
        $monitor("Time=%0t | rst=%b | in=%b | out=%b", $time, rst, in, out);

    end
endmodule
