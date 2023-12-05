/// Advent of Code 2015 Day 4 Part 1
const std = @import("std");
const md5 = std.crypto.hash.Md5;

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    // const sc = "bgvyzdsv";

    var buf: [md5.digest_length]u8 = undefined;

    var j: i32 = 0;
    while (true) : (j += 1) {
        const alloc = std.heap.page_allocator;
        const s = try std.fmt.allocPrint(alloc, "bgvyzdsv{}", .{j});
        md5.hash(s, buf[0..], .{});

        for (buf, 0..) |b, i| {
            if (((i == 0 or i == 1) and b == 0x00) or (i == 2 and b <= 0x0f) or i == 3) {
                if (i == 3) {
                    try stdout.print("{d}\n", .{j});
                    return;
                }
            } else {
                break;
            }
        }
    }
}
