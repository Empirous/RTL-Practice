/* https://chipdev.io/question/18
Prompt

Given an input (din), output (dout) a 1 if its binary representation is a palindrome and a 0 otherwise.

A palindrome binary representation means that the binary representation has the same sequence of bits whether you read it from left to right or right to left. Leading 0s are considered part of the input binary representation.
Input and Output Signals

    din - Input value
    dout - 1 if the binary representation is a palindrome, 0 otherwise
*/

module model #(parameter
  DATA_WIDTH=32
) (
  input [DATA_WIDTH-1:0] din,
  output logic dout
);

  if(DATA_WIDTH == 1)
    assign dout = 1;
  else begin
    logic [DATA_WIDTH/2-1:0] top_r = {<<{din}}; //streaming operator {<<{}}
    logic [DATA_WIDTH/2-1:0] bot = din[DATA_WIDTH/2-1:0];
    assign dout = top_r == bot;
  end

  // Alternative Solution (quick hacky way but inefficient use of comparisons)
  // logic [$bits(din)-1:0] din_r;

  // always_comb begin
  //   for(int i = 0; i < DATA_WIDTH; i++) 
  //     din_r[DATA_WIDTH-1-i] = din[i];
  // end

  // assign dout = din == din_r;
  
endmodule
