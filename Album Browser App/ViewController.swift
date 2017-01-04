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
  var photoAssets: PHFetchResult<AnyObject>!
  var assetsCollection: PHAssetCollection!
  
  override func viewDidLoad() {
    super.viewDidLoad()

  self.navigationItem.title = albumName
    
    self.automaticallyAdjustsScrollViewInsets = false
    
    
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    
    collectionView.reloadData()
    
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return photoAssets.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell: AlbumsCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! AlbumsCollectionViewCell
    
    let asset: PHAsset = photoAssets[indexPath.row] as! PHAsset
    
    PHImageManager.default().requestImage(for: asset, targetSize: PHImageManagerMaximumSize, contentMode: PHImageContentMode.aspectFit, options: nil) { (image: UIImage?, object: [AnyHashable: Any]?) -> Void in
      
      cell.imageView.image = image
      
    }
    return cell
    
  }

  // Mark:  Collection View Layout
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    let width = self.view.frame.width
    let sizeDimension = (width - 2 * 3) / 4
    
    return CGSize(width: sizeDimension, height: sizeDimension)
    
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 1.0
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 1.0
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    if segue.identifier == "showImage" {
      
      if let controller: ImageViewController = segue.destination as? ImageViewController {
        
      controller.index = self.collectionView.indexPath(for: sender as! UICollectionViewCell)!.item
      
      controller.assetFetchResult = self.photoAssets
      controller.assetCollection = self.assetsCollection
      }
    }
  }
}















