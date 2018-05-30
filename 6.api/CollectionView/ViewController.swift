//
//  ViewController.swift
//  CollectionView
//
//  Created by agilemac-74 on 25/04/18.
//  Copyright © 2018 Agile. All rights reserved.
//

import UIKit
typealias ErrorHandler = ((String)->(Void))
typealias  SumHandler = ((Int)->Void)
typealias  BlankHandler = (()->())

class ViewController: UIViewController {

    var getErrorHandler:ErrorHandler?

    @IBOutlet var tblUserList:UserTableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        getErrorHandler =  {
            error in
            print(error)
        }
        self.setupUI()
     
        print("End Of ViewDidLoad")
    }
    //MARK: - Call API
    func callAPI(){
        var GetURLRequest:URLRequest = URLRequest.init(url: URL.init(string: "")!)
        
        //GetURLRequest.setValue("", forHTTPHeaderField: "")
        GetURLRequest.httpMethod  = "GET/POST"
        GetURLRequest.httpBody = Data.init(base64Encoded: "")
        URLSession.shared.dataTask(with: GetURLRequest) { (data, response, error) in
            
            do {
                if let dict:NSDictionary = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary{
                    print(dict)
                }
                
            }catch {
                print(error.localizedDescription)
            }
        }
    }
    //MARK: - Other Methods
    func setupUI(){
       
        let aryUserList:[String] = ["1","2","3","4","5","6","7","8","9","10","11","12"]
        self.tblUserList.setupTableView(withUserList: aryUserList)
        self.tblUserList.setDidSelectHandler { (userName) in
            print(userName)
            
        }
    }
    func setupIntegerContent(){
        self.getSumOfTwoNumber(withNumber: 15, withNumber: 20) { (total) in
            print("Total is \(total)")
        }
    
        let total:Int = self.getSumOfTwoNumber(withNumber: 15, withNumber: 20)
        print("Total is \(total)")
        
    }
    func getSumOfTwoNumber(withNumber firstNumber:Int,withNumber secondNumber:Int )-> Int{
        
        return (firstNumber+secondNumber)
    }
    func getSumOfTwoNumber(withNumber firstNumber:Int,withNumber secondNumber:Int,withTotal sumHandler:SumHandler ){
        
        sumHandler(firstNumber+secondNumber)
    }
    //MARK: - Button Action
    @IBAction func btnCallBlock() {
        if let handler = getErrorHandler {
            handler("Called Handler ")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
    
    

}


