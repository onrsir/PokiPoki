//
//  PokeCell.swift
//  PokedexApp
//
//  Created by Onur Sir on 22.03.2023.
//

import UIKit

class PokeCell: UICollectionViewCell {

    //MARK: - Outlets
    @IBOutlet weak var cellContainerview: UIView!
    @IBOutlet weak var cellNameLabel: UILabel!
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellContainerView: CardView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    

}
