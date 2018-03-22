//: jrtb's histogram

// import UIKit

func printHistogram(with values: [Int]) {
    print("Input: \(values)")
    print("Output:")

    var uniques = Set<Int>()
    values.map { uniques.insert($0) }

    let counts = uniques.map { value in values.filter { $0 == value }.count }
    
    let maxX = counts.count
    let maxY = counts.max() ?? 0

    for y in (0 ..< maxY).reversed() {
        for x in 0 ..< maxX {
            if counts[x] > y {
                print("*", terminator: "")
            } else {
                print(" ", terminator: "")
            }
        }
        print()
    }
    
    uniques.map { print("\($0)", terminator: "") }
    print("\n")
}

printHistogram(with: [3,4,2,1,6,6,4,4])
printHistogram(with: [8,8,8,8,6,1,1,8,1,4])
