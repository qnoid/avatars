//
//  Bar.swift
//  kata
//
//  Created by Markos Charatzas on 10/04/2016.
//  Copyright © 2016 Markos Charatzas. All rights reserved.
//

import Foundation


class Session
{
    let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())

    func download(image: String, completionHandler: (NSData?, NSURLResponse?, NSError?) -> Void) -> NSURLSessionDataTask {
        
        let url = NSURL(string: "http://qnoid.com/assets/images/\(image)")!
        
        return self.session.dataTaskWithURL(url, completionHandler: completionHandler)
    }
}