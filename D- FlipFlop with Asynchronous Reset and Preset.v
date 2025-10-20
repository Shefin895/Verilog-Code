


module DFF_with_Asyn_Reset_and_preset(input D,rst,preset,clk,output reg q);
  always@(posedge clk or negedge rst or negedge preset)begin
    if(rst==0)begin
      q<=0;
    end
    else if (preset==0)begin
      q<=1;
    end
    else
      q<=D;
  end
endmodule

module DFF_with_Asyn_Reset_and_preset_tb;
  reg D,rst,preset,clk;
  wire q;
  
  DFF_with_Asyn_Reset_and_preset uut(D,rst,preset,clk,q);
initial begin
clk=0;
forever #5 clk=~clk;
end
  
  initial begin
    $monitor("||Time =%t | rst =%b |preset=%b| clk=%b | D=%b | q=%b||",$time,rst,preset,clk,D,q);
    
     D = 0; rst = 1; preset = 1;

    #5 rst = 0;        
    #7 rst = 1;      

    #5 preset = 0;     
    #5 preset = 1;     

    #5 D = 1;             
    #10 D = 0;            

    #5 rst = 0;         
    #5 preset = 0;      
    #5 rst = 1; preset = 1; 

    #10 $stop;
  end
endmodule