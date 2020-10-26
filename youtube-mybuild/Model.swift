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
            
            // error handling "do catch try" because it may throw an error
            do {
            // Parsing the data into video objects
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            let response = try decoder.decode(Responce.self, from: data!)
                
            dump(response)
                // breakpoint dump and write in console "po response.items![0]"
                
            }
            catch {
                
            }
        }
        
        // Kick off the task
        dataTask.resume()
        
    }
}
