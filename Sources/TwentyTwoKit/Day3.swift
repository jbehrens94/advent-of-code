import Foundation

public final class Day3 {
    let alphabet = String("abcdefghijklmnopqrstuvwxyz")
    
    public let inputURL = Bundle.module.url(forResource: "Input/day3", withExtension: "txt")!
    
    private var input: [String.SubSequence] {
        get throws {
            return try String(contentsOf: inputURL)
                .split(separator: "\n")
        }
    }
    
    public init() {
    }
}

public extension Day3 {
    func partOne() throws -> Int {
        let intersections = try input
            .map { $0.splitEqually() }
            .compactMap { $0.first?.intersection($0.last!) }
            .compactMap { $0.first }
        
        let values = intersections
            .map { Day3.scores[$0]! }
        
        let answer = values
            .reduce(0, +)
        
        return answer
    }
    
    func partTwo() throws -> Int {
        
        return 0
    }
}

extension Day3 {
    static let scores = {
        let alphabet = "abcdefghijklmnopqrstuvwxyz"
        let lowerScores = Dictionary(uniqueKeysWithValues: alphabet.enumerated().map { (i, c) in
                (c, i+1)
        })
        
        let upperScores = Dictionary(uniqueKeysWithValues: alphabet.enumerated().map { (i, c) in
                (c.uppercased().first!, i+27)
        })
        
        return lowerScores.merging(upperScores, uniquingKeysWith: { a, _ in a })
    }()
}

fileprivate extension String.SubSequence {
    func splitEqually() -> [Set<Character>] {
        guard
            let halfIndex = self.index(startIndex, offsetBy: self.count / 2, limitedBy: endIndex)
        else { return [] }
        
        let firstHalf = Array(self[startIndex..<halfIndex])
        let secondHalf = Array(self[halfIndex..<endIndex])
        
        return [
            Set(firstHalf),
            Set(secondHalf)
        ]
    }
}
