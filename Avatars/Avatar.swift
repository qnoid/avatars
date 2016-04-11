//
//  Avatar.swift
//  kata
//
//  Created by Markos Charatzas on 10/04/2016.
//  Copyright © 2016 Markos Charatzas. All rights reserved.
//

protocol Avatar {
    var defaultImage: String { get }
    
    var imager: Imager { get }
}

class CustomAvatar: Avatar {    
    let defaultImage = "avatar"
    let image: String
    
    init(image: String) {
        self.image = image
    }
    
    lazy var imager: Imager = { [unowned self] in
        return SessionImager(avatar: self)
    }()
}

class DefaultAvatar: Avatar {
    let defaultImage = "avatar"

    lazy var imager: Imager = { [unowned self] in
        return DefaultImager(avatar: self)
    }()
}