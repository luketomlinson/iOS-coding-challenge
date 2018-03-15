var inputOne = [3, 4, 2, 1, 6, 6, 4, 4]
var inputTwo = [8, 8, 8, 8, 6, 1, 1, 8, 1, 4]

func generateHistogram(with input: [Int]) {
    let datum = input.reduce([Int: Int](), arrayToDictionary)
    let orderedKeys = input.reduce([Int](), stripDuplicates)
    let rows = maxValue(from: datum)
    
    for index in (1...rows).reversed() {
        let rowString = string(for: index, datum: datum, keys: orderedKeys)
        print(rowString)
    }
    
    let keyString = orderedKeys.reduce("", generateKeyString)
    print(keyString)
    
}

func arrayToDictionary(result: [Int: Int], input: Int) -> [Int: Int] {
    var newResult = result
    if let occurences = result[input] {
        newResult[input] = occurences + 1
    } else {
        newResult[input] = 1
    }
    return newResult
}

func stripDuplicates(result: [Int], input: Int) -> [Int] {
    if result.contains(input) {
        return result
    } else {
        var newResult = result
        newResult.append(input)
        return newResult
    }
}

func maxValue(from datum: [Int: Int]) -> Int {
    var max = Int.min
    for key in datum.keys {
        if let value = datum[key], value > max {
            max = value
        }
    }
    return max
}

func generateKeyString(result: String, input: Int) -> String {
    var newResult = result
    newResult.append(String(input))
    return newResult
}

func string(for row: Int, datum: [Int: Int], keys: [Int]) -> String {
    var output = ""
    for key in keys {
        if let value = datum[key], value >= row {
            output.append("*")
        } else {
            output.append(" ")
        }
    }
    return output
}

generateHistogram(with: inputOne)
print("")
generateHistogram(with: inputTwo)
