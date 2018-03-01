/*     462 - Bridge Hand Evaluator
 
import UIKit
import Darwin

let input = "JD KC 7C QD 3D 8C 5D 2S AS QC JH 2C KD"

var inputCards: [String] = input.components(separatedBy: " ")
inputCards = inputCards.filter{ $0 != "" && $0 != "0" }
guard inputCards.count == 13 else { print("Please retype the set(I need exactly 13 cards)"); exit(0) }

// tuples for each suit
var spades:   (cards: [String], k: Int, stopped: Bool) = (cards: [], k: 0, stopped: false)
var hearts:   (cards: [String], k: Int, stopped: Bool) = (cards: [], k: 0, stopped: false)
var diamonds: (cards: [String], k: Int, stopped: Bool) = (cards: [], k: 0, stopped: false)
var clubs:    (cards: [String], k: Int, stopped: Bool) = (cards: [], k: 0, stopped: false)

var points: Int = 0

for card in inputCards {
    let suit = String(card.characters.suffix(1))
    let rank = String(card.characters.prefix(1))
    
    // 1st rule
    switch rank {
        case "A": points += 4
        case "K": points += 3
        case "Q": points += 2
        case "J": points += 1
        default: break
    }
    
    switch suit {
        case "S": spades.cards.append(card)  ; spades.k += 1
        case "H": hearts.cards.append(card)  ; hearts.k += 1
        case "D": diamonds.cards.append(card); diamonds.k += 1
        case "C": clubs.cards.append(card)   ; clubs.k += 1
        default: print("Houston we have a problem! Something wrong with suit(\(suit))")
    }
}

var allSuits: [(cards: [String], k: Int, stopped: Bool)] = [spades, hearts, diamonds, clubs]
var longestSuit: (name: String, length: Int) = (name: "S", length: 0)
var n = 0 // index for each suit in allSuits

// 2nd, 3rd and 4th rules
for suit in allSuits {
    let length = suit.k
    for card in suit.cards {
        let rank = String(card.characters.prefix(1))
        switch rank {
            case "A": allSuits[n].stopped = true                      // rule for stopping
            case "K"  where length == 1: points -= 1                  // 2nd rule
            case "K"  where length > 1 : allSuits[n].stopped = true   // rule for stopping
            case "Q"  where length < 3 : points -= 1                  // 3rd rule
            case "Q"  where length > 2 : allSuits[n].stopped = true   // rule for stopping
            case "J"  where length < 4 : points -= 1                  // 4th rule
            default: break
        }
    }
    n += 1
    
    // finds the longest suit
    if length > longestSuit.length {
        longestSuit.length = suit.k
        longestSuit.name = String(suit.cards[0].characters.suffix(1))
    }
}

var allSuitsStopped = false   // flag if all suits are stopped
if  allSuits[0].stopped,
    allSuits[1].stopped,
    allSuits[2].stopped,
    allSuits[3].stopped  { allSuitsStopped = true }

if points >= 16 && allSuitsStopped {
    print("BID NO-TPUMP")
} else {
    // 5th, 6th, and 7th rules
    for suit in allSuits {
            switch suit.k {
            case 2: points += 1
            case 1, 0: points += 2
            default: break
        }
    }
    // uses next cases if case "NO-TRUMP" was failed
    if points < 14 {
        print("PASS")
    } else {
        print("BID \(longestSuit.name)")
    }
}

 */




/*               637 - Booklet Printing (v1)
 
import UIKit
import Darwin

let inputSrting: String = "1\n3\n5\n8\n uygn9\n25\n0\n7"

func getCleanedInput(input: String) -> [String] {
    let cleanedInput = input.replacingOccurrences(of: "\\D", with: " ", options: .regularExpression, range: inputSrting.startIndex..<inputSrting.endIndex)
    let separatedStringArray = cleanedInput.components(separatedBy: " ")
    let stringArray = separatedStringArray.filter{ $0 != "" }
    return stringArray
}

let cleanedInput: [String] = getCleanedInput(input: inputSrting)

// makes array [Int] from [String]
var intArray = cleanedInput.map{ Int($0) } as! [Int]

intArray = intArray.filter(){ ($0 >= 0) && ($0 <= 100) }

guard !intArray.isEmpty else { print("Please use next format(s) to type number of pages: xx OR xx xx ... xx"); exit(0) }

var index = 0

while (index < intArray.count) && (intArray[index] != 0) {
    var input = intArray[index]
    
    print("Printing order for \(input) pages:")
    
    // checks particularly case if there is the only one page
    if input == 1 {
        print("Sheet 1, front: Blank, 1")
        index += 1
        continue
    }
    
    var maxPage = Int(ceil(Double(input) / 4)) * 4
    var pages: [String] = []
    var k = 1
    
    // fills array of pages
    while k <= input {
        pages.append(String(k))
        k += 1
    }
    
    // adds blank pages if need
    while k <= maxPage {
        pages.append("Blank")
        k += 1
    }
    
    for n in 1...maxPage/4 {
        print("Sheet \(n), front: \(pages.removeLast()), \(pages.removeFirst())")
        print("Sheet \(n), back : \(pages.removeFirst()), \(pages.removeLast())")
    }
    
    index += 1
}

 */





/*              637 - Booklet Printing (v2)  */

import UIKit
import Darwin

let inputSrting: String = "3\n9\n1 8 dfrtb \n0\n"

func getCleanedInput(input: String) -> [String] {
    let cleanedInput = input.replacingOccurrences(of: "\\D", with: " ", options: .regularExpression, range: inputSrting.startIndex..<inputSrting.endIndex)
    let separatedStringArray = cleanedInput.components(separatedBy: " ")
    let stringArray = separatedStringArray.filter{ $0 != "" }
    return stringArray
}

let cleanedInput: [String] = getCleanedInput(input: inputSrting)

// makes array [Int] from [String]
var intArray = cleanedInput.map{ Int($0) } as! [Int]

intArray = intArray.filter(){ ($0 >= 0) && ($0 <= 100) }

guard !intArray.isEmpty else { print("Please use next format(s) to type number of pages: xx OR xx xx ... xx"); exit(0) }

func addFullSheets(sheet: Int, maxPage: Int, minPage: Int) {
    var k = sheet
    var max = maxPage
    var min = minPage
    
    while max > min {
        print("Sheet \(k), front: \(max), \(min)")
        print("Sheet \(k), back:  \(min+1), \(max-1)")
        
        k += 1
        max -= 2
        min += 2
    }
}

var index = 0

while (index < intArray.count) && (intArray[index] != 0) {
    var input = intArray[index]
    
    var minPage = 1
    var maxPage = Int(ceil(Double(input) / 4)) * 4  // ups maxPage from input page to next number multiple 4
    var sheet = 2                                   // sheet number
    
    print("Printing order for \(input) pages:")
    
    if input == 1 {
        print("Sheet 1, front: Blank, 1")
        index += 1
        continue
    }
    
    switch input % 4 {
        case 1:
            print("Sheet 1, front: Blank, 1\nSheet 1, back: 2, Blank")
            print("Sheet 2, front: Blank, 3\nSheet 2, back: 4, \(input)")
            addFullSheets(sheet: sheet, maxPage: maxPage-4, minPage: minPage+4)
        case 2:
            print("Sheet 1, front: Blank, 1\nSheet 1, back: 2, Blank")
            addFullSheets(sheet: sheet, maxPage: maxPage-2, minPage: minPage+2)
        case 3:
            print("Sheet 1, front: Blank, 1\nSheet 1, back: 2, \(input)")
            addFullSheets(sheet: sheet, maxPage: maxPage-2, minPage: minPage+2)
        default:
            addFullSheets(sheet: sheet-1, maxPage: maxPage, minPage: minPage)
    }

    index += 1
}
/**/


 
/*     161 - Traffic Lights */
/*
import UIKit

let input = "19 20 0\n\n10 10\n0\n0\n 10 10 0 0 0"

let cleanedInput = input.replacingOccurrences(of: "\\D", with: " ", options: .regularExpression, range: input.startIndex..<input.endIndex)
// array of series
let suitOfSeries: [String] = cleanedInput.components(separatedBy: " 0")

// for each series
for series in suitOfSeries {
    let separatedStringArray = series.components(separatedBy: " ")
    let stringArray = separatedStringArray.filter{ $0 != "" && $0 != "0"}
    var intArray = stringArray.map{ Int($0) } as! [Int]
    
    intArray = intArray.filter(){ ($0 >= 10) && ($0 <= 90) }
    
    guard intArray.count > 1 else { continue }
    
    var min = intArray[0]
    for number in intArray {
        if number < min {
            min = number
        }
    }
    
    intArray = intArray.filter(){ $0 != min }
    
    var flag = false        // flag to finish finding "bingo"
    var j = 2               // jumper between intervals
    let timeLimit = 18000   // time limit
    var bingo = 0           // time to reach sinhronization
    var currentTime = 0
    
    repeat {
        
        let leftLimit = j * min
        let rightLimit = (j+1) * min - 6
        
        for currentSecond in leftLimit...rightLimit {
            var k = 0
            for inputGreen in intArray {
                let greenLimit = inputGreen - 5
                let ostatok = currentSecond % (inputGreen * 2) // subtract full cycle(s)
                
                if (ostatok >= greenLimit) {
                    break
                } else { k += 1 }
            }
            if k == intArray.count {
                bingo = currentSecond
                flag = true
                break
            }
        }
        currentTime = rightLimit
        j = j + 2
        
    } while ((currentTime < timeLimit) && !flag)
    
    if (0 < bingo) && (bingo <= timeLimit) {
        let hours: Int = bingo / 3600
        let minutes: Int = (bingo -  hours * 3600) / 60
        let seconds = bingo - hours * 3600 - minutes * 60
        print(String.localizedStringWithFormat("%02d:%02d:%02d", hours, minutes, seconds))
    } else {
        print("Signals fail to synchronise in 5 hours")
    }
}
    
  */




