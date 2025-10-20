//factorial using function
//fact of 0 is 1
//`timescale 1ns/1ps
module fact;
  
  function integer factorial(input integer a);
  begin
    if(a>1)begin
      factorial=a*factorial(a-1);
    end
    else begin
      factorial=1;
    end
  end
 endfunction 
integer rtn;
  initial begin
    rtn=factorial(30);
    $display("factorial of 5 is:%d",rtn);
  end
endmodule
  
  // Factorial using function
// fact(0) = 1

/*
`timescale 1ns/1ps
module fact;

  // Recursive factorial function
  function integer factorial;
    input integer a;
    begin
      if (a > 1) begin
        factorial = a * factorial(a-1); // recursive case
      end
      else begin
        factorial = 1;                  // base case: 0! = 1, 1! = 1
      end
    end
  endfunction

  integer rtn;
  initial begin
    rtn = factorial(5);  // calculate 5!
    $display("Factorial of 5 is : %0d", rtn);

    rtn = factorial(0);  // check base case
    $display("Factorial of 0 is : %0d", rtn);

    rtn = factorial(7);  // another test
    $display("Factorial of 7 is : %0d", rtn);

    $finish;
  end

endmodule
*/
