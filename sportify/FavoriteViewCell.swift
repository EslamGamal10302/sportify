//
//  FavoriteViewCell.swift
//  sportify
//
//  Created by Eslam gamal on 20/05/2023.
//

import UIKit

class FavoriteViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var fav_image: UIImageView!
    
    @IBOutlet weak var fav_label: UILabel!
    
    
    @IBOutlet weak var fav_action_button: UIButton!
    
    
    @IBOutlet weak var container: UIView!
}
