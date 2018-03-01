
protocol DriveVehicle {
    func startVehicle()
    func haveASeat()
    func closeTheDoor()
    func useProtection()
    func lookAtTheMirror()
    func turnSignal()
    func driveForward()
}

extension DriveVehicle {

    func startVehicle() {
        haveASeat()
        closeTheDoor()
        useProtection()
        lookAtTheMirror()
        turnSignal()
        driveForward()
    }
    
    func haveASeat() {
        preconditionFailure("this method should be overriden")
    }
    
    func closeTheDoor() {
        preconditionFailure("this method should be overriden")
    }
    
    func useProtection() {
        preconditionFailure("this method should be overriden")
    }
    
    func lookAtTheMirror() {
        preconditionFailure("this method should be overriden")
    }
    
    func turnSignal() {
        preconditionFailure("this method should be overriden")
    }
    
    func driveForward() {
        preconditionFailure("this method should be overriden")
    }
}

class Bicycle: DriveVehicle{

    func haveASeat() {
        print("sit down on the bicycle seat")
    }
    
    func closeTheDoor() {
    }
    
    func useProtection() {
        print("put on a helmet")
    }
    
    func lookAtTheMirror() {
        print("look at the little mirror")
    }
    
    func turnSignal() {
        print("show left hend")
    }
    
    func driveForward() {
        print("pedal")
    }

}

class Car: DriveVehicle{
    
    func haveASeat() {
        print("sit down on a car seat")
    }
    
    func closeTheDoor() {
        print("close the door")
    }
    
    func useProtection() {
        print("fasten seat belt")
    }
    
    func lookAtTheMirror() {
        print("look at the left and rearview mirrors")
    }
    
    func turnSignal() {
        print("turn on left turn light")
    }
    
    func driveForward() {
        print("push pedal")
    }
    
}


let car = Car()
let bicycle = Bicycle()

car.startVehicle()
print("========================")
bicycle.startVehicle()












