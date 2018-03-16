//: Playground - noun: a place where people can play

import UIKit

let integers = [1, 8, 6, 4, 5, 9, 8, 7, 7, 5, 22, 2, 4, 9, 5, 7,6 , 3, 8, 9, 1, 5, 4, 2, 22, 22, 99, 99, 99, 99, 12, 15, 12342, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5]

func printHistogram(integers: [Int]) {

    let countsOfIntegers: [Int: Int] = integers.reduce(into: [Int: Int]()) { (result, int) in
        result[int, default: 0] += 1
    }

    let maxCount = countsOfIntegers.max { $0.value < $1.value }?.value
    let sortedIntegerPairs = countsOfIntegers.sorted(by: { $0.key < $1.key })

    let padding: Int = 1

    if let maxCount = maxCount {
        for i in 0..<maxCount {
            let rowString = sortedIntegerPairs.reduce(into: "", { (string, integerPair) in
                let integerWidth = String(integerPair.key).count
                let isFilledIn = (integerPair.value >= maxCount - i)
                let columnString = padString(String(repeating: isFilledIn ? "█" : " ", count: integerWidth), onBothSidesWith: " ", paddingAmount: padding)
                string += columnString
            })
            print(rowString)
        }
    }

    let integersString: String = sortedIntegerPairs.reduce(into: "") { (string, integerPair) in
        string += padString(String(integerPair.key), onBothSidesWith: " ", paddingAmount: padding)
    }

    print(integersString)

}

func padString(_ string: String, onBothSidesWith paddingString: String, paddingAmount: Int) -> String {
    let expandedPaddingString = String(repeating: paddingString, count: paddingAmount)
    return expandedPaddingString + string + expandedPaddingString
}

printHistogram(integers: integers)
