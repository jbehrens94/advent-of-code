import Algorithms
import Foundation

public final class Day2 {
    public let inputURL = Bundle.module.url(forResource: "Input/day2", withExtension: "txt")!
    
    public var input: [Direction] {
        get throws {
            return try String(contentsOf: inputURL)
                .split(separator: "\n")
                .map { $0.split(separator: " ") }
                .map {
                    let string = String($0.first!)
                    let int = Int(String($0.last!))!
                    
                    return (string, int)
                }
                .map(Direction.init)
        }
    }
    
    public init() {}
}

public extension Day2 {
    func partOne() throws -> Int {
        let depth = try input
            .reduce(0, { partialResult, direction in
                if case let Direction.down(depth) = direction {
                    return partialResult + depth
                } else if case let Direction.up(depth) = direction {
                    return partialResult - depth
                }
                
                return partialResult
            })
        
        let forward = try input
            .reduce(0, { partialResult, direction in
                if case let Direction.forward(distance) = direction {
                    return partialResult + distance
                }
                
                return partialResult
            })

        return depth * forward
    }
    
    func partTwo() throws -> Int {
        var depth = 0
        var forward = 0
        var aim = 0
        
        try input.forEach { direction in
            switch direction {
            case let .down(distance):
                aim += distance
            case let .up(distance):
                aim -= distance
            case let .forward(distance):
                forward += distance
                depth += aim * distance
            }
        }
        
        return depth * forward
    }
}

public extension Day2 {
    enum Direction {
        case forward(Int),
             down(Int),
             up(Int)
        
        init(_ value: (axis: String, distance: Int)) {
            switch value.axis {
            case "forward":
                self = .forward(value.distance)
            case "down":
                self = .down(value.distance)
            case "up":
                self = .up(value.distance)
            default:
                fatalError("Axis not supported: \(value.axis)")
            }
        }
    }
}
