//
//  UserTableViewCell.swift
//  CollectionView
//
//  Created by agilemac-74 on 26/04/18.
//  Copyright © 2018 Agile. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    var clickButtonHandler:(()->())?
    @IBOutlet var lblName:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction private func clickChangeColor() {
        if let handler = clickButtonHandler {
            handler()
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setupCell(withUser user:AIUser){
        self.lblName.text = user.city
    }
    

}
