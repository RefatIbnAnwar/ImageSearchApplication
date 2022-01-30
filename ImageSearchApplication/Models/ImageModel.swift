//
//  ImageModel.swift
//  ImageSearchApplication
//
//  Created by Refat Hossain on 30/1/22.
//

import Foundation

struct ImageModel {

    let imageURL: String
    
    init(withPhotos photo: FlickrPhoto) {
        let urlString = String(format: AppConstants.imageURL, photo.farm, photo.server, photo.id, photo.secret)
        imageURL = urlString
    }
}
