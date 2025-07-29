`timescale 1ns/1ps

module ALU_tb;

reg [3:0] A, B;
reg [2:0] sel;
wire [3:0] result;

ALU uut (
    .A(A),
    .B(B),
    .sel(sel),
    .result(result)
);

initial begin
    $dumpfile("dump.vcd");     // Enable waveform output
    $dumpvars(0, ALU_tb);

    $display("Time\tSel\tA\tB\tResult\tOperation");
    A = 4'b0101; B = 4'b0011;

    sel = 3'b000; #10; $display("%0t\t%b\t%h\t%h\t%h\tADD", $time, sel, A, B, result);
    sel = 3'b001; #10; $display("%0t\t%b\t%h\t%h\t%h\tSUB", $time, sel, A, B, result);
    sel = 3'b010; #10; $display("%0t\t%b\t%h\t%h\t%h\tAND", $time, sel, A, B, result);
    sel = 3'b011; #10; $display("%0t\t%b\t%h\t%h\t%h\tOR", $time, sel, A, B, result);
    sel = 3'b100; #10; $display("%0t\t%b\t%h\t%h\t%h\tNOT A", $time, sel, A, B, result);

    $finish;
end

endmodule
