import Foundation

/// reverse string without using str.reverse() function
func reverse(_ str: String) -> String {
    var reversedArray = Array<Character>()
    for i in str {
        reversedArray.insert(i, at: 0)
    }
    return String(reversedArray)
}

print(reverse("hello"))
