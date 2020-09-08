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
    
    @IBOutlet weak var constantHourTableView: NSLayoutConstraint!
    @IBOutlet weak var hourDisplaylabel: UILabel!
    @IBOutlet weak var calenderView: JTHorizontalCalendarView!
    @IBOutlet weak var bottomRectangleView: UIView!

    @IBOutlet weak var hourTableView: UITableView!
    var calendarManager: JTCalendarManager!
    
    
    var todayDate = NSDate()
    var minDate = NSDate()
    var maxDate = NSDate()
    var dateSelected = NSDate()
    
    
    
    var topLimit: CGFloat = 0.0
    
    var data: [String] {
        var str: [String] = []
        for i in 0..<10 {
            str.append(String(i))
        }
        return str
    }
    
    var startTime = "0" {
        didSet {
            observarbleHour()
        }
    }
    var endTime = "1" {
        didSet {
            observarbleHour()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hourTableView.register(UINib(nibName: "HourCell", bundle: nil), forCellReuseIdentifier: "cell")
        hourTableView.tableFooterView = UIView()
        
        setupCalendar()
        
        topRectangleView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(onPanTopCircleView(_:))))
        topRectangleView.isUserInteractionEnabled = true
        
        bottomRectangleView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(onPanBottomCircleView(_:))))
        bottomRectangleView.isUserInteractionEnabled = true
        
        topLimit = containerView.frame.minY - calenderView.frame.maxY
        
        // xac dinh lai so 140
        let heightDefault: CGFloat = containerView.frame.height - 140
        bottomContraint.constant = heightDefault
        
        hourDisplaylabel.text = "\(startTime) - \(endTime)"
        
    }
    
    private func observarbleHour() {
        hourDisplaylabel.text = "\(startTime) - \(endTime)"
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
    
    @objc func onPanTopCircleView(_ pan: UIPanGestureRecognizer) {
        let translation = pan.translation(in: pan.view)
        
        switch pan.state {
        case .began, .changed:
            pan.setTranslation(.zero, in: pan.view)
            
            if bookingView.frame.height >= 70 {
                
                if topRectangleView.frame.minY >= topLimit {
                    
                    topContrant.constant += translation.y
                    
                } else {
                    UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                        self.topContrant.constant = 0
                        
                    }, completion: { _ in self.view.layoutIfNeeded()})
                }
                
            } else {
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                    self.topContrant.constant -= 2
                }, completion:{ _ in self.view.layoutIfNeeded()})
                
            }
            hourDisplaylabel.text = ""
        case .ended:
            
            startTime = rangeTime(arr: data, currentHeight: Int(topRectangleView.frame.maxY))
            
        default: break
        }
        
        
    }
    
    @objc func onPanBottomCircleView(_ pan: UIPanGestureRecognizer) {
        let translation = pan.translation(in: pan.view)
        
        switch pan.state {
        case .began, .changed:
            pan.setTranslation(.zero, in: pan.view)
            
            // can xac dinh thay doi so 70 nay
            if bookingView.frame.height >= 70 {
                // dat dieu kien theo contentSize cua tableview
                if hourTableView.contentSize.height <= containerView.frame.height {
                    if bottomRectangleView.frame.maxY <= hourTableView.contentSize.height {
                        bottomContraint.constant -= translation.y
                    } else {
                        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                            self.bottomContraint.constant = self.containerView.frame.height - self.hourTableView.contentSize.height
                        }, completion: { _ in self.view.layoutIfNeeded()})
                    }
                    
                } else {
                    if bottomContraint.constant >= 0 {
                        bottomContraint.constant -= translation.y
                    } else {
                        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                            self.bottomContraint.constant = 0
                        }, completion: { _ in self.view.layoutIfNeeded() })
                    }
                }
 
            } else {
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                    self.bottomContraint.constant -= 2
                }, completion: nil)
                
            }
            
             hourDisplaylabel.text = ""
            
        case .ended:
            
            endTime = rangeTime(arr: data, currentHeight: Int(bottomRectangleView.frame.minY))
            
        default: break
        }
       
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


