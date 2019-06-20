//
//  SwiftJSONDecoder.swift
//  Demo08JSONDecoder
//
//  Created by Aditya Sharma on 9/14/18.
//  Copyright © 2018 AdityaSharma. All rights reserved.
//

import UIKit

public class SwiftJSONDecoder: NSObject {
    
    private class func parseJsonData<T: Decodable>(_ classDeclared : T.Type , jsonDict : NSDictionary) -> Any? {
        let tempData = NSKeyedArchiver.archivedData(withRootObject: jsonDict)
        var tempObj : Any!
        do {
            tempObj = try JSONDecoder().decode(classDeclared, from: tempData)
        } catch let er {
            print(er)
        }
        return tempObj
    }
    
    private class func parseJsonArray<T: Decodable>(_ classDeclared : T.Type , jsonArray : NSArray) -> Any? {
        let returnArray = NSMutableArray()
        for i in 0 ..< jsonArray.count {
            let dict: AnyObject = jsonArray.object(at: i) as AnyObject
            returnArray.add(parseJsonData(classDeclared, jsonDict: dict as! NSDictionary)!)
        }
        return returnArray
    }
    
    public class func decodeJSON<T: Decodable>(_ classDeclared : T.Type , json : Any) -> Any? {
        guard let tempJSON =  json as? NSDictionary else {
            var returnArray = [Any]()
            for item in (json as! [Any]) {
                returnArray.append(decodeJSON(classDeclared, json: item)!)
            }
            return returnArray
        }
        let tempData = tempJSON.toData()
        var tempObj : Any!
        do {
            let decoder = JSONDecoder()
            tempObj = try decoder.decode(classDeclared, from: tempData)
        } catch let er {
            print(er)
        }
        return tempObj
    }
    
}

import UIKit

public extension NSDictionary{
    
    func toData() -> Data{
        if JSONSerialization.isValidJSONObject(self) {
            do{
                let data = try JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions(rawValue: 0))
                return data
            }catch {
            }
        }
        return Data()
    }
}
