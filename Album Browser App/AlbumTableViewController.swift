//
//  AlbumTableViewController.swift
//  Album Browser App
//
//  Created by Cynthia Whitlatch on 10/24/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

import UIKit
import Photos

class AlbumTableViewController: UITableViewController {

  var albumsCollection = PHFetchResult<AnyObject>()
  var assetsCollection = PHAssetCollection()
  var photoAsset = PHFetchResult<AnyObject>()
  
  var albumNames = [String]()
  
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      albumsCollection = PHAssetCollection.fetchAssetCollections(with: PHAssetCollectionType.album, subtype: PHAssetCollectionSubtype.any, options: nil) as! PHFetchResult<AnyObject>
        
        print(albumsCollection.count)

      
      if albumsCollection.count > 0 {
        
        for i in 0...albumsCollection.count - 1 {
          
          assetsCollection = albumsCollection[i] as! PHAssetCollection
          
          let albumName = assetsCollection.localizedTitle!
          albumNames.append(albumName)

        }
      }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
      return albumNames.count > 0 ? 1 : 0
      
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumNames.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AlbumTableViewCell
      
      assetsCollection = albumsCollection[indexPath.row] as! PHAssetCollection
      photoAsset = PHAsset.fetchAssets(in: assetsCollection, options: nil) as! PHFetchResult<AnyObject>
        
        if photoAsset.count > 0 {
        
        let totalImages = photoAsset.count
        
        let randomIndex: Int = Int(arc4random_uniform(UInt32(photoAsset.count)))
        
        let asset: PHAsset = photoAsset[randomIndex] as! PHAsset
        
          PHImageManager.default().requestImage(for: asset, targetSize: PHImageManagerMaximumSize, contentMode: PHImageContentMode.aspectFit, options: nil, resultHandler: { (image: UIImage?, object: [AnyHashable: Any]?) -> Void in
            
          cell.albumImage.image = image
          cell.albumCount.text = totalImages > 1 ? "\(totalImages) images" : "\(totalImages) image"
            
        })
          
          
        } else {
          cell.albumImage.image = UIImage(named: "imagePlaceholder")
          cell.albumCount.text = " No Images"
      }

        cell.albumName.text = albumNames[indexPath.row]
      
        return cell
    }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    if segue.identifier == "showAlbums" {
      
      let controller: ViewController = segue.destination as! ViewController
      let indexPath: IndexPath = self.tableView.indexPathForSelectedRow!
      
      controller.albumName = albumNames[indexPath.row]
      assetsCollection = albumsCollection[indexPath.row] as! PHAssetCollection
      controller.assetsCollection = assetsCollection
      controller.photoAssets = PHAsset.fetchAssets(in: assetsCollection, options: nil) as! PHFetchResult<AnyObject>
    }
  }
  
  
}
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation


