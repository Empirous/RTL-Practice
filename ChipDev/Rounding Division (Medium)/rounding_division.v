/* https://chipdev.io/question/3
Prompt

Divide an input number by a power of two and round the result to the nearest integer. 
The power of two is calculated using 2DIV_LOG2 where DIV_LOG2 is a module parameter. 
Remainders of 0.5 or greater should be rounded up to the nearest integer. 
If the output were to overflow, then the result should be saturated instead.

Input and Output Signals

    din - Input number
    dout - Rounded result
*/

module model #(parameter
  DIV_LOG2=3,
  OUT_WIDTH=32,
  IN_WIDTH=OUT_WIDTH+DIV_LOG2
) (
  input [IN_WIDTH-1:0] din,
  output logic [OUT_WIDTH-1:0] dout
);
  
    logic [OUT_WIDTH-1:0] res;
    logic [DIV_LOG2-1:0] remainder;

    assign {res, remainder} = din;

    assign dout = ( &(res) || (remainder[DIV_LOG2-1] != '1) ) ? res : (res+1);

endmodule
