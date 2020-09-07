//
//  HomeViewController.swift
//  DemoCalendar
//
//  Created by Apple on 9/1/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
import JTCalendar



class HomeViewController: UIViewController, JTCalendarDelegate {
    @IBOutlet weak var topContrant: NSLayoutConstraint!
    @IBOutlet weak var bookingView: UIView!
    @IBOutlet weak var bottomContraint: NSLayoutConstraint!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var topRectangleView: UIView!
    
    @IBOutlet weak var hourDisplaylabel: UILabel!
    @IBOutlet weak var calenderView: JTHorizontalCalendarView!
    @IBOutlet weak var bottomRectangleView: UIView!
    
    @IBOutlet weak var hourTableView: UITableView!
    var calendarManager: JTCalendarManager!
    
    var verticalDiff: CGFloat = 45
    var verticalInset: CGFloat = 10
    var todayDate = NSDate()
    var minDate = NSDate()
    var maxDate = NSDate()
    var dateSelected = NSDate()
    
    var bottomFrameLimit: CGFloat = 0.0
    var topFrameLimit: CGFloat = 0.0
    
    var heightDefault:CGFloat = 0.0
    
    
    var data: [String] {
        var str: [String] = []
        for i in 0..<13 {
            str.append(String(i))
        }
        return str
    }
    
    var startTime = "0" {
        didSet {
            observarbleHour()
        }
    }
    var endTime = "1"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hourTableView.register(UINib(nibName: "HourCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        setupCalendar()
        
        topRectangleView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(onPanTopCircleView(_:))))
        topRectangleView.isUserInteractionEnabled = true
        
        bottomRectangleView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(onPanBottomCircleView(_:))))
        bottomRectangleView.isUserInteractionEnabled = true
        
        topFrameLimit = containerView.frame.minY - calenderView.frame.maxY
        bottomFrameLimit = containerView.frame.maxY - calenderView.frame.maxY
        
        
        bottomContraint.constant = containerView.frame.height - 140
        
        
        hourDisplaylabel.text = "\(startTime) - \(endTime)"
        
    }
    
    private func observarbleHour() {
        hourDisplaylabel.text = "\(startTime) - \(endTime)"
    }
    
    func rangeTime(arr: [String], condition: Int) {

        let newHeight = 50
        
        var preHeight = 0
        
        var conditionTemp = 0
        
        for i in 0..<arr.count {
            
            if i == 0 {
                conditionTemp = 1
            } else {
                conditionTemp = 0
            }
            
            if condition >= preHeight + 1 && condition < (newHeight + conditionTemp ) * i {
                startTime = arr[i]
            }
            preHeight = newHeight
        }
    }
    
    @objc func onPanTopCircleView(_ pan: UIPanGestureRecognizer) {
        let translation = pan.translation(in: pan.view)
        
        switch pan.state {
        case .began, .changed:
            
            if bookingView.frame.height >= 80 {
                
                if topRectangleView.frame.minY >= topFrameLimit {
                    
                    topContrant.constant += translation.y
                    
                } else {
                    topContrant.constant = 0
                }
                
            } else {
                topContrant.constant -= 1
            }
            
//
//            let totalHeihgt = data.count * 50
//
//
//            for i in 0..<data.count {
//                switch topRectangleView.frame.maxY {
//                case 0..<50:
//                    startTime = data[0]
//                case 51..<100:
//                    startTime = data[1]
//                case 101..<150:
//                    startTime = data[2]
//                case 151..<200:
//                    startTime = data[3]
//                case 201..<250:
//                    startTime = data[4]
//                default:
//                    break
//                }
//            }
            
            rangeTime(arr: data, condition: Int(topRectangleView.frame.maxY))
            
            
            
            
            
            
            
        case .ended:
            
            break
            
        default: break
        }
        
        pan.setTranslation(.zero, in: pan.view)
    }
    
    @objc func onPanBottomCircleView(_ pan: UIPanGestureRecognizer) {
        let translation = pan.translation(in: pan.view)
        
        switch pan.state {
        case .began, .changed:
            
            if bookingView.frame.height >= 80 {
                
                if bottomRectangleView.frame.maxY <= bottomFrameLimit {
                    
                    
                    bottomContraint.constant -= translation.y
                    
                } else {
                    bottomContraint.constant = 0
                }
                
            } else {
                bottomContraint.constant -= 1
            }
            
        case .ended:
            break
        default: break
        }
        
        pan.setTranslation(.zero, in: pan.view)
        
    }
    
    
    
    private func setupCalendar() {
        calendarManager = JTCalendarManager()
        calendarManager.delegate = self
        calendarManager.contentView = calenderView
        calendarManager.settings?.weekDayFormat = JTCalendarWeekDayFormat.single
        calendarManager.settings?.weekModeEnabled = true
        calendarManager.settings?.pageViewHaveWeekDaysView = true
        calendarManager.setDate(self.dateSelected as Date)
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
        
        if(!calendarManager.dateHelper!.date(calenderView.date, isTheSameMonthThan: mydayview.date)){
            if(calenderView.date.compare(mydayview.date) == ComparisonResult.orderedAscending)
            {
                calenderView.loadNextPageWithAnimation()
            }
            else{
                calenderView.loadPreviousPageWithAnimation()
            }
        }
    }
    
    func calendarDidLoadNextPage(_ calendar: JTCalendarManager?) {
        changeMonth(date: (calendar?.date())!)
    }
    
    func calendarDidLoadPreviousPage(_ calendar: JTCalendarManager?) {
        changeMonth(date: (calendar?.date())!)
    }
    
    func changeMonth(date: Date) {
        self.title = date.toString(formatString: GFDateFormat.MMMMyyyy.rawValue)
    }
}


extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = hourTableView.dequeueReusableCell(withIdentifier: "cell") as! HourCell
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}


