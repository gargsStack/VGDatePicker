//
//  VGDatePicker.swift
//  VGDatePicker
//
//  Created by Vivek on 05/07/18.
//  Copyright © 2018 Vivek. All rights reserved.
//

import UIKit

class  VGDatePicker: UIViewController {
    
    // Public variables
    lazy var configuration = PickerConfiguration()
    var output: ((UIDatePicker) -> ())? = nil
    
    // Private variables
    private lazy var centerView: UIView = {
        return UIView(frame: .zero)
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private lazy var selectionButton: UIButton = {
        let button = UIButton(frame: .zero)
        return button
    }()
    
    private lazy var datePicker: UIDatePicker = {
        let picker = UIDatePicker(frame: .zero)
        picker.timeZone = NSTimeZone.local
        return picker
    }()
    
    
    //MARK:- View's Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        view.endEditing(true)
        
        placeDatePickerInCenter()
        configureTitleView()
        addSelectionButtonView()
        setupDatePicker()
    }
    
    //MARK:-  DatePicker UI Setup
    
    private func placeDatePickerInCenter() { // This will add a container view for the picker.
        
        view.addSubview(centerView)
        
        // Adding layout constraints
        centerView.translatesAutoresizingMaskIntoConstraints = false
        let heightConstraint = NSLayoutConstraint(item: centerView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 0.4, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: centerView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 0.75, constant: 0)
        view.addConstraints([heightConstraint, widthConstraint])
        centerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func configureTitleView() { // This will add a title label for picker
        
        titleLabel.backgroundColor = configuration.titleBackgroundColor
        titleLabel.textColor = configuration.titleTextColor
        titleLabel.text = configuration.titleText
        titleLabel.font = configuration.font
        centerView.addSubview(titleLabel)
        
        // Adding layout constraints
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: centerView.topAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: centerView.rightAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: centerView.leftAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func addSelectionButtonView() { // This will add a action button for picker
        
        selectionButton.setTitle(configuration.selectionButtonText, for: .normal)
        selectionButton.setTitleColor(configuration.selectButtonTextColor, for: .normal)
        selectionButton.backgroundColor = configuration.selectButtonBackgroundColor
        selectionButton.addTarget(self, action: #selector(dismissPicker), for: .touchUpInside)
        selectionButton.titleLabel?.font = configuration.font
        centerView.addSubview(selectionButton)
        
        // Adding layout constraints
        selectionButton.translatesAutoresizingMaskIntoConstraints = false
        selectionButton.bottomAnchor.constraint(equalTo: centerView.bottomAnchor).isActive = true
        selectionButton.rightAnchor.constraint(equalTo: centerView.rightAnchor).isActive = true
        selectionButton.leftAnchor.constraint(equalTo: centerView.leftAnchor).isActive = true
        selectionButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    private func setupDatePicker() {  // This will add date picker
        
        datePicker.datePickerMode = configuration.datePickerMode!
        datePicker.backgroundColor = configuration.datePickerBackgroundColor
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        
        centerView.addSubview(datePicker)
        
        // Adding layout constraints
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        datePicker.rightAnchor.constraint(equalTo: centerView.rightAnchor, constant: -10).isActive = true
        datePicker.leftAnchor.constraint(equalTo: centerView.leftAnchor, constant: 10).isActive = true
        datePicker.bottomAnchor.constraint(equalTo: selectionButton.topAnchor).isActive = true
        
    }
    
    //MARK:-  Selector methods
    @objc private func datePickerValueChanged(_ sender: UIDatePicker) {
        
        if let result = output {
            result(sender)
        }
    }
    
    @objc private func dismissPicker() {
        self.dismiss(animated: true, completion: nil)
    }
}

//MARK:-  UI Configuration

final class PickerConfiguration {
    
    //Variables-------
    var titleBackgroundColor = UIColor()
    var titleTextColor = UIColor()
    var titleText = "Select Date"
    var datePickerBackgroundColor = UIColor()
    var selectButtonBackgroundColor = UIColor()
    var selectButtonTextColor = UIColor()
    var selectionButtonText = "Done"
    var datePickerMode = UIDatePickerMode(rawValue: 0)
    var font = UIFont()
    
    // Initializers------
    init() {
        titleBackgroundColor = .orange
        titleTextColor = .white
        datePickerBackgroundColor = .white
        datePickerMode = .date
        selectButtonBackgroundColor = .lightGray
        selectButtonTextColor = .white
        font = UIFont.boldSystemFont(ofSize: 22)
    }
}
