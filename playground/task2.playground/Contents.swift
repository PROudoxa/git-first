import UIKit
// man = true     муж
// woman = false  жен

class Person: NSObject {
    var name: String
    var age: Int8
    var sex: Bool = true
    
    init(name: String = "Unknown", age: Int8, sex: Bool) {
        self.name = name
        self.age = age
        self.sex = sex
    }
    
    func makeWoman (person: Person) -> Person {
        person.sex = false
        return person
    }
    
    func makeMan(person: Person) -> Person {
        person.sex = true
        return person
    }

    func makeManIfWoman(person: Person) -> Person {
        if person.sex == false {
            person.sex = true
            print("Woman  \(name) has become a man!")
            return person
        } else {
            print("Wow! \(name) is a man already.")
            return person
        }
    }
    
    func walk() {
        print("someone \(name) walk")
    }
}

//подкласс "мужчина"
class Man: Person {
    var carColor: String = "White"
    var carBirthday: Int16 = 2000
    
    init(name: String = "Unknown", age: Int8, sex: Bool, carColor: String, carBirthday: Int16) {
        super.init(name: name, age: age, sex: sex)
        self.carColor = carColor
        self.carBirthday = carBirthday
    }
    
    override func walk() {
        print("man \(self.name) is running fast!")
    }
    
    func manInfo() {
        print("man \(self.name) has got a \(self.carColor) car which was made in \(self.carBirthday) year")
    }
}

//подкласс "женщина"
class Woman: Person {
    var dressColor: String = "Red"
    
    init (name: String = "Unknown", age: Int8, sex: Bool, dressColor: String) {
        super.init(name: name, age: 18, sex: sex)
        self.dressColor = dressColor
    }
    
    func womanInfo() {
        print("Ж: \(name) is \(age) year(s) old")
    }
}

var person1 = Person(name: "First", age: 33, sex: true)
var person2 = Person(name: "Second", age: 22, sex: false)

var person3 = Woman(name: "Sasha", age: 22, sex: true, dressColor: "Red")
person3.age = 25
var person4 = Man(name: "Jack", age: 15, sex: false, carColor: "Black", carBirthday: 1999)

var newPerson1 = person1.makeWoman(person1)
var newPerson2 = person2.makeWoman(person2)

var newPerson3 = person1.makeMan(person2)
var newPerson4 = person3.makeManIfWoman(person3)
var newPerson5 = person4.makeManIfWoman(person4)


person3.walk()
person4.walk()

person3.womanInfo()
person4.manInfo()




