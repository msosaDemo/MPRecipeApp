//
//  MPImageView+UIImageView.swift
//  MPRecipe
//
//  Created by Mauricio Pimienta on 10/9/24.
//

import UIKit

extension UIImageView {
    
    func addBorders() {
        layer.masksToBounds = true
        layer.borderWidth = 1.2
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = 10
    }
    
}
