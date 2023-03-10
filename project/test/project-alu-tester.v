`timescale 1ns / 1ns
`include "project/src/project-alu.v"

module mini_alu_tb;

  reg  [31:0] a;
  reg  [31:0] b;
  reg  cin;
  reg  [3:0] opcode;
  wire [31:0] y;
  wire [3:0] flags;

  mini_alu uut (
    .a(a),
    .b(b),
    .cin(cin),
    .opcode(opcode),
    .y(y),
    .flags(flags)
  );

  initial begin
  // #3 $display("Test 1: postive number and negative number");
  // $display("Test 1: A: positive, B: negative, no carry \n");
  #10
    
  //   a = 32'b0000000000001100;
  //   b = -32'b0000000000110011;
  //   cin = 1'b0;
  //   opcode = 4'b0000;
  //   repeat (15) #20 opcode = opcode + 4'b0001;

  //   #100
  //   $display("\n");

    // #3 $display("Test 2: negative number and negative number");
    // a = -32'b0000000000001100;
    // b = -32'b0000000000110011;
    // cin = 1'b0;
    // opcode = 4'b0000;
    // repeat (15) #20 opcode = opcode + 4'b0001;

    // #100
    // $display("\n");

    // #3 $display("Test 2: negative number and negative number");
    // a = 32'b01111111111111111111111111110011;
    // b = 32'b0100000000001100;

    // #100
    // $display("\n");

    // ---------------------------------------------------------

    // a = 32'b00000000000000000000000000000001;
    // b = 32'b10111111111111111111111111111111;

    a = 32'b00000000000000000000000000000000;
    b = 32'b00000000000000000000000000000001;

    cin = 1'b0;
    opcode = 4'b0000;
    repeat (15) #20 opcode = opcode + 4'b0001;

    // #3 $display("Tesst 3: Numbers that trigger carry");
    // a = 32'b1111111111111111;
    // b = -32'b1111111111111111;
    // cin = 1'b1;
    // opcode = 4'b0000;
    // repeat (7) #10 opcode = opcode + 4'b0001;


    // if (y !== 32'h00000000 || flags !== 4'b1000) $error("Test failed for ADD operation with flags");
    end
    initial begin
    
    #10 $display("opcode |      A      |      B      |      Y      | flags");
    #15 $monitor("%b   | %d | %d | %d | %b | %b", opcode, a, b, y, flags, uut.carry);
    end



endmodule
