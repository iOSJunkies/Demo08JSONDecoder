//
//  ResponseData.swift
//  Demo08JSONDecoder
//
//  Created by Aditya Sharma on 9/14/18.
//  Copyright © 2018 AdityaSharma. All rights reserved.
//

import UIKit

class ResponseData: Codable {
    
    var users : [JDUser]?
    var images : [String]?
    

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.users = try container.decodeIfPresent([JDUser].self, forKey: .users) ?? [JDUser]()
        self.images = try container.decodeIfPresent([String].self, forKey: .images) ?? [String]()
    }
    
}
