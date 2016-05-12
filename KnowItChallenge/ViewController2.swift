//
//  ViewController2.swift
//  KnowItChallenge
//
//  Created by Fredrik Ekholdt on 12/05/16.
//  Copyright © 2016 com.fredrikekholdt. All rights reserved.
//

//
//  ViewController.swift
//  KnowItChallenge
//
//  Created by Fredrik Ekholdt on 12/05/16.
//  Copyright © 2016 com.fredrikekholdt. All rights reserved.
//

import UIKit
import AddressBook
import Contacts
import ContactsUI

class ViewController2: UIViewController, CNContactPickerDelegate {
  // MARK: UIViewController
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    switch segue.destinationViewController {
      case let vc3 as ViewController3:
        vc3.phoneNumberFromPicker = phoneNumberTextField.text!
      default: ()
    }
  }

  // MARK: Properties
  @IBOutlet weak var phoneNumberTextField: UITextField!

  // MARK: Actions
  @IBAction func openPicker(sender: AnyObject) {
    //Suppose it is possible to load this when the NIB loads...
    let contactPickerViewController = CNContactPickerViewController()

    contactPickerViewController.displayedPropertyKeys = [CNContactPhoneNumbersKey]
    contactPickerViewController.delegate = self
    //FIXME: getting a plugin com.apple.MobileAddressBook.ContactsViewService invalidated because of this in my Xcode 7.3.1:
    //http://stackoverflow.com/questions/31827356/addressbook-not-working-in-ios9 suggests upgrading Xcode.
    self.presentViewController(contactPickerViewController, animated: false, completion: nil)
  }

  // MARK: CNContactPickerDelegate
  func contactPicker(picker: CNContactPickerViewController, didSelectContactProperty contactProperty: CNContactProperty) {
    //Here we only take the number, but the country code is not here. 
    //See why here: http://stackoverflow.com/questions/34730543/ios-9-get-cncontact-country-code-and-phone-number
    let value = contactProperty.value as! CNPhoneNumber
    print("Selected: ", contactProperty)
    phoneNumberTextField.text = value.stringValue
  }
}

