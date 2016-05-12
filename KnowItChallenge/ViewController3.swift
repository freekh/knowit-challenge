//
//  ViewController3.swift
//  KnowItChallenge
//
//  Created by Fredrik Ekholdt on 12/05/16.
//  Copyright © 2016 com.fredrikekholdt. All rights reserved.
//

import UIKit

class ViewController3: UIViewController, UITextFieldDelegate {


  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
  }

  var currentPhoneNumber: String = ""

  override func viewDidAppear(animated: Bool) {
    phoneNumberTextField.text = currentPhoneNumber
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBOutlet weak var phoneNumberTextField: UITextField!

  @IBAction func executeCall(sender: AnyObject) {
    print("executing call \(currentPhoneNumber)")
    UIApplication.sharedApplication().openURL(NSURL(string: "tel://" + currentPhoneNumber)!)
  }

  func textFieldDidEndEditing(textField: UITextField) {
      print("--> \(textField.text)")
      currentPhoneNumber = textField.text!
  }

}

