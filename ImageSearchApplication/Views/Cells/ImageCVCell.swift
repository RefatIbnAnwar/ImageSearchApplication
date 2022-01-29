//
//  ImageCVCell.swift
//  ImageSearchApplication
//
//  Created by Refat Hossain on 29/1/22.
//

import UIKit

class ImageCVCell: UICollectionViewCell {

    @IBOutlet weak var flickrImageView: UIImageView!{
        didSet {
            self.flickrImageView.layer.cornerRadius = 8.0
            self.flickrImageView.layer.borderWidth = 0.1
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
