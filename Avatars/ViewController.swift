//
//  ViewController.swift
//  Avatars
//
//  Created by Markos Charatzas on 10/04/2016.
//  Copyright © 2016 Markos Charatzas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var defaultImageView: UIImageView!
    @IBOutlet weak var customImageView: UIImageView!
    
    let session = Session()
    let defaultAvatar: Avatar = DefaultAvatar()
    let customAvatar: Avatar = CustomAvatar(image:"avatar.jpg")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.defaultAvatar.imager.image(self.defaultImageView)
        
        var imager = self.customAvatar.imager
        imager.session = self.session
        self.customAvatar.imager.image(self.customImageView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

