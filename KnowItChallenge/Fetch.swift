//
//  Fetch.swift
//  KnowItChallenge
//
//  Created by Fredrik Ekholdt on 12/05/16.
//  Copyright © 2016 com.fredrikekholdt. All rights reserved.
//

import Foundation

class Fetch {

  func get(URL: NSURL,
           completionHandler: (data:NSData?, response:NSURLResponse?, error:NSError?) -> Void) {
     //simplest way of getting a session, could have our own queue?, but for this it is not needed
    let session = NSURLSession.sharedSession()
    let request = NSURLRequest(URL: URL)
    let dataTask = session.dataTaskWithRequest(request, completionHandler: completionHandler)
    dataTask.resume()
  }
}