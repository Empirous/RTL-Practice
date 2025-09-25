/* https://chipdev.io/question/5
Prompt

Reverse the bits of an input value's binary representation.
Input and Output Signals

    din - Input value
    dout - Bitwise reversed value
*/

module model #(parameter
  DATA_WIDTH=32
) (
  input  [DATA_WIDTH-1:0] din,
  output logic [DATA_WIDTH-1:0] dout
);

  always @(*) begin
    for(int i = 0; i < DATA_WIDTH; i++) 
      assign dout[i] = din[DATA_WIDTH-1-i];
  end
  
endmodule
