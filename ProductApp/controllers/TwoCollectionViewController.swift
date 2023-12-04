//
//  CollectionViewController.swift
//  ProductApp
//
//  Created by Milu Ann George on 29/11/23.
//

import UIKit


class TwoCollectionViewController : UIViewController {
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        }
    
    override func viewDidAppear(_ animated: Bool) {
        collectionView.dataSource = self
    }
}
    
    extension TwoCollectionViewController : UICollectionViewDataSource{
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 10
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
            cell.collectionLabel?.text = "Title"
            return cell
        }
    }
    


