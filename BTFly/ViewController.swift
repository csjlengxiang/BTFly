//
//  ViewController.swift
//  BTFly
//
//  Created by csj on 15/8/7.
//  Copyright (c) 2015年 csj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var fly: BTFlyManager!
    
    @IBOutlet weak var lb: UILabel!
    
    @IBAction func cl(sender: AnyObject) {
        fly.lb = lb
        var tasks = [NSURLSessionDownloadTask]()
        for i in 0...50 {
            tasks.append(fly.addTask(i))
        }
        
        println("over")
        
        for task in tasks {
            task.resume()
        }
        
        println("resume over")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        fly = BTFlyManager()
    }
}

