func frequencyMapping(_ array: [Int]) -> [Int: Int] {
    return array.reduce(into: [Int: Int]()) { $0[$1] = ($0[$1] == nil) ? 1 : $0[$1]! + 1 }
}

func printCollection(collection: [Int: Int], delimiter: String = " ") {

    let descendingCollection = collection.sorted { $0.value > $1.value }
    let keyStrings = descendingCollection.map{$0.key}.map(String.init)
    let maxPrintWidth: Int = keyStrings.map{ $0.count }.max() ?? 0
    let spacing = String(repeating: delimiter, count: maxPrintWidth)
    let maxFrequency = descendingCollection.first?.value ?? 0

    for i in stride(from: maxFrequency, to: 0, by: -1) {
        print(descendingCollection.reduce("") { $0 + ($1.value >= i ? "*" : "") + spacing })
    }

    let lastLine = keyStrings.reduce(into: (spacing: "", line: "")) { partial, key in
        partial.line += partial.spacing + key
        partial.spacing = String(repeating: delimiter, count: (maxPrintWidth - key.count + 1))
    }.line

    print(lastLine)
}

func printHistogram(_ values: [Int]) {
    let frequencies = frequencyMapping(values)
    printCollection(collection: frequencies)
}

let testArray = [1,2,3,423,22,23,4,8,9,2,100,99,12345,12345,1235]

printHistogram(testArray)

