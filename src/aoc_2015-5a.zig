/// Advent of Code 2015 Day 5 Part 1
/// --------------------------------
///
const std = @import("std");
const c = @cImport({
    @cDefine("PCRE2_CODE_UNIT_WIDTH", "8");
    @cInclude("pcre2.h");
});

extern fn pcre2_compile_8([*c]const u8, usize, u32, *c_int, ?*c.PCRE2_SIZE, ?*anyopaque) ?*anyopaque;
extern fn pcre2_match_data_create_from_pattern_8(?*anyopaque, ?*anyopaque) ?*anyopaque;
extern fn pcre2_match_8(?*anyopaque, [*c]const u8, usize, usize, u32, ?*anyopaque, ?*anyopaque) c_int;

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    var nice: i16 = 0; // nice count

    var en: c_int = undefined; // error number
    var eo: usize = undefined; // error offset
    const pattern = "^(?!.*(?:ab|cd|pq|xy))(?=.*(.)\\1)(?=(?:.*(?:a|e|i|o|u)){3}).*$";
    const re = pcre2_compile_8(pattern.ptr, pattern.len, 0, &en, &eo, null);
    const match_data = pcre2_match_data_create_from_pattern_8(re, null);

    const dr = @embedFile("./aoc_2015-5.dat"); // Naughty / nice list

    var readIter = std.mem.tokenize(u8, dr, "\n");
    while (readIter.next()) |line| {
        if (pcre2_match_8(re, line.ptr, line.len, // the subject string and length
            0, 0, // start at offset 0 in the subject, default options (/gm?)
            match_data, // block for storing the result
            null) >= 0) // use default match context
        {
            nice += 1;
        }
    }
    try stdout.print("Nice strings: {d}\n", .{nice});
    // Part 2 regex: /^(?=.*(..).*\\1)(?=.*(.).\\2).*$/gm
}
