//
//  SearchViewModel.swift
//  ImageSearchApplication
//
//  Created by Refat Hossain on 30/1/22.
//

import UIKit

class SearchViewModel: NSObject {

    private(set) var photoArray = [FlickrPhoto]()
    private var searchText = ""
    private var pageNo = 1
    private var totalPageNo = 1
    
    var showAlert: ((String) -> Void)?
    var dataUpdated: (() -> Void)?
    
    func search(text: String, completion:@escaping () -> Void) {
        searchText = text
        photoArray.removeAll()
        fetchResults(completion: completion)
    }
    
    private func fetchResults(completion:@escaping () -> Void) {
        FlickrSearchService.shared.searchFlickr(searchText: searchText, pageNo: pageNo) { newPhotos in
            if let photos = newPhotos {
                self.totalPageNo = Int(photos.pages)
                self.photoArray.append(contentsOf: photos.photo)
                print(self.photoArray.count , "count")
                self.dataUpdated?()
                completion()
            }
            else {
                completion()
                self.showAlert?("Something is wrong")
            }
        }
    }
    
    func fetchNextPage(completion:@escaping () -> Void) {
        if pageNo < totalPageNo {
            pageNo += 1
            fetchResults {
                completion()
            }
        } else {
            completion()
        }
    }
}

