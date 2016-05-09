//: Playground - noun: a place where people can play
import UIKit

class Person:NSObject {
    let name: String
    let age: Int8
    var hasCat: Bool
    
    //конструктор(ы)
    init(name: String, age: Int8, hasCat: Bool = false) {
        self.name = name
        self.age = age
        self.hasCat = hasCat
    }
    
    var howOld: Int8 {
        get{
            return self.age
        }
    }
    override var description:String{
        get{
            return self.name
        }
    }
}

var person1 = Person(name: "Ara", age: 29, hasCat: true)
var person2 = Person(name: "Bob", age: 12)
var person3 = Person(name: "Bill", age: 98, hasCat: true)
var person4 = Person(name: "Tom", age: 8)
var person5 = Person(name: "Linda", age: 34)

//вызов геттера
person1.howOld

let personList = [person1, person2, person3, person4, person5]

func printPersonArray(array: [Person]) {
    var count = 1
    for i in array {
        print("#\(count) \(i.name) \(i.age) \(i.hasCat)")
        count++
    }
    print("")
}

//Оригинальный список
print("Original list")
printPersonArray(personList)

//Сортировка по имени в обратном алфавитном порядке
print("Sorted by name")
printPersonArray(personList.sort(){ $0.name > $1.name })

//Сортировка по возрасту в возрастающем порядке
print("Sorted by age")
printPersonArray(personList.sort(){ $0.age < $1.age })

// -----------------------------------------------------------------------

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

//сортировка 1
func backwards(s1: String, _ s2: String) -> Bool {
    //print(s1 + "  VS  " + s2)
    return s1 > s2
}

var reversed = names.sort(backwards)
print(reversed)

// сортировка 2
//reversed = names .sort({(s1: String, s2: String) -> Bool in
//    return s1 > s2
//})

//короткая форма
// reversed = personList.sort({ s1, s2 in s1 > s2 })

// еще короче
//var reverse = names.sort( > )

