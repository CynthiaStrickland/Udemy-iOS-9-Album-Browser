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
  var assetFetchResult = PHFetchResult<AnyObject>()
  var index : Int = 0
  
  @IBOutlet weak var imageView: UIImageView!

  
  @IBAction func trash(_ sender: AnyObject) {
    let alertController = UIAlertController(title: "Delete Image?", message: "Confirm Delete Image", preferredStyle: UIAlertControllerStyle.alert)
    alertController.addAction(UIAlertAction(title: "YES", style: UIAlertActionStyle.default, handler: { (UIAlertAction) -> Void in
  
  PHPhotoLibrary.shared().performChanges({ () -> Void in
    let trash = PHAssetCollectionChangeRequest(for: self.assetCollection)
    trash?.removeAssets([self.assetFetchResult[self.index]])
    }, completionHandler: { (success: Bool, error: NSError?) -> Void in
      
      if success {
        print("Image Deleted")
        
      } else {
        print("Error, Image Not Deleted")
      }
  
  })
      UIView.animate(withDuration: 1.0, animations: { () -> Void in
        self.imageView.alpha = 0.0
      })
      
    }))
    
    alertController.addAction(UIAlertAction(title: "NO", style: .default, handler: { (alertAction: UIAlertAction) -> Void in
      print("You Selected NO")

    }))
    
    self.present(alertController, animated: true, completion: nil)
  
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()

    }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    
    let asset:PHAsset = assetFetchResult[index] as! PHAsset
    
   PHImageManager.default().requestImage(for: asset, targetSize: PHImageManagerMaximumSize, contentMode: PHImageContentMode.aspectFit, options:nil, resultHandler: { (image: UIImage?, object: [AnyHashable: Any]?) -> Void in
      
      self.imageView.image = image
    })
  }
}
