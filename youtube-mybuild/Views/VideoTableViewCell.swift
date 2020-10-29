//
//  VideoTableViewCell.swift
//  youtube-mybuild
//
//  Created by Ahmed Sayed on 10/28/20.
//  Copyright © 2020 Ahmed Sayed. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var video: Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v:Video) {
        
        self.video = v
        
        // Ensure we have a video
        guard self.video != nil else {
            return
        }
        
        // Set title label
        self.titleLabel.text = video?.title
        
        // Set date label
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        // Set the thumbnail
        guard self.video!.thumbnail != "" else {
            return
        }
        
        // Check cache before downloading data
        if let cachedData = CacheManager.getVideoCache((self.video!.thumbnail)) {
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return // to skip downloading code if found in cache
        }
        
        // Download theumbnail data
        let url = URL(string: self.video!.thumbnail)
        
        // Get shared url session object
        let session = URLSession.shared
        
        // Create a data task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil {
                
                // Save downloaded data into cache
                CacheManager.setVideoCache(url!.absoluteString, data)
                
                // Check if downloaded url matches video thumbnail url that the cell is set to display
                if url!.absoluteString != self.video?.thumbnail {
                    
                    // Video cell has been recycled for another video and no longer matches the downloaded thumbnail
                    return
                }
                
                // If passes all that, Create image object
                let image = UIImage(data: data!)
                
                // Set the image view
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
            }
        }
        
        // Start data task
        dataTask.resume()
    }

}
