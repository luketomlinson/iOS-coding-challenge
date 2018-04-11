import Foundation

func isStringSherlockable(_ string: String) -> Bool {

    let countedCharacters = NSCountedSet(array: Array(string))
    let countOfCounts = NSCountedSet(array: countedCharacters.map({ countedCharacters.count(for: $0) }))

    // all characters are counted equally
    if countOfCounts.count <= 1 {
        return true
    }

    // there are only two counts of characters, potential case to remove 1 character to get equal string
    if countOfCounts.count == 2 {
        let maxCount = countOfCounts.max { ($0 as! Int) < ($1 as! Int) }!
        let minCount = countOfCounts.min { ($0 as! Int) < ($1 as! Int) }!

        if (minCount as! Int) == 1 && countOfCounts.count(for: minCount) == 1 {
            return true
        }

        if countOfCounts.count(for: maxCount) == 1 && (maxCount as! Int) - (minCount as! Int) == 1 {
            return true
        }

    }

    // if there are 3 or more characters with different counts, can't make 1 change that fixes the strings
    return false
}

print("Should pass:")
let stringsThatShouldPass = [ "", "a", "ab", "aab", "aabb", "abcc", "aaab", "aabbc", "aabbcc", "aaabbcc" ]
stringsThatShouldPass.forEach {
    print("\"\($0)\": \(isStringSherlockable($0))")
}

print("\nShould fail:")
let stringsThatShouldFail = [ "abccc", "abccdd", "aaabbc", "aabbccddeefghi" ]
stringsThatShouldFail.forEach {
    print("\"\($0)\": \(isStringSherlockable($0))")
}
