## VGDatePicker

VGDatepicker is a helper class which helps to present date picker and allow user to select a date. 
It can be present on any view controller with few line of code.

## Motivation
Sometimes it happen when we are dealing with dates and time more than usual in our application. Creating a datepicker for every view controller is not a good appraoch to deal with. For this reason I crated a reusable class with no xib. 




## Feature

- Written in Swift 4.X 
- Autolayout through code.
- Easy and short implementation.
- No use of delegation.
- Custom configuration.
- Reusable throughout the app.

# Installation

You just need to place file named `VGDatepicker.swift` in project bundle and you are done :+1:


# How to use?

- Create an instance of type `VGDatePicker()`
- Set its modal presentation style to `.overCurrentContext`
- Add your personalized configuration to the datePicker **(Optional)**
- Handle datePicker output block.

# Code Example
```
        // Create instance of date picker controller
        let pickerView = VGDatePicker()
        
        // Set the presentation style of picker
        pickerView.modalPresentationStyle = .overCurrentContext

        // Handle the output from the date picker
        pickerView.output = { datePicker  in
        
            print(datePicker.date) // You will get datepicker here
            
        }
        
        // Present the date picker
        self.present(pickerView, animated: true, completion: nil)
```

# How to configure UI

- Create a instance of PickerConfiguration()

```
    let newConfiguration = PickerConfiguration()
        newConfiguration.titleText = "New Title"
        newConfiguration.titleBackgroundColor = .orange
        newConfiguration.titleTextColor = .white
        
        newConfiguration.datePickerBackgroundColor = .white
        newConfiguration.datePickerMode = .date
        
        newConfiguration.selectionButtonText = "Okay"
        newConfiguration.selectButtonBackgroundColor = .lightGray
        newConfiguration.selectButtonTextColor = .white
        
        newConfiguration.font = UIFont.boldSystemFont(ofSize: 22)
        
```
- Passed it to datepicker's configuration

```
        // Create instance of date picker controller
        let pickerView = VGDatePicker()
        
        // Add personalized configuration to picker view
        pickerView.configuration = newConfiguration
```

## Liecense








