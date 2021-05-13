//
//  ViewController.swift
//  CoreDataN-N
//
//  Created by Apple on 5/12/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tbvLib: UITableView!
    
    var libs: [Library] {
        return DBHelper.shared.fetch(.Library)
    }

    var pics: [Picture] {
        return DBHelper.shared.fetch(.Picture)
    }
    
    var isExpand = false
    var headerSection = 0
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(performAddUser))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(performAddDog))
        
        
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print(urls[urls.count-1] as URL)
        
        tbvLib.register(UINib(nibName: "LibCell", bundle: nil), forCellReuseIdentifier: "cell")
        tbvLib.tableFooterView = UIView()
        
    }
    
    @objc func performAddUser() {
        
        libs.forEach {
            print("Lib: \($0.name)")
            let pic = $0.pic?.allObjects as? [Picture]

            pic?.forEach {
                print("Pic: \($0.name) - \($0.id)")
            }

        }
        print("-----------")
        pics.forEach {
            print($0.name)
            let lib = $0.lib?.allObjects as? [Library]
            lib?.forEach {
                print("Lib: \($0.name) - \($0.id)")
            }
        }
        
        
    }
    
    @objc func performAddDog() {
        
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
//        let managedContext =
//            appDelegate.persistentContainer.viewContext
//
//        let lib2 = libs[1]
        
//        let pic1 = pics.first
        
//        pic1?.addToLib(lib2)
        
//        do {
//            try! managedContext.save()
//        } catch {
//            print("Count not save")
//        }
        DBHelper.shared.update {
            libs.first?.name = "Lib"
        }
        
        
//        DBHelper.shared.delete(1, object: .Library)
    }
    
    @objc func expandCollapCell(_ sender: UITapGestureRecognizer) {
        
    }
    
//    : Optional("Lib2")
//    Pic: Optional("Pic1") - 1
//    Lib: Optional("Lib3")
//    -----------
//    Optional("Pic1")
//    Lib: Optional("Lib2") - 2
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return libs.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = HeaderLib(frame: .init(x: 0, y: 0, width: tbvLib.frame.width, height: 50))
        header.setTitle(libs[section].name ?? "")
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
//        if isExpand && indexPath.section == headerSection   {
//            return 40
//        } else {
//            return 0
//        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return libs[section].pic!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tbvLib.dequeueReusableCell(withIdentifier: "cell") as? LibCell else {fatalError()}
        let pics = libs[indexPath.section].pic?.allObjects as? [Picture]
        cell.textLabel?.text = "\(pics?[indexPath.row].name ?? "") - id: \(pics?[indexPath.row].id ?? 0)"
       
        return cell
    }
    
}
