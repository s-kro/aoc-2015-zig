/// Advent of Code 2015 Day 1 Part 1
const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    var fl: i16 = 0; // _floor _level

    const dr = @embedFile("./aoc_2015-1.dat"); // _di_rections

    var i: usize = 0; // _intruction count
    // var it = std.mem.split(u8, floors, '');
    while (i < dr.len) { // No Zig-ish way to do this ?????
        if (dr[i] == '(') {
            fl += 1;
        } else if (dr[i] == ')') {
            fl -= 1;
        }
        i += 1;
    }
    try stdout.print("Santa ended up on floor: {d}\n", .{fl});
}
