import Foundation

func printHistogram(values: [Int]) {
    let valueToFreqTable = values.reduce(into: [:]) { table, value in table[value, default: 0] += 1 }
    let uniques = valueToFreqTable.keys

    let freqToValuesTable = Dictionary(grouping: uniques, by: { valueToFreqTable[$0]! })
    var acc = [Int]()
    for freq in (1...freqToValuesTable.keys.max()!).reversed() {
        acc += (freqToValuesTable[freq] ?? [])
        var line = ""
        uniques.forEach { line += acc.contains($0) ? "*" : " " }
        print(line)
    }
    uniques.forEach { print($0, terminator:"") }
    print()
}


printHistogram(values: [3, 4, 2, 1, 6, 6, 4, 4, 1, 1, 1])
    *
   **
*  **
*****
62341

printHistogram(values: [8, 8, 8, 8, 6, 1, 1, 3, 4, 2, 1, 6, 6, 4, 4, 1, 1, 1])
     *
     *
    **
**  **
**  **
******
642381

printHistogram(values: [8, 8, 8, 8, 6, 1, 1, 8, 1, 4])
  * 
  * 
  **
  **
****
6481
