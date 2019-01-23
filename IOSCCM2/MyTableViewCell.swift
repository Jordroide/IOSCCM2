//
//  MyTableViewCell.swift
//  IOSCCM2
//
//  Created by Jordane SERREAU Dev on 23/01/2019.
//  Copyright © 2019 Jordane SERREAU Dev. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var labelDomain: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fill(withData domains:Domain) {
        labelDomain.text = domains.domain
    }
}
