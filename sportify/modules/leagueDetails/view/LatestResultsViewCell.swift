//
//  LatestResultsViewCell.swift
//  sportify
//
//  Created by Eslam gamal on 21/05/2023.
//

import UIKit

class LatestResultsViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }

    
    @IBOutlet weak var homeTeamImage: UIImageView!
    
    
    @IBOutlet weak var homeTeamName: UILabel!
    
    @IBOutlet weak var totalResult: UILabel!
    
    @IBOutlet weak var awayTeamImage: UIImageView!
    
 
    @IBOutlet weak var awayTeamName: UILabel!
    
   
    @IBOutlet weak var container: UIView!
    
}
