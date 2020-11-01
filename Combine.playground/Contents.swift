import UIKit
import Combine
var str = "Hello, playground"


public func example(of description: String,
                    action: () -> Void) {
    print("\n——— Example of:", description, "———")
    action()
}

example(of: "Publisher") {
    // 1
    let myNotification = Notification.Name("MyNotification")
    
    // 2
    let publisher = NotificationCenter.default
        .publisher(for: myNotification, object: nil)
    
    let center = NotificationCenter .default
    
    let observer = center.addObserver(forName: myNotification, object: nil, queue: nil) { (notifications) in
        print("Reviced")
    }
    
    center.post(name: myNotification, object: nil)
    center.removeObserver(observer)
}

example(of: "Subscriber") {
    let myNotification = Notification.Name("MyNotification")
    
    
    let center = NotificationCenter.default
    
    let publisher = NotificationCenter.default
        .publisher(for: myNotification, object: nil)
    
    
    let subscription = publisher.sink { (_) in
        print("Notification reviced from a publisher")
    }
    
    
    center.post(name: myNotification, object: nil)
    center.post(name: myNotification, object: nil)
    
    subscription.cancel()
    
}

example(of: "Just") {
    // 1
    let just = Just("Hello world!")
    
    // 2
    _ = just
        .sink(
            receiveCompletion: {
                print("Received completion", $0)
        },
            receiveValue: {
                print("Received value", $0)
        })
    
}


example(of: "assign(to:on:)") {
    // 1
    class SomeObject {
        var value: String = "" {
            didSet {
                print(value)
            }
        }
    }
    
    // 2
    let object = SomeObject()
    
    // 3
    let publisher = ["Hello", "world!"].publisher
    
    // 4
    _ = publisher
        .assign(to: \.value, on: object)
    
}

example(of: "assign(to:)") {
    // 1
    class SomeObject {
        @Published var value = 0
    }
    
    let object = SomeObject()
    
    // 2
    object.$value
        .sink {
            print($0)
    }
    
    // 3
    //    (0..<10).publisher
    //        .assign(to: object.$value, on: object)
}

public protocol Publisher {
    // 1
    associatedtype Output
    
    // 2
    associatedtype Failure : Error
    
    // 4
    func receive<S>(subscriber: S)
        where S: Subscriber,
        Self.Failure == S.Failure,
        Self.Output == S.Input
}

extension Publisher {
    // 3
    public func subscribe<S>(_ subscriber: S)
        where S : Subscriber,
        Self.Failure == S.Failure,
        Self.Output == S.Input {}
}




example(of: "Custom Subscriber") {
    // 1
    let publisher = (1...6).publisher
    
    // 2
    final class IntSubscriber: Subscriber {
        // 3
        typealias Input = Int
        typealias Failure = Never
        
        // 4
        func receive(subscription: Subscription) {
            subscription.request(.max(3))
        }
        
        // 5
        func receive(_ input: Int) -> Subscribers.Demand {
            print("Received value", input)
            return .none
        }
        func receive(completion: Subscribers.Completion<Never>) {
            print("Received completion", completion)
        }
    }
    
    let supscripber = IntSubscriber()
    
    
    publisher.subscribe(supscripber)
}


//example(of: "Future") {
//
//
//    func futureIncrement(
//        integer: Int,
//        afterDelay delay: TimeInterval) -> Future<Int, Never> {
//
//        Future<Int, Never> { promise in
//
//            DispatchQueue.global().asyncAfter(deadline: .now() + delay) {
//                promise(.success(integer + 1))
//            }
//        }
//    }
//
//    let future = futureIncrement(integer: 5, afterDelay: 1)
//
//    future.sink(receiveCompletion: { (complition) in
//        print(complition)
//    }) { (number) in
//        print(number)
//    }.store(in: )
//
//}
