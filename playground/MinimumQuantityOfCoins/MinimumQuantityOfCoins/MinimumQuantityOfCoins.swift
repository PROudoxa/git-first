//
//  MinimumQuantityOfCoins.swift
//  MinimumQuantityOfCoins
//
//  Created by Alex Voronov on 08.09.16.
//  Copyright © 2016 Alex&V. All rights reserved.
//

import Foundation

class MinimumQuantityOfCoins {
   
   var sum: Float
   var coinsCounter: Int8 = 0
   let coinsValues: [Int8] = [50, 25, 10, 5, 2, 1]
   var usedCoins = [Int8]()
   var dollars: Int = 0

   var cents: Int8 {
      get {
         let value = "\(sum)"
         let valueArray = value.components(separatedBy: ".")
         if valueArray[1] == "" {
            return Int8(0)
         } else {
            return Int8(valueArray[1])!
         }
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
   
   func checkSum() {
      if sum < 0 {
         print("Mate, gimme real sum please!")
      } else if sum == 0 {
         print("Mate, 0.00 dollars it's...0 coins. Say hello to captain!")
      }
   }
   
   //shows how many dollars there is
   func countsDollars() {
         dollars = Int(sum)
         print("There is \(dollars) dollars here. And we have rest about \(cents) cents")
         if rest == 0 {
            print("We dont have any rest so the quantity of coins is 0")
      }
   }
   
   //counts how many(minimum quantity) coins we need to make rest
   func countsMinimum(_ rest: Int8) {
      usedCoins.removeAll()
      coinsCounter = 0
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
