//
//  DetailViewController.swift
//  DemoCalendar
//
//  Created by Apple on 9/4/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
import JTCalendar

class DetailViewController: UIViewController, JTCalendarDelegate {
    
    @IBOutlet weak var calendarView: JTHorizontalCalendarView!
    
    
    @IBOutlet weak var timeTableView: UITableView!
    
    var calendarManager: JTCalendarManager!
    
    var todayDate = NSDate()
    var minDate = NSDate()
    var maxDate = NSDate()
    var dateSelected = NSDate()
    
    let topView: UIView = {
        let v = UIView()
        v.backgroundColor = .systemBlue
        return v
    }()
    
    let bottomView: UIView = {
        let v = UIView()
        v.backgroundColor = .systemBlue
        return v
    }()
    
    let bookingView: UIView = {
        let v = UIView()
        v.backgroundColor = .green
        return v
    }()
    
    
    let displayTimeLable: UILabel = {
       let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .black
        lb.font = .boldSystemFont(ofSize: 20)
        return lb
    }()
    
    
    var data: [String] {
        var str: [String] = []
        for i in 0..<20 {
            str.append(String(i))
        }
        return str
    }
    
    var startTime = "" {
        didSet {
            observableHour()
        }
    }
    var endTime = "" {
        didSet {
            observableHour()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeTableView.register(UINib(nibName: "HourCell", bundle: nil), forCellReuseIdentifier: "cell")
        timeTableView.tableFooterView = UIView()
        
        calendarManager = JTCalendarManager.init()
        
        calendarManager.delegate = self
        calendarManager.contentView = calendarView
        
        calendarManager.settings?.weekModeEnabled = true
        
        calendarView.isScrollEnabled = false
        
        let myDate = Date()
        calendarManager.setDate(myDate)
        
        
        self.view.addSubview(topView)
        self.view.addSubview(bookingView)
        self.view.addSubview(bottomView)
//        self.view.addSubview(displayTimeLable)
        
        
        topView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(onPanTopView(_:))))
        topView.isUserInteractionEnabled = true
        
        bottomView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(onPanBottomView(_:))))
        bottomView.isUserInteractionEnabled = true
        
        
//        NSLayoutConstraint.activate([
//            displayTimeLable.centerXAnchor.constraint(equalTo: bookingView.centerXAnchor),
//            displayTimeLable.centerYAnchor.constraint(equalTo: bookingView.centerYAnchor),
//        ])
//
//

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        topView.frame = .init(x: calendarView.frame.width / 2, y: calendarView.frame.maxY, width: 70, height: 10)
        
        bookingView.frame = .init(x: timeTableView.frame.maxX, y: topView.frame.maxY, width: self.view.frame.width - timeTableView.frame.width, height: 80)
        
        bottomView.frame = .init(x: calendarView.frame.width / 2, y: bookingView.frame.maxY, width: 70, height: 10)
        
        
        startTime = data[0]
        endTime = data[1]
        displayTimeLable.text = "\(startTime) - \(endTime)"
        
    }
    
    private func observableHour() {
         displayTimeLable.text = "\(startTime) - \(endTime)"
    }
    
    func rangeTime(arr: [String], currentHeight: Int) -> String {
        var result = ""
        
        let standarHeight = 50
        var preHeight = 0
        
        var aNumber = 0
        var bNumber = 0
        
        for i in 0..<arr.count {
            if i == 0 {
                bNumber = 1
                aNumber = 0
            } else {
                bNumber = i + 1
                aNumber = 1
            }
            if currentHeight >= preHeight + aNumber && currentHeight <= standarHeight * bNumber {
                result = arr[i]
            }
            preHeight = standarHeight * bNumber
        }
        return result
    }
    
    
    
    
    @objc func onPanTopView(_ pan: UIPanGestureRecognizer) {
        let translation = pan.translation(in: pan.view)
        
        switch pan.state {
        case .began, .changed:
            let difference = translation.y
            topView.center.y += difference
            var frameBookingView = bookingView.frame
            
            if (bottomView.frame.minY - topView.frame.maxY) >= 80 {
                
                if topView.frame.minY >= timeTableView.frame.minY {
                    
                    frameBookingView.origin.y += difference
                    frameBookingView.size.height -= difference
                    bookingView.frame = frameBookingView
                    
                } else {
                    
                    var frameTopView = topView.frame
                    frameTopView.origin.y = timeTableView.frame.minY
                    topView.frame = frameTopView

                    frameBookingView.size.height = bottomView.frame.minY - frameTopView.maxY
                    frameBookingView.origin.y = frameTopView.maxY
                    bookingView.frame = frameBookingView
                }
                
            } else {
    
                var frameTopView = topView.frame
                frameTopView.origin.y -= difference
                topView.frame = frameTopView
                
                frameBookingView.origin.y = topView.frame.maxY
                bookingView.frame = frameBookingView
                
                var frameBottomView = bottomView.frame
                frameBottomView.origin.y = bookingView.frame.maxY
                bottomView.frame = frameBottomView
                
            }
//            startTime = rangeTime(arr: data, currentHeight: Int(bookingView.frame.midX))
        case .ended:
            break
            
        default:
            break
        }
        pan.setTranslation(.zero, in: pan.view)
    }
    
    @objc func onPanBottomView(_ pan: UIPanGestureRecognizer) {
        let translation = pan.translation(in: pan.view)
        switch pan.state {
        case .began, .changed:
             let difference = translation.y
             var frameBookingView = bookingView.frame
            
            if bottomView.frame.minY - topView.frame.maxY >= 80 {
                
                if timeTableView.contentSize.height <= timeTableView.frame.height {
                    
                    if bottomView.frame.maxY - timeTableView.frame.minY <= timeTableView.contentSize.height  {
                        
                        bottomView.center.y += difference
                        frameBookingView.size.height += difference
                        bookingView.frame = frameBookingView
                        
                    } else {
                        bottomView.frame = .init(x: bottomView.frame.minX, y: timeTableView.contentSize.height + calendarView.frame.maxY - 10, width: bottomView.frame.width, height: 10)
                        
                        frameBookingView.size.height = bottomView.frame.minY - topView.frame.maxY
                        bookingView.frame = frameBookingView
                    }
                } else {
                    
                    bottomView.center.y += difference
                    frameBookingView.size.height += difference
                    bookingView.frame = frameBookingView
                    
                    if bottomView.frame.maxY > timeTableView.frame.maxY {
                        bottomView.frame = .init(x: bottomView.frame.minX, y: timeTableView.frame.maxY - 10, width: bottomView.frame.width, height: 10)
                        
                        frameBookingView.size.height = bottomView.frame.minY - topView.frame.maxY
                        bookingView.frame = frameBookingView
                    }

                }
                
            } else {
                
                var frameBottomView = bottomView.frame
                frameBottomView.origin.y = 81 + topView.frame.maxY - difference
                
                bottomView.frame = frameBottomView
 
                frameBookingView.size.height = frameBottomView.minY - topView.frame.maxY
            
                bookingView.frame = frameBookingView
                
            }
             
//             endTime = rangeTime(arr: data, currentHeight: Int(bookingView.frame.maxY))
            
        case .ended:
            break
        default:
            break
        }
        pan.setTranslation(.zero, in: pan.view)
    }
    
    func calendar(_ calendar: JTCalendarManager?, canDisplayPageWith date: Date?) -> Bool {
        return calendarManager.dateHelper!.date(date, isEqualOrAfter: minDate as Date?, andEqualOrBefore: maxDate as Date?)
    }
    
    func calendar(_ calendar: JTCalendarManager?, prepareDayView dayView: (UIView & JTCalendarDay)?) {
        //         Today
        let mydayview=dayView as! JTCalendarDayView
        if(calendarManager.dateHelper!.date(NSDate() as Date?, isTheSameDayThan: mydayview.date)) {
            mydayview.circleView.isHidden = false;
            mydayview.dotView.backgroundColor = UIColor.blue
            mydayview.textLabel.textColor = UIColor.white
        }
            // Selected date
        else if(String(describing: dateSelected) != "" && calendarManager.dateHelper!.date(dateSelected as Date?, isTheSameDayThan: mydayview.date)) {
            mydayview.circleView.isHidden = false;
            mydayview.circleView.backgroundColor = UIColor.red
            mydayview.dotView.backgroundColor = UIColor.white
            mydayview.textLabel.textColor = UIColor.white
        }
            // Other month
        else if(calendarManager.dateHelper!.date(calendarView.date, isTheSameMonthThan: mydayview.date)) {
            mydayview.circleView.isHidden = true;
            mydayview.dotView.backgroundColor = UIColor.red
            mydayview.textLabel.textColor = UIColor.black
        }
            // Another day of the current month
        else {
            mydayview.circleView.isHidden = true;
            mydayview.dotView.backgroundColor = UIColor.red
            mydayview.textLabel.textColor = UIColor.lightGray
        }
    }
    
    func calendar(_ calendar: JTCalendarManager?, didTouchDayView dayView: (UIView & JTCalendarDay)?) {
        let mydayview = dayView as! JTCalendarDayView
        dateSelected = mydayview.date as NSDate
        
        UIView.transition(with: mydayview, duration: 0.3, options: UIView.AnimationOptions(rawValue: 0), animations: {
            mydayview.circleView.transform = CGAffineTransform.identity
            self.calendarManager.reload()
        }, completion: nil)
        
        if(!calendarManager.dateHelper!.date(calendarView.date, isTheSameMonthThan: mydayview.date)){
            if(calendarView.date.compare(mydayview.date) == ComparisonResult.orderedAscending)
            {
                calendarView.loadNextPageWithAnimation()
            }
            else{
                calendarView.loadPreviousPageWithAnimation()
            }
        }
    }
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = timeTableView.dequeueReusableCell(withIdentifier: "cell") as! HourCell
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
}

extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
