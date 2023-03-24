//
//  CardView.swift
//  PokedexApp
//
//  Created by Onur Sir on 22.03.2023.
//

import UIKit


class CardView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
        
    }
    
    private func  initialSetup() {
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.shadowOpacity = 0.1
    }

}

