import UIKit
import CalendarKit
import DateToolsSwift

class DemoCalendarKitViewController: DayViewController, DatePickerControllerDelegate {
    
    var data = [
        "",
        "YEAH",
        ""
    ]
    
    var hour: [Int] {
        var result = [Int]()
        for i in 0..<23 {
            result.append(i)
        }
        return result
    }
    
    
    var hourApi = [3,12]
    
    var generatedEvents = [EventDescriptor]()
    var alreadyGeneratedSet = Set<Date>()
    
    var colors = [UIColor.gray, UIColor.blue, UIColor.gray]
    
    lazy var customCalendar: Calendar = {
        let customNSCalendar = NSCalendar(identifier: NSCalendar.Identifier.gregorian)!
        customNSCalendar.timeZone = TimeZone(abbreviation: "CEST")!
        let calendar = customNSCalendar as Calendar
        return calendar
    }()
    
    override func loadView() {
        calendar = customCalendar
        dayView = DayView(calendar: calendar)
        view = dayView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "CalendarKit Demo"
        //navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Change Date",
        //                                                       style: .plain,
        //                                                       target: self,
        //                                                       action: #selector(ExampleController.presentDatePicker))
        navigationController?.navigationBar.isTranslucent = false
        dayView.autoScrollToFirstEvent = true
        
   

        reloadData()
    }
    
    //    @objc func presentDatePicker() {
    //        let picker = DatePickerController()
    //        //    let calendar = dayView.calendar
    //        //    picker.calendar = calendar
    //        //    picker.date = dayView.state!.selectedDate
    //        picker.datePicker.timeZone = TimeZone(secondsFromGMT: 0)!
    //        picker.delegate = self
    //        let navC = UINavigationController(rootViewController: picker)
    //        navigationController?.present(navC, animated: true, completion: nil)
    //    }
    
    func datePicker(controller: DatePickerController, didSelect date: Date?) {
        if let date = date {
            var utcCalendar = Calendar(identifier: .gregorian)
            utcCalendar.timeZone = TimeZone(secondsFromGMT: 0)!
            
            let offsetDate = dateOnly(date: date, calendar: dayView.calendar)
            
            print(offsetDate)
            
            dayView.state?.move(to: offsetDate)
        }
        controller.dismiss(animated: true, completion: nil)
    }
    
    func dateOnly(date: Date, calendar: Calendar) -> Date {
        let yearComponent = calendar.component(.year, from: date)
        let monthComponent = calendar.component(.month, from: date)
        let dayComponent = calendar.component(.day, from: date)
        let zone = calendar.timeZone
        
        let newComponents = DateComponents(timeZone: zone,
                                           year: yearComponent,
                                           month: monthComponent,
                                           day: dayComponent)
        let returnValue = calendar.date(from: newComponents)
        return returnValue!
    }
    
    // MARK: EventDataSource
    
    override func eventsForDate(_ date: Date) -> [EventDescriptor] {
        if !alreadyGeneratedSet.contains(date) {
            alreadyGeneratedSet.insert(date)
            generatedEvents.append(contentsOf: generateEventsForDate(date))
        }
        return generatedEvents
    }
    
    private func generateEventsForDate(_ date: Date) -> [EventDescriptor] {
        var workingDate = date.add(TimeChunk.dateComponents(hours: 0))
        var events = [Event]()
        
        for i in 0..<data.count {
            let event = Event()
            var duration = 0
            var nextOffset = 60
            
            if i == 0 {
                duration = hourApi[0] * 60
                nextOffset = duration
            } else if i == 1 {
                duration = 60
                nextOffset =  (hourApi[1] - hourApi[0]) * duration
            } else {
                duration = (24 - hourApi[1]) * 60
            }
            
            let datePeriod = TimePeriod(beginning: workingDate,
                                        chunk: TimeChunk.dateComponents(minutes: duration))
            
            event.startDate = datePeriod.beginning!
            event.endDate = datePeriod.end!
            
            //            var info = data[Int(arc4random_uniform(UInt32(data.count)))]
            
            
            //            let timezone = dayView.calendar.timeZone
            //
            //            info.append(datePeriod.beginning!.format(with: "dd.MM.YYYY", timeZone: timezone))
            //            info.append("\(datePeriod.beginning!.format(with: "HH:mm", timeZone: timezone)) - \(datePeriod.end!.format(with: "HH:mm", timeZone: timezone))")
            
            event.text = data[i]
            event.color = colors[i]
            
            events.append(event)
            
            // tinh theo phut
            
            
            workingDate = workingDate.add(TimeChunk.dateComponents(minutes: nextOffset))
            event.userInfo = String(i)
        }
        
        print("Events for \(date)")
        return events
    }
    
    //    private func textColorForEventInDarkTheme(baseColor: UIColor) -> UIColor {
    //        var h: CGFloat = 0, s: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
    //        baseColor.getHue(&h, saturation: &s, brightness: &b, alpha: &a)
    //        return UIColor(hue: h, saturation: s * 0.3, brightness: b, alpha: a)
    //    }
    
    // MARK: DayViewDelegate
    
    private var createdEvent: EventDescriptor?
    
    
    
    
    override func dayViewDidLongPressEventView(_ eventView: EventView) {
        guard let descriptor = eventView.descriptor as? Event else {
            return
        }
        
//        if eventView.frame.minY <= CGFloat(hourApi[0] * 60) {
            print("NHO HON ROIKIA CHA NOI")
        
        
        endEventEditing()
        print("Event has been longPressed: \(descriptor) \(String(describing: descriptor.userInfo))")
        
        beginEditing(event: descriptor, animated: true)
        
        print("LONG PRESS")

    }
    

    
    
    
    
    // Su dung cho picker calendar
    override func dayViewDidBeginDragging(dayView: DayView) {
        print("DayView did begin dragging")
        print("BEGIN DRAG")
    }
    
    override func dayView(dayView: DayView, willMoveTo date: Date) {
        print("DayView = \(dayView) will move to: \(date)")
        
        print("WILL MOVE")
    }
    
    override func dayView(dayView: DayView, didMoveTo date: Date) {
        print("DayView = \(dayView) did move to: \(date)")
        
        
        print("DID MOVE")
    }
    
    override func dayView(dayView: DayView, didUpdate event: EventDescriptor) {
        print("did finish editing \(event)")
        print("new startDate: \(event.startDate) new endDate: \(event.endDate)")
        
        
        
        if let _ = event.editedEvent {
            event.commitEditing()
        }
        
        if let createdEvent = createdEvent {
            createdEvent.editedEvent = nil
            generatedEvents.append(createdEvent)
            self.createdEvent = nil
            endEventEditing()
        }
        
        print("DRAG")
        
        reloadData()
    }
    
    //    override func dayViewDidSelectEventView(_ eventView: EventView) {
    //        guard let descriptor = eventView.descriptor as? Event else {
    //            return
    //        }
    //        print("Event has been selected: \(descriptor) \(String(describing: descriptor.userInfo))")
    //    }
    
    
    //    override func dayView(dayView: DayView, didTapTimelineAt date: Date) {
    //        endEventEditing()
    //        print("Did Tap at date: \(date)")
    //    }
    
    //  override func dayView(dayView: DayView, didLongPressTimelineAt date: Date) {
    //    print("Did long press timeline at date \(date)")
    //    // Cancel editing current event and start creating a new one
    //    endEventEditing()
    //    let event = generateEventNearDate(date)
    //    print("Creating a new event")
    //    create(event: event, animated: true)
    //    createdEvent = event
    //  }
    
    //    private func generateEventNearDate(_ date: Date) -> EventDescriptor {
    //        let duration = Int(arc4random_uniform(160) + 60)
    //        let startDate = date.subtract(TimeChunk.dateComponents(minutes: Int(CGFloat(duration) / 2)))
    //        let event = Event()
    //        let datePeriod = TimePeriod(beginning: startDate,
    //                                    chunk: TimeChunk.dateComponents(minutes: duration))
    //        event.startDate = datePeriod.beginning!
    //        event.endDate = datePeriod.end!
    //
    //        var info = data[Int(arc4random_uniform(UInt32(data.count)))]
    //        let timezone = dayView.calendar.timeZone
    //        info.append(datePeriod.beginning!.format(with: "dd.MM.YYYY", timeZone: timezone))
    //        info.append("\(datePeriod.beginning!.format(with: "HH:mm", timeZone: timezone)) - \(datePeriod.end!.format(with: "HH:mm", timeZone: timezone))")
    //        event.text = info.reduce("", {$0 + $1 + "\n"})
    //        event.color = colors[Int(arc4random_uniform(UInt32(colors.count)))]
    //        event.editedEvent = event
    //
    //        // Event styles are updated independently from CalendarStyle
    //        // hence the need to specify exact colors in case of Dark style
    //        if #available(iOS 12.0, *) {
    //            if traitCollection.userInterfaceStyle == .dark {
    //                event.textColor = textColorForEventInDarkTheme(baseColor: event.color)
    //                event.backgroundColor = event.color.withAlphaComponent(0.6)
    //            }
    //        }
    //        return event
    //    }
    
    
}
