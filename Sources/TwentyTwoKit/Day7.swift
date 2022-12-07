import Foundation
import Parsing
import RegexBuilder

public final class Day7 {
    public let inputURL = Bundle.module.url(forResource: "Input/day7", withExtension: "txt")!
    
    private var input: [String] {
        get throws {
            let inputString = try String(contentsOf: inputURL)
            
            return inputString
                .split(separator: "\n")
                .map(String.init)
        }
    }
    
    public init() {}
    
    func parse(input: [String]) throws -> [Line] {
        let cd = Parse {
            "cd "
            Rest()
        }.map(Command.cd)
        let ls = Parse { "ls" }.map { Command.ls }
        let command = Parse {
            "$ "
            OneOf {
                cd
                ls
            }
        }
        
        let dir = Parse {
            "dir "
            Rest()
        }.map(Node.directory)
        let file = Parse {
            Digits()
            " "
            Rest()
        }.map(Node.file)
        let lsLine = Parse {
            OneOf {
                dir
                file
            }
        }
        
        let parser = Parse {
            OneOf {
                command.map(Line.command)
                lsLine.map(Line.node)
            }
        }
        return try input.map { try parser.parse($0[...]) }
    }
    
    func makeTree(lines: [Line]) -> Tree {
        let root = Tree(node: .directory("/"))
        var directories = [root]
        var cwd: Tree { directories.last! }
        
        for line in lines {
            switch line {
            case .command(.cd("/")):
                directories = [root]
            case .command(.cd("..")):
                _ = directories.popLast()
            case .command(.cd(let dir)):
                if !cwd.children.keys.contains(dir) {
                    cwd.children[dir] = Tree(node: .directory(dir))
                }
                directories.append(cwd.children[dir]!)
            case .command(.ls):
                continue
            case .node(.directory(let dir)):
                if !cwd.children.keys.contains(dir) {
                    cwd.children[dir] = Tree(node: .directory(dir))
                }
            case .node(let file):
                cwd.values.insert(file)
            }
        }
        
        return root
    }
}

public extension Day7 {
    func partOne() throws -> Int {
        let input = try input
        let lines = try parse(input: input)
        let tree = makeTree(lines: lines)
        
        return tree.visit { $0.size }.filter { $0 <= 100000 }.reduce(0, +)
    }
    
    func partTwo() throws -> Int {
        return 0
    }
}

extension Day7 {
    enum Command: Equatable {
        case ls,
             cd(Substring)
    }
    
    enum Node: Equatable, Hashable {
        case file(Int, Substring),
             directory(Substring)
        
        var size: Int {
            switch self {
            case .file(let size, _):
                return size
            case .directory(_):
                return 0
            }
        }
    }
    
    enum Line: Equatable {
        case command(Command),
             node(Node)
    }
    
    class Tree {
        let node: Node
        var children: [Substring: Tree]
        var values: Set<Node>
        
        init(node: Node) {
            self.node = node
            self.children = [:]
            self.values = []
        }
        
        var size: Int {
            let innerDirs = children
                .values
                .map(\.size)
                .reduce(0, +)
            
            let files = values.map(\.size).reduce(0, +)
            
            return innerDirs + files
        }
        
        func visit<Result>(_ f: (Tree) -> Result) -> [Result] {
            var result = children.values.flatMap { $0.visit(f) }
            result.append(f(self))
            return result
        }
    }
}
