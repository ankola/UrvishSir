//
//  ViewController.swift
//  APIDemo
//
//  Created by agilemac-74 on 30/01/18.
//  Copyright © 2018 Agile. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.postMethod()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func postMethod()
    {
        /*
         1) method Type : get
         url :http://202.131.117.92:7024/v1/api/test
         
         2)Method Type : post
         url : http://202.131.117.92:7024/v1/api/getUserDetail
         parameters :
         user_id : 5a61df2e4f2dd92403f9c629
         */
        let perametes:[String:String] = ["user_id":"5a61df2e4f2dd92403f9c629"]
        Alamofire.request(URL.init(string: "http://202.131.117.92:7024/v1/api/getUserDetail")!, method: HTTPMethod.post, parameters: perametes, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result
            {
            case .success(let json):
                print(json)
                if let dictResponse:[String:Any] = json as? [String:Any]
                {
                }
                else
                {
                    print("Not proper response ")
                }
                break
            case .failure(let error):
                
                print(error.localizedDescription)
                break;
            }
        }
    }
}
