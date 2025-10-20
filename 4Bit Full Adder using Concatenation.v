
module FA_using_Conc(input [3:0]a,b,input cin,output [3:0]sum,output carry);

assign{carry,sum}=a+b+cin;
endmodule

module FA_using_Conc_tb;
reg [3:0]a,b;
reg cin;
wire [3:0]sum;
wire carry ;

FA_using_Conc uut (a,b,cin,sum,carry);

initial begin
$monitor("Time=%0t A=%b B=%b Cin=%b || Sum=%b Cout=%b",
                 $time, a, b, cin, sum, carry);

        a=4'b0001; b=4'b0010; cin=0; #10;
        a=4'b1111; b=4'b0001; cin=0; #10;
        a=4'b1010; b=4'b0101; cin=1; #10;
        a=4'b1111; b=4'b1111; cin=1; #10;

        $finish;
    end
endmodule
