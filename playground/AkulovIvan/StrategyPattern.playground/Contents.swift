

protocol SwimBehavior { func swim() }
protocol DiveBehavior { func dive() }

class ProfessionalSwimmer: SwimBehavior {
    func swim() {
        print("professional swimming")
    }
}

class NonSwimmer: SwimBehavior {
    func swim() {
        print("non-swimming")
    }
}

class ProfessionalDiver: DiveBehavior {
    func dive() {
        print("professional diving")
    }
}

class NewBieDiver: DiveBehavior {
    func dive() {
        print("newbie diving")
    }
}

class NonDiver: DiveBehavior {
    func dive() {
        print("non-diving")
    }
}

//---------------------------------------------------
class Human {
    
    init(swimBehavior: SwimBehavior, diveBehavior: DiveBehavior) {
        self.swimBehavior = swimBehavior
        self.diveBehavior = diveBehavior
    }
    
    private var diveBehavior: DiveBehavior!
    private var swimBehavior: SwimBehavior!
    
    func performSwim() {
        swimBehavior.swim()
    }
    
    func performDive() {
        diveBehavior.dive()
    }
    
    func performRun() {
        print("running")
    }
    
    func setSwimBehavior(sb: SwimBehavior) {
        self.swimBehavior = sb
    }
    
    func setDiveBehavior(db: DiveBehavior) {
        self.diveBehavior = db
    }
}

let human = Human(swimBehavior: ProfessionalSwimmer(), diveBehavior: ProfessionalDiver())
//human.setDiveBehavior(db: NonDiver())
human.performDive()

//human.setSwimBehavior(sb: NonSwimmer())
human.performSwim()
human.performRun()

