//
//  Label.swift
//  MPRecipe
//
//  Created by Mauricio Pimienta on 10/7/24.
//

import UIKit

class MPLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        textColor = UIColor.MPGrayColor
        font = UIFont.MPTextFont(ofSize: .h4, type: .descriptionStyle) // default
        textAlignment = .left
    }
    
}
