import Foundation

public struct Day1 {
    public let inputURL = Bundle.module.url(forResource: "Input/day1", withExtension: "txt")!
    
    public init() {}
}

public extension Day1 {
    func partOne() throws -> Int {
        let inputString = try String(contentsOf: inputURL)
        let inputLines = inputString.split(separator: "\n")
        
        return 0
    }
}
