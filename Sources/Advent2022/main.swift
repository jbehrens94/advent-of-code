import Foundation
import TwentyTwoKit

let commands = CommandLine.arguments.dropFirst()

switch commands {
case ["day1", "part1"]:
    print(try! Day1().partOne())
case ["day1", "part2"]:
    print(try! Day1().partTwo())
case ["day2", "part1"]:
    print(try! Day2().partOne())
case ["day2", "part2"]:
    print(try! Day2().partTwo())
case ["day3", "part1"]:
    print(try! Day3().partOne())
case ["day3", "part2"]:
    print(try! Day3().partTwo())
    
case []:
    print("No subcommand given"); exit(1)
default:
    print("Unrecognized subcommand '\(commands.joined(separator: " "))'"); exit(1)
}
