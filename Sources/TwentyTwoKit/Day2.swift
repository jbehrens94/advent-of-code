import Foundation

public final class Day2 {
    public let inputURL = Bundle.module.url(forResource: "Input/day2", withExtension: "txt")!
    
    public var rounds: [Round] {
        get throws {
            let inputString = try String(contentsOf: inputURL)
            
            return inputString
                .split(separator: "\n")
                .map { $0.components(separatedBy: " ") }
                .map {
                    Round(
                        opponentMove: .init(rawValue: $0.first ?? "") ?? .unknown,
                        playerMove: .init(rawValue: $0.last ?? "") ?? .unknown
                    )
                }
        }
    }
    
    public var score: Int {
        get throws {
            return try rounds
                .map { $0.score() }
                .reduce(0, +)
        }
    }
    
    public init() {}
}

public extension Day2 {
    struct Round {
        let opponentMove: OpponentMove
        let playerMove: PlayerMove
        
        enum Result: Int, CaseIterable {
            case lose = 0,
                 draw = 3,
                 win = 6
        }
        
        func play() -> Round.Result {
            switch (opponentMove, playerMove) {
            // Losses
            case (.rock, .scissors), (.scissors, .paper), (.paper, .rock): return .lose
                
            // Draws
            case (.rock, .rock), (.paper, .paper), (.scissors, .scissors): return .draw
                
            // Wins
            case (.scissors, .rock), (.paper, .scissors), (.rock, .paper): return .win
            
            default: return .lose
            }
        }
        
        func score() -> Int {
            return playerMove.score + play().rawValue
        }
    }
    
    enum OpponentMove: String, CaseIterable {
        case rock = "A", paper = "B", scissors = "C", unknown
    }
    
    enum PlayerMove: String, CaseIterable {
        case rock = "X", paper = "Y", scissors = "Z", unknown
        
        var score: Int {
            switch self {
            case .rock: return 1
            case .paper: return 2
            case .scissors: return 3
            case .unknown: return 0
            }
        }
    }
}

public extension Day2 {
    func partOne() throws -> Int {
        return try score
    }
    
    func partTwo() throws -> Int {
        return 0 // TODO: Implement after part one.
    }
}
