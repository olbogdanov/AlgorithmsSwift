import Foundation

/// Write a function that accepts a positive namber N.
/// The function should console log a step shape with N levels
/// using the # character. The step has spaces on the right hand side!
/// example
/// steps(3)
/// "#   "
/// "## "
/// "###"

func steps(_ n: Int) {
    var step = Array.init(repeating: " ", count: n)
    for i in 0...n-1 {
        step[i] = "#"
        print(step.joined(separator: ""))
    }
}

steps(5)
