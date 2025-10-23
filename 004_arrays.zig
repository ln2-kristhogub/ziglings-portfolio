const std = @import("std");

pub fn main() void {
    // This "const" is going to cause a problem later - can you see what it is?
    // We fix it by using 'var' because we modify the array below.
    var some_primes = [_]u8{ 1, 3, 5, 7, 11, 13, 17, 19 };

    // Change the first prime to 2 (which is correct)
    some_primes[0] = 2;

    // Access array elements
    const first = some_primes[0];

    // Arrays are zero-indexed, so the 4th element is at index 3.
    const fourth = some_primes[3];

    // Use the .len property to get the number of elements in the array
    const length = some_primes.len;

    // Print the results
    std.debug.print("First: {}, Fourth: {}, Length: {}\n", .{
        first, fourth, length,
    });
}
