
func printHistogram(arr: [Int]){
    var counter: [Int: Int] = [:]
    for num in arr {
        counter[num, default: 0] += 1
    }
    
    /// guard let maxCount = counts.values.max() else {return}
    
    let max = counter.values.max()!
    //print ("\(max)")
    for i in stride(from: max, through: 0, by: -1) {
        for (key, value) in counter{
            if i == 0 {
                print("\(key)", terminator: "")
            } else {
                if i > value {
                    print(" ", terminator: "")
                } else {
                    print("*", terminator: "")
                }
            }
        }
        print("\n")
        
    }
}

let arrOne = [3, 4, 2, 1, 6, 6, 4, 4]

let arrTwo = [8, 8, 8, 8, 6, 1, 1, 8, 1, 4]

printHistogram(arr: arrOne)
printHistogram(arr: arrTwo)

