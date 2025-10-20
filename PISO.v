

module piso_shift_register (input clk,rst,load,input wire [3:0] in,output wire out);

reg [3:0] q;

  always @(posedge clk or negedge rst) begin
    if (!rst) begin
        q <= 4'b0000;
      
    end else begin 
        if (!load) begin
           q <= in;
          
        end else begin
            q <= {1'b0, q[3:1]};
        end
    end
end


assign out = q[0];

endmodule


module piso_shift_register_tb;
    reg clk;
    reg rst;
    reg load;
  reg [3:0] in;
    wire out;

    piso_shift_register uut (.clk(clk),.rst(rst),.load(load),.in(in),.out(out));

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
      
       $dumpfile("piso_shift_register_tb.vcd");
        $dumpvars(0, piso_shift_register_tb);

        rst = 0; load = 1;
        #12 rst = 1; 

        #10 load = 0; in = 4'b1011;
        @(posedge clk);
        #1;
        load = 1;

        repeat(4) begin
            @(posedge clk);
          $display("Time=%0t | S_Out=%b | P_input =%b", $time, out,in);
        end

        #10 load = 0; in = 4'b0110;
      @(posedge clk);#1;
        load = 1;

        repeat(4) begin
         @(posedge clk);
          $display("Time=%0t | S_Out=%b| P_input =%b", $time,out,in);
        end
        #20;
        $display("Simulation completed.");
        $finish;
    end

endmodule
