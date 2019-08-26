//
//  ViewController.swift
//  DatePickerPopupView
//
//  Created by Vivek on 04/07/18.
//  Copyright © 2018 Vivek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Outlets
    @IBOutlet var dateLabel: UILabel!
    
    //MARK:- View's lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    //MARK:- Button action
    @IBAction func showPopup() {
        
        // Create instance of date picker controller
        let pickerView = VGDatePicker()
        
        // Set the presentation style of picker
        pickerView.modalPresentationStyle = .overCurrentContext

        // Handle the output from the date picker
        pickerView.output = { datePicker  in
            self.displayDate(from: datePicker)
        }
        
        // Present the date picker
        self.present(pickerView, animated: true, completion: nil)
    }
    
    // MARK:-  UI behaviour
    func displayDate(from picker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM,yyyy"
        let selectedDate = dateFormatter.string(from: picker.date)
        dateLabel.text = selectedDate
    }
    
}





