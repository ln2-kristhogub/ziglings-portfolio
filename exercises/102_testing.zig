const std = @import("std");
const testing = std.testing;

// This is a simple function
// that builds a sum from the
// passed parameters and returns.
fn add(a: f16, b: f16) f16 {
    return a + b;
}

// The associated test.
// It always starts with the keyword "test",
// followed by a description of the tasks
// of the test. This is followed by the
// test cases in curly brackets.
test "add" {
    // The first test checks if the sum
    // of '41' and '1' gives '42', which
    // is correct.
    try testing.expect(add(41, 1) == 42);

    // Another way to perform this test
    // is as follows:
    try testing.expectEqual(42, add(41, 1));

    // This time a test with the addition
    // of a negative number:
    try testing.expect(add(5, -4) == 1);

    // And a floating point operation:
    try testing.expect(add(1.5, 1.5) == 3);
}

// Another simple function
// that returns the result
// of subtracting the two
// parameters.
fn sub(a: f16, b: f16) f16 {
    return a - b;
}

// The corresponding test
// is not much different
// from the previous one.
// Except that it contains
// an error that you need
// to correct.
test "sub" {
    //  Corrected expected value (10 - 5 = 5)
    try testing.expect(sub(10, 5) == 5);

    try testing.expect(sub(3, 1.5) == 1.5);
}

// This function divides the
// numerator by the denominator.
// Here it is important that the
// denominator must not be zero.
// This is checked and if it
// occurs an error is returned.
fn divide(a: f16, b: f16) !f16 {
    if (b == 0) return error.DivisionByZero;
    return a / b;
}

test "divide" {
    try testing.expect(divide(2, 2) catch unreachable == 1);
    try testing.expect(divide(-1, -1) catch unreachable == 1);
    try testing.expect(divide(10, 2) catch unreachable == 5);
    try testing.expect(divide(1, 3) catch unreachable == 0.3333333333333333);

    //  Correct error check for division by zero
    try testing.expectError(error.DivisionByZero, divide(15, 0));
}
