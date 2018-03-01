
//let array = [1, 2, 3, 4, 5]
//var iterator = array.makeIterator()
//
//while let item = iterator.next() {
//    print(item)
//}
//for item in array {
//    print(item)
//}

class Driver {
    let isgoodDriver: Bool
    let name: String
    
    init(isGood: Bool, name: String) {
        self.isgoodDriver = isGood
        self.name = name
    }
}

class Car {
    
    var doodDriverIterator: GoodDriverIterator {
        return GoodDriverIterator(drivers: drivers)
    }
    let drivers = [Driver(isGood: true, name: "Mark"),
                           Driver(isGood: false, name: "Ivan"),
                           Driver(isGood: true, name: "Maria"),
                           Driver(isGood: false, name: "Morgan")]
}

extension Car: Sequence {
    func makeIterator() -> GoodDriverIterator {
        return GoodDriverIterator(drivers: drivers)
    }
}

class GoodDriverIterator: IteratorProtocol {
    private let drivers: [Driver]
    private var current = 0
    
    init(drivers: [Driver]) {
        self.drivers = drivers.filter{$0.isgoodDriver}
    }
    
    func next() -> Driver? {
        defer { current += 1 }
        return drivers.count > current ? drivers[current] : nil
    }

    func allDrivers() -> [Driver] {
        return drivers
    }
}

let car = Car()
let goodDriverIterator = car.doodDriverIterator.next()
let goodDriverIteratorViaSequence = car.makeIterator()
goodDriverIteratorViaSequence.next()?.name
goodDriverIteratorViaSequence.next()?.name
car.makeIterator().allDrivers()





