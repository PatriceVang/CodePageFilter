//: [Previous](@previous)

import Foundation


//class Person {
//    var name: String
//
//
//    init(name: String) {
//        self.name = name
//    }
//}

//protocol Beautiful {
//    var beautiLevel: Int { get set }
//    func makeUp()
//}
//
//protocol Cookable {
//
//}
//
//
//class FemalePerson: Person, Beautiful, Cookable {
//    var beautiLevel: Int = 2
//
//    func makeUp() {
//        print("Making up")
//    }
//}
//
//class AlienPerson: Beautiful {
//    var beautiLevel: Int = 1
//    var numEyes:  Int = 5
//    func makeUp() {
//
//    }
//}
//
//
//class BeautyContest {
//    var candidates: [Beautiful] = []
//
//    func chooseMostBeautyCan() -> Beautiful? {
//        if candidates.count == 0 { return nil }
//        var mostBeauty: Beautiful = self.candidates[0]
//
//        for candidate in candidates {
//            if candidate.beautiLevel > mostBeauty.beautiLevel {
//                mostBeauty = candidate
//            }
//        }
//        return mostBeauty
//    }
//}
//
//let contest = BeautyContest()
//contest.candidates = [ FemalePerson(name: "Lady"), AlienPerson() ]
//
//contest.chooseMostBeautyCan()?.beautiLevel


//class Person {
//    fileprivate var name = "David"
    
//    func getName() -> String {
//        return name
//    }
//
//    func setName(name: String){
//        self.name = name
//    }
//}

//open
//public
//internal
//fileprivate
//private

//class Male : Person{
//
//
//}
//var instance = Male()
////instance.name = "1234"
//
//var a = Animal(name: "", weight:

//var hinhChunhat = HinhChuNhat()
//
//hinhChunhat.chieudai = 4
//hinhChunhat.chieurong = 2
//print(hinhChunhat.toString())

//var sv1 = SinhVien(id: 001, name: "Patrice", pointLT: 5.0, pointTH: 5.5)
//sv1.acountPointAverage()
//print(sv1.toString())
//
//var sv2 = SinhVien(id: 002, name: "Marco", pointLT: 6.0, pointTH: 6.5)
//sv2.acountPointAverage()
//print(sv2.toString())
//
//
//
//var sv3 = SinhVien()
//sv3.id = 003
//sv3.name = "CR7"
//sv3.pointLT = 5.5
//sv3.pointTH = 5.5
//print(sv3.toString())
//

//class Food {
//    var name: String
//    init(name: String) {
//        self.name = name
//    }
//    convenience init() {
//        self.init(name: "[Unnamed]")
//    }
//}
//
//let namedMeat = Food(name: "Bacon")
//let mysteryMeat = Food()
//
//class RecipeIngredient: Food {
//    var quantity: Int
//    init(name: String, quantity: Int) {
//        self.quantity = quantity
//        super.init(name: name)
//    }
//    override convenience init(name: String) {
//        self.init(name: name, quantity: 1)
//    }
//}
//
//let oneMysteryItem = RecipeIngredient()
//let oneBacon = RecipeIngredient(name: "Bacon")
//let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)
//
//class ShoppingListItem: RecipeIngredient {
//    var purchased = false
//    var description: String {
//        var output = "\(quantity) x \(name)"
//        output += purchased ? " ✔" : " ✘"
//        return output
//    }
//}
//
//var breakfastList = [
//    ShoppingListItem(),
//    ShoppingListItem(name: "Bacon"),
//    ShoppingListItem(name: "Eggs", quantity: 6),
//]
//
//breakfastList[0].name = "Orange juice"
//breakfastList[0].purchased = true
//
//for item in breakfastList {
//    print(item.description)
//}

//class Document {
//    var name: String?
//    init() {}
//    init?(name: String) {
//        if name.isEmpty { return nil }
//        self.name = name
//    }
//}
//
//class AutomaticallyNamedDocument: Document {
//    override init() {
//        super.init()
//        self.name = "[Untitled]"
//    }
//    override init(name: String) {
//        super.init()
//        if name.isEmpty {
//            self.name = "[Untitled]"
//        } else {
//            self.name = name
//        }
//    }
//}


//Declare 1 closure, (Int) ->  Bool
// checking prime numbers



//func checkingPrimeNumber() -> () -> Bool {
//    func checking() -> Bool {
//        let n = 10
//        var result = 0
//        for i in 1...n {
//            if i % 1 == 0 && i % n == 0 {
//                result += i
//            }
//        }
//        if result == 2 {
//            return true
//        } else {
//            return false
//        }
//    }
//    return checking
//}


//var closure: ((Int) -> Bool) = { num in
//    //todo
//    return num % 2 == 0
//}
//
//
//print(closure(5))

//func searchFirstPrimeNum(in arr: [Int], complt: ([Int]) -> Void) {
//    let arrPrime = arr.filter { item in
//        if item == 1 || item == 2 { return true }
//        var isPrime = true
//        (2..<item).forEach { num in
//            isPrime = isPrime && (item % num != 0)
//        }
//        return isPrime
//    }
//
////    complt
////
////    complt(arrPrime)
//
//    complt(arrPrime)
//}
//
//
//
//searchFirstPrimeNum(in: [8, 6,7, 9]) { num in
//    print(num)
//}
//
//searchFirstPrimeNum(in: [1,2,3,4,5,6,7,8,9]) { arr in
//
//}


//var list = [1,3,5,8]

//func toTal() -> [Int] { ... }
//
//
//func toTal(closure:(Int) -> Void){
//    var result = 0
//    for  i in list {
//        result += i
//    }
//    closure(result)
//}
//
//toTal { n in
//    print(n)
//}

//
//func checkIsPrimNumber(n: Int ,closure: (Bool) -> Void) {
//    var condition = 0
//    for i in 1...n {
//        if  i % 1 == 0 && i % n == 0 {
//            condition += i
//        }
//    }
//    let result = condition == 2 ? true : false
//
//
//    closure(result)
//}
//var num = 2
//
//khai bao bien closure
//var handlePrimeNum: (Bool) -> Void = {
//
//}
//
//
//checkIsPrimNumber(n: num) { isPrime in
//    if isPrime {
//        print("\(num) la so nguyen to")
//    } else {
//        print(" k phai la so nguyen to")
//    }
//}



//func incrementNumberInList(list: [Int], closure: ([Int]) -> Void){
//
//}

//var list = [1,5,7,8,3]
//
//
//list.sorted { (a, b) -> Bool in
//    return a > b
//}
//
//list

//func addTwoInts(_ a: Int, _ b: Int) -> Int {
//    return a + b
//}
//
//func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
//    print("Result: \(mathFunction(a, b))")
//}
//printMathResult(addTwoInts, 3, 5)




//func addTow(function: (Int, Int) -> Int, a: Int, b: Int){
//    print("\(function(a,b))")
//}
//
//addTow(function: { (a, b) -> Int in
//    return a + b
//}, a: 5, b: 7)

//func treamentResult(_ a: Int) -> Bool {
//    if a % 2 == 0 {
//        return true
//    } else {
//        return false
//    }
//}
//
//func checkingIsEvenNumber(number: Int,fun: (Int) -> Bool){
//    let result = treamentResult(number)
//    if result {
//        print("\(number) la so chan")
//    } else {
//        print("\(number) la so le")
//    }
//}
//checkingIsEvenNumber(number: 6, fun:  treamentResult)

// var a = 746381295/10000000
//var b = 74%10


//vd1
//class CanBo {
//    var name: String
//    var age: Int
//    var sex: String
//    var adress: String
//    init(name: String, age: Int, sex: String, adress: String) {
//        self.name = name
//        self.age  = age
//        self.sex  = sex
//        self.adress = adress
//    }
//}
//
//class CongNhan : CanBo {
//    var rank : Int = 0
//    init(name: String, age: Int, sex: String, adress: String, rank: Int) {
//        super.init(name: name, age: age, sex: sex, adress: adress)
//        self.rank = rank
//    }
//}
//
//class KySu : CanBo {
//    var branchEducation : String = ""
//    init(name: String, age: Int, sex: String, adress: String, branchEducation: String) {
//        super.init(name: name, age: age, sex: sex, adress: adress)
//        self.branchEducation = branchEducation
//    }
//}

//class NhanVien : CanBo {
//    var job : String = ""
//    init(name: String, age: Int, sex: String, adress: String, job: String) {
//        super.init(name: name, age: age, sex: sex, adress: adress)
//        self.job = job
//    }
//}
//
//class QuanLyCanBo {
//
//    var listCanBo = [CanBo]()
//
//    func addCanBo(canbo: CanBo) {
//        listCanBo.append(canbo)
//    }
//
//    func lookUp(hoten: CanBo?) -> String {
//        listCanBo.filter { (CanBo) -> Bool in
//            if CanBo.name == hoten!.name {
//                return true
//            } else {
//                return false
//            }
//        }
//
//        if true {
//            return "co"
//        } else {
//            return "k co"
//        }
//    }
//
//    func showInformation(){
//        for i in listCanBo {
//            print(i.name)
//        }
//    }
//
//}
//
//var hung = NhanVien(name: "Hung", age: 20, sex: "male", adress: "hcm", job: "member")
//var ly  =  KySu(name: "Ly", age: 38, sex: "Male", adress: "hcm", branchEducation: "IT")
//var mit = CongNhan(name: "Mit", age: 18, sex: "female", adress: "hcm", rank: 1)
//
//var l1 = QuanLyCanBo()
//
//var l3 = ly
//
//l1.addCanBo(canbo: mit)
//l1.addCanBo(canbo: hung)
//l1.lookUp(hoten: l3)
//
//l1.showInformation()



/////////////////////////////////////
//class Library : CanShowInformation{
//    func showInfo() {
//        print("Nothing")
//    }
//
//    var codeOfDocument : Int
//    var publishingHouse : String
//    var numberOfExcuting : Int
//    init(codeOfDocument : Int, publishingHouse : String,numberOfExcuting : Int) {
//        self.codeOfDocument = codeOfDocument
//        self.publishingHouse = publishingHouse
//        self.numberOfExcuting = numberOfExcuting
//    }
//
//    func lookUpOfKind() {
//        print("notthing")
//    }
//}
//
//protocol CanShowInformation {
//    func showInfo()
//}

//class Book : Library {
//    var author = ""
//    var pageNumber = 0
//    init(codeOfDocument: Int, publishingHouse: String, numberOfExcuting: Int, author: String, pageNumber: Int) {
//        super.init(codeOfDocument: codeOfDocument, publishingHouse: publishingHouse, numberOfExcuting: numberOfExcuting)
//        self.author = author
//        self.pageNumber = pageNumber
//    }
//    override func showInfo() {
//        print("Thong tin cua Book")
//    }
//
//
//}
//
//class Journal : Library {
//    var  reissueNumber = 0
//    var  reissueMonth = 0
//    init(codeOfDocument: Int, publishingHouse: String, numberOfExcuting: Int, reissueNumber : Int, reissueMonth: Int) {
//        super.init(codeOfDocument: codeOfDocument, publishingHouse: publishingHouse, numberOfExcuting: numberOfExcuting)
//        self.reissueNumber = reissueNumber
//        self.reissueMonth = reissueMonth
//    }
//
//    override func showInfo() {
//        print("Thong tin cuar Journal")
//    }
//}
//
//class News : Library {
//    var reissueDay = 0
//    init(codeOfDocument: Int, publishingHouse: String, numberOfExcuting: Int, reissueDay: Int) {
//        super.init(codeOfDocument: codeOfDocument, publishingHouse: publishingHouse, numberOfExcuting: numberOfExcuting)
//        self.reissueDay = reissueDay
//    }
//    override func showInfo() {
//        print("Thong tin cua News")
//    }
//
//
//}
//
//
//
//class ManageBook {
//    var listLibrary = [Library]()
//    func addDocumnet(doc: Library){
//        listLibrary.append(doc)
//        print("\(doc) added in Library")
//    }
////
//    func deleteDocument(codeOfDoc: Library) -> [Library] {
//        listLibrary.removeAll { (library) -> Bool in
////            if codeOfDoc.codeOfDocument == Library.codeOfDocument {
////                return true
////            } else {
////                return false
////            }
//            return (codeOfDoc.codeOfDocument == library.codeOfDocument)
//        }
//        return listLibrary
//    }
//}
//
//    func showInformation(){
//        for item in listLibrary {
//            item.showInfo()
//        }
//
//        func showNews(news: News){
//            print("\(news.reissueDay) - \(news.codeOfDocument) - \(news.numberOfExcuting) - \(news.publishingHouse)")
//        }
//
//        func showJournal(journal: Journal){
//            print("\(journal.reissueMonth) - \(journal.reissueNumber) - \(journal.codeOfDocument) - \(journal.numberOfExcuting) - \(journal.publishingHouse)")
//        }
//    }
    
    //noted
//    func lookUpOfKind<G: Library>(kind: G.Type) -> [G] {
//        return listLibrary
//            .filter({ lib -> Bool in
//                return lib is G
//            })
//            .map{ lib in
//                return lib as! G
//        }
//    }
    
    //noted
//    func stupidLookUp(kind: LibraryType) -> [Library] {
//        return listLibrary.filter { lib -> Bool in
//            switch kind {
//            case .book:
//                return lib is Book
//            case .journal:
//                return lib is Journal
//            case .news:
//                return lib is News
//            }
//        }
//    }
//}
//
//enum LibraryType {
//    case book, journal, news
//}
//
//var bookFruit = Book(codeOfDocument: 001, publishingHouse: "HCM", numberOfExcuting: 12, author: "Patrice", pageNumber: 150)
//var journalTree = Journal(codeOfDocument: 012, publishingHouse: "HN", numberOfExcuting: 21, reissueNumber: 14, reissueMonth: 10)
//var newsYoung = News(codeOfDocument: 007, publishingHouse: "HCM", numberOfExcuting: 09, reissueDay: 29)
//
//
//
////Add
//var bookStore = ManageBook()
//bookStore.addDocumnet(doc: bookFruit)
//bookStore.addDocumnet(doc: journalTree)
//bookStore.addDocumnet(doc: newsYoung)
//print(bookStore.listLibrary.count)
////bookStore.deleteDocument(codeOfDoc: journalTree)
//print(bookStore.listLibrary.count)
//bookStore.showInformation()
////bookStore.lookUpOfKind(kind: Journal.self).forEach({ print($0.codeOfDocument) })
////bookStore.lookUpOfKind(kind: bookFruit)
//(bookStore.stupidLookUp(kind: .journal) as? [Journal])?.forEach({ (kind) in
//    print(kind.codeOfDocument)
//})
/////////////////////////////////////////


/////////////////

//class Candidate {
//    var id : Int
//    var name : String
//    var address : String
//    var prioritizeRank : Int
//    var blockOfCandidate : Block
//    init(id : Int, name : String, address : String, prioritizeRank : Int, block: Block ) {
//        self.id = id
//        self.name = name
//        self.address = address
//        self.prioritizeRank = prioritizeRank
//        self.blockOfCandidate = block
//    }
//}
//
//enum Block {
//    case BlockA, BlockB, BlockC
//
//    var subjectRequires: [Subject] {
//        switch self {
//        case .BlockA:
//            return [.T, .L, .H]
//        case .BlockB:
//            return [.T, .H, .Si]
//        case .BlockC:
//            return [.V, .Su, .D]
//        }
//    }
//}
//
//enum Subject {
//    case T, L, H, Si, Su, D, V, A
//}
//
//class Admissions {
//    var listCandidate = [Candidate]()
//
//    //Add candidate
//    func addCandidate(candidate: Candidate) -> Candidate {
//        listCandidate.append(candidate)
//        return candidate
//    }
//
//    //show infor
//    func showInformationOfCandidate(candidate: Candidate){
//        print("\(candidate.id) - \(candidate.name) - \(candidate.address) \(candidate.prioritizeRank) \(candidate.blockOfCandidate.subjectRequires)")
//    }
//
//    func lookUpWithId(id: Int) -> String {
//
//        //duyet theo mang
////        let candidates = listCandidate
////            .filter { can -> Bool in
////                return (id == can.id)
////            }
////
////        if candidates.count > 0 {
////            return "\(candidates[0].name)"
////        } else {
////            return "Not show!"
////        }
//
//        let candidate = listCandidate
//            .filter { can -> Bool in
//                return (id == can.id)
//            }
//            .first
//

//        if let _candidate = candidate {
//            return "\(_candidate.name)"
//        } else {
//            return "Not found"
//        }
//    }
//}

//var a = Candidate(id: 001, name: "A Dam", address: "Iran", prioritizeRank: 1, block: Block.BlockA)
//var b = Candidate(id: 002, name: "Buterfly", address: "Binh Nguyen Vo Tan", prioritizeRank: 2, block: Block.BlockB)
//var c = Candidate(id: 003, name: "CR7", address: "Poturgal", prioritizeRank: 1, block: Block.BlockC)
//
//var add = Admissions()
//add.addCandidate(candidate: a)
//add.addCandidate(candidate: b)
//add.addCandidate(candidate: c)
//add.lookUpWithId(id: a.id)

/////////////////


//class Town {
//    var family = [Family]()
//    var numberOfFamily : Int
//    init(numberOfFamily : Int) {
//        self.numberOfFamily =  numberOfFamily
//    }
//
//    func toAllPeople() -> [People] {
//        var listPeople = [People]()
//
//        family.forEach { _family in
//            listPeople += _family.person
//        }
//        return listPeople
//    }
//}
//
//class Family {
//    var numberOfMember : Int
//    var numberOfHouse: Int
//    var person = [People]()
//    init(numberOfMember : Int, numberOfHouse: Int) {
//        self.numberOfMember = numberOfMember
//        self.numberOfHouse = numberOfHouse
//    }
//}
//
//class People {
//    var name : String
//    var age: Int
//    var career : String
//    var cmnd : Int
//
//    init(name : String, age: Int, career : String, cmnd: Int) {
//        self.cmnd = cmnd
//        self.name = name
//        self.age = age
//        self.career = career
//    }
//}
//
//var a = People(name: "CR7", age: 36, career: "Player",cmnd:1 )
//var b = People(name: "M10", age: 34, career: "Player", cmnd:2)
//var c = People(name: "Hazard", age: 30, career: "Player", cmnd:3)
//
//let familya = Family(numberOfMember: 5, numberOfHouse: 113)
//familya.person.append(a)
//familya.person.append(b)
//familya.person.append(c)
//
//let familyb = Family(numberOfMember: 3, numberOfHouse: 114)
//
//let town = Town(numberOfFamily: 2)
//town.family.append(familya)
//town.family.append(familyb)
//
//let number = 2
//
////Foreach
//
//var currentIndex = 0
//town.toAllPeople().forEach{ people in
//    if currentIndex < 2 {
//        print(people.name)
//    }
//    currentIndex += 1
//}
//
////For
//let allPeople = town.toAllPeople()
//for i in 0..<number {
//    print(allPeople[i].name)
//}

//Bai 5
//class Person {
//    var name : String
//    var age : Int
//    var cmnd : Int
//    var numberRent : Int
//    var kindOfRoom : Int
//
//    init(name: String, age: Int, cmnd: Int, numberRent: Int, kindOfRoom: Int) {
//        self.name = name
//        self.age = age
//        self.cmnd = cmnd
//        self.numberRent = numberRent
//        self.kindOfRoom = kindOfRoom
//    }
//}
//
//enum KindOfRoom : String {
//    case KindIsA, KindIsB, KindIsC
//
//    var priceOfRoom : Int {
//        switch self {
//        case .KindIsA:
//            return 500
//        case .KindIsB:
//            return 300
//        case .KindIsC:
//            return 100
//        }
//    }
//}
//
//
//
//class Hotel {
//
//    var listPerson = [Person]()
//
//    func addNewClient(client: Person){
//              listPerson.append(client)
//    }
//
//    func deleteClient(cmnd: Int) -> [Person]{
//           listPerson.removeAll { person -> Bool in
//                   return (cmnd == person.cmnd)
//           }
//            return listPerson
//    }
//
//    func acountRentRoom(cmnd: Int) -> Int {
//
//
//       var person = listPerson.filter { person -> Bool in
//            return (cmnd == person.cmnd)
//        }.first
//
//        if person == nil {
//            return 0
//        } else {
//            return person!.kindOfRoom * person!.numberRent
//        }
//    }
//
//    func showDetailInformation(person: Person){
//        print("Infdormation:\n -Name\(person.name)\n  ")
//    }
//
//
//}
//
////
//var a = Person(name: "Mou", age: 49, cmnd: 123, numberRent: 10, kindOfRoom: KindOfRoom.KindIsA.priceOfRoom)
//var a1 = Person(name: "Aterta", age: 35, cmnd: 124, numberRent: 20, kindOfRoom: KindOfRoom.KindIsB.priceOfRoom)
//var a2 = Person(name: "Lamp", age: 50, cmnd: 125, numberRent: 10, kindOfRoom: KindOfRoom.KindIsC.priceOfRoom)
////
//var hotelA = Hotel()
//hotelA.addNewClient(client: a)
//hotelA.addNewClient(client: a1)
//hotelA.addNewClient(client: a2)
//
//hotelA.acountRentRoom(cmnd: 123)



//Bai 6

//class Student {
//    var name : String
//    var age : Int
//    var homeTown : String
//    var _class : String
//    init(name : String, age : Int, homeTown : String, _class : String ) {
//        self.name = name
//        self.age = age
//        self.homeTown = homeTown
//        self._class = _class
//    }
//
//    var decription : String {
//        return "Information of Student:\n -Name:\(name)\n -Age:\(age)\n -HomeTown:\(homeTown)\n -Class: \(_class)"
//    }
//}
//
//class School {
//    var listStudent = [Student]()
//
//    func addNewStudent(student: Student){
//        listStudent.append(student)
//    }
//
//    func showStudentIs20yearOld(age: Int) -> [String] {
//        let students = listStudent.filter { student -> Bool in
//            return (age == student.age)
//        }.map { student -> String in
//            return student.name
//        }
//
//        if students == nil {
//            return []
//        } else {
//            return students
//        }
//
//    }
//
//    func acountStudentsWithAgeAndHometown() -> Int {
//        var students = listStudent.filter { student -> Bool in
//            return (student.age == 23 && student.homeTown == "DN")
//        }.count
//
//        if students == nil {
//            return 0
//        } else {
//            return students
//        }
//    }
//}
////khoi tao
//var a = Student(name: "Mathew", age: 20, homeTown: "HCM", _class: "12")
//var a1 = Student(name: "Aegon", age: 20, homeTown: "HN", _class: "5")
//var a2 = Student(name: "David", age: 20, homeTown: "DN", _class: "12")
//var a3 = Student(name: "Enzo", age: 20, homeTown: "HN", _class: "DH1")
//var a4 = Student(name: "Daniel", age: 23, homeTown: "DN", _class: "11")
//// Them
//var schoolA = School()
//schoolA.addNewStudent(student: a)
//schoolA.addNewStudent(student: a1)
//schoolA.addNewStudent(student: a2)
//schoolA.addNewStudent(student: a3)
//schoolA.addNewStudent(student: a4)
//
////loc hoc sinh tuoi 20
//schoolA.showStudentIs20yearOld(age: 20)
//schoolA.acountStudentsWithAgeAndHometown()


// Bai 7

//class Person {
//    var name : String
//    var age : Int
//    var homeTown : String
//    var id : Int
//    init(name : String, age : Int, homeTown : String, id : Int) {
//           self.name = name
//           self.age = age
//           self.homeTown = homeTown
//           self.id = id
//       }
//}
//
//class OfficialsTecher : Person {
//
//    var hardSalery : Int
//    var bonusSalery : Int
//    var penaltySalaery : Int
//
//    init(name: String, age: Int, homeTown: String, id: Int, hardSalery : Int, bonusSalery : Int, penaltySalaery : Int) {
//        self.hardSalery = hardSalery
//        self.bonusSalery = bonusSalery
//        self.penaltySalaery = penaltySalaery
//        super.init(name: name, age: age, homeTown: homeTown, id: id)
//    }
//
//
//}
//
//class ManageTecher {
//    var listOfficialsTecher = [OfficialsTecher]()
//    //them GV
//    func addNewTecher(newTecher: OfficialsTecher) {
//        listOfficialsTecher.append(newTecher)
//    }
//
//    //Xoa GV
//    func deleteTecher(id : Int){
//        var result = listOfficialsTecher.removeAll { techer -> Bool in
//            return (id == techer.id)
//        }
//
//        if result == nil {
//            print("ID is wrong")
//        } else {
//            print("Deleted ID \(id)")
//        }
//    }
//
//    //Tinh luong thuc te
//    func actuallySalery(id : Int) -> Int {
//        var result = listOfficialsTecher.filter { techer -> Bool in
//            return (id == techer.id)
//        }.first
//
//        if result == nil{
//            print("ID not find")
//            return 0
//        } else {
//            return result!.hardSalery + result!.bonusSalery - result!.penaltySalaery
//        }
//
//    }
//}
//
//var a = OfficialsTecher(name: "David Son", age: 35, homeTown: "HCM", id: 001, hardSalery: 50, bonusSalery: 10, penaltySalaery: 0)
//var a1 = OfficialsTecher(name: "Now Way", age: 40, homeTown: "HN", id: 002, hardSalery: 45, bonusSalery: 0, penaltySalaery: 0)
//var a2 = OfficialsTecher(name: "Eman", age: 38, homeTown: "HP", id: 003, hardSalery: 50, bonusSalery: 0, penaltySalaery: 10)
//var a3 = OfficialsTecher(name: "Lauhing", age: 30, homeTown: "CT", id: 004, hardSalery: 60, bonusSalery: 10, penaltySalaery: 0)
//
//var techer = ManageTecher()
//techer.addNewTecher(newTecher: a)
//techer.addNewTecher(newTecher: a1)
//techer.addNewTecher(newTecher: a2)
//techer.addNewTecher(newTecher: a3)
//
//techer.deleteTecher(id: 003)
//
//techer.actuallySalery(id: 001)
//techer.actuallySalery(id: 002)
//techer.actuallySalery(id: 003)
//techer.actuallySalery(id: 004)


/////Bai 8

//class Student {
//    var name: String
//    var age : Int
//    var _class: String
//    init(name: String, age: Int, _class: String) {
//        self.name = name
//        self.age = age
//        self._class = _class
//    }
//}
//
//class TicketOfLibrary {
//    var codeTicket : Int
//    var dayBorrow : String
//    var limitBorow : String
//    var numberOfBook : Int
//    var informationOfStudent : Student
//    init(codeTicket : Int, dayBorrow : String,limitBorow : String, numberOfBook : Int, informationOfStudent: Student ) {
//        self.codeTicket = codeTicket
//        self.dayBorrow = dayBorrow
//        self.limitBorow = limitBorow
//        self.numberOfBook = numberOfBook
//        self.informationOfStudent = informationOfStudent
//    }
//}
//
//class ManageLibrary {
//    var listTicket = [TicketOfLibrary]()
//    //them ticket
//    func addTicket(ticket: TicketOfLibrary) {
//        listTicket.append(ticket)
//        print("Added \(ticket.codeTicket)")
//    }
//    //xoa ticket
//    func deleteWithCodeTicket(code: Int) -> [TicketOfLibrary] {
//        var result = listTicket.removeAll { ticket  -> Bool in
//            return (code == ticket.codeTicket)
//        }
//        return listTicket
//    }
//}
//
//
//var a = TicketOfLibrary(codeTicket: 01, dayBorrow: "1/3/2020", limitBorow: "1/4/2020", numberOfBook: 1090, informationOfStudent: Student.init(name: "David Hay", age: 35, _class: "10"))
//var a1 = TicketOfLibrary(codeTicket: 02, dayBorrow: "28/2/2020", limitBorow: "3/3/2020", numberOfBook: 1107, informationOfStudent: Student.init(name: "David Hay", age: 25, _class: "12"))
//var a2 = TicketOfLibrary(codeTicket: 03, dayBorrow: "15/3/2020", limitBorow: "20/3/2020", numberOfBook: 107, informationOfStudent: Student.init(name: "David Hay", age: 18, _class: "19"))
//
//var manageLibrary = ManageLibrary()
//manageLibrary.addTicket(ticket: a)
//manageLibrary.addTicket(ticket: a1)
//manageLibrary.addTicket(ticket: a2)
//
//var c = manageLibrary.deleteWithCodeTicket(code: 01)

////// Bai 9

//class Client {
//    var name : String
//    var idOfHOuse: String
//    var numberOfElectricity : Int
//
//
//    init(name : String, idOfHOuse: String, numberOfElectricity : Int) {
//        self.name = name
//        self.idOfHOuse = idOfHOuse
//        self.numberOfElectricity = numberOfElectricity
//    }
//
//
//    func updateInformationClient(name : String, idHouse : String, numberOfElectricity : Int) {
//        self.name = name
//        self.idOfHOuse = idHouse
//        self.numberOfElectricity = numberOfElectricity
//    }
//
//
//}
//class Bill {
//    var numberOfOld : Int
//    var numberOfNew : Int
//    var informationOfClient : Client
//    init(numberOfOld : Int, numberOfNew : Int, informationOfClient : Client) {
//        self.numberOfOld = numberOfOld
//        self.numberOfNew = numberOfNew
//        self.informationOfClient = informationOfClient
//    }
//
//    func updateInfo(old: Int, new: Int) {
//        self.numberOfOld = old; self.numberOfNew = new
//    }
//
//    func acountMoneyElectricity(numberOld: Int, numberNew: Int) -> Int {
//        return (numberNew - numberOld) * 5
//    }
//}
//
//class ManageMoneyElectricity {
//    var listBill = [Bill]()
//
//
//    //them
//    func addCLient(client: Client) {
//        let newBill = Bill(numberOfOld: -1, numberOfNew: -1, informationOfClient: client)
//        listBill.append(newBill)
//    }
//
//    func findBill(ofClientName name: String) -> [Bill] {
////        var result = listBill.filter { bill -> Bool in
////            return (name == bill.informationOfClient.name)
////        }
////        return result
//
//
//        return listBill.filter({ $0.informationOfClient.name == name })
//    }
    
//    //xoa
//    func deleted(client: String) {
//        listBill.removeAll { bill -> Bool in
//            return (client == bill.informationOfClient.name)
//        }
//        print("Deleted \(client)")
//    }
//
//    func showInforOfBill(infor: Bill){
//        print("So moi: \(infor.numberOfNew)\n - So cu: \(infor.numberOfOld)\n - Name:\(infor.informationOfClient.name) ")
//    }
//}
//
//
//var a = Client(name: "Jon Snow", idOfHOuse: "Printer Fill" , numberOfElectricity: 100)
//var b = Client(name: "Eto", idOfHOuse: "Camaeroom", numberOfElectricity: 80)
//var c = Client(name: "Matiral", idOfHOuse: "King Dom", numberOfElectricity: 120)

//var billA = Bill(numberOfOld: 100, numberOfNew: 200, informationOfClient: a)
//var billB = Bill(numberOfOld: 200, numberOfNew: 280, informationOfClient: b)
//var billC = Bill(numberOfOld: 100, numberOfNew: 220, informationOfClient: c)

//var manage = ManageMoneyElectricity()
//
//
//manage.addCLient(client: a)
//manage.addCLient(client: b)
//manage.addCLient(client: c)
//
//
//
//manage.findBill(ofClientName: "Jon Snow").first?.updateInfo(old: 190, new: 90)
//manage.findBill(ofClientName: "Eto").first?.updateInfo(old: 100, new: 120)
//manage.findBill(ofClientName: "Matiral").first?.updateInfo(old: 50, new: 100)
//
//for i in manage.listBill {
//    manage.showInforOfBill(infor: i)
//}


//class Xe {
//    var hangSx : String
//    var namSx : String
//    var giaBan: String
//    var mauXe: String
//    init(hangSx : String, namSx : String, giaBan: String, mauXe: String) {
//        self.hangSx = hangSx
//        self.namSx = namSx
//        self.giaBan = giaBan
//        self.mauXe = mauXe
//    }
//}
//class Oto: Xe {
//    var soChoNgoi: Int
//    var kieuDongCo: String
//    init(hangSx: String, namSx: String, giaBan: String, mauXe: String, soChoNgoi: Int, kieuDongCo: String) {
//        self.soChoNgoi = soChoNgoi
//        self.kieuDongCo = kieuDongCo
//        super.init(hangSx: hangSx, namSx: namSx, giaBan: giaBan, mauXe: mauXe)
//
//    }
//}
//
//class Xemay : Xe{
//    var congSuat : Int
//    init(hangSx: String, namSx: String, giaBan: String, mauXe: String, congSuat: Int) {
//        self.congSuat = congSuat
//        super.init(hangSx: hangSx, namSx: namSx, giaBan: giaBan, mauXe: mauXe)
//    }
//}
//
//class Xetai : Xe {
//    var trongTai : Int
//    init(hangSx: String, namSx: String, giaBan: String, mauXe: String, trongTai: Int) {
//        self.trongTai = trongTai
//        super.init(hangSx: hangSx, namSx: namSx, giaBan: giaBan, mauXe: mauXe)
//    }
//}
//
//class QuanliXe {
//    var listXe = [Xe]()
//
//    func themXe(xe: Xe) {
//        listXe.append(xe)
//    }
//
//    func xoaXe() {
//
//    }
//}
//
//
//var a = Xemay(hangSx: "Honda", namSx: "2017", giaBan: "10", mauXe: "Trang", congSuat: 110)
//var a1 = Xetai(hangSx: "HuynDai", namSx: "2021", giaBan: "40", mauXe: "Xam", trongTai: 5000)
//var a2 = Oto(hangSx: "Toyota", namSx: "2010", giaBan: "80", mauXe: "Do", soChoNgoi: 4, kieuDongCo: "super man")
//
//var b = QuanliXe()
//b.themXe(xe: a)
//b.themXe(xe: a1)
//b.themXe(xe: a2)
//b.listXe.count
////b.xoaXe(xe: "Oto")
//
//b.listXe.count

//
//
//class Triangle {
//    var canhA : Int
//    var canhB : Int
//    var canhC : Int
//    init(canhA: Int, canhB: Int, canhC: Int) {
//        self.canhA = canhA
//        self.canhB = canhB
//        self.canhC = canhC
//    }
//
//    func checkingIsTGD() -> Bool {
//        return (canhB == canhA && canhA == canhC)
//    }
//
//    private func findMax(arr: [Int]) -> Int {
//        var valueIsMax = arr[0]
//        for item in arr {
//            if item > valueIsMax {
//                valueIsMax = item
//            }
//        }
//        return valueIsMax
//    }
//
//    private func sumSqrtOf(arr: [Int]) -> Int {
//        var resulSumOfSquare = 0
//        for item in arr {
//            resulSumOfSquare += item*item
//        }
//        return resulSumOfSquare
//    }
//
//    // c^2 * 2 = a^2 + b^2 + c^2
//
//    func isTGV() -> Bool {
//        let arrCanh = [canhA, canhB, canhC]
//        return findMax(arr: arrCanh) * findMax(arr: arrCanh) * 2 == sumSqrtOf(arr: arrCanh)
//    }
//}
//var a = Triangle(canhA: 4, canhB: 5, canhC: 3)
//a.checkingIsTGD()
//a.isTGV()



//class User {
//    var age = 1
//    init(age: Int) {
//        self.age = age
//    }
//}
//var user1: User //tao ra o nho nhung chua co data
//user1 = User(age: 20) //truyen data cho o nho
//user1.age = 22 //user1 = 22
//var user2 = User(age: 25) //tao ra o nho voi data: user2 = 25
//print(user1)
//user2 = user1
//user1.age = 30
//
//print(user1)

//public var store = 0
//
//class Water {
    
//
//
//    var name: String?
//
//    static var amount: Int = 0
//    init(name: String) {
//        self.name = name
//        store += 1
//    }
//}
//
//var a = Water(name: "Organe")
//var b = Water(name: "Apple")
//store


//protocol A {
//    func insora()
//}
//
//extension A {
//    func insora() {
//        print("123456")
//    }
//}
//
//class AB: A {
//    func insora() {
//        print("8888")
//    }
//}
//
//var a = AB()
//a.insora()


//protocol Boxing where Self: Sport {
//    func kickBoxing() -> Int
//}

//protocol Sport {
//    var total: Int {get}
//}
//
//extension Boxing {
//    func kickBoxing() -> Int {
//        return total
//    }
//}
//
//class A {
//
//    static let shared = A()
//
//    private init() {
//        print("234")
//    }
//
//    func number() {
//        print("number")
//    }
//}
//A.shared.number()
//var a = A(name: "123")
//a.kickBoxing()

protocol Information:  Hashable {
    var name: String {get set}
}

struct Dog: Information {
     
    var hashValue: Int {
        return 0
    }

    
    var name: String {
        get {
            return "Cho"
        }
        set {
            self.name = newValue
        }
    }
    
    
}

struct Cat: Information {
    
    var hashValue: Int {
        return 0
    }

    var name: String {
        get {
            return "Meo"
        }
        set {
            self.name = newValue
        }
    }

}

var dog = Dog()
var cat = Cat()

dog.name
cat.name
if dog.hashValue == cat.hashValue {
    print()
}





























    


















