//
//  Imager.swift
//  kata
//
//  Created by Markos Charatzas on 10/04/2016.
//  Copyright © 2016 Markos Charatzas. All rights reserved.
//

import UIKit

protocol Imager {
    func image(imageView: UIImageView)
}

struct SessionImager: Imager
{
    unowned let session: Session
    unowned let avatar: CustomAvatar
    
    func image(imageView: UIImageView) {
        
        let download = self.session.download(self.avatar.image) { [weak imageView = imageView] (data, response, _) in
            
            guard let _imageView = imageView else {
                return
            }
            
            dispatch_async(dispatch_get_main_queue()) {
                _imageView.image = UIImage(data: data!)
            }
        }
        
        download.resume()        
        
        imageView.image = UIImage(named: self.avatar.defaultImage)
    }
}

struct DefaultImager: Imager
{
    let avatar: DefaultAvatar

    func image(imageView: UIImageView) {
        imageView.image = UIImage(named: self.avatar.defaultImage)
    }
}
