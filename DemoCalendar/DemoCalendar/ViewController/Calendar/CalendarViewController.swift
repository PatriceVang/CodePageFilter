//
//  CalendarViewController.swift
//  DemoCalendar
//
//  Created by Apple on 9/10/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {
    @IBOutlet weak var calendarView: UIView!
    @IBOutlet weak var tbvTime: UITableView!
    @IBOutlet weak var pagerView: UIView!
    
    let displayTimeLable: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .black
        lb.font = .boldSystemFont(ofSize: 20)
        return lb
    }()
    
    let arrowTop: UIImageView = {
       let arrow = UIImageView()
        arrow.image = UIImage(named: "Polygon")
        return arrow
    }()
    
    let arrowBottom: UIImageView = {
       let arrow = UIImageView()
        arrow.image = UIImage(named: "PolygonBottom")
        return arrow
    }()
    

    let topView: UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        return v
    }()
    
    let bottomView: UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        return v
    }()
    
    let bookingView: UIView = {
        let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0.342161715, green: 0.7497660518, blue: 0.7723494172, alpha: 1)
        return v
    }()
    
    let nonOperationTopVIew: UIView = {
        let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0.7097254395, green: 0.7098491788, blue: 0.7097176313, alpha: 1)
        let content = UILabel()
        content.text = "Non-Operating hours"
        content.textColor = .black
        content.frame = .init(x: 10, y: 10, width: 200, height: 20)
        v.addSubview(content)
        return v
    }()
    let nonOperationBottomVIew: UIView = {
        let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0.7097254395, green: 0.7098491788, blue: 0.7097176313, alpha: 1)
        let content = UILabel()
        content.text = "Non-Operating hours"
        content.textColor = .black
        content.frame = .init(x: 10, y: 10, width: 200, height: 20)
        v.addSubview(content)
        return v
    }()
    
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
    
    var data: [String] {
        var str: [String] = []
        for i in 1...24 {
            var hour = ""
            var conditionTime = ""
            if i < 12 {
                conditionTime = "AM"
                hour = "\(i)" + " " + "\(conditionTime)"
            } else if i == 12 {
                hour = "Noon"
            } else {
                conditionTime = "PM"
                hour = "\(i - 12)" + " " + "\(conditionTime)"
            }
            str.append(hour)
        }
        return str
    }
    
    var hourApi: [Int] = [9, 19]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbvTime.register(UINib(nibName: "HourCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        pagerView.addSubview(nonOperationTopVIew)
        pagerView.addSubview(nonOperationBottomVIew)
        pagerView.addSubview(topView)
        pagerView.addSubview(bookingView)
        pagerView.addSubview(bottomView)
        bookingView.addSubview(displayTimeLable)
        topView.addSubview(arrowTop)
        bottomView.addSubview(arrowBottom)
    
        arrowTop.center = topView.center
        arrowBottom.center = bottomView.center
        
        topView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(onPanTopView(_:))))
        topView.isUserInteractionEnabled = true
        
        bottomView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(onPanBottomView(_:))))
        bottomView.isUserInteractionEnabled = true
        
        
        NSLayoutConstraint.activate([
            displayTimeLable.centerXAnchor.constraint(equalTo: bookingView.centerXAnchor),
            displayTimeLable.centerYAnchor.constraint(equalTo: bookingView.centerYAnchor),
        ])
        
        startTime = data[hourApi[0] - 1]
        endTime = data[hourApi[0]]
        displayTimeLable.text = "\(startTime) - \(endTime)"
             
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        nonOperationTopVIew.frame = .init(x: 0, y: 0, width: pagerView.frame.width, height: CGFloat(hourApi[0] * 50) - 50)
        
        topView.frame = .init(x: 150, y: nonOperationTopVIew.frame.maxY - 10, width: 20, height: 10)
        
        bookingView.frame = .init(x: 0, y: topView.frame.maxY, width: pagerView.frame.width, height: 65)
        
        bottomView.frame = .init(x: 150, y: bookingView.frame.maxY, width: 20, height: 10)
        
        nonOperationBottomVIew.frame = .init(x: 0, y:  CGFloat(hourApi[1] * 50), width: pagerView.frame.width, height: pagerView.frame.height - CGFloat(hourApi[1] * 50))
        
        arrowTop.frame = .init(x: 0, y: 0, width: 20, height: bottomView.frame.height)
        arrowBottom.frame = .init(x: 0, y: 0, width: 20, height: topView.frame.height)
        
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
            var frameBookingView = bookingView.frame
            topView.center.y += difference
            
            if bottomView.frame.minY - topView.frame.maxY >= 65 {
                
                frameBookingView.origin.y = topView.frame.maxY
                frameBookingView.size.height -= difference
                bookingView.frame = frameBookingView
                
                if topView.frame.maxY <= nonOperationTopVIew.frame.maxY {
                    topView.frame = .init(x: 150, y: nonOperationTopVIew.frame.maxY - 10, width: 70, height: 10)
                    frameBookingView.size.height = bottomView.frame.minY - topView.frame.maxY
                    frameBookingView.origin.y = topView.frame.maxY
                    bookingView.frame = frameBookingView
                }

                
            } else {

                var frameTopView = topView.frame
                frameTopView.origin.y -= difference
                topView.frame = frameTopView
                
                frameBookingView.origin.y = topView.frame.maxY
                frameBookingView.size.height = bottomView.frame.minY - topView.frame.maxY
                bookingView.frame = frameBookingView

            }
            
            startTime = rangeTime(arr: data, currentHeight: Int(bookingView.frame.minY))
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
            bottomView.center.y += difference
            
            if bottomView.frame.minY - topView.frame.maxY >= 65 {
                frameBookingView.size.height += difference
                bookingView.frame = frameBookingView
                
                if bottomView.frame.minY >= nonOperationBottomVIew.frame.minY {
                    bottomView.frame = .init(x: 150, y: nonOperationBottomVIew.frame.minY, width:70, height: 10)
                    frameBookingView.size.height = bottomView.frame.minY - topView.frame.maxY
                    bookingView.frame = frameBookingView
                }
                
            } else {
                
                var frameBottomView = bottomView.frame
                frameBottomView.origin.y = 65 + topView.frame.maxY - difference
                bottomView.frame = frameBottomView

                frameBookingView.size.height = frameBottomView.minY - topView.frame.maxY
                bookingView.frame = frameBookingView
            }
            
            endTime = rangeTime(arr: data, currentHeight: Int(bookingView.frame.maxY))
        case .ended:
            break
        default:
            break
        }
        
        pan.setTranslation(.zero, in: pan.view)

    }

}

extension CalendarViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbvTime.dequeueReusableCell(withIdentifier: "cell") as! HourCell
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    
}

extension CalendarViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
