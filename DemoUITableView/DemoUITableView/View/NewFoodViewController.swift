//
//  Page2ViewController.swift
//  DemoUITableView
//
//  Created by Apple on 3/27/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class NewFoodViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    @IBOutlet weak var imgHinh: UIImageView!
    @IBOutlet weak var tfEntryFoodName: UITextField!
    @IBOutlet weak var lbSetRating: UILabel!
    var newFood : Food!
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        //tap img
        let onTappedImg = UITapGestureRecognizer(target: self, action: #selector(onTappedImgView))
        imgHinh.isUserInteractionEnabled = true
        imgHinh.addGestureRecognizer(onTappedImg)
        //Tap rating
        let tappingRating =  UITapGestureRecognizer(target: self, action: #selector(onTappedLbRating(sender:)))
        tappingRating.numberOfTapsRequired = 1
        lbSetRating?.isUserInteractionEnabled = true
        lbSetRating?.addGestureRecognizer(tappingRating)
    }
    //
    @IBAction func btnSave(_ sender: Any) {
       }
    @objc func onTappedLbRating(sender: UITapGestureRecognizer) {
        //vi tri tap
        let locationInView = sender.location(in: self.view)
        //dang o stackview chuyen qua superView
        let newLbRatingFrame = self.view.convert(lbSetRating!.frame, to:  lbSetRating!.superview)
        //ve khung cho sao
        let frame1 = CGRect(x: newLbRatingFrame.origin.x, y: newLbRatingFrame.origin.y, width: newLbRatingFrame.size.width / 5, height: newLbRatingFrame.size.height)
        let frame2 = CGRect(x: newLbRatingFrame.origin.x, y: newLbRatingFrame.origin.y, width: 2 * newLbRatingFrame.size.width / 5, height: newLbRatingFrame.size.height)
        let frame3 = CGRect(x: newLbRatingFrame.origin.x, y: newLbRatingFrame.origin.y, width: 3 * newLbRatingFrame.size.width / 5, height: newLbRatingFrame.size.height)
        let frame4 = CGRect(x: newLbRatingFrame.origin.x, y: newLbRatingFrame.origin.y, width: 4 * newLbRatingFrame.size.width / 5, height: newLbRatingFrame.size.height)
        let frame5 = newLbRatingFrame
        
        if frame1.contains(locationInView) {
            lbSetRating?.text = "★☆☆☆☆"
            newFood.rating = 1
        } else if frame2.contains(locationInView) {
            lbSetRating?.text = "★★☆☆☆"
            newFood.rating = 2
        } else if frame3.contains(locationInView) {
            lbSetRating?.text = "★★★☆☆"
            newFood.rating = 3
        } else if frame4.contains(locationInView) {
            lbSetRating?.text = "★★★★☆"
            newFood.rating = 4
        } else if frame5.contains(locationInView){
            lbSetRating?.text = "★★★★★"
            newFood.rating = 5
        }
    }
    
    //MARK: UINavigationControllerDelegate
    //lay doi tuong tu media ra
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let chosenImg = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
        imgHinh.image = chosenImg
        newFood.image = chosenImg
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    
    //MARK:UIImagePickerControllerDelegate
    @objc func onTappedImgView() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true, completion: nil)

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()// khi nhan return se tat keyboard
        return true
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        newFood.name = textField.text ?? ""
    }
}
