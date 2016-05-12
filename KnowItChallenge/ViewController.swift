//
//  ViewController.swift
//  KnowItChallenge
//
//  Created by Fredrik Ekholdt on 12/05/16.
//  Copyright © 2016 com.fredrikekholdt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  // MARK: Properties
  @IBOutlet weak var image1: UIImageView!

  func get(url:NSURL, completion: ((data: NSData?, response: NSURLResponse?, error: NSError? ) -> Void)) {
    NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
      completion(data: data, response: response, error: error)
      }.resume()
  }

  func downloadImage(url: NSURL){
    get(url) { (data, response, error)  in
      dispatch_async(dispatch_get_main_queue()) { () -> Void in
        guard let data = data where error == nil else { return }
        self.image1.image = UIImage(data: data)
      }
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.

    if let checkedUrl = NSURL(string: "https://revarant.files.wordpress.com/2012/05/cute-free-free-kittens-fur-kittens-favim-com-126015.jpg") {
      self.image1.contentMode = .ScaleAspectFit
      downloadImage(checkedUrl)
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

