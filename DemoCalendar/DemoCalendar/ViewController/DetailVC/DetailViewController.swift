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
    
    
    var data: [String] {
        var str: [String] = []
        for i in 0..<10 {
            str.append(String(i))
        }
        return str
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
        
        
        topView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(onPanTopView(_:))))
        topView.isUserInteractionEnabled = true
        
        bottomView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(onPanBottomView(_:))))
        bottomView.isUserInteractionEnabled = true
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        topView.frame = .init(x: calendarView.frame.width / 2, y: calendarView.frame.maxY, width: 70, height: 10)
    
        bookingView.frame = .init(x: timeTableView.frame.maxX, y: topView.frame.maxY, width: self.view.frame.width - timeTableView.frame.width, height: 80)
        
        bottomView.frame = .init(x: calendarView.frame.width / 2, y: bookingView.frame.maxY, width: 70, height: 10)
        
       
        
    }
    
    
    @objc func onPanTopView(_ pan: UIPanGestureRecognizer) {
        let translation = pan.translation(in: pan.view)
        switch pan.state {
        case .began, .changed:
            let difference = translation.y
            
            
//            if bookingView.frame.height >= 80 {
//                if topView.frame.minY >= calendarView.frame.maxY {
                    var newFrameTopView = topView.frame
                    newFrameTopView.origin.y = newFrameTopView.origin.y + difference
                    topView.frame = newFrameTopView
                    
                    var newFrameBookingView = bookingView.frame
                    newFrameBookingView.origin.y = newFrameBookingView.origin.y + difference
                    newFrameBookingView.size.height = newFrameBookingView.height - difference
                    
                    bookingView.frame = newFrameBookingView
            // keo dc
                    // k keo dc
                    
 
//                } else {
//                    topView.frame = .init(x: calendarView.frame.width / 2, y: calendarView.frame.maxY, width: 70, height: 10)
//                }
//            } else {
//
//            }
//
            
        default:
            break
        }
        
        pan.setTranslation(.zero, in: pan.view)
        
    }
    
    @objc func onPanBottomView(_ pan: UIPanGestureRecognizer) {
        let translation = pan.translation(in: pan.view)
        switch pan.state {
        case .began, .changed:
            bottomView.center.y += translation.y
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
