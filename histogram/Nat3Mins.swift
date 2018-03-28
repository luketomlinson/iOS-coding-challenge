//: Playground - noun: a place where people can play

//NATS THREE MINUTE SOLUTION
import Foundation

func printHistogram(values:[Int]) {
    let set = NSCountedSet(array:values)
    let counts = set.map { set.count(for:$0) }
    let height = counts.max()
    // SOMETHING LIKE THS
//    for (i, num) in set.enumerated() {
//        for height in height...1 {
//            print(i, num, height)
//        }
//    }
    
}

printHistogram(values: [3,4,2,1,6,6,4,4])
