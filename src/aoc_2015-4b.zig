/// Advent of Code 2015 Day 4 Part 2
const std = @import("std");
const md5 = std.crypto.hash.Md5;

pub fn main() !void { // my input: bgvyzdsv
    const stdout = std.io.getStdOut().writer();

    var buf: [md5.digest_length]u8 = undefined;
    const bm: u128 = 0xffff_ff00_0000_0000_0000_0000_0000_0000; // bitmask

    var j: i32 = 0;
    while (true) : (j += 1) {
        const alloc = std.heap.page_allocator;
        md5.hash(try std.fmt.allocPrint(alloc, "bgvyzdsv{}", .{j}), buf[0..], .{});
        if (std.mem.readInt(u128, buf[0..], .Big) & bm == 0) { // force big endian to swap
            try stdout.print("{d}\n", .{j}); //                   the byte order around
            return;
        }
    }
}
