//
//  UIImageExtention.swift
//  ImageSearchApplication
//
//  Created by Refat Hossain on 30/1/22.
//

import UIKit

//MARK:- UIImageView
extension UIImageView {
    
    func downloadImage(_ url: String) {
        
        ImageDownloadManager.shared.addOperation(url: url,imageView: self) {  [weak self](result,downloadedImageURL)  in
            //GCD.runOnMainThread {
                switch result {
                case .Success(let image):
                    self?.image = image
                case .Failure(_):
                    break
                case .Error(_):
                    break
                }
            //}
        }
    }
}
