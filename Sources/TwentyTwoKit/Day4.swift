import Foundation

public final class Day4 {
    public let inputURL = Bundle.module.url(forResource: "Input/day4", withExtension: "txt")!
    
    // Expected result: [[37...87, 36...87], [3...98, 3...84]]
    private var input: [[ClosedRange<Int>]] {
        get throws {
            let input = try String(contentsOf: inputURL)
                .split(separator: "\n") // 37-87,36-87\n3-98,3-84
                .map { $0.split(separator: ",") } // [["37-87", "36-87"], ["3-98", "3-84"]]
                .map { $0.map { $0.split(separator: "-") } } // [[["37", "87"], ["36", "87"]], [["3", "98"], ["3", "84"]]]
            
            let values = input
                .map { $0.map { $0.map(String.init).compactMap(Int.init) }}
            
            let ranges = values
                .map { $0.map { $0.first!...$0.last! }}
            
            return ranges
        }
    }
    
    public init() {
    }
}

public extension Day4 {
    func partOne() throws -> Int {
        let ranges = try input
        
        return ranges
            .map { ($0.first! ~= $0.last!) || ($0.last! ~= $0.first!) }
            .reduce(0) { partialResult, value in
                return value ?
                    partialResult + 1 :
                    partialResult
            }
    }
    
    func partTwo() throws -> Int {
        return 0
    }
}

fileprivate extension ClosedRange {
    static func ~=(lhs: Self, rhs: Self) -> Bool {
        rhs.clamped(to: lhs) == rhs
    }
}
