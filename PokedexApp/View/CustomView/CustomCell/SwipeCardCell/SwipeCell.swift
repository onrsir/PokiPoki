//
//  SwipeCell.swift
//  PokedexApp
//
//  Created by Onur Sir on 22.03.2023.
//

import UIKit
import VerticalCardSwiper

class SwipeCell: CardCell {

    @IBOutlet weak var swBackgroundView: UIView!
    @IBOutlet weak var swCardImage: UIImageView!
    @IBOutlet weak var swTitleLabel: UILabel!
    @IBOutlet weak var swIdLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        swBackgroundView.layer.cornerRadius   = 40
        swIdLabel?.layer.masksToBounds        = true
        swIdLabel?.layer.cornerRadius         = 16

    }

}
