//
//  ViewController.swift
//  Lecture2
//
//  Created by agilemac-74 on 18/04/18.
//  Copyright © 2018 Agile. All rights reserved.
//

import UIKit
import MessageUI
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
class ViewController: UIViewController,UISearchBarDelegate,MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate {

    @IBOutlet var swtPaymentViaOnline:UISwitch!
    @IBOutlet var lblDownloadContent:UILabel!
    @IBOutlet var sliderDownloadContent:UISlider!
    
    @IBOutlet var searchBarUsers:UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.getNotificationForObserver), name: Notification.Name(rawValue: MYLectureNotification.HelloNotification), object: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @objc func getNotificationForObserver(){
        
    }

    //MARK: - Mail Delegate
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
    }
    
     //MARK: - Message Delegate
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
    }
    
    //MARK: - Button Event
    @IBAction func btnClick(sender:UIButton){
        
    }
    @IBAction func btnSendMailClick(withButton sender:UIButton){
        
        if MFMailComposeViewController.canSendMail(){
            let mailComposer:MFMailComposeViewController = MFMailComposeViewController()
            mailComposer.setSubject("")
            mailComposer.mailComposeDelegate = self
            mailComposer.setToRecipients(["test@test.com"])
            mailComposer.setMessageBody("Testing ", isHTML: false )
            self.present(mailComposer, animated: true , completion: nil)
            
        }
    }
    @IBAction func btnSendMessageClick(withButton sender:UIButton){
        if MFMessageComposeViewController.canSendText(){
            
            let messageController:MFMessageComposeViewController = MFMessageComposeViewController()
            messageController.body = ""
            messageController.recipients = [""]
            messageController.messageComposeDelegate = self
              self.present(mailComposer, animated: true , completion: nil)
        }
    }
    
    //MARK: - Switch Event
    
    @IBAction func isPaymentOnline(withSwitch swtPayment:UISwitch){
        print(swtPayment.isOn)
    }
    
    //MARK: - Slider Event
    @IBAction func downloadProgressSlider(withSlider slider:UISlider){
        print(slider.value)
        
    }
    
    

}

