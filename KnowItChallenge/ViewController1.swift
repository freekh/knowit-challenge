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

  // MARK: Session
  var session: NSURLSession? //Uncertain if we need this reference. Put it there to avoid it being deallocated by ARC or whatnot when viewDidLoad goes out of scope. Could have looked that one up or asked an iOS expert...

  // MARK: Progress
  var progressByTask: Dictionary<NSURLSessionDownloadTask, (Int64, Int64)> = [:]
  var urlImageMapping: Dictionary<NSURL, UIImageView> = [:]

  // MARK: UIViewController
  override func viewDidLoad() {
    super.viewDidLoad()

    //Seems like a CollectionViewController would be better suited, but realized it too late
    let imageViews = [image1, image2, image3, image4]
    progress.progress = 0.0

    let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
    session = NSURLSession(configuration: configuration, delegate:self, delegateQueue: nil)
    let path = NSBundle.mainBundle().pathForResource("Properties", ofType: "plist")!
    let props = NSDictionary(contentsOfFile: path)
    let imageUrls = (props?.mutableArrayValueForKey("Images"))!
    imageUrls.enumerate().forEach { (index, imageUrl) in
      let checkedUrl = NSURL(string: imageUrl as! String)!
      if let imageView = imageViews[index] {
        urlImageMapping[checkedUrl] = imageView
        imageView.image = UIImage(named: "Spinner")
        //A bit unnecessary to use downloadTask (which creates a tmp file) could have used dataTask, but it was easier to get the progress bar like that...
        session!.downloadTaskWithURL(checkedUrl).resume()
      }
    }
  }

  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  // MARK: NSURLSessionDownloadDelegate
  func URLSession(session: NSURLSession, task: NSURLSessionTask,
                  didCompleteWithError maybeError: NSError?) {
    if let error = maybeError {
      let url = task.currentRequest?.URL
      let imageView = urlImageMapping[url!]
      imageView!.image = UIImage(named: "Error")
      print("Got an error while downloading", url, error)
    }
  }

  func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask,
                  didFinishDownloadingToURL location: NSURL) {
    let data = NSData(contentsOfURL: location)!
    let url = downloadTask.originalRequest?.URL
    let imageView = urlImageMapping[url!]
    //Not an ios expert but I believe this needs to go on the ui main thread
    dispatch_async(dispatch_get_main_queue()) { () -> Void in
      imageView?.image = UIImage(data: data)
    }
  }

  func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask,
                  didWriteData bytesWritten: Int64, totalBytesWritten: Int64,
                               totalBytesExpectedToWrite: Int64) {
    progressByTask[downloadTask] = (totalBytesWritten, totalBytesExpectedToWrite)
    //Not sure I would do this in the wild, but it is good fun for this exercise
    let (combinedTotal, combinedExpected) = progressByTask.reduce((Int64(0), Int64(0)), combine: { (accumulator, current) in
      //Could do this more elegantly?
      //Not sure if it is possible use pattern matching/partial function directly in Swift?
      let (accTotal, accExpected) = accumulator
      let (_, combined) = current
      let (combinedTotal, combinedExpected) = combined
      return (combinedTotal + accTotal, accExpected + combinedExpected)
    })
    let percentageDownloaded = Float(combinedTotal) / Float(combinedExpected)
    print("Progress", downloadTask, combinedTotal, combinedExpected, percentageDownloaded * 100)
    progress.progress =  percentageDownloaded
  }
}

