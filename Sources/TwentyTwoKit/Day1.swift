import Foundation

public final class Day1 {
    public let inputURL = Bundle.module.url(forResource: "Input/day1", withExtension: "txt")!
    
    private var input: [[Int]] {
        get throws {
            let inputString = try String(contentsOf: inputURL)
            return inputString
                .split(separator: "\n\n")
                .map { $0.components(separatedBy: "\n") }
                .map { $0.compactMap(Int.init) }
        }
    }
    
    public init() {}
}

public extension Day1 {
    func partOne() throws -> Int {
        return try input
            .map { $0.reduce(0, +) }
            .sorted(by: >)
            .first!
    }
    
    func partTwo() throws -> Int {
        return try input
            .map { $0.reduce(0, +) }
            .sorted(by: { $0 > $1 })
            .prefix(3).reduce(0, +)
    }
}
