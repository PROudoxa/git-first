import UIKit
// man = true     муж
// woman = false  жен

class Person: NSObject {
    let name: String
    let age: Int8
    var sex: Bool = true
    
    init(name: String = "Unknown", age: Int8) {
        self.name = name
        self.age = age
    }
}

/////////////////////////////////////////////////////////////////
func walk(person: Person) {
    print("someone \(person.name) walk")
}

func makeManIfWoman(person: Person) -> Person {
    if person.sex == false {
        person.sex = true
        print("Woman  \(person.name) has become a man!")
    } else {
        print("Wow! \(person.name) is a man already.")
    }
    return person
}

func invertSex (person: Person) -> Person {
    if person.sex {
        person.sex = false
        print("man \(person.name) now is a pretty woman!")
    } else {
        person.sex = true
        print("woman \(person.name) now is a strong man!")

    }
    return person
}

func makeManIfWoman (person: Person) -> Person {
    if person.sex == false {
        person.sex = true
        print("Woman  \(person.name) has become a man!")
    } else {
        print("Wow! \(person.name) is a man already.")
    }
    return person
}

func personInfo(person: Person) {
    if person.sex {
        print("Man: \(person.name) | age: \(person.age) | sex: male | car: \(carColor) | year: \(person.carBirthday)")
    } else {
        print("Woman: \(person.name) | age: \(age) | sex: female | dress: \(dressColor)")
    }
}

                        //подкласс "мужчина"
class Man: Person {
    var carColor: String = "White"
    var carBirthday: Int16 = 2000
    
    init(name: String = "Unknown", age: Int8, sex: Bool, carColor: String, carBirthday: Int16) {
        super.init(name: name, age: age)
        self.sex = sex
        self.carColor = carColor
        self.carBirthday = carBirthday
    }
    
    func walk(person: Person) {
        print("man \(person.name) is running fast!")
    }
    
    func manInfo(person: Person) {
        var s: String = " "
        if person.sex {
            s = "Male"
        } else {
            s = "Female"
        }
        print("man: \(name) | age: \(age) | sex: \(s) | car: \(carColor) | year: \(carBirthday) ")
    }
}

                         //подкласс "женщина"
class Woman: Person {
    var dressColor: String = "Red"
    
    init (name: String = "Unknown", age: Int8, sex: Bool, dressColor: String) {
        super.init(name: name, age: 18)
        self.sex = sex
        self.dressColor = dressColor
    }
    
    func womanInfo(person: Person) {
        var s: String = " "
        if person.sex {
            s = "Male"
        } else {
            s = "Female"
        }
        print("woman: \(name) | age: \(age) | sex: \(s) | dress: \(dressColor) ")
    }
    
    func allTime18(person: Person) {
        print("woman: \(name) | age: 18 | dress: \(dressColor) ")
    }
}


var person1 = Woman(name: "Саша", age: 22, sex: true, dressColor: "Red")
var person2 = Woman(name: "Женя", age: 98, sex: true, dressColor: "Red")
//person3.age = 25
var person3 = Man(name: "Мэн1", age: 15, sex: false, carColor: "Black", carBirthday: 1999)
var person4 = Man(name: "Мэн2", age: 77, sex: false, carColor: "Gray", carBirthday: 2004)


//var newPerson1 = person1.makeManIfWoman(person1)
//var newPerson3 = person2.makeManIfWoman(person3)


//var newPerson1 = person1.makeWoman(person1)
//var newPerson2 = person2.makeWoman(person2)
//var newPerson3 = person1.makeMan(person2)
//var newPerson4 = person3.makeManIfWoman(person3)
//var newPerson5 = person4.makeManIfWoman(person4)
//person1.walk()
//person4.walk()
//person3.womanInfo()
//person4.manInfo()


