//
//  CacheManager.swift
//  youtube-mybuild
//
//  Created by Ahmed Sayed on 10/29/20.
//  Copyright © 2020 Ahmed Sayed. All rights reserved.
//

import Foundation

class CacheManager {
    
    static var cache = [String:Data]()
    
    static func setVideoCache(_ url:String, _ data:Data?) {
        // Store image data and use url as a key
        cache[url] = data
    }
    
    static func getVideoCache(_ url:String) -> Data? {
        // Try to get data from the specified url
        return cache[url]
    }
}
