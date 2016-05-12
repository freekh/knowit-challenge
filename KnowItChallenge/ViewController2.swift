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

  // MARK: Properties

  func getContact(contactStore: CNContactStore) {

  }

  @IBOutlet weak var phoneNumberTextField: UITextField!

  @IBAction func openPicker(sender: AnyObject) {
    let contactPickerViewController = CNContactPickerViewController()

    contactPickerViewController.displayedPropertyKeys = [CNContactPhoneNumbersKey]
    contactPickerViewController.delegate = self
    //FIXME: getting a plugin com.apple.MobileAddressBook.ContactsViewService invalidated because of this in my Xcode 7.3.1:
    //http://stackoverflow.com/questions/31827356/addressbook-not-working-in-ios9 suggests downloading a new. Verify that this is in fact the issue.
    self.presentViewController(contactPickerViewController, animated: false, completion: nil)
  }

  func contactPicker(picker: CNContactPickerViewController, didSelectContactProperty contactProperty: CNContactProperty) {

    let value = contactProperty.value as! CNPhoneNumber
    print("\(value.stringValue) ")
    phoneNumberTextField.text = value.stringValue
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.


//    let authorizationStatus = CNContactStore.authorizationStatusForEntityType(CNEntityType.Contacts)
//    print("here")
//    let contactStore = CNContactStore()
//
//    switch authorizationStatus {
//    case .Denied, .Restricted:
//      //1
//      print("Denied")
//          case .Authorized:
//      //2
//      print("Authorized")
//    case .NotDetermined:
//      //3
//      contactStore.requestAccessForEntityType(CNEntityType.Contacts, completionHandler: {(accepted: Bool, error: NSError?) -> Void in
//        if (accepted) {
//          getContact(contactStore)
//        } else {
//          print("Not implemented") //TODO
//        }
//      })
//      print("Not Determined")
//    }

  }

  override func viewDidAppear(animated: Bool) {

  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    print("prepare \(phoneNumberTextField.text!)")
    let vc3 = segue.destinationViewController as! ViewController3;
    vc3.currentPhoneNumber = phoneNumberTextField.text!
  }
  
}

