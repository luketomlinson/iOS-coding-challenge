//: Playground - noun: a place where people can play
// hackerrank.com/challenges/sherlock-and-valid-string/problem
// Valid strings have all characters occurring in the same frequency

func testString(_ input: String) {
    let chars = Array(input)
    var charCounts: [Character : Int] = [:] // [character : occurances of that character]

    for char in chars {
        charCounts[char, default: 0] += 1
    }

    var countCounts: [Int : Int] = [:] // [occurrences of a character : number of characters that have that number of occurrences]

    for (_, count) in charCounts {
        countCounts[count, default: 0] += 1
    }

    if countCounts.count > 2 {
        print("No")
        return
    }

    if countCounts.count == 1 {
        print("Yes")
        return
    }

    let firstCountCount = countCounts.popFirst()!
    let secondCountCount = countCounts.popFirst()!

    guard firstCountCount.value == 1 || secondCountCount.value == 1 else {
        print("No")
        return
    }

    if abs(firstCountCount.key - secondCountCount.key) == 1 {
        print("Yes")
        return
    }

    print("No")
    return
}

testString("aabb")
testString("aabbcc")
testString("aabbccc")
testString("aaabbbcccc")
testString("qwertyasdfghzxcvbn")
