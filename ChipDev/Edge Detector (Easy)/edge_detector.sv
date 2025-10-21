/* https://chipdev.io/question/6
Prompt

Build a circuit that pulses dout one cycle after the rising edge of din. 
A pulse is defined as writing a single-cycle 1 as shown in the examples below. 
When resetn is asserted, the value of din should be treated as 0.

Bonus - can you enhance your design to pulse dout on the same cycle as the rising edge? 
Note that this enhancement will not pass our test suite, but is still a useful exercise.

Input and Output Signals

    clk - Clock signal
    resetn - Synchronous reset-low signal
    din - Input signal
    dout - Output signal

Output signals during reset

    dout - 0 when resetn is active
*/

module model (
  input clk,
  input resetn,
  input din,
  output dout
);

  logic current, last; 

  always @(posedge clk) begin
  
    if(~resetn) begin
      current <= 0;
      last    <= 0;
    end else begin
      current <=  din;
      last    <= current;
    end

  end

  assign dout = ~last && current;

endmodule

// Bonus: edge detect pulse on the same rising edge, which must assume din is a registered input not subject to glitches

// module model (
//   input clk,
//   input resetn,
//   input din,
//   output dout
// );

//   wire pulse_now;  
//   logic last, dout_reg;

//   assign pulse_now = ~last && din;

//   always @(posedge clk) begin
//     if(~resetn) begin
//       last <= 0;
//       dout_reg <= 0;
//     end else begin
//       last <= din;
//     end
//   end

//   assign dout = pulse_now;
// endmodule
