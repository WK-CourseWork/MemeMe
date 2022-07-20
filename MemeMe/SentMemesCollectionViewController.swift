//
//  SentMemesCollectionViewController.swift
//  MemeMe
//
//  Created by Waylon Kumpe on 7/14/22.
//

import Foundation
import UIKit

class SentMemesCollectionViewController: UICollectionViewController {

    // MARK: Properties
    @IBOutlet weak var collcetionAddButton: UIBarButtonItem!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!

    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        let space: CGFloat = 3.0
        let dimensionWidth = (view.frame.size.width - (2 * space)) / 3.0
        let dimensionHeight = (view.frame.size.height - (1 * space)) / 3.0
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimensionWidth, height: dimensionHeight)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView!.reloadData()
        self.tabBarController?.tabBar.isHidden = false
    }

    // MARK: Collection View Data Source
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let memes = (UIApplication.shared.delegate as! AppDelegate).memes
        return memes.count
    }

    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let meme = (UIApplication.shared.delegate as! AppDelegate).memes[(indexPath as NSIndexPath).row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! SentMemesCollectionViewCell
        let memedImage = meme.memedImage
        cell.collectionImageView?.image = memedImage
        return cell
    }
}
