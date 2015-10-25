//
//  AlbumTableViewCell.swift
//  Album Browser App
//
//  Created by Cynthia Whitlatch on 10/24/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {

  @IBOutlet weak var albumImage: UIImageView!
  @IBOutlet weak var albumName: UILabel!
  @IBOutlet weak var albumCount: UILabel!
  
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

  
}
