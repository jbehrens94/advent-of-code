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
        let threshold = 4
        let result = try input
            .windows(ofCount: threshold)
            .map(Set.init)
            .enumerated()
            .first { $0.element.count == threshold }
        
        return result!.offset + threshold
    }
    
    func partTwo() throws -> Int {
        let threshold = 14
        
        let result = try input
            .windows(ofCount: threshold)
            .map(Set.init)
            .enumerated()
            .first { $0.element.count == threshold }
        
        return result!.offset + threshold
    }
}
