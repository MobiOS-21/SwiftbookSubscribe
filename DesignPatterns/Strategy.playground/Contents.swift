
protocol SwimBehavior {
    func swim()
}

class ProfessionalSwimmer: SwimBehavior {
    func swim() {
        print("Proffessional swimmer")
    }
}

class NonSwimmer: SwimBehavior {
    func swim() {
        print("non swimming")
    }
}

protocol DiveBehavior {
    func dive()
}

class ProfessionalDiver: DiveBehavior {
    func dive() {
        print("Proffessional diver")
    }
}

class NewbieDiver: DiveBehavior {
    func dive() {
        print("newbie diver")
    }
}

class NonDiver: DiveBehavior {
    func dive() {
        print("non diver")
    }
}

class Human {
    private var diveBehavior: DiveBehavior
    private var swimBehavir: SwimBehavior
    
    init(diveBehavior: DiveBehavior, swimBehavir: SwimBehavior) {
        self.swimBehavir = swimBehavir
        self.diveBehavior = diveBehavior
    }
    func performSwim() {
        swimBehavir.swim()
    }
    
    func performDive() {
        diveBehavior.dive()
    }
    
    func setDiveBehavior(db: DiveBehavior) {
        self.diveBehavior = db
    }
    
    func setSwimBehavior(sb: SwimBehavior) {
        self.swimBehavir = sb
    }
    func run() {
        print("running")
    }
}

let human = Human(diveBehavior: ProfessionalDiver(), swimBehavir: NonSwimmer())
human.performDive()
human.performSwim()
