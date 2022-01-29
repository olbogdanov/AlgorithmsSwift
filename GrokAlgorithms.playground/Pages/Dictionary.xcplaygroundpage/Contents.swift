import Foundation

var voted : [String : Bool] = [:]

func checkVoter(_ name: String) -> String {
    if voted[name] == true {
        return "kick them out"
    } else {
//        var combinedAttributes : NSMutableDictionary! =  NSMutableDictionary(dictionary: voted)
//        combinedAttributes.addEntries(from: voted)
        voted[name] = true
        return "let them vote"
    }
}
var greeting = "Hello, playground"
print(checkVoter(greeting))
print(checkVoter(greeting))

