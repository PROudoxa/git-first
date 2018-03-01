
//Написать минимальное количество монет, с помощью которых можно дать сдачу
//(69 центов — это 25+25+10+5+1+1+1+1 = 8 монет)

import UIKit

class minimalQuantityOfCoins {

   let sum: Float
   let coinsValues: [Int8] = [50, 25, 10, 5, 2, 1]
   var coinsCounter: Int8 = 0
   var usedCoins = [Int8]()
   var dollars: Int = 0

   var cents: Int8 {
      get {
         return Int8(sum % 1.00 * 100)
      }
   }
   
   var rest: Int8 {
      get {
         return cents
      }
   }
   
   init(sum: Float) {
      self.sum = sum
   }

   func verifyInputSum(sum: Float) {
      let adaptedSum = String(format: "%.2f", sum)
      if sum < 0 {
         print("Mate, gimme real sum please!")
      } else if sum == 0 {
         print("Ow, it's simple: 0 dollars need...0 coins :)")
      } else {
         print("The sum is \(adaptedSum) dollars")
      }
   }

//shows how many dollars there is
   func checkLessOneDollar() {
      if sum > 0.99 {
         dollars = Int(sum / 1.00)
         print("There is \(dollars) dollars here. And we have rest about \(cents) cents")
         if rest == 0 {
            print("We dont have any rest so the quantity of coins is 0")
         } else {
            print("Let's try to count coins for it...")
         }
      }
   }

//counts how many(minimum quantity) coins we need to make rest
   func minimumQuantityCoins(rest: Int8) {
      var rest = rest
      for i in 0..<coinsValues.count {
         while rest - coinsValues[i] >= 0 {
            rest = rest - coinsValues[i]
            coinsCounter += 1
            usedCoins.append(coinsValues[i])
         }
         //ends calculation when rest is decreased to 0
         if cents == 0 {
            break
         }
      }
   }
   
   func checkEqualOneCoin() {
      if cents > 0 {
         if coinsValues.contains(cents) {
            print("So to make rest with \(cents) cent we need only one coin: \(cents).")
         } else {
            print("So to make rest with \(cents) cents we need minimum \(coinsCounter) coins")
            print("It might be interesting for you, we can use next coins: \(usedCoins)")
         }
      }
   }
}

