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
        //self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: UISearchBar(frame: CGRect(x: 0, y: 0, width: 200, height: 20)))
        self.navigationItem.titleView = UISearchBar(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Options", style: .plain, target: self, action: #selector(showActionSheet)) //UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(showActionSheet))
    }
    
    
    @objc func showActionSheet()
    {
        let ac = UIAlertController(title: "Change Gird Style", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "2 Image per row", style: .default, handler: changeLayout(action:)))
        ac.addAction(UIAlertAction(title: "3 Image per row", style: .default, handler: changeLayout(action:)))
        ac.addAction(UIAlertAction(title: "4 Image per row", style: .default, handler: changeLayout(action:)))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        ac.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem
            present(ac, animated: true)
    }
    
    func changeLayout(action: UIAlertAction) {
        
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
