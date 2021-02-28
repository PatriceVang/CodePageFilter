import UIKit

//Trong block nay sẽ chạy bất đồng bộ
let blockOperation = BlockOperation()
//blockOperation.qualityOfService = .utility

blockOperation.addExecutionBlock {
    print("Hello")
}


blockOperation.addExecutionBlock {
    for i in 0...50 {
        print("BLock")
    }
}




blockOperation.addExecutionBlock {
    print("Finish")
}

//blockOperation.start()

let anotherBlock = BlockOperation()

//let operation = Operation()
//operation.completionBlock = {
//    print("Another block")
//}
//
anotherBlock.addExecutionBlock {
    print("Another block")
}


let operationQueue = OperationQueue()
operationQueue.qualityOfService = .default

//operationQueue.addOperation(operation)


// Thực hiện xong block này thì block kế tiếp mới được chạy
operationQueue.addBarrierBlock {
    for i in 0...1000 {
        print(i)
    }
}


operationQueue.addOperation(blockOperation)

operationQueue.addOperation(anotherBlock)







