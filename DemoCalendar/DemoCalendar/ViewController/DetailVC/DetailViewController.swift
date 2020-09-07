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
    @IBOutlet weak var menuView: JTCalendarMenuView!
    @IBOutlet weak var calendarView: JTHorizontalCalendarView!
    
    @IBOutlet weak var bottomConstrain: NSLayoutConstraint!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var hourView: UIView!
    
    var calendarManager: JTCalendarManager!
    
    var todayDate = NSDate()
    var minDate = NSDate()
    var maxDate = NSDate()
    var dateSelected = NSDate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendarManager = JTCalendarManager.init()
        
        calendarManager.delegate = self
        calendarManager.contentView = calendarView
        calendarManager.menuView = menuView
        calendarManager.settings?.weekModeEnabled = true
        
        menuView.scrollView.isScrollEnabled = false
        
        calendarView.isScrollEnabled = false
        
        
        createMinAndMaxDate()
        
        let myDate = Date()
        calendarManager.setDate(myDate)
        
        
        
        topView.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(onLongPressTopView(_:))))
        topView.isUserInteractionEnabled = true
        
        bottomView.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(onLongPressBottomView(_:))))
        bottomView.isUserInteractionEnabled = true
        
    }
    
    @objc func onLongPressTopView(_ long: UILongPressGestureRecognizer) {
        let touchStart = long.location(in: long.view)
        print(touchStart)
//        if topConstraint.constant <= 10 {
//            return
//        } else {
//            topConstraint.constant += touchStart.y
//        }
        
        topConstraint.constant += touchStart.y
       
    }
    
    @objc func onLongPressBottomView(_ long: UILongPressGestureRecognizer) {
        let touchStart = long.location(in: long.view)
        print(touchStart)
//        if bottomConstrain.constant >= 10 {
//            return
//        } else {
//            bottomConstrain.constant += touchStart.y
//        }
        
        bottomConstrain.constant += touchStart.y
    }
    
    
    
    func createMinAndMaxDate() {
        todayDate = NSDate()
        minDate = calendarManager.dateHelper!.add(to: todayDate as Date?, months: -6) as NSDate
        maxDate = calendarManager.dateHelper!.add(to: todayDate as Date?, months: 6) as NSDate
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
