//
//  JDUser.swift
//  Demo08JSONDecoder
//
//  Created by Aditya Sharma on 9/15/18.
//  Copyright © 2018 AdityaSharma. All rights reserved.
//

import UIKit

class JDUser: Codable {
    
    var address : String?
    var city : String?
    var dob : String?
    var id : Int?
    var email : String?
    var name : String?
    var optedin : Bool?
    var work : String?
   
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.address = try container.decodeIfPresent(String.self, forKey: .address) ?? String()
        self.city = try container.decodeIfPresent(String.self, forKey: .city) ?? String()
        self.dob = try container.decodeIfPresent(String.self, forKey: .dob) ?? String()
        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? Int()
        self.email = try container.decodeIfPresent(String.self, forKey: .email) ?? String()
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? String()
        self.optedin = try container.decodeIfPresent(Bool.self, forKey: .optedin) ?? Bool()
        self.work = try container.decodeIfPresent(String.self, forKey: .work) ?? String()

    }
}
