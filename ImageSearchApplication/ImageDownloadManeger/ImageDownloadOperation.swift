//
//  ImageDownloadOperation.swift
//  ImageSearchApplication
//
//  Created by Refat Hossain on 30/1/22.
//

import UIKit
import Alamofire

typealias ImageCompletion = (_ image : UIImage?, _ url : String) -> Void

class ImageDownloadOperation: Operation {
    
    let url: String?
    var customCompletionBlock: ImageCompletion?
    
    init(url: String, completionBlock: @escaping ImageCompletion) {
        self.url = url
        self.customCompletionBlock = completionBlock
    }
    
    override func main() {
        
        if self.isCancelled { return }
        
        if let url = self.url {
        
            if self.isCancelled { return }
            

            AF.download(url)
                .downloadProgress { progress in
                    print("Download Progress: \(progress.fractionCompleted)")
                }
                .responseData { response in
                    if let data = response.value {
                        let image = UIImage(data: data)
                        if self.isCancelled { return }
                        if let completion = self.customCompletionBlock{
                            completion(image, url)
                        }
                    }
                    else {
                        if self.isCancelled { return }
                    }
                }
//
//            NetworkManager.shared.downloadImage(url) { (result) in
//
//                GCD.runOnMainThread {
//                    switch result {
//                    case .Success(let image):
//                        if self.isCancelled { return }
//                        if let completion = self.customCompletionBlock{
//                            completion(image, url)
//                        }
//                    default:
//                        if self.isCancelled { return }
//                        break
//                    }
//                }
//            }
        }
    }
}

