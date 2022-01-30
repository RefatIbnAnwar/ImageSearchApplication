//
//  Result.swift
//  ImageSearchApplication
//
//  Created by Refat Hossain on 30/1/22.
//

import UIKit

enum Result <T>{
    case Success(T)
    case Failure(String)
    case Error(String)
}
