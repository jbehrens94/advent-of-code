import Foundation
import TwentyOneKit

let commands = CommandLine.arguments.dropFirst()

switch commands {
case ["day1", "part1"]:
    print(try! Day1().partOne())
case ["day1", "part2"]:
    print(try! Day1().partTwo())
}
    
case []:
    print("No subcommand given"); exit(1)
default:
    print("Unrecognized subcommand '\(commands.joined(separator: " "))'"); exit(1)
}
