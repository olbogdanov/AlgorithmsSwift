import Foundation

struct Item {
    let name: String
    let weight: Int
    let value: Int
}

let items = [Item(name: "television", weight: 1, value: 500),
    Item(name: "candlesticks", weight: 1, value: 300),
    Item(name: "stereo", weight: 5, value: 400),
    Item(name: "laptop", weight: 7, value: 100000),
]



func optimalItems(items: [Item], maxCapacity: Int) {
    var grid = [[Int]](
        repeating: [Int](repeating: 0, count: maxCapacity+1),
        count: items.count+1)
    for (itemIndex, item) in items.enumerated() {

        for cap in 1...maxCapacity {

            if (item.weight > cap) {
                grid[itemIndex+1][cap] = grid[itemIndex][cap]
                continue
            }
            else {
                grid[itemIndex+1][cap] =
                max(
                    item.value + grid[itemIndex][cap-item.weight],
                    grid[itemIndex][cap]
                )
            }
        }
    }
    print(grid)
}

optimalItems(items: items, maxCapacity: 7)
