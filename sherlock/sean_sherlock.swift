func sherlock(inputString: String)-> String{
    /// Create the counter Dictionary
    var counter: [Character: Int] = [:]

    /// Assign the counter Dictionary
    for character in inputString {
        counter[character, default: 0] += 1
    }
    
    /// Set the compare value to the first item in the dictionary
    /// Make the first item the errant value
    let compareVal = counter.first?.value
    /// Create an empty Character array to keep track of errant values
    var errantVals: [Character] = []
    for (key, value) in counter.reversed() {
        /// If the current value doesn't equal the compare value
        if value != compareVal {
            if (!errantVals.contains(key)){
                errantVals.append(key)
                if errantVals.count > 1 {
                    return "No"
                }
            }
        }
    }
    
    return "Yes"
}

var string1 = "aabcdefghiijjkklmnop"
var string2 = "aaabbbcccddd"

print (sherlock(inputString: string1))
print (sherlock(inputString: string2))
