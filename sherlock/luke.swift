func isValid(string: String) -> Bool {
    
    //get the frequency of characters e.g (a:1, b:2, c:1)
    //then get the count of a certain frequency e.g. : (1: 2, 2: 1)
    let countOfCounts = string.reduce(into:[Character: Int]()) { result, next in
        result[next, default: 0] += 1
    }.values.reduce(into: [Int: Int]()) { (result: inout [Int: Int], next: Int) in
        result[next, default: 0] += 1
    }
    
    //get most common and least common character frequencies
    guard
        let mostCommonCount = countOfCounts.max(by: {$0.value < $1.value}),
        let leastCommonCount = countOfCounts.min(by: {$0.value < $1.value})
    else {
        return false
    }
    
    switch countOfCounts.count {
    case 1: 
        // all characters have the same frequency
        return true
    case 2 where leastCommonCount.key == mostCommonCount.key + 1:
        //there are only 2 frequencies and the least common could be deleted to make the string valid
        return true
    case 2 where leastCommonCount.key == 1 && leastCommonCount.value == 1:
        //there are only 2 frequencies, but there is only 1 other one and it could be deleted
        return true
    default:
        //any count > 2 will be invalid 
        return false
    }
}

func isValidSherlockString(_ string: String) -> String {
    return isValid(string: string) ? "YES" : "NO"
}

print(isValidSherlockString("abcde"))
print(isValidSherlockString("aabbccddee"))
print(isValidSherlockString("aabbccdde"))
print(isValidSherlockString("aabbccddeeee"))
print(isValidSherlockString("abcdefgabcdefgh"))
