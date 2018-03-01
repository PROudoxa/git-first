



protocol Velicle { func drive() }
protocol VelicleFactory { func produce() -> Velicle }

class Car: Velicle {
    func drive() {
        print("drive a car")
    }
}

class Truck: Velicle {
    func drive() {
        print("drive a truck")
    }
}

class Bus: Velicle {
    func drive() {
        print("drive a bus")
    }
}

class CarFactory: VelicleFactory {
    func produce() -> Velicle {
        print("car has been created")
        return Car()
    }
}

class TruckFactory: VelicleFactory {
    func produce() -> Velicle {
        print("truck has been created")
        return Truck()
    }
}

class BusFactory: VelicleFactory {
    func produce() -> Velicle {
        print("bus has been created")
        return Bus()
    }
}

let carFactory = CarFactory()
let car = carFactory.produce()
car.drive()

let truckFactory = TruckFactory()
let truck = truckFactory.produce()
truck.drive()

let busFactory = BusFactory()
let bus = busFactory.produce()
bus.drive()





