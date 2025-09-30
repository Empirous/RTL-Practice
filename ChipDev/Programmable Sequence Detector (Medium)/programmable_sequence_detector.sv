/* https://chipdev.io/question/19
Prompt

Given a stream of input bits, pulse a 1 on the output (seen) whenever a specified 5-bit target 
sequence is detected on the input (din). The target sequence is specified by init and is updated 
whenever the reset-low signal (resetn) is deasserted.

The target sequence is always a 5-bit value, so left-padded 0's are also considered part of 
the sequence (a sequence specified as b11 would actually be b00011).

When resetn goes active, all previously seen bits on the input are no longer considered when searching for the target sequence.

Input and Output Signals

    clk - Clock signal
    resetn - Synchronous reset-low signal
    init - Target sequence to detect. Updated whenever resetn is asserted
    din - Input bits
    seen - 1 if the sequence specified by init was detected, 0 otherwise

Output signals during reset

    seen - 0 when resetn is active
*/

module model (
  input clk,
  input resetn,
  input [4:0] init,
  input din,
  output logic seen
);
  
  logic [4:0] target;
  always @ (posedge resetn) begin
    target <= init;
  end

  logic [4:0] in_reg;
  integer count; 
  always @(posedge clk) begin
    if(~resetn) begin
      in_reg <= '0;
      count <= 0;
    end else begin
      in_reg <= (in_reg << 1) | din;
      count <= count + 1;
    end
  end

  assign seen = (in_reg == target) && (count > 4) ? 1 : 0;

endmodule
