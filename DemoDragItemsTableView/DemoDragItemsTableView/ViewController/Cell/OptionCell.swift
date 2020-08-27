//
//  OptionCell.swift
//  DemoDragItemsTableView
//
//  Created by Apple on 8/26/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
import MobileCoreServices


class OptionCell: UICollectionViewCell, UITableViewDelegate {
    
    
    @IBOutlet weak var itemsTableView: UITableView!
    var task: Task?
    override func awakeFromNib() {
        super.awakeFromNib()
        itemsTableView.register(UINib(nibName: "ItemsCell", bundle: nil), forCellReuseIdentifier: "cellItem")
        itemsTableView.tableFooterView = UIView()
        itemsTableView.delegate = self
        itemsTableView.dataSource = self
        itemsTableView.dragInteractionEnabled = true
        itemsTableView.dragDelegate = self
        itemsTableView.dropDelegate = self
    }
    
    func setupValue(task: Task) {
        self.task = task
        itemsTableView.reloadData()
        
    }
    
}

extension OptionCell: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.frame = .init(x: 0, y: 0, width: self.contentView.frame.width, height: 50)
        
        let titleHeader = UILabel()
        titleHeader.frame = .init(x: 0, y: 0, width: 100, height: 30)
        titleHeader.center = headerView.center
        titleHeader.textAlignment = .center
        titleHeader.text = task?.title
        if task?.title == "Ready" {
            headerView.backgroundColor = .yellow
        } else if task?.title == "Accept" {
            headerView.backgroundColor = .cyan
        } else {
            headerView.backgroundColor = .systemBlue
        }
        titleHeader.textColor = .black
        headerView.addSubview(titleHeader)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return task?.content.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = itemsTableView.dequeueReusableCell(withIdentifier: "cellItem") as! ItemsCell
        cell.setupValue(content: task?.content[indexPath.row] ?? "")
        return cell
    }
    
}

extension OptionCell: UITableViewDragDelegate, UITableViewDropDelegate {
    
    
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        guard let task = task, let stringData = task.content[indexPath.row].data(using: .utf8) else { return [] }
        let itemProvider = NSItemProvider(item: stringData as NSData, typeIdentifier: kUTTypePlainText as String)
        let dragItem = UIDragItem(itemProvider: itemProvider)
        session.localContext = (task, indexPath, tableView)
        return [dragItem]
    }
    
    func tableView(_ tableView: UITableView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UITableViewDropProposal {
        return UITableViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
    }
    
    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {

        if coordinator.session.hasItemsConforming(toTypeIdentifiers: [kUTTypePlainText as String]) {
            coordinator.session.loadObjects(ofClass: NSString.self) { (items) in
                guard let string = items.first as? String else {
                    return
                }
                
                switch (coordinator.items.first?.sourceIndexPath, coordinator.destinationIndexPath) {
                case (.some(let sourceIndexPath), .some(let destinationIndexPath)):
                    // Same Table View
                    let updatedIndexPaths: [IndexPath]
                    if sourceIndexPath.row < destinationIndexPath.row {
                        updatedIndexPaths =  (sourceIndexPath.row...destinationIndexPath.row).map { IndexPath(row: $0, section: 0) }
                    } else if sourceIndexPath.row > destinationIndexPath.row {
                        updatedIndexPaths =  (destinationIndexPath.row...sourceIndexPath.row).map { IndexPath(row: $0, section: 0) }
                    } else {
                        updatedIndexPaths = []
                    }
                    self.itemsTableView.beginUpdates()
                    self.task?.content.remove(at: sourceIndexPath.row)
                    self.task?.content.insert(string, at: destinationIndexPath.row)
                    self.itemsTableView.reloadRows(at: updatedIndexPaths, with: .automatic)
                    self.itemsTableView.endUpdates()
                    break
                    
                case (nil, .some(let destinationIndexPath)):
                    // Move data from a table to another table
                    // Drag to index has been define (between tow items 0...2) => index: 1
                    // sourceIndex has been defined at tableView has cursor
                    self.removeSourceTableData(localContext: coordinator.session.localDragSession?.localContext)
                    self.itemsTableView.beginUpdates()
                    self.task?.content.insert(string, at: destinationIndexPath.row)
                    self.itemsTableView.insertRows(at: [destinationIndexPath], with: .automatic)
                    self.itemsTableView.endUpdates()
                    break
                    

                case (nil, nil):
                    // Insert data from a table to another table
                    //Table 2 index empty => drag to blank
                    self.removeSourceTableData(localContext: coordinator.session.localDragSession?.localContext)
                    self.itemsTableView.beginUpdates()
                    self.task?.content.append(string)
                    self.itemsTableView.insertRows(at: [IndexPath(row: (self.task?.content.count)! - 1 , section: 0)], with: .automatic)
                    self.itemsTableView.endUpdates()
                    break
                    
                default: break
                }
            }
        }
    }

    func removeSourceTableData(localContext: Any?) {
        if let (dataSource, sourceIndexPath, tableView) = localContext as? (Task, IndexPath, UITableView) {
            tableView.beginUpdates()
            dataSource.content.remove(at: sourceIndexPath.row)
            tableView.deleteRows(at: [sourceIndexPath], with: .automatic)
            tableView.endUpdates()
        }
    }
}


