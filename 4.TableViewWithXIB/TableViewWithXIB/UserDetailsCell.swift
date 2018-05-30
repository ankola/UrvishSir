//
//  UserDetailsCell.swift
//  TableViewWithXIB
//
//  Created by agilemac-74 on 24/04/18.
//  Copyright © 2018 Agile. All rights reserved.
//

import UIKit

class UserDetailsCell: UITableViewCell {

    @IBOutlet var lblName:UILabel!
    @IBOutlet var tfDetails:UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
