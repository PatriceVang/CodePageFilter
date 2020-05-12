//
//  ViewController.swift
//  MessageApp
//
//  Created by Apple on 5/12/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
private let cellId = "cell"

extension Date {
    static func customDate(str: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyy"
        return dateFormatter.date(from: str) ?? Date()
        
    }
}

class DateHeaderLb: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        textColor = .white
        textAlignment = .center
        backgroundColor = .lightGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        let contentSize = super.intrinsicContentSize
        let width = contentSize.width + 16
        let height = contentSize.height + 12
        layer.cornerRadius = height / 2
        layer.masksToBounds = true
        return .init(width: width, height: height)
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var myTableV: UITableView!
    //MARK: Probretis
    
    let listMsgFromUserA = [
        [
            Message(msg: "What interests you about this position?", ofOwnUser: true, date: Date.customDate(str: "01/05/2020")),
            Message(msg: "its help my sleep difficult", ofOwnUser: false, date: Date.customDate(str: "01/05/2020")),
            
        ],
        [
            Message(msg: "What languages have you programmed in?", ofOwnUser: true, date: Date.customDate(str: "03/05/2020")),
            Message(msg: "Swift", ofOwnUser: false, date: Date.customDate(str: "01/05/2020"))
        ],
        [
            Message(msg: "What is the biggest IT challenge you have faced and how did you handle it? ", ofOwnUser: true, date:Date.customDate(str: "05/05/2020"))
        ]
    ]
    
    let msgFromUserSv = [
               Message(msg: "What interests you about this position?", ofOwnUser: true, date: Date.customDate(str: "01/05/2020")),
               Message(msg: "its help my sleep difficult", ofOwnUser: false, date: Date.customDate(str: "01/05/2020")),
               Message(msg: "What languages have you programmed in?", ofOwnUser: true, date: Date.customDate(str: "03/05/2020")),
               Message(msg: "Swift", ofOwnUser: false, date: Date.customDate(str: "01/05/2020")),
               Message(msg: "What is the biggest IT challenge you have faced and how did you handle it? ", ofOwnUser: true, date:Date.customDate(str: "05/05/2020")),
               Message(msg: "Swift", ofOwnUser: false, date: Date.customDate(str: "29/05/2020")),
               Message(msg: "What is the biggest IT challenge you have faced and how did you handle it? ", ofOwnUser: true, date:Date.customDate(str: "05/04/2020"))
       ]
    
    var chatMsg = [[Message]]()
    
    private func attempToGroupedMsg() {
        let groupMsg = Dictionary(grouping: msgFromUserSv) { (element) -> Date in
            return element.date!
        }
        //sorting key somehow
//        let sortedKey = groupMsg.keys.sorted()
//        sortedKey.forEach { (date) in
//            let values = groupMsg[date]
//            chatMsg.append(values ?? [])
//        }
        
//        groupMsg.keys.forEach { (date) in
//            let values = groupMsg[date]
//            chatMsg.append(values ?? [])
//            print(values)
//        }
        chatMsg = groupMsg.sorted { $0.key < $1.key }
            .map{ $0.value }
        
        
    }
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        attempToGroupedMsg()
        self.title = "Message"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        myTableV.register(UINib(nibName: "OptionCell", bundle: nil), forCellReuseIdentifier: cellId)
        myTableV.separatorStyle = .none
        myTableV.backgroundColor = UIColor(white: 0.95, alpha: 1)
    }
}
//MARK: Table View
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    //MARK: Section
    func numberOfSections(in tableView: UITableView) -> Int {
        return chatMsg.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let firstMsgInsection = chatMsg[section].first {
            let dateFormate =  DateFormatter()
            dateFormate.dateFormat = "dd/MM/yyyy"
            let dateString = dateFormate.string(from: firstMsgInsection.date!)
      
            let lb = DateHeaderLb()
            lb.text = dateString

            lb.translatesAutoresizingMaskIntoConstraints = false
            
            let aView = UIView()
            aView.addSubview(lb)
            lb.centerXAnchor.constraint(equalTo: aView.centerXAnchor).isActive = true
            lb.centerYAnchor.constraint(equalTo: aView.centerYAnchor).isActive = true
            return aView
        }
        return nil
    }
    
    //MARK: Cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMsg[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableV.dequeueReusableCell(withIdentifier: cellId) as? OptionCell
        let msg = chatMsg[indexPath.section][indexPath.row]
        cell?.msg = msg
        return cell!
    }
}
