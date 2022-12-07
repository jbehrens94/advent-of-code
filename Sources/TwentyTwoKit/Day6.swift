import Algorithms
import Foundation

public final class Day6 {
    public let inputURL = Bundle.module.url(forResource: "Input/day6", withExtension: "txt")!
    
    private var input: String {
        get throws {
            return try String(contentsOf: inputURL)
        }
    }
    
    public init() {}
}

public extension Day6 {
    func partOne() throws -> Int {
        let result = try input
            .windows(ofCount: 4)
            .map { Set($0) }
            .enumerated()
            .first { $0.1.count == 4 }
        
        return result!.0 + 4
    }
    
    func partTwo() throws -> Int {
        return 0
    }
}
