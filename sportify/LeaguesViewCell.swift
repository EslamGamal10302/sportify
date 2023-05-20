//
//  LeaguesViewCell.swift
//  sportify
//
//  Created by Eslam gamal on 21/05/2023.
//

import UIKit

class LeaguesViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var leagues_image: UIImageView!
    
    @IBOutlet weak var leagues_title: UILabel!
    
    @IBOutlet weak var container: UIView!
    
    
}
