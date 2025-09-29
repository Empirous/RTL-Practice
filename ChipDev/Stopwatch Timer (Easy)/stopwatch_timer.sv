/* https://chipdev.io/question/14
Prompt

Build a module which controls a stopwatch timer.

The timer starts counting when the start button (start) is pressed (pulses) and increases by 1 every clock cycle. When the stop button (stop) is pressed, the timer stops counting. When the reset button (reset) is pressed, the count resets to 0 and the timer stops counting.

If count ever reaches MAX, then it restarts from 0 on the next cycle.

stop's functionality takes priority over start's functionality, and reset's functionality takes priority over both stop and start's functionality.
Input and Output Signals

    clk - Clock signal
    reset - Synchronous reset signal
    start - Start signal
    stop - Stop signal
    count - Current count

Output signals during reset

    count - 0 when reset is active
*/

module model #(parameter
  DATA_WIDTH = 16,
  MAX = 99
) (
    input clk,
    input reset, start, stop,
    output logic [DATA_WIDTH-1:0] count
);

  logic counting = 0;
  logic [DATA_WIDTH-1:0] counter = 0;

  always @(posedge clk) begin
    if(reset) begin
      counting = 0;
      counter = 0;
    end else if (stop) begin
      counting = 0;
    end else if (start && ~counting) begin
      counting = 1;
    end 
    
    if (counting) begin
      if(counter == MAX)
        counter = 0;
      else
        counter += 1;
    end

  end

  assign count = counter;

endmodule
