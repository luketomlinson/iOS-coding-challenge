// Joshua Evan Queen

import UIKit

func printHistogram(arrayVals: [Int]) {
    // Create an empty dictionary
    var weightsDictionary = [Int: Int]()

    // for each unique value in arrayVals create a key in the dict with a value 1, if a key repeats increment the value by 1
    for num in arrayVals {
        if weightsDictionary.keys.contains(num) {
            weightsDictionary.updateValue((weightsDictionary[num]?.unsafeAdding(1))!, forKey: num)
        } else {
            weightsDictionary.updateValue(1, forKey: num)
        }
    }

    // Grab the heaviest weight in the dict
    var currMax = weightsDictionary.values.max()

    // Decrement currMax for each iteration until currMax is less than 1
    while currMax! >= 1 {
        // Iterate through the weights, printing either a space or *.
        for (_, weight) in weightsDictionary {
            if weight < currMax! {
                print(" ", terminator: "")
            } else {
                print("*", terminator: "")
            }
        }
        currMax = currMax!.unsafeSubtracting(1)
        print()
    }

    // Collection of keys for easy converstion to String Array for printing
    let lazyMapCollection = weightsDictionary.keys
    let stringArray = Array(lazyMapCollection.map { String($0) })
    print(stringArray.joined(separator: ""))
}

printHistogram(arrayVals: [3, 4, 2, 1, 6, 6, 4, 4])
