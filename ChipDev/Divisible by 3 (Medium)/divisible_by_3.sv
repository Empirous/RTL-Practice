/* https://chipdev.io/question/16
Prompt

Design a circuit that determines whether an input value is evenly divisible by three.

The input value is of unknown length and is left-shifted one bit at a time into the circuit via the input (din). The circuit should output a 1 on the output (dout) if the current cumulative value is evenly divisible by three, and a 0 otherwise.

When resetn is asserted, all previous bits seen on the input are no longer considered. The 0 seen during reset should not be included when calculating the next value.

This problem is tricky, so it may help to think in terms of modulus and remainder states.
Input and Output Signals

    clk - Clock signal
    resetn - Synchronous reset-low signal
    din - Input bit
    dout - 1 if the current value is divisible by 3, 0 otherwise.

Output signals during reset

    dout - 0 when resetn is asserted
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
    XXX
  } state_e;

  state_e state, next;
  logic n_dout;

  always_ff @ (posedge clk)
    if (~resetn) state <= START;
    else         state <= next;

  always_comb begin
    next = XXX;
    case (state)
      START : next = din ? REM1 : REM0;
      REM0  : next = din ? REM1 : REM0;
      REM1  : next = din ? REM0 : REM2;
      REM2  : next = din ? REM2 : REM1;
    endcase
  end

  always_comb begin
      dout = (state == REM0) ? 1 : 0;
  end
  
endmodule

// Brief Explanation

// As you track the input bits, you can also follow the resulting remainder.
// You can consider that as each bit enters, you are logical shifting left by one, 
// then adding the next input bit. Logical shifting left by one is multiplying by 2.
// So for example if you currently had a remainder of 2 and you next input was 1, 
// then multiplying the remainder by 2 and adding the input 1 bit gives you (2*2) + 1 = 5
// In modulus 3, 5%3 would result in a remainder of 2 again, so we remain in the REM2 state.
