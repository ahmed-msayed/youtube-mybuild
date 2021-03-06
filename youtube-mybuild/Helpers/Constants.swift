//
//  Constants.swift
//  youtube-mybuild
//
//  Created by Ahmed Sayed on 10/25/20.
//  Copyright © 2020 Ahmed Sayed. All rights reserved.
//

import Foundation

struct Constants {
    
    static var API_KEY = ""
    static var PLAYLIST_ID = "PLRCzrSHS5u_HQuXr15gOMCIK-E-57A5vd"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    
    static var VIDEOCELL_ID = "VideoCell"
    
    static var YT_EMBED_URL = "https://www.youtube.com/embed/"
}
