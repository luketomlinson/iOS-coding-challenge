let countSymbol: Character = "*"
let spacerSymbol: Character = " "

private extension Array {
    func counts() -> [String: Int] {
        var outputDict: [String: Int] = [:]
        for element in self {
            let stringElement = String(describing: element)
            if outputDict[stringElement] == nil {
                outputDict[stringElement] = 1
            } else {
                outputDict[stringElement] = outputDict[stringElement]! + 1
            }
        }
        return outputDict
    }
}

func printHistogram(values: [Int]) -> Void {
    let counts = values.counts()
    guard let maxHeight = counts.values.max() else { 
        return 
    }
    for row in stride(from: maxHeight, to: 0, by: -1) {
        var rowString = String()
        for column in counts {
            if column.value >= row {
                rowString.append(countSymbol)
            } else {
                rowString.append(spacerSymbol)
            }
            rowString.append(String(repeating: spacerSymbol, count: column.key.count))
        }
        print(rowString)
    }
    let valuesString = counts.keys.joined(separator: String(spacerSymbol))
    print(valuesString)
}

printHistogram(values: [1,2,1,1,11,1,1,1,2,2,2,2,3,1])
