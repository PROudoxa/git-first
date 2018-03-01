//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport





class LongrunOperation: Operation {
    
    let identifier: String
    
    init(identifier: String) {
        self.identifier = identifier
    }
    override func main() {
        if isCancelled {
            return
        }
        
        for count in 1...5 {
            print("\(identifier) working \(count)")
            sleep(1)
        }
        print("\(identifier) finished")
    }
}

let operation1 = LongrunOperation(identifier: "firstOperation")
let operation2 = LongrunOperation(identifier: "secondOperation")
let operation3 = LongrunOperation(identifier: "thirdperation")

//operation1.main()

let operationsQueue = OperationQueue()
//operationsQueue.addOperation(operation1)
operationsQueue.addOperations([operation1, operation2, operation3], waitUntilFinished: false)






PlaygroundPage.current.needsIndefiniteExecution = true









