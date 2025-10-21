/* https://chipdev.io/question/30
Prompt

Thermometer (a.k.a. unary) coding is frequently used in digital systems applications to represent a natural number.  
In a thermometer code, a N-bit binary number is represented by a (2 ** N)-bit digital word, which has m zeros followed by (N - m) ones or vice-versa.

Implement a thermometer code detector.  The module has two ports, codeIn and isThermemeter.  The former is a 
DATA_WIDTH-bit unsigned binary word, and the latter is the signal that indicates whether or not the input is a thermometer code.  
The circuit must support both types of thermometer representations.  For instance, for an input word that is N-bit long, 
the detector must detect thermometer representations that use m zeros followed by (N - m) ones or m ones followed by (N - m) zeros.  
Output isThermemeter is one when a thermometer word is detected at the input and zero otherwise.

Input and Output Signals

    codeIn - Thermometer input word
    isThermometer - Output bit that indicates whether or not an input word is a thermometer code
*/

module model #(parameter
    DATA_WIDTH = 8
) (
    input [DATA_WIDTH-1:0] codeIn,
    output reg isThermometer
);

    //check cases of 1's followed by 0's unary forms
    logic [DATA_WIDTH-1:0] one_zero_therms = ~codeIn & ~codeIn+1; 

    assign isThermometer = ( (codeIn & codeIn+1) == 0 || one_zero_therms == 0 ) && 
                             (codeIn != '1) && 
                             (codeIn != '0) ? 1 : 0; 

endmodule

 
// BIT TRICK: x & x+1 turns off trailing 1's 
// This can be used as long as x is not '0 or '1.
// If x is of the form of something like 0011, bit trick will result in 0000
// and can be checked by comparing to '0 

