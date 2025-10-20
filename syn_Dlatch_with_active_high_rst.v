module syn_Dlatch_with_active_high_rst(input D,rst,clk,output reg q);  
  always@(posedge clk)begin
    if(rst==1)begin
      q<=0;
    end
    else if (clk)begin
      q<=D;
    end
  end
endmodule

module syn_Dlatch_with_active_high_rst_tb;
  reg D,rst,clk;
  wire q;
  
  syn_Dlatch_with_active_high_rst uut(D,rst,clk,q);
  
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  
  initial begin
    $monitor("||Time =%t | rst =%b | clk=%b | D=%b | q=%b||",$time,rst,clk,D,q);
    
    rst=0;D=0;
    #5 rst=1;
    #5 rst=0;    
    #5 D=1;
    #5 D=0;
    #5;$finish;
  end
endmodule