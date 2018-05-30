//
//  ViewController.swift
//  Lecture2
//
//  Created by agilemac-74 on 18/04/18.
//  Copyright © 2018 Agile. All rights reserved.
//

import UIKit
//enum MYLectureNotification{
//    case Hello
//
//    var name:String {
//        switch self {
//        case .Hello:
//            return "HelloWorld"
//        }
//    }
//}
struct  MYLectureNotification {
    static let HelloNotification:String = "HelloWorld"
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.getNotificationForObserver), name: Notification.Name(rawValue: MYLectureNotification.HelloNotification), object: nil)
    }
    @objc func getNotificationForObserver(){
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

