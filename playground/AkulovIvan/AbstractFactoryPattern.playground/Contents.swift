


protocol Car { func drive() }
protocol Bus { func drive() }
protocol Factory {
    func produceCar() -> Car
    func prodiceBus() -> Bus
}

class LittleSizeCar: Car {
    func drive() {
        print("drive a little car")
    }
}

class MiddleSizeCar: Car {
    func drive() {
        print("drive a middle car")
    }
}

class LittleSizeBus: Bus {
    func drive() {
        print("drive a little bus")
    }
}

class MiddleSizeBus: Bus {
    func drive() {
        print("drive a middle bus")
    }
}

class LittleSizeFactory: Factory {
    func produceCar() -> Car {
        print("little car has been created")
        return LittleSizeCar()
    }
    
    func prodiceBus() -> Bus {
        print("little bus has been created")
        return LittleSizeBus()
    }
}

class MiddleSizeFactory: Factory {
    func produceCar() -> Car {
        print("middle car has been created")
        return MiddleSizeCar()
    }
    
    func prodiceBus() -> Bus {
        print("middle bus has been created")
        return MiddleSizeBus()
    }
}


let littleSizeFactory = LittleSizeFactory()
let littleSizeCar = littleSizeFactory.produceCar()

let middleSizeFactory = MiddleSizeFactory()
let middleSizeBus = middleSizeFactory.prodiceBus()




