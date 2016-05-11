//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


class Product {
    var price: Double
    let productId: String
    var name: String
    
    //конструктор. принимает значения переменных
    init(productId: String, name: String, price: Double) {
        self.productId = productId
        self.name = name
        self.price = price
    }
}

class Storage {
        private var products = [String]()
        
        func addProduct(product: Product){
            for var i = 0; 1 < products.count; i++ {
                if products[i] == product.productId {
                    //increment quantity
                    //...
                    return
                }
            }
            products.append(product.productId)
        }
    
        func removeProductById(productId: String) {
            for item: String in products {
                if item == productId {
                    if let idx = products.indexOf(item) {
                    products.removeAtIndex(idx)
                    }
                }
            }
        }
    func productById(id: String) -> Product? {
        for item: String in products {
            if item == productId {
                return item
            }
        }
        return nill
    }
}

class Cachbox {
    
    class func trySelf() -> Bool {
        
    }
}

