
module fulladder_using_nand(input a,b,cin,output sum,carry);
wire [10:1] w;

nand n1(w[1],a,b);
nand n2(w[2],a,w[1]);
nand n3(w[3],b,w[1]);
nand n4(w[4],w[2],w[3]); 
nand n5(w[5],w[4],cin);
nand n6(w[6],w[4],w[5]);
nand n7(w[7],cin,w[5]);
nand n8(sum,w[6],w[7]);

nand n9(w[8],w[4],cin);
nand n10(carry,w[1],w[8]);

endmodule

module FA_4BIT_using_nand(input [3:0]a,b,input cin,output [3:0] sum,output carry);
wire c1,c2,c3;
fulladder_using_nand n1(a[0],b[0],cin,sum[0],c1);
fulladder_using_nand n2(a[1],b[1],c1,sum[1],c2);
fulladder_using_nand n3(a[2],b[2],c2,sum[2],c3);
fulladder_using_nand n4(a[3],b[3],c3,sum[3],carry);
endmodule

module FA_4BIT_using_nand_tb;
reg [3:0]a,b;
reg cin;
wire [3:0]sum;
wire carry ;

FA_4BIT_using_nand uut (a,b,cin,sum,carry);

initial begin
$monitor("Time=%0t A=%b B=%b Cin=%b || Sum=%b Cout=%b",
                 $time, a, b, cin, sum, carry);

        a=4'b0001; b=4'b0010; cin=0; #10;
        a=4'b1111; b=4'b0001; cin=0; #10;
        a=4'b1010; b=4'b0101; cin=1; #10;
        a=4'b1111; b=4'b1111; cin=1; #10;
        a=4'b1011; b=4'b0110; cin=1; #10;

        $finish;
    end
endmodule