//
//  FlickrPhoto.swift
//  ImageSearchApplication
//
//  Created by Refat Hossain on 30/1/22.
//

import Foundation

struct FlickrPhoto : Codable {
    let id : String
    let owner: String
    let secret : String
    let server : String
    let farm : Int
    let title: String
    let ispublic : Int
    let isfriend : Int
    let isfamily : Int
    
}
