//
//  Imager.swift
//  kata
//
//  Created by Markos Charatzas on 10/04/2016.
//  Copyright © 2016 Markos Charatzas. All rights reserved.
//

import UIKit

protocol Imager {
    var session: Session? { get set }
    
    func image(imageView: UIImageView)
}

class SessionImager: Imager
{
    weak var session: Session?
    unowned let avatar: CustomAvatar
    
    init(avatar: CustomAvatar){
        self.avatar = avatar
    }
    
    func image(imageView: UIImageView) {
        
        let download = self.session!.download(self.avatar.image) { [weak imageView = imageView] (data, response, _) in
            
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

class DefaultImager: Imager
{
    var session: Session?
    
    let avatar: DefaultAvatar
    
    init(avatar: DefaultAvatar){
        self.avatar = avatar
    }

    func image(imageView: UIImageView) {
        imageView.image = UIImage(named: self.avatar.defaultImage)
    }
}
