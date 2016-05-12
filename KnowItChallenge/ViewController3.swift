//
//  ViewController3.swift
//  KnowItChallenge
//
//  Created by Fredrik Ekholdt on 12/05/16.
//  Copyright © 2016 com.fredrikekholdt. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {
  var phoneNumberFromPicker: String = "" //hope there's no weirdness because this gets set in a segue

  // MARK: UIViewController
  override func viewDidLoad() {
    super.viewDidLoad()
    phoneNumberTextField.text = phoneNumberFromPicker
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  // MARK: Properties
  @IBOutlet weak var phoneNumberTextField: UITextField!

  // MARK: Actions
  @IBAction func executeCall(sender: AnyObject) {
    let phoneNumber = phoneNumberTextField.text! //closing over this later
    let alert = UIAlertController(title: "About to call", message: "You're about to call: \(phoneNumber)", preferredStyle: UIAlertControllerStyle.Alert)
    let alertHandler: UIAlertAction! -> Void = { action in
      switch action.style {
      case .Default:
        let urlEncoded = phoneNumber.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLPathAllowedCharacterSet())! //Not entirely sure this is the correct encoding
        if let telUrl = NSURL(string: "tel://\(urlEncoded)") {
          print("Opening url", telUrl)
          UIApplication.sharedApplication().openURL(telUrl  )
        } else {
          //Could be handled by emitting a new alert
          print("Failed", phoneNumber)
        }
      case .Cancel:
        print("Cancel")
      case .Destructive:
        print("Destroy")
      }
    }
    alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: alertHandler))
    alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: alertHandler))

    self.presentViewController(alert, animated: true, completion: nil)
  }
}

