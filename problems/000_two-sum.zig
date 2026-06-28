const std = @import("std");

/// Given an array `list` of numbers (`usize`) and a `sum`,
/// identify the pair of indeces at which the numbers in `list`
/// sum to `sum`.
///
/// For example: for `list=[_]usize{ 1, 2, 3, 4, 5 }` and `sum=9`,
/// the function `solution` should return `[2]uszie{3, 4}` since
/// `list[3]+list[4]=4+5=9=sum`
///
/// You may expect that each `list` and `sum` has at least one
/// solution. You only need to return one, in any order.
pub fn solution(list: []const usize, sum: usize) ![2]usize {
    _ = list;
    _ = sum;
}

test "Two sum" {
    var prng = std.Random.DefaultPrng.init(0xCafeBabe);
    const random = prng.random();

    for (0..100) |_| {
        var numbers: [100]usize = undefined;
        for (&numbers) |*n| {
            n.* = random.intRangeAtMost(usize, 0, 100);
        }

        const i = random.uintLessThan(usize, numbers.len);
        var j = random.uintLessThan(usize, numbers.len);
        while (i == j) {
            j = random.uintLessThan(usize, numbers.len);
        }

        const target = numbers[i] + numbers[j];
        const result = try solution(&numbers, target);

        try std.testing.expect(result[0] != result[1]);

        try std.testing.expect(result[0] < numbers.len);
        try std.testing.expect(result[1] < numbers.len);

        try std.testing.expect(numbers[result[0]] + numbers[result[1]] == target);
    }
}
