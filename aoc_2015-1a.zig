/// Advent of Code 2015 Day 1 Part 1
const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    var fl: i16 = 0; // floor level

    const dr = @embedFile("./aoc_2015-1.dat"); // Santa's directions

    for (dr) |c| {
        if (c == '(') {
            fl += 1;
        } else if (c == ')') {
            fl -= 1;
        }
    }
    try stdout.print("Santa ended up on floor: {d}\n", .{fl});
}
