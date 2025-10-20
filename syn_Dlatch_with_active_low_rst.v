
module syn_Dlatch_with_active_low_rst(input D,rst,clk,output reg q);  
  always@(posedge clk)begin
    if(rst==0)begin
      q<=0;
    end
    else if (clk)begin
      q<=D;
    end
  end
endmodule
module syn_Dlatch_with_active_low_rst_tb;
  reg D,rst,clk;
  wire q;
  
  syn_Dlatch_with_active_low_rst uut(D,rst,clk,q);
  
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  
  initial begin
    $monitor("||Time =%t | rst =%b | clk=%b | D=%b | q=%b||",$time,rst,clk,D,q);
    
    rst=1;D=0;
    #5 rst=0;
    #5 rst=1;
    
    #5 D=1;
    #5 D=0;
    #5;rst=0;
    $finish;
  end
endmodule