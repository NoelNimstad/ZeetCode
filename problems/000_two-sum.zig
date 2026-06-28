const std = @import("std");

// Expect that each `list` and `sum` has at least one solution.
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
