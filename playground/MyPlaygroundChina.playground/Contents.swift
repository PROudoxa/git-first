




struct SomeStruct {
    var name = "name"
    
    mutating func change() {
        self.name = "sss"
    }
}

class SomeClass {
    var name = "class name"
}


var entity = SomeStruct()
let entityClass = SomeClass()

entity.name = "aaa"
entityClass.name = "aaa"

entity.change()

let someName = entity.name
let someName2 = entityClass.name

print(someName)
print(someName2)



