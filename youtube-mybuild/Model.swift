//
//  Model.swift
//  youtube-mybuild
//
//  Created by Ahmed Sayed on 10/25/20.
//  Copyright © 2020 Ahmed Sayed. All rights reserved.
//

import Foundation

class Model {
    
    func getVideos()  {
        
        // Create a URL object
        let url = URL(string: Constants.API_URL)
        guard url != nil else{
            return
        }
        
        
        // Get a URL session object
        let session = URLSession.shared
        
        
        // Get a data task from the URL session object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // Check if there any errors
            if error != nil || data == nil {
                return
            }
            
            // Parsing the data into video objects
        }
        
        // Kick off the task
        dataTask.resume()
    }
}
