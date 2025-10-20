module RTC(
 input clk,
 input reset,
 output reg[3:0]sec_l,
 output reg[3:0]sec_m,
 output reg[3:0]min_l,
 output reg[3:0]min_m,
 output reg[3:0]hr_l,
 output reg[3:0]hr_m,
 output reg[6:0]seven_sec_l,
 output reg[6:0]seven_sec_m,
 output reg[6:0]seven_min_l,
 output reg[6:0]seven_min_m,
 output reg[6:0]seven_hr_l,
 output reg[6:0]seven_hr_m
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        sec_l<=0;
        sec_m<=0;
        min_l<=0;
        min_m<=0;
        hr_l<=0; 
        hr_m<=0;
    end else begin
       
        if (sec_l == 9) begin
            sec_l <= 0;
            
            if (sec_m==5) begin
                sec_m<=0;
                
                if (min_l==9) begin
                    min_l<=0;
                    
                    if (min_m==5) begin
                        min_m<= 0;
                        
                        if (hr_l==9&& hr_m<2) begin
                            hr_l<= 0;
                            hr_m<= hr_m + 1;
                        end
                        else if (hr_m==1 && hr_l==2) begin  //change hr_m==1 &hr_l==2 for 12hr format
                            hr_l <= 0;
                            hr_m <= 0;
                        end
                        else begin
                            hr_l <= hr_l + 1;
                        end
                    end 
                  else min_m <= min_m + 1;
                end 
              else min_l <= min_l + 1;
            end 
          else sec_m <= sec_m + 1;
        end 
      else sec_l <= sec_l + 1;
    end
end


function [6:0]seven;
    input [3:0]bcd;
    begin
        case(bcd)
            4'b0000:seven=7'b0000001;
            4'b0001:seven=7'b1001111;
            4'b0010:seven=7'b0010010;
            4'b0011:seven=7'b0000110;
            4'b0100:seven=7'b1001100;
            4'b0101:seven=7'b0100100;
            4'b0110:seven=7'b0100000;
            4'b0111:seven=7'b0001111;
            4'b1000:seven=7'b0000000;
            4'b1001:seven=7'b0000100;
            default:seven=7'b1111111;
        endcase
    end
endfunction

always @(*) begin
    seven_sec_l=seven(sec_l);
    seven_sec_m=seven(sec_m);
    seven_min_l=seven(min_l);
    seven_min_m=seven(min_m);
    seven_hr_l =seven(hr_l);
    seven_hr_m=seven(hr_m);
end

endmodule

module tb_RTC;
    reg clk;
    reg reset;
    wire [3:0] sec_l, sec_m, min_l, min_m, hr_l, hr_m;
    wire [6:0] seven_sec_l, seven_sec_m, seven_min_l, seven_min_m, seven_hr_l, seven_hr_m;

    RTC uut (.clk(clk),.reset(reset),.sec_l(sec_l),.sec_m(sec_m),.min_l(min_l),.min_m(min_m),.hr_l(hr_l),.hr_m(hr_m),.seven_sec_l(seven_sec_l),.seven_sec_m(seven_sec_m),.seven_min_l(seven_min_l),.seven_min_m(seven_min_m),.seven_hr_l(seven_hr_l),.seven_hr_m(seven_hr_m));
    initial clk=0;
    always #10 clk= ~clk;

    initial begin
       
        reset = 1;
        #20;
        reset = 0;
        #1000000;
        reset = 1;
        #20;
        reset = 0;
        #1000000;
        $stop; 
    end

    initial begin
        $display("Time\tHR_M HR_L : MIN_M MIN_L : SEC_M SEC_L | 7seg");
        $monitor("%0t\t %0d%0d : %0d%0d : %0d%0d || %b|%b|%b|%b|%b|%b",$time, hr_m,hr_l,min_m,min_l,sec_m,sec_l,seven_hr_m,seven_hr_l,seven_min_m,seven_min_l,seven_sec_m,seven_sec_l);
    end

endmodule


