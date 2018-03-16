//: Harman Histogram Challenge




func printHistogram(values: [Int]) {
    let counts = count(values)
    
    guard let maxCount = counts.values.max() else { return }
    
    for i in stride(from: maxCount, through: 0, by: -1) {

        for key in counts.keys {
            guard let value = counts[key] else { return }
            if i == 0 {
                print(key, terminator: "")
            } else {
                if i > value {
                    print(" ", terminator: "")
                } else {
                    print("*", terminator: "")
                }
            }
        }
        //Print something after to provide new line (playground quirk)
        print("")
    }
}

func count(_ values: [Int]) -> [Int:Int] {
    var counts = [Int:Int]()
    
    for integer in input {
        var newValue = 1
        if let value = counts[integer] {
            newValue = value + 1
        }
        counts.updateValue(newValue,forKey: integer)
    }
    
    return counts
}

let input = [8, 8, 8, 8, 6, 1, 1, 8, 1, 4]
printHistogram(values: input)
