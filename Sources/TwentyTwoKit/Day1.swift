import Foundation

public struct Day1 {
    public let inputURL = Bundle.module.url(forResource: "Input/day1", withExtension: "txt")!
    
    public init() {}
}

public extension Day1 {
    func partOne() throws -> Int {
        let inputString = try String(contentsOf: inputURL)
        let input: [[Int]] = inputString
            .split(separator: "\n\n")
            .map { string in
                string
                    .components(separatedBy: "\n")
                    .compactMap(Int.init)
            }
        
        let highest = input.map { elf in
            return elf.reduce(0, +)
        }
        .max()!
        
        return highest
    }
}
