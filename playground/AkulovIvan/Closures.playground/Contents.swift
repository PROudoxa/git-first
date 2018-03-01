//: Playground - noun: a place where people can play

import UIKit

let closure = {
    print("Hello, World!")
}

func repeatThreeTimes(closure: () -> ()) {
    for _ in 0...2 {
        closure()
    }
}

repeatThreeTimes(closure: {
    print("Hello, World!")
})

repeatThreeTimes {
    () -> () in
    print("Hello")
}

let unsortedArray = [123, 3, 44, 444]

let sortedArray = unsortedArray.sorted {
    (number1: Int, number2: Int) -> Bool in
    return number1 > number2
}

