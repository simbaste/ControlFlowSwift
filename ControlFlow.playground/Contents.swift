//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//: Control Flow

let names = ["Anna", "Alex", "Brian", "Stephane"]

for name in names {
    print(name)
}

//: (key, value) iteration can be use on dictionary

let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]

for (animalName, legCount) in numberOfLegs {
    print("\(animalName) has \(legCount) legs")
}

//: We can also acsess directly to the value with the appropriate key
print(numberOfLegs["spider"] ?? 0)

//: We can use *for-in* loop with numeric range

for index in 1...5 {
    print("\(index) times 5 is \(index*5)")
}

//: We can ignore the values by using an underscore in place of a variable name

let power = 4
var answer = 4

for _ in 1...power {
    print("Swift is so Nice...(\(answer-=1))")
}

//: We can also do
for _ in 1..<power {
    print("Apple has make a great Job...(\(answer+=1))")
}

/*:
    We could prefer one mark every 5 minutes instead.
    Use the **stride(from:to:by:)** function to skip the unwanted marks
 */

let minuteInterval = 5
let minutes = 21

for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    // render the tick mark every 5 minutes (0, 5, 10, 15 ... 45, 50, 55)
    print("tickMark = \(tickMark)")
}

//: Closed ranges are also available, by using stride(from:through:by:) instead:

print("\n=====\n")

for tickMark in stride(from: 3, through: 12, by: 3) {
    // render the tick mark every 3 hours (3, 6, 9, 12)
    print("tickMark = \(tickMark)")
}

//: this code bellow init an array with 26 zero Int values
let finalSquare = 25

var board = [Int](repeating: 0, count: finalSquare+1)

print(board)
print(board.count)

var square = 0

repeat {
    print("This is the square number \(square)")
    square += 2
} while square < finalSquare

print(finalSquare)

//: Swift switch statement

let anotherCharacter: Character = "a"

switch anotherCharacter {
case "A", "a":
    print("The letter A")
default:
    print("Not the letter A")
}

//: Interval matching

let approximateCount = 62
let countedThings = "moons orbiting Saturn"
let naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")

//: Tupples

let somePoint = (1, 1)

switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
}

//: Values Bindings

let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}

//: A switch case can use a where clause to check for additional conditions

let yetAnotherPoint = (1, -1)

switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}

//: Control Transfer Statements

/*:
 - continue: The continue statement tells a loop to stop what it is doing and start again at the beginning of the next iteration through the loop
 - break: The break statement ends execution of an entire control flow statement immediately. *When used inside a switch statement, break causes the switch statement to end its execution immediately and to transfer control to the code after the switch statement’s closing brace (})*
 - fallthrough: In Swift, switch statements don’t fall through the bottom of each case and into the next one
 - return:
 - throw:
*/

let puzzleInput = "great minds think alike"
var puzzleOutput = ""
let charactersToRemove: [Character] = ["a", "e", "i", "o", "u", " "]

for character in puzzleInput {
    if charactersToRemove.contains(character) {
        continue
    } else {
        puzzleOutput.append(character)
    }
}

print(puzzleOutput)

let numberSymbol: Character = "三"  // Chinese symbol for the number 3
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
    possibleIntegerValue = 1
case "2", "٢", "二", "๒":
    possibleIntegerValue = 2
case "3", "٣", "三", "๓":
    possibleIntegerValue = 3
case "4", "٤", "四", "๔":
    possibleIntegerValue = 4
default:
    break
}

if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
    print("An integer value could not be found for \(numberSymbol).")
}

let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}

print(description)

//: Labeled Statements
// Give a name to a stetement like loop to explicite *break* this statement

square = 0
var diceRoll = 0

gameLoop: while square != finalSquare {
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    switch square + diceRoll {
    case finalSquare:
        // diceRoll will move us to the final square, so the game is over
        break gameLoop
    case let newSquare where newSquare > finalSquare:
        // diceRoll will move us beyond the final square, so roll again
        continue gameLoop
    default:
        // this is a valid move, so find out its effect
        square += diceRoll
        square += board[square]
    }
}
print("Game over!")

//: Bonus Track

/*:
 In-Out Parameters:
    This is use when you want to modify parameters passed to a fonction
 */

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")















