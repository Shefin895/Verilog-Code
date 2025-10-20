
module Asyn_Dlatch_with_activehigh_rst(input D,rst,clk,output reg q);
  always@(*)begin
    if(rst==1)begin
      q<=0;
    end
    else if (clk)begin
      q<=D;
    end
  end
endmodule

module Asyn_Dlatch_with_activehigh_rst_tb;
  reg D,rst,clk;
  wire q;
  
  Asyn_Dlatch_with_activehigh_rst uut(D,rst,clk,q);
  
  initial begin
    $monitor("||Time =%t | rst =%b | clk=%b | D=%b | q=%b||",$time,rst,clk,D,q);
    
    rst=0;clk=0;D=0;
    #5 rst=1;
    #5 rst=0;
    
    #5 D=1;clk=1;
    #5 D=0;clk=1;
    #5;$finish;
  end
endmodule