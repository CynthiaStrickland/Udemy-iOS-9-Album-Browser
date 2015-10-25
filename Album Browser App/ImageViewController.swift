//
//  ImageViewController.swift
//  Album Browser App
//
//  Created by Cynthia Whitlatch on 10/25/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

import UIKit
import Photos

class ImageViewController: UIViewController {
  
  var assetCollection = PHAssetCollection()
  var assetFetchResult = PHFetchResult()
  var index : Int = 0
  
  @IBOutlet weak var imageView: UIImageView!

  
  @IBAction func trash(sender: AnyObject) {
    
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()

    }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(true)
    
    let asset:PHAsset = assetFetchResult[index] as! PHAsset
    
   PHImageManager.defaultManager().requestImageForAsset(asset, targetSize: PHImageManagerMaximumSize, contentMode: PHImageContentMode.AspectFit, options:nil, resultHandler: { (image: UIImage?, object: [NSObject: AnyObject]?) -> Void in
      
      self.imageView.image = image
    })
  }
}
