/* https://chipdev.io/question/8

Prompt

Build a circuit that reads a sequence of bits (one bit per clock cycle) from the input (din), 
and shifts the bits into the least significant bit of the output (dout). 
Assume all bits of the output are 0 to begin with.

Once the number of input bits received is larger than DATA_WIDTH, only the DATA_WIDTH most 
recent bits are kept in the output.

Input and Output Signals

    clk - Clock signal
    resetn - Synchronous reset-low signal
    din - Input signal
    dout - Output signal

Output signals during reset

    dout - 0 when resetn is active
*/

module model #(parameter
  DATA_WIDTH = 16
) (
  input clk,
  input resetn,
  input din,
  output logic [DATA_WIDTH-1:0] dout
);

  logic [$bits(dout)-1:0] shift_reg;

  always @(posedge clk) begin
    if(~resetn)
      shift_reg <= '0;
    else
      shift_reg <= (shift_reg << 1) | din;
  end

  assign dout = shift_reg;

endmodule

/*
Example 

Assume DATA_WIDTH = 6 in this example.

The binary values resulting from the input being shifted bit by bit into the output's least significant bit are shown below:

b1
b10
b101
b1011
b10110
b101100
b011001
b110011

From the example you can see that the incoming bits are appended to the right side, which is the least significant bit's position.

Also notice that once the number of shifted bits exceeds 6 (which is the DATA_WIDTH), we only keep the 6 most recent bits.

And finally, when resetn goes low, all the previous input bits are no longer considered. Once resetn goes back high, the output begins ingesting the input bits as the new sequence show below:

b1
b11

*/

