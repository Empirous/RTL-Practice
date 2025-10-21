/* https://chipdev.io/question/17
Prompt

Design a module that determines whether an input value is evenly divisible by five.

The input value is of unknown length and is left-shifted one bit at a time into the module via the input (din). 
The module should output a 1 on the output (dout) if the current cumulative value is evenly divisible by five and a 0 otherwise.

When resetn is asserted, all previous bits seen on the input are no longer considered. 
The 0 seen during reset should not be included when calculating the next value.

This problem is tricky, so it may help to think in terms of modulus and remainder states.
Input and Output Signals

    clk - Clock signal
    resetn - Synchronous reset-low signal
    din - Input bit
    dout - 1 if the current value is divisible by 5, 0 otherwise.

Output signals during reset

    dout - 0 when resetn is active
*/

module model (
  input clk,
  input resetn,
  input din,
  output logic dout
);

  typedef enum {
      START,
      REM0,
      REM1,
      REM2,
      REM3,
      REM4,
      XXX
    } state_e;

  state_e state, next;

  always_ff @ (posedge clk)
    if (~resetn) state <= START;
    else         state <= next;

  always_comb begin
      next = XXX;
      case (state)
        START : next = din ? REM1 : REM0;
        REM0  : next = din ? REM1 : REM0;
        REM1  : next = din ? REM3 : REM2;
        REM2  : next = din ? REM0 : REM4;
        REM3  : next = din ? REM2 : REM1;
        REM4  : next = din ? REM4 : REM3;
      endcase
  end

  always_comb begin
    dout = (state == REM0) ? 1 : 0;
  end

endmodule

// Refer to Divisible by 3 (Medium) for solution explanation. 
// The solution to divisible by 5 is just an expansion of the divisible by 3 solution.


