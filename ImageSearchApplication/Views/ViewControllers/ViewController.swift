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
            self.imageCollectionView.collectionViewLayout = {
                let layout = createLayout(size: self.imageCollectionView.bounds.width / 2)
                return layout
            }()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.titleView = UISearchBar(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Options", style: .plain, target: self, action: #selector(showActionSheet))
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
        var cellSize = self.imageCollectionView.bounds.width / 2
        switch action.title
        {
        case "2 Image per row":
            print(2)
            cellSize = self.imageCollectionView.bounds.width / 2
            
        case "3 Image per row":
            print(3)
            cellSize = self.imageCollectionView.bounds.width / 3
        case "4 Image per row":
            print(4)
            cellSize = self.imageCollectionView.bounds.width / 4
        default:
            print("default")
            cellSize = self.imageCollectionView.bounds.width / 2
        }
        self.imageCollectionView.setCollectionViewLayout(self.createLayout(size: cellSize), animated: true)
    }
    
    
    func createLayout(size: CGFloat) -> UICollectionViewLayout{
        let _flowLayout = UICollectionViewFlowLayout()
        _flowLayout.itemSize = CGSize(width: size, height: size)
        _flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        _flowLayout.scrollDirection = UICollectionView.ScrollDirection.vertical
        _flowLayout.minimumInteritemSpacing = 0.0
        _flowLayout.minimumLineSpacing = 0.0
        return _flowLayout
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
