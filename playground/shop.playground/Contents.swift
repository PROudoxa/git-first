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

    class Storage {
        private var product = [String: Int]()
        
        func addProduct(product: Product){
            for var i = 0; 1 < products.count; i++ {
                if products[i] == prduct.productId {
                    //increment quantity
                    //...
                    return
                }
            }
        }
    }
    
}


