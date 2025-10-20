// Code your design here
//asynchronus reset
module SR_FF(input clk,s,r,rst,output reg q,qbar);
  always@(posedge clk or posedge rst )begin
    if(rst)begin
      q<=0;
      qbar<=1;
    end
    else
      case({s,r})
        2'b00:begin
          q<=q;
          qbar<=qbar;
        end
         2'b01:begin
          q<=0;
          qbar<=1;
        end 
        2'b10:begin
          q<=1;
          qbar<=0;
        end 
        2'b11:begin
          q<=1'bx;
          qbar<=1'bx;
        end
        default:begin
          q<=0;
          qbar<=0;
        end
        endcase
  end
endmodule

// 
// Code your testbench here
// or browse Examples
module SR_tb;
  reg clk,s,r,rst;
  wire q,qbar;

  SR_FF uut(clk,s,r,rst,q,qbar);
  
  initial begin
    clk=0;
  forever #5 clk=~clk;
  end
  
 initial begin
        rst = 1;s = 0;r = 0;
        #10; rst = 0; 
        
        
        s = 0;r = 0;#10;//mem
        s = 0;r = 1;#10; //reset
        s = 1;r = 0;#10;//set
        s = 1;r = 1;//invalid
        #10 $stop;
    end

    initial begin
        $monitor("Time=%t | clk=%b | s=%b | r=%b | rst=%b || q=%b | qbar=%b",
                  $time, clk, s, r, rst, q, qbar);
    end
endmodule

