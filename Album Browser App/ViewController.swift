//
//  ViewController.swift
//  Album Browser App
//
//  Created by Cynthia Whitlatch on 10/24/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

  @IBOutlet weak var collectionView: UICollectionView!
  
  var albumName: String!
  var photoAssets: PHFetchResult!
  var assetsCollection: PHAssetCollection!
  
  override func viewDidLoad() {
    super.viewDidLoad()

  self.navigationItem.title = albumName
    
  }
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(true)
    
    collectionView.reloadData()
    
  }

  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return photoAssets.count
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    
    let cell: AlbumsCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! AlbumsCollectionViewCell
    
    let asset: PHAsset = photoAssets[indexPath.row] as! PHAsset
    
    PHImageManager.defaultManager().requestImageForAsset(asset, targetSize: PHImageManagerMaximumSize, contentMode: PHImageContentMode.AspectFit, options: nil) { (image: UIImage?, object: [NSObject: AnyObject]?) -> Void in
      
      cell.imageView.image = image
      
    }
    return cell
    
  }

}















