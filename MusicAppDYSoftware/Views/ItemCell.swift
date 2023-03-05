//
//  ContentCell.swift
//  MusicAppDYSoftware
//
//  Created by Macbook Air on 5.03.2023.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var cellImage : UIImageView!
    @IBOutlet weak var cellTexts : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
