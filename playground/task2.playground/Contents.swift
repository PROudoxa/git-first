import UIKit
// man = true     муж
// woman = false  жен

class Person: NSObject {
    let name: String
    let age: Int8    // = 18
    
    init(name: String = "Unknown", age: Int8) {
        self.name = name
        self.age = age
    }
    
    func walk(p: Person) {
        print("someone \(p.name) walk")
    }
}

/////////////////////////////////////////////////////////////////

func makeManIfWoman(who: Person?) {
    let ss: String? = who?.name
    if who is Man {
        print("Man  \(who?.name) has become a man!")
    } else {
        print("Wow! \(who?.name) is a man already.")
    }
    return who?
}

func invertSex (p: Man) -> Person {
    if p.sex {
        p.sex = false
        print("man \(p.name) now is a pretty woman!")
    } else {
        p.sex = true
        print("woman \(p.name) now is a strong man!")

    }
    return p
}

func x(p:Person?){
    
    let xxx:String? = p?.name
    if p is Woman{
        print("Object \(xxx) is a woman")

    }else if p is Man{
        print("Object \(p?.name) is a man")
    }else{
        print("Object \(p?.name) is a person")

    }
}
//
//func x(p:Woman){
//    print("Object \(p.name) is a woman")
//}
//
//func x(p:Man){
//    print("Object \(p.name) is a man")
//}

func personInfo(p: Person?) {
    if p is Man {
        print("man")
    } else if p is Woman {
       print("woman")
    }
}

                        //подкласс "мужчина"
class Man: Person {
    var carColor: String = "White"
    var carBirthday: Int16 = 2000
    var sex: Bool = true
    
    init(name: String = "Unknown", age: Int8, sex: Bool, carColor: String, carBirthday: Int16) {
        super.init(name: name, age: age)
        self.sex = sex
        self.carColor = carColor
        self.carBirthday = carBirthday
    }
    
    override func walk(person: Person) {
        print("man \(person.name) is running fast!")
    }
    
    func manInfo(pers: Man) {
        print("man: \(self.name) | age: \(self.age) | sex: Male | car: \(self.carColor) | year: \(self.carBirthday) ")
    }
}

                         //подкласс "женщина"
class Woman: Person {
    var dressColor: String
    var sex: Bool = true
    
    init (name: String = "Unknown", age: Int8, sex: Bool, dressColor: String) {
        self.sex = sex
        self.dressColor = dressColor
        super.init(name: name, age: 18)
    }
    
    func womanInfo(person: Person) {
        print("woman: \(name) | age: \(age) | sex: Female | dress: \(dressColor) ")
    }
    
    func allTime18(sss: Woman) -> Woman {
        print("woman: \(self.name) | age: 18 | dress: \(self.dressColor) ")
        return sss
    }
}
//=========================================================================
var pers1:Person = Person(name: "Name1", age: 13)
var man1:Man = Man(name: "Man1", age: 77, sex: true, carColor: "Green", carBirthday: 2010)
var wom1:Woman = Woman(name: "Жен4", age: 98, sex: false, dressColor: "Green")

if let nonnil:Man = man1 {
    x(nonnil)
}

//x(man1)
x(wom1)


if let xx:Person = man1{
    x(xx)
}
print("s")
personInfo(man1)
print("f")
var person1 = Woman(name: "Жен1", age: 22, sex: false, dressColor: "Red")
var person2 = Woman(name: "Жен2", age: 98, sex: false, dressColor: "Red")
//person3.age = 25
var person3 = Man(name: "Мэн1", age: 15, sex: true, carColor: "Black", carBirthday: 1999)
var person4 = Man(name: "Мэн2", age: 77, sex: true, carColor: "Gray", carBirthday: 2004)

makeManIfWoman(person1)

//var newPerson3 = makeManIfWoman(person3)

//var newPerson4 = invertSex(newPerson1)
//var newPerson5 = invertSex(newPerson3)


var woman1 = person1.allTime18(person1)


