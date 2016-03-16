//
//  ViewController.swift
//  TextFieldDelegate
//
//  Created by sodas on 3/14/16.
//  Copyright © 2016 TextFieldDelegate. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var textField: UITextField!
    var statusLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.textField = UITextField(frame: CGRect(x: 20.0, y: 40.0, width: 280.0, height: 30.0))
        self.textField.borderStyle = .RoundedRect
        self.textField.clearButtonMode = .WhileEditing
        self.textField.placeholder = "Enter email address ..."
        self.textField.keyboardType = .EmailAddress
        self.textField.autocapitalizationType = .None
        self.textField.autocorrectionType = .No
        self.textField.returnKeyType = .Send
        self.textField.delegate = self
        self.view.addSubview(self.textField)

        self.statusLabel = UILabel(frame: CGRect(x: 20.0, y: 78.0, width: 280.0, height: 30.0))
        self.view.addSubview(self.statusLabel)
    }

    // MARK: - UITextFieldDelegate

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Close keyboard when leaving this method
        defer {
            self.textField.resignFirstResponder()
        }
        // Get email text
        guard let email = self.textField.text else {
            return false
        }
        // Check email ...
        if email.containsString("@") && email.containsString(".") {
            self.statusLabel.text = "Get email: \(email)"
            self.statusLabel.textColor = UIColor(hue: 0.267, saturation: 0.8, brightness: 0.8, alpha: 1.0)
            return true
        } else {
            self.statusLabel.text = "Invalid email"
            self.statusLabel.textColor = UIColor.redColor()
            return false
        }
    }

}

