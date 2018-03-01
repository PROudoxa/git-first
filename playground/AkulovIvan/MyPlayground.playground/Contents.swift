//: Playground - noun: a place where people can play

import UIKit
/*
var str = "Hello, playground"


class Parent {
    
    var name: String {
        get {
            return self.name
        }
        set {
            self.name = newValue
        }
    }
    
    let someValueParent = 111
    
    init(name: String) {
        self.name = name 
    }
}

class Child: Parent {

    override var name: String {
        get {
            //return "sdggsdf"
            return super.name
        }
        set {
            return super.name = newValue
        }
    }
    var age: Int

    init(name1: String, age: Int) {
        self.age = age

        super.init(name: name1)
        self.name = name1

    }
}

var par1 = Parent(name: "aaa")
var c = Child(name1: "dd", age: 12)

c.name = "sgs"
c.name
*/

/*
public class FooButton {
    public var weight: Double = 1.0
    
}

public class BarButton: FooButton {
    override public var weight: Double {
        get {
            return 2.0
        }
        set {
            self.weight = newValue
        }
    }
}

var instance0 = FooButton()
var instance = BarButton()

print("1: \(instance0.weight)")

instance.weight
print("2: \(instance.weight)")

//instance.weight = 9.8
//print("3: \(instance.weight)")

*/
/*
class MyClass: NSObject {
    var str: String = "aaa"
}

class MyChildClass: MyClass {
     override var str: String {
        get { return super.str }
        set { super.str = newValue }
    }
}

var ins1 = MyClass()
var ins2 = MyChildClass()

ins1.str
ins2.str
print("str: \(ins2.str)")

ins2.str = "sssddddd"
ins2.str

print("str: \(ins2.str)")
print("the end")
*/
/*
class MyClass {
    var date: NSDate {
        willSet {
            print("Will set date from \(date) to \(newValue)")
        }
        
        didSet {
            print("Did set date from \(oldValue) to \(date)")
        }
    }
    
    init() {
        date = NSDate()
    }
}

let foo = MyClass()
foo.date = foo.date.addingTimeInterval(10086)
foo.date = foo.date.addingTimeInterval(1111)
*/
/*
class A {
    private var _number: Int = 9
    var number: Int {
        get {
            print("get")
            return _number
        }
        
        set {
            print("set \(newValue)")
            _number = newValue
        }
    }
}

class B: A {
    
    var sss: Int = 9
    private var _number: Int = 9
    
    override var number: Int {
        willSet {
            //sss = newValue
            print("willSet \(newValue)")
            _number = newValue
        }
        didSet {
            if oldValue > _number {
                number = oldValue
                print("didSet \(oldValue)")
            } else {
                number = _number
                print("denied")
            }
        }
    }
}
var a = A()
print(a.number)
a.number = 33

print(a.number)
var b = B()
//b.number = 8
//b.number = 5
*/







