//
//  ViewController.swift
//  KnowItChallenge
//
//  Created by Fredrik Ekholdt on 12/05/16.
//  Copyright © 2016 com.fredrikekholdt. All rights reserved.
//

import UIKit

class ViewController1: UIViewController, NSURLSessionDownloadDelegate {

  // MARK: Properties
  @IBOutlet weak var progress: UIProgressView!

  // MARK: Images
  @IBOutlet weak var image1: UIImageView!
  @IBOutlet weak var image2: UIImageView!
  @IBOutlet weak var image3: UIImageView!
  @IBOutlet weak var image4: UIImageView!

  var session:NSURLSession?
  var currentTotal = 0
  var expectedContentLength = 0
  var downloadedImageUrlIndex: [NSURL] = []
  var imageViews: [UIImageView!] = []

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    imageViews = [image1, image2, image3, image4]
    progress.progress = 0.0

    let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
    let manqueue = NSOperationQueue.mainQueue()
    session = NSURLSession(configuration: configuration, delegate:self, delegateQueue: manqueue)
    if let path = NSBundle.mainBundle().pathForResource("Properties", ofType: "plist") {
      let props = NSDictionary(contentsOfFile: path)
      for imageUrl in (props?.mutableArrayValueForKey("Images"))! {
        if let checkedUrl = NSURL(string: imageUrl as! String) {
          session!.downloadTaskWithURL(checkedUrl).resume()
        }
      }
    }
  }

  func URLSession(session: NSURLSession, task: NSURLSessionTask,
                  didCompleteWithError maybeError: NSError?) {
    if let error = maybeError {
      print("Got an error", error)
    }
  }

  func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didFinishDownloadingToURL location: NSURL) {
    //chosing an image semi-randomly. obviously solveable in some other way
    let emptyImageView = self.imageViews.filter({$0.image == nil}).first
    let maybeData = NSData(contentsOfURL: location)
    if let data = maybeData {
      //not an ios expert but I believe
      dispatch_async(dispatch_get_main_queue()) { () -> Void in
        emptyImageView!.image = UIImage(data: data)
      }
    } else {
      print("Could not convert", location, downloadTask.originalRequest?.URL)
    }
  }

  func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
    let percentageDownloaded = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
    print("Progress", percentageDownloaded * 100)
    progress.progress =  percentageDownloaded
  }

  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

