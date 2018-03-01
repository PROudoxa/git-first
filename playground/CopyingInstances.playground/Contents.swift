
import Foundation


class Person: NSCopying {
    var name = ""
    var surname = ""
    
    init() {}
    
    required init(_ person: Person) {
        self.name = person.name
        self.surname = person.surname
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
    return type(of: self).init(self)
    }
}


let person1 = Person()
person1.name
person1.surname

let person2 = person1
person2.name
person2.surname

person2.name = "Alex "
person2.surname = "Black "

print("1: " + person1.name + person1.surname + "2: " + person2.name + person2.surname)

let person3 = Person()
person3.name = "Pavel"
person3.surname = "Davidoff"

let person4 = Person(person3)
person4.name = "person 4 name"
person4.surname = "person 4 surname"

person3.name
person3.surname



