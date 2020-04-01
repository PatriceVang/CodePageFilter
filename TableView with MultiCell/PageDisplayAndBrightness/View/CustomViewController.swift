//
//  CustomViewController.swift
//  PageDisplayAndBrightness
//
//  Created by Apple on 3/31/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class CustomViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let headerSection = ["APPEARANCE", "BRIGHTNESS", "", " "]
    
    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    //section
    func numberOfSections(in tableView: UITableView) -> Int {
        return headerSection.count
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 || section == 1 {
            return 60
        }
        return 40
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 70))
        let label = UILabel(frame: CGRect(x: 10, y: 20, width: tableView.frame.size.width, height: 30))
        label.text = self.headerSection[section]
        label.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(label)
        view.backgroundColor = #colorLiteral(red: 0.7252808213, green: 0.729327023, blue: 0.7375316024, alpha: 1)
        return view
   
    }
    //cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        } else if section == 1 {
            return 1
        } else if section == 2 {
            return 1
        } else {
            return 2
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if headerSection[0] == headerSection[indexPath.section] {
            if indexPath.row == 0 {
                let cell1 = myTableView.dequeueReusableCell(withIdentifier: "Cell1") as? FirstTableViewCell
                cell1?.imgView1.image = UIImage(named: "img1")
                cell1?.imgView2.image = UIImage(named: "img2")
                      return cell1!
            } else if indexPath.row == 1 {
                let cell2 = myTableView.dequeueReusableCell(withIdentifier: "Cell2") as? SecondTableViewCell
                cell2?.lbAutomatic.text = "Automatic"
                      return cell2!
            }else if indexPath.row == 2 {
                let cell3 = myTableView.dequeueReusableCell(withIdentifier: "Cell3") as? ThirdTableViewCell
                cell3?.lbOption.text = "Option"
                cell3?.lbResultOption.text = "Light"
                return cell3!
            }
        } else if headerSection[1] == headerSection[indexPath.section] {
                let cell4 = myTableView.dequeueReusableCell(withIdentifier: "Cell4") as?         FourTableViewCell
                return cell4!
            
        } else if headerSection[2] == headerSection[indexPath.section] {
            if indexPath.row == 0 {
                    let cell5 = myTableView.dequeueReusableCell(withIdentifier: "Cell5") as? FiveTableViewCell
                    cell5?.lbNightShit.text = "Night Shift"
                    cell5?.lbOff.text = "Off"
                return cell5!
            }
        } else if headerSection[3] == headerSection[indexPath.section] {
            if indexPath.row == 0 {
                let cell6 = myTableView.dequeueReusableCell(withIdentifier: "Cell6") as? SixTableViewCell
                cell6?.lbAutoClock.text = "Auto - Clock"
                cell6?.lbMinute.text = "Minute"
                return cell6!
            } else if indexPath.row == 1 {
                let cell7 = myTableView.dequeueReusableCell(withIdentifier: "Cell7") as? SevenTableViewCell
                cell7?.lbRaiseToWake.text = "Raise to Wake"
                return cell7!
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if headerSection[0] == headerSection[indexPath.section] {
            if indexPath.row == 0 {
                return 250
            }
            return 50
        }
         return 50
        
    }
    
    
    



}
