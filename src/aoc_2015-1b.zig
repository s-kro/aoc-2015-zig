/// Advent of Code 2015 Day 1 Part 2
const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    var fl: i16 = 0; // floor level
    var bi: usize = 0; // basement instruction
    const dr = @embedFile("./aoc_2015-1.dat"); // Santa's directions

    for (dr) |c, i| { // loop through the string!
        if (c == '(') {
            fl += 1;
        } else if (c == ')') {
            fl -= 1;
        }
        if (fl < 0) { // just entered the basement
            bi = i + 1; // Count like a human
            break;
        }
    }
    try stdout.print("Instruction {d} first sent Santa to the basement.\n", .{bi});
}
