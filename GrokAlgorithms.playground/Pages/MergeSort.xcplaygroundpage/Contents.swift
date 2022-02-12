import Foundation

func mergeSort(_ array: [Int]) -> [Int] {
    if array.count < 2 {
        return array
    }
    let middleIndex = array.count / 2
    let leftArray = mergeSort(Array(array[0..<middleIndex]))
    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
    return merge(leftArray, rightArray)
}

func merge(_ leftArray: [Int], _ rightArray: [Int]) -> [Int] {
    var sortedArray: [Int] = []
    var leftIndex = 0
    var rightIndex = 0
    while leftIndex < leftArray.count && rightIndex < rightArray.count {
        if leftArray[leftIndex] < rightArray[rightIndex] {
            sortedArray.append(leftArray[leftIndex])
            leftIndex += 1
        } else if rightArray[rightIndex] < leftArray[leftIndex] {
            sortedArray.append(rightArray[rightIndex])
            rightIndex += 1
        } else {
            sortedArray.append(leftArray[leftIndex])
            sortedArray.append(rightArray[rightIndex])
            leftIndex += 1
            rightIndex += 1
        }
    }
    while leftIndex < leftArray.count {
        sortedArray.append(leftArray[leftIndex])
        leftIndex += 1
    }
    while rightIndex < rightArray.count {
        sortedArray.append(rightArray[rightIndex])
        rightIndex += 1
    }
    return sortedArray
}

let unsortedArray = [1, 10, 30, 22, -1, 100, 40, 50, 2, 10000, 200000, -200, -1000000]
print(mergeSort(unsortedArray))


