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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @IBOutlet weak var leagues_image: UIImageView!
    
    @IBOutlet weak var leagues_title: UILabel!
    
    @IBOutlet weak var container: UIView!
    
    
}
