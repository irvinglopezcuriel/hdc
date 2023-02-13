/*****************************************************************
What inference needs to do:
Compares a query vector with class hypervectors, then outputs
a value corresponding to the class it matched the most with.
Optionaly produces an accuracy factor that can represent confidence
in match.

Inference Control blocks:

   input    |      functions      |   output   |
------------+---------------------+------------+--
class_hv_0  |  compare(xor)       |match(value)|
class_hv_1  |  getAcc             |accuracy    |
query       |                     |            |
            |                     |            |
size        |                     |            |

Error Handling:
 - query hv & class hv must be quantized
 - all hv's must be the same length
 - special case if query has same # of diff w/both
*****************************************************************/

module inferenceControl(
    input class_hv_0, class_hv_1,
    input query,
    input size,
    output logic match,
    output logic accuracy
);

    assign size = 10000;

    logic[13:0] diffCounter0 = 0;
    logic[13:0] diffCounter1 = 0;
    initial begin
        //compare query indexes with class hv indexes using xor
        for(logic[13:0] i = 0; i < size; i = i + 1) begin
            if(query ^ class_hv_0 == 1) diffCounter0 = diffCounter0 + 1;
            else diffCounter1 = diffCounter1 + 1;
        end

        //determine closest match from diff counters
        if (diffCounter0 < diffCounter1) begin
            match = 0;
            accuracy = 1 - diffCounter0/size;
        end
        else begin
            match = 1;
            accuracy = 1 - diffCounter0/size;
        end

    end

endmodule