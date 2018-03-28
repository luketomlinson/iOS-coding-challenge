//: Playground - noun: a place where people can play

import Foundation

func printHistogram(values:[Int]) {
    let set = NSCountedSet(array:values)
    let counts = set.map { set.count(for:$0) }
    let height = counts.max()!
    for line in stride(from: height, to: 0, by: -1) {
        for count in counts {
            let char = (count >= line) ? "*" : " "
            print(" ", char, terminator: "")
        }
        print("")
    }
    print("")
    print(Array(set))
}

printHistogram(values: [3,4,2,1,6,6,4,4])