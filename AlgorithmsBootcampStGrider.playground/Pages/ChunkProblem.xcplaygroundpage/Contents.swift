import Foundation

func chunk(_ array: [Int], _ size: Int) -> [[Int]] {
    var arrayOfChanks = [[Int]]()
    for (index, value) in array.enumerated() {
        if (index % size == 0) {
            arrayOfChanks.append([Int]())
        }
        arrayOfChanks[arrayOfChanks.count-1].append(value)
    }
    return arrayOfChanks
}

func chunk2(_ array: [Int], _ size: Int) -> [[Int]] {
    var arrayOfChanks = [[Int]]()
    for value in array {
        let last = arrayOfChanks.last
        if last == nil || last?.count == size {
            arrayOfChanks.append([Int]())
        }
        arrayOfChanks[arrayOfChanks.count-1].append(value)
    }
    return arrayOfChanks
}

let chunk = [1, 2, 3, 4, 5, 6, 7, 8, 9]
print(chunk(chunk, 6))
