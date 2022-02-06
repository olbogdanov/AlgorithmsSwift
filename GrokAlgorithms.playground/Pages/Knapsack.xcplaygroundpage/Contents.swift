import Foundation

struct Item {
    let name: String
    let weight: Int
    let value: Int
}

let items = [Item(name: "television", weight: 1, value: 500),
             Item(name: "candlesticks", weight: 1, value: 300),
             Item(name: "stereo", weight: 5, value: 400),
             Item(name: "laptop", weight: 7, value: 1000),
]



func optimalItems(items: [Item], maxCapacity: Int) {
    var grid = [[Int]](
        repeating: [Int](repeating: 0, count: maxCapacity+1),
        count: items.count+1)
    for row in 1...items.count {
        let item = items[row-1]
        
        for column in 1...maxCapacity {
            
            if (item.weight > column) {
                grid[row][column] = grid[row-1][column]
                continue
            }
            else {
                grid[row][column] =
                max(
                    grid[row-1][column-item.weight] + item.value,
                    grid[row-1][column]
                )
            }
        }
    }

    // figure out solution from table
    var solution: [Item] = [Item]()
    var capacity = maxCapacity
    for i in stride(from: items.count, to: 0, by: -1) { // work backwards
        if grid[i - 1][capacity] != grid[i][capacity] {
            // did we use this item?
            solution.append(items[i - 1])
            capacity -= items[i - 1].weight
            // if we used an item, remove its weight
        }
    }
    print(solution)
}

optimalItems(items: items, maxCapacity: 7)
