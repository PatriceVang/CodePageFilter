import Foundation
///////// Linkedlist
class Node {
    var data: Int = -1
    var next: Node!

    init(data: Int) {
        self.data = data
    }
}

class LinkedList {
    var head: Node!

    init(head: Node) {
        self.head = head
    }
    
    init(arrayData: [Int]) {
        if arrayData.count == 0 { head = nil }
        var runnerNode = Node(data: arrayData[0])
        self.head = runnerNode
        
        for i in 1..<arrayData.count {
            let newNode = Node(data: arrayData[i])
            runnerNode.next = newNode
            runnerNode = newNode
        }
    }
    
    func printAllData() {
        var head: Node! = self.head

        while (head != nil) {
            print(head.data, terminator: " ")
            head = head.next
        }
        print("")
    }
    
    func lenght() -> Int {
        var result = 0
        var head : Node! = self.head
        while (head != nil) {
            result += 1
            head = head.next
        }
        return result
    }
    
    func findMax() -> Int {
        var head : Node! = self.head
        var result = head.data
        while (head != nil) {
            if head.data > result{
                result = head.data
            }
            head = head.next
        }
        return result
    }
    
    func dataAt(position: Int) -> Int? {
        var head : Node! = self.head
        var index = 0
        if position < 0 { return nil}
       
        while head != nil {
            if index == position{
                return head.data
            }
            index = index + 1
            head = head.next
        }
        return nil
    }
    
    func insertFirst(data: Int) { 
        let newNode = Node(data: data)
        newNode.next = head
        head = newNode
    }
    
    func insertAt(position: Int, data: Int) {
        
        if position == 0 {
            self.insertFirst(data: data)
            return
        }
        
        var head : Node! = self.head
        var index = 0
        while head != nil {
            if index == position - 1 {
                let newNode = Node(data: data)
                newNode.next = head.next //noted
                head.next = newNode
                break
            }
            index = index + 1
            head = head.next
        }
    }
    
    func removeFirst() {
        var currentHead: Node! = self.head
        self.head = currentHead.next
        currentHead = nil
        
        
    }
    
    func delete(position: Int) {
        if position == 0 { removeFirst(); return; }
        
         var head : Node! = self.head
        var preHead: Node! = head
         var index = 0
         while head != nil {
            
            if index == position {
                preHead.next = head.next
                head = nil
                break
            }
            
            preHead = head
            head = head.next
            index += 1
        }
    }
}



let node = Node(data: -1)
let node2 = Node(data: -14)
let node3 = Node(data: -17)
let node4 = Node(data: -9)
let node5 = Node(data: -2)
let node6 = Node(data: 3)
let node7 = Node(data: 1)
let node8 = Node(data: 2)

node.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
node5.next = node6
node6.next = node7
node7.next = node8


//let linkedlist = LinkedList(head: node)

//linkedlist.insertAt(position: 0, data: 10)
//linkedlist.dataAt(position: 1)
//linkedlist.delete(position: 0)
//linkedlist.lenght()
//linkedlist.printAllData()

var arr = [1]

var newLinkedList = LinkedList(arrayData: arr)
//newLinkedList.printAllData()


class Queue: LinkedList {
    var tail: Node!
    
    override init(head: Node) {
        super.init(head: head)
        tail = head
    }
    
    override init(arrayData: [Int]) {
        super.init(arrayData: arrayData)
        
        var runnerNode: Node! = self.head
        
        while true {
            if runnerNode.next == nil {
                tail = runnerNode
                break
            }
            runnerNode = runnerNode.next
        }
    }
    
    func enQueue(data: Int) {
        var tailNew = Node(data: data)
        self.tail.next = tailNew
        self.tail = tailNew
    }
    
    func deQueue() -> Int {
        let data = self.head.data
        var newHead: Node! = self.head.next
        self.head = nil
        self.head = newHead
        return data
    }
    
    func findMaxOfQueue() -> Int {
        <#function body#>
    }
    
   
}


let queue = Queue(arrayData: [1,2,3])
queue.enQueue(data: 4)
queue.deQueue()

queue.deQueue()





//print(queue.head.data)
//
//print(queue.tail.data)

//





