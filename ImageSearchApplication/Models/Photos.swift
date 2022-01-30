//
//  Photos.swift
//  ImageSearchApplication
//
//  Created by Refat Hossain on 30/1/22.
//

import Foundation

struct Photos: Codable {
    let page: Int
    let pages: Int
    let perpage: Int
    let photo: [FlickrPhoto]
    let total: Int
    
}
