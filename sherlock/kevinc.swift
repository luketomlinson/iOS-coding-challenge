#!/usr/bin/env swift

struct CountedSet<Element : Hashable> {

    private let counts: [Element : Int]

    init<S>(_ sequence: S)
        where S : Sequence, S.Iterator.Element == Element
    {
        counts = sequence.reduce(into: [:]) { (result, element) in
            result[element, default: 0] += 1
        }
    }

    private init(counts: [Element : Int]) {
        self.counts = counts.filter { (_, count) in 0 < count }
    }

    subscript(_ element: Element) -> Int {
        return counts[element] ?? 0
    }

    var keys: Dictionary<Element, Int>.Keys {
        return counts.keys
    }

    func decrementing(_ element: Element) -> CountedSet<Element> {
        var counts = self.counts
        counts[element, default: 0] -= 1
        return CountedSet(counts: counts)
    }

}

enum SherlockResult {

    case valid
    case invalid

    init(string: String) {
        // Count the occurrences of characters in the string.
        let countsByCharacter = CountedSet(string)

        // Determine minimum and maximum counts of characters.
        let counts = countsByCharacter.keys.map { character in countsByCharacter[character] }
        let minimumCount = counts.reduce(.max, min)
        let maximumCount = counts.reduce(.min, max)

        // If all counts are the equal, the string is valid.
        guard minimumCount != maximumCount else {
            self = .valid
            return
        }

        // When not all counts are equal, the string can only be valid
        // if the maximum count is one greater than the minimum count.
        guard maximumCount == minimumCount + 1 else {
            self = .invalid
            return
        }

        // Count the occurrences of counts of occurcences of characters in the string.
        let countsByCount = CountedSet(counts)

        // When all counts are either the maximum or one less than the maximum,
        // the string is valid if and only if exactly one character has the maximum count.
        self = countsByCount[maximumCount] == 1 ? .valid : .invalid
    }

}

extension SherlockResult: CustomStringConvertible {

    var description: String {
        switch self {
        case .valid:
            return "YES"
        case .invalid:
            return "NO"
        }
    }

}

print(SherlockResult(string: "abc")) // valid
print(SherlockResult(string: "abcc")) // valid
print(SherlockResult(string: "abccc")) // invalid
print(SherlockResult(string: "aabbcd")) // invalid
print(SherlockResult(string: "aabbccddeefghi")) // invalid
