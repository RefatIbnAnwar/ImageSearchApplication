//
//  FlickrSearchService.swift
//  ImageSearchApplication
//
//  Created by Refat Hossain on 30/1/22.
//

import Foundation
import Alamofire
import UIKit

class FlickrSearchService {
    
    static var shared : FlickrSearchService = FlickrSearchService()
    
    private init(){}
    
    
    func searchFlickr(searchText: String, pageNo: Int, complition: @escaping (Photos?) -> Void) {
        
        let urlString = String(format: AppConstants.searchURL, searchText, pageNo)
        
        AF.request(urlString, method: .post,  parameters: [:]).response
        { response in
            
            print(response)
            switch response.result {
            case .success(_):
                if let model = self.processResponse(response.data) {
                    complition(model.photos)
                }
            case .failure(_):
                print("network call error")
                complition(nil)
            }
            
        }
        
    }
    
    
    func processResponse(_ data: Data?) -> SearchModel? {
        do {
            let responseModel = try JSONDecoder().decode(SearchModel.self, from: data!)
            return responseModel
            
        } catch {
            print("Data parsing error: \(error.localizedDescription)")
            return nil
        }
    }
    
    
}
