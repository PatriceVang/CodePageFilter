//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

// total state
protocol State {
    var context: LikeContext? {get set}
    func like()
    func unLike()
}

extension State {
    mutating func updateContext(_ context: LikeContext) {
        self.context = context
    }
}

// Need save current context and func convert state for context
class LikeContext {
    private var state: State
    
    init(state: State) {
        self.state = state
    }
    
    func transitionTo(_ state: State) {
        self.state = state
        self.state.updateContext(self)
    }
    
    func changeLike() {
        state.like()
    }
    
    func changeUnlike() {
        state.unLike()
    }
}

class LikeState: State {
    var context: LikeContext?
    
    func like() {
        
    }
    
    func unLike() {
        
    }
    
    
    
}


