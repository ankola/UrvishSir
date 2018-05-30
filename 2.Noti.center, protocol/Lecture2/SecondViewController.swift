//
//  SecondViewController.swift
//  Lecture2
//
//  Created by agilemac-74 on 18/04/18.
//  Copyright © 2018 Agile. All rights reserved.
//

import UIKit

protocol MYLectureProtocol {
    func CreateTaskYourOwn()
}
class SecondViewController: UIViewController,MYLectureProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NotificationCenter.default.post(Notification.init(name: Notification.Name(rawValue: MYLectureNotification.HelloNotification)))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func CreateTaskYourOwn() {
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
