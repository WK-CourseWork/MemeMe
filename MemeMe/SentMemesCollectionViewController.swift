//
//  SentMemesCollectionViewController.swift
//  MemeMe
//
//  Created by Waylon Kumpe on 7/14/22.
//

// MARK: - Import
import Foundation
import UIKit

// MARK: - Class

class SentMemesCollectionViewController: UICollectionViewController {
    
    // MARK: - Properties
    @IBOutlet weak var collcetionAddButton: UIBarButtonItem!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    // MARK: - Collection View Data Source
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let memes = (UIApplication.shared.delegate as! AppDelegate).memes
        return memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let meme = (UIApplication.shared.delegate as! AppDelegate).memes[(indexPath as NSIndexPath).row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! SentMemesCollectionViewCell
        let memedImage = meme.memedImage
        cell.ImageView?.image = memedImage
        return cell
    }
}
