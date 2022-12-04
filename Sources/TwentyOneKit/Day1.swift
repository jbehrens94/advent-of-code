import Foundation

public final class Day1 {
    public let inputURL = Bundle.module.url(forResource: "Input/day1", withExtension: "txt")!
    
    public var input: [Int] {
        get throws {
            return try String(contentsOf: inputURL)
                .split(separator: "\n")
                .map(String.init)
                .compactMap(Int.init)
        }
    }
    
    public init() {}
}

public extension Day1 {
    func partOne() throws -> Int {
        let inputs = try input.dropFirst()
        let result: [ComparisonResult] = try inputs
            .enumerated()
            .map { index, element in
                let previous = try input[index]
                let result: ComparisonResult = element > previous ?
                    .higher : .lower
                
                return result
            }
            .filter { $0 == .higher }
        
        return result.count
    }
    
    func partTwo() throws -> Int {
        return 0
    }
}

extension Day1 {
    enum ComparisonResult {
        case lower, higher
    }
}
