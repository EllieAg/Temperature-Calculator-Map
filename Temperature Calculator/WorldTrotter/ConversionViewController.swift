//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Elena Agina on 9/8/22.


import UIKit

// ConversionViewController is a subclass of UIViewController, and it conforms to the UITextFieldDelegate protocol
class ConversionViewController: UIViewController, UITextViewDelegate {
    
    // add outlet to celcius label
    @IBOutlet var celciusLable: UILabel!
    
    @IBOutlet var textField: UITextField!
    
    // adding number formatter property
    let numberFormatter: NumberFormatter = {
        
        let nf = NumberFormatter()
        
        nf.numberStyle = .decimal
        
        nf.minimumFractionDigits = 0
        
        nf.maximumFractionDigits = 1
        
        return nf
    }()
    
    var fahrenheitValue: Measurement<UnitTemperature>? {
        
        // property observer
        didSet {
            updateCelciusLabel()
        }
        
    }
    
    var celciusValue: Measurement<UnitTemperature>? {
        
        // unwrap fahrenheitValue
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        } else {
            return nil
        }
        
    }
    
    /***Methods**/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ConversionViewController loaded its view.")
        
        updateCelciusLabel()
    }
    
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
        
        if let text = textField.text, let number = numberFormatter.number(from: text) {
            
            fahrenheitValue = Measurement(value: number.doubleValue, unit: .fahrenheit)
        
        } else {
            fahrenheitValue = nil
        }
        
    } // end of fahrenheitFieldEditingChanged
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
    
    func updateCelciusLabel() {
        
        print("updateCelciusLabel method called.")
        
        // unwrap celciusValue
        if let celciusValue = celciusValue {
            // celciusLable.text = "\(celciusValue.value)"
            celciusLable.text = numberFormatter.string(from: NSNumber(value: celciusValue.value))
        } else {
            celciusLable.text = "???"
        }
        
    } // end of updateCelciusLabel
    
    // delegate callback function
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        
        let currentLacale = Locale.current
        
        //set the current separator
        let decimalSeparator = currentLacale.decimalSeparator ?? "."
        
        print(decimalSeparator)
        
        // range {3, 0} 4 3 2 1
        let existingTextHasDecimalSeparator = textField.text?.range(of:decimalSeparator)
        
        // string 4
        let replacementTextHasDecimalSeparator = string.range(of: ".")
        
        if existingTextHasDecimalSeparator != nil,
           replacementTextHasDecimalSeparator != nil {
            return false
        } else {
            return true
        }
        
    } // end of textField

} // end of class

