#!/usr/bin/env swift

private func countsByNumber(of numbers: [Int]) -> [Int : Int] {
    var counts: [Int : Int] = [:]

    for number in numbers {
        counts[number, default: 0] += 1
    }

    return counts
}

private func histogramString(forCountsByNumber countsByNumber: [Int : Int]) -> String {
    // Ensure a consistent order when iterating over elements.
    let pairs = Array(countsByNumber)

    // Decide the Y-axis values.
    let rowCount = countsByNumber.values.reduce(0, max) // e.g. 5
    let rowValues = (1 ... rowCount).reversed() // 5, 4, …1

    // Make a string like "  * " for each line in the histogram.
    let rows = rowValues.map { rowValue in
        pairs.map { (_, count) in
            rowValue <= count ? "*" : " "
        }.joined()
    }

    // Make a string for the axis labels as the last line.
    let labels = pairs.map { (number, _) in
        String(number)
    }.joined()

    // Join all the lines.
    return (rows + [labels]).joined(separator: "\n")
}

func printHistogram(forNumbers numbers: [Int]) {
    let counts = countsByNumber(of: numbers)
    let histogram = histogramString(forCountsByNumber: counts)
    print(histogram)
}

printHistogram(forNumbers: [8, 8, 8, 8, 6, 1, 1, 8, 1, 4])
