//
//  ViewController.swift
//  Demo08JSONDecoder
//
//  Created by Aditya Sharma on 9/14/18.
//  Copyright © 2018 AdityaSharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var request = URLRequest(url: URL(string: "https://api.myjson.com/bins/sm1co")!)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request){
            (data, response, error) -> Void in
            var jsonDict = NSDictionary()
            do{
                jsonDict = try JSONSerialization.jsonObject(with: data!, options:JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                print(jsonDict)
                let responseDataObj = SwiftJSONDecoder.decodeJSON(ResponseData.self, json: jsonDict as Any) as! ResponseData
                print(responseDataObj)
                print(responseDataObj.images!)
                print(responseDataObj.users!)
            }catch _ as NSError {              
                DispatchQueue.main.async(execute: { () -> Void in
                })
            }
            }.resume()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

