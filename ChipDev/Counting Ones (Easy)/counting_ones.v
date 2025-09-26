/* https://chipdev.io/question/10
Prompt

Given an input binary value, output the number of bits that are equal to 1.
Input and Output Signals

    din - Input value
    dout - Number of 1's in the input value
*/

module model #(parameter
  DATA_WIDTH = 16
) (
  input [DATA_WIDTH-1:0] din,
  output logic [$clog2(DATA_WIDTH):0] dout
)
  always_comb begin
    int cnt = 0;
    for(int i = 0; i < DATA_WIDTH; i++)
      cnt = (din[i] == 1) ? cnt+1 : cnt;
    assign dout = cnt;
  end
  
endmodule
