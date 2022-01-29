import Foundation

var graph = [String: [String: Double]]()
graph["Start"] = [String: Double]()
graph["Start"]?["A"] = 10
graph["Start"]?["B"] = 2
graph["A"] = [String: Double]()
graph["A"]?["Finish"] = 100
graph["B"] = [String: Double]()
graph["B"]?["A"] = 1
graph["B"]?["Finish"] = 20
graph["Finish"] = [String: Double]()

var costs = [String: Double]()
costs["Start"] = 0
costs["Finish"] = Double.infinity


var parents = [String: String]()
var processed: [String] = [String]()

func calculateShotestPath() {
    var node = findLowestCostNode(in: costs, exclude: processed)
    while node != nil {
        let cost = costs[node!]
        let neighbors = graph[node!]
        for (neighbor, nCost) in neighbors! {
            let newCost = cost! + nCost
            if costs[neighbor] ?? Double.infinity > newCost {
                costs[neighbor] = newCost
                parents[neighbor] = node!
            }
        }
        processed.append(node!)
        node = findLowestCostNode(in: costs, exclude: processed)
    }
}

func findLowestCostNode(in costs: [String: Double], exclude: [String]) -> String? {
    var lowestCost = Double.infinity
    var lowestCostNode: String? = nil
    // Go through each node.
    for node in costs {
        let cost = node.value
        // If it's the lowest cost so far and hasn't been processed yet...
        if (cost < lowestCost) && !processed.contains(node.key) {
            // ... set it as the new lowest-cost node.
            lowestCost = cost
            lowestCostNode = node.key
        }
        
    }
    return lowestCostNode
}

calculateShotestPath()
print("Cost from the start to each node:")
print(costs)
print(parents)


extension String: Error {}


