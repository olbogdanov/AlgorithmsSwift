// --- Directions
// Write a function that returns the number of vowels
// used in a string. Vowels are the characters a, e, i, o and u

import Foundation

func vowels(_ str: String) -> Int {
    let vowels: Set<String> = ["a", "e", "i", "o", "u"]
    let filteredStr = str.filter { it in
        vowels.contains(it.lowercased())
    }
    return filteredStr.count
}

assert(vowels("aeiou") == 5)
assert(vowels("Hallo") == 2)
assert(vowels("HALLO WALLI AND EVA") == 7)

func vowelsRegex(_ str: String) -> Int {
    let range = NSRange(location: 0, length: str.count)
    let regex = try! NSRegularExpression(pattern: "[aeiou]", options: NSRegularExpression.Options.caseInsensitive)
    return regex.matches(in: str, range: range).count
}

assert(vowelsRegex("aeiou") == 5)
assert(vowelsRegex("Hallo") == 2)
assert(vowelsRegex("HALLO WALLI AND EVA") == 7)


