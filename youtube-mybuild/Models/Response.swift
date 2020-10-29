//
//  Response.swift
//  youtube-mybuild
//
//  Created by Ahmed Sayed on 10/26/20.
//  Copyright © 2020 Ahmed Sayed. All rights reserved.
//

import Foundation

// To grab the items container from JSON

struct Responce: Decodable {
    var items: [Video]?
    
    enum CodingKeys: String, CodingKey {
        case items
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.items = try container.decode([Video].self, forKey: .items)
    }
}
