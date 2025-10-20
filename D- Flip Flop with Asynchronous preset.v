


module DFF_with_Asyn_preset(input D,preset,clk,output reg q);
  always@(posedge clk or negedge preset)begin
    if(preset==0)begin
      q<=1;
    end
    else begin
      q<=D;
    end
  end
endmodule

module DFF_with_Asyn_preset_tb;
  reg D,preset,clk;
  wire q;
  
  DFF_with_Asyn_preset uut(D,preset,clk,q);
initial begin
clk=0;
forever #5 clk=~clk;
end
  
  initial begin
    $monitor("||Time =%t | preset =%b | clk=%b | D=%b | q=%b||",$time,preset,clk,D,q);
    
    preset=0;D=0;
    #10 preset=1;
    #10;D=1;
    #10;D=0;
    #10; preset=0;
    
    #10; D=1;
    #10; D=0;
    #10;
    #10;$stop;
  end
endmodule