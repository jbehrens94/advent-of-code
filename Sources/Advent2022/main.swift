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
case ["day4", "part1"]:
    print(try! Day4().partOne())
case ["day4", "part2"]:
    print(try! Day4().partTwo())
case ["day5", "part1"]:
    print(try! Day5().partOne())
case ["day5", "part2"]:
    print(try! Day5().partTwo())
case ["day6", "part1"]:
    print(try! Day6().partOne())
case ["day6", "part2"]:
    print(try! Day6().partTwo())
case ["day7", "part1"]:
    print(try! Day7().partOne())
case ["day7", "part2"]:
    print(try! Day7().partTwo())
    
case []:
    print("No subcommand given"); exit(1)
default:
    print("Unrecognized subcommand '\(commands.joined(separator: " "))'"); exit(1)
}
