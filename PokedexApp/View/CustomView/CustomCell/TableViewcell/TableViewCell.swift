//
//  TableViewCell.swift
//  PokedexApp
//
//  Created by Onur Sir on 22.03.2023.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var favImageView: UIImageView!
    @IBOutlet weak var favIdLabel: UILabel!
    @IBOutlet weak var favNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
