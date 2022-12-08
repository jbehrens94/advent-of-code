import Foundation
import RegexBuilder

public final class Day5 {
    public let inputURL = Bundle.module.url(forResource: "Input/day5", withExtension: "txt")!
    
    private var stacks: [[String]] = [
        "SMRNWJTV",
        "BWDJQPCV",
        "BJFHDRP",
        "FRPBMND",
        "HVRPTB",
        "CBPT",
        "BJRPL",
        "NCSLTZBW",
        "LSG",
    ]
    .map(Array.init)
    .map { $0.map(String.init) }
    
    private var input: [(amount: Int, from: Int, to: Int)] {
        get throws {
            let regex = #/move (\d+) from (\d+) to (\d+)/#
            let lines = try String(contentsOf: inputURL)
                .split(separator: "\n")
                .map(String.init)
            
            let matches = lines
                .compactMap { $0.wholeMatch(of: regex) }
                .map { ($0.output.1, $0.output.2, $0.output.3) }
            
            return matches
                .map { (Int($0.0)!, Int($0.1)! - 1, Int($0.2)! - 1) }
        }
    }
    
    public init() {
    }
}

public extension Day5 {
    func partOne() throws -> String {
        var stacks = stacks
        
        try input
            .forEach {
                for _ in 1...$0.amount {
                    let last = stacks[$0.from].removeLast()
                    stacks[$0.to].append(last)
                }
            }
        
        return stacks.compactMap(\.last).joined()
    }
    
    func partTwo() throws -> String {
        var stacks = stacks
        
        try input
            .forEach {
                let startIndex = stacks[$0.from].startIndex
                let middleIndex = stacks[$0.from].endIndex - $0.amount
                let endIndex = stacks[$0.from].endIndex
                
                let xs = stacks[$0.from][middleIndex..<endIndex]
                let remainder = stacks[$0.from][startIndex..<middleIndex]
                
                stacks[$0.to].append(contentsOf: xs)
                stacks[$0.from] = Array(remainder)
            }
        
        return stacks.compactMap(\.last).joined()
    }
}
