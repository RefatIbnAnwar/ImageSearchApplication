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
    
    var model: ImageModel? {
        didSet {
            if let model = model {
                flickrImageView.image = UIImage(named: "placeholder")
                flickrImageView.downloadImage(model.imageURL)
            }
        }
    }
    
    override func prepareForReuse() {
        flickrImageView.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
