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
    let alertController = UIAlertController(title: "Delete Image?", message: "Confirm Delete Image", preferredStyle: UIAlertControllerStyle.Alert)
    alertController.addAction(UIAlertAction(title: "YES", style: UIAlertActionStyle.Default, handler: { (UIAlertAction) -> Void in
  
  PHPhotoLibrary.sharedPhotoLibrary().performChanges({ () -> Void in
    let trash = PHAssetCollectionChangeRequest(forAssetCollection: self.assetCollection)
    trash?.removeAssets([self.assetFetchResult[self.index]])
    }, completionHandler: { (success: Bool, error: NSError?) -> Void in
      
      if success {
        print("Image Deleted")
        
      } else {
        print("Error, Image Not Deleted")
      }
  
  })
      UIView.animateWithDuration(1.0, animations: { () -> Void in
        self.imageView.alpha = 0.0
      })
      
    }))
    
    alertController.addAction(UIAlertAction(title: "NO", style: .Default, handler: { (alertAction: UIAlertAction) -> Void in
      print("You Selected NO")

    }))
    
    self.presentViewController(alertController, animated: true, completion: nil)
  
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
