//
//  ViewController.swift
//  youtube-mybuild
//
//  Created by Ahmed Sayed on 10/24/20.
//  Copyright © 2020 Ahmed Sayed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        model.getVideos()
    }


}

