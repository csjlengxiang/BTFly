//
//  BTFlyManager.swift
//  BTFly
//
//  Created by csj on 15/8/7.
//  Copyright (c) 2015年 csj. All rights reserved.
//

import Foundation
import UIKit

class BTFlyManager: NSObject, NSURLSessionDelegate, NSURLSessionDownloadDelegate {
    var session: NSURLSession!
    var config: NSURLSessionConfiguration!
    var lb: UILabel!;
    
    override init() {
        super.init()
        config = NSURLSessionConfiguration.backgroundSessionConfigurationWithIdentifier("BTFly.background1")
        session = NSURLSession(configuration: config, delegate: self, delegateQueue: nil)
        
    }
    
    func URLSessionDidFinishEventsForBackgroundURLSession(session: NSURLSession) {
        println(session)
        
        for i in 0...50 {
            addTask(i).resume()
        }
        
        
        lb.text = "hah"
        
        var d =  UIApplication.sharedApplication().delegate as? AppDelegate
        d?.ch!()
        

    }
    
    func addTask(num: Int) -> NSURLSessionDownloadTask {
        var request = NSURLRequest(URL: NSURL(string: "http://www.baidu.com")!)
        var task = session.downloadTaskWithRequest(request)
        task.taskDescription = "\(num)"
        return task
    }
    
    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didFinishDownloadingToURL location: NSURL) {
        //println(session)
        println(downloadTask.taskDescription)
        //println(location)
    }
}