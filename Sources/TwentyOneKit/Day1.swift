import Algorithms
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
        return zip(try input, try input.dropFirst())
            .lazy
            .filter { $0 < $1 }
            .count
    }
    
    func partTwo() throws -> Int {
        return zip(try input, try input.dropFirst(3))
            .lazy
            .filter { $0 < $1 }
            .count
    }
}

extension Day1 {
    enum ComparisonResult {
        case lower, higher
    }
}
