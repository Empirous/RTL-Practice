/* https://chipdev.io/question/21
Prompt

Design a circuit that counts incrementally for a maximum number of cycles, MAX_CYCLES.   
At all cycles, the circuit should determine whether or not the counter value is evenly 
divisible by parameters FIZZ, BUZZ, or both.  

The counter value should monotonically increase when the reset signal (resetn) is de-asserted. 
The counter sequence is expected to start from 0 and be MAX_CYCLES long, 
restarting from 0 when MAX_CYCLES is reached (e.g. for MAX_CYCLES = 100:  0, 1, 2, 3, ..., 99, 0, 1, ...).

As the circuit counts, output fizz should be asserted if the current counter value is evenly divisible by FIZZ.  
buzz should output 1 when the current counter value is divisible by BUZZ.  
Finally, output fizzbuzz should be 1 when counter is evenly divisible by both FIZZ and BUZZ. 

Input and Output Signals

    clk - Clock signal
    resetn - Synchronous, active low, reset signal
    fizz - Output Fizz
    buzz - Output Buzz
    fizzbuzz - Output FizzBuzz

Output signals during reset

    fizz - 1
    buzz - 1
    fizzbuzz - 1
*/

module model #(parameter
    FIZZ=3,
    BUZZ=5,
    MAX_CYCLES=100
) (
    input clk,
    input resetn,
    output logic fizz,
    output logic buzz,
    output logic fizzbuzz
);
    integer counter = 0;
    always @(posedge clk) begin
        if(~resetn | counter == MAX_CYCLES-1)
            counter <= 0;
        else
            counter <= counter + 1;
    end

    always_comb begin
        fizz = (counter % FIZZ) == 0;
        buzz = (counter % BUZZ) == 0;
        fizzbuzz = fizz && buzz;
    end
endmodule
