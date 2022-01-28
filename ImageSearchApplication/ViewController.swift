//
//  ViewController.swift
//  ImageSearchApplication
//
//  Created by Refat Hossain on 29/1/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageCollectionView: UICollectionView! {
        didSet {
            self.imageCollectionView.register(UINib(nibName: "ImageCVCell", bundle: nil), forCellWithReuseIdentifier: "cell")
            self.imageCollectionView.dataSource = self
            self.imageCollectionView.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: UISearchBar(frame: CGRect(x: 0, y: 0, width: 200, height: 20))) 
    }
    
}

extension ViewController : UICollectionViewDataSource, UICollectionViewDelegate , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ImageCVCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    
}
