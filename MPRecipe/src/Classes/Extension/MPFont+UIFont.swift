//
//  Font.swift
//  MPRecipe
//
//  Created by Mauricio Pimienta on 10/7/24.
//

import UIKit

enum FontStyle {
    case titleStyle, subtitleStyle, descriptionStyle
}

enum FontSize: CGFloat {
    case h0 = 26.0
    case h1 = 22.0
    case h3 = 18.0
    case h4 = 14.0
    
    var value: CGFloat {
        switch self {
        case .h0: return 26.0
        case .h1: return 22.0
        case .h3: return 18.0
        case .h4: return 14.0
        }
    }
}

struct FontName {
    static let regular = "Baskerville"
    static let bold = "Baskerville-Bold"
}

extension UIFont {
    
    class func MPTextFont(ofSize size: FontSize, type: FontStyle) -> UIFont {
        guard let font = UIFont(name: type == .titleStyle ? FontName.bold : FontName.regular,
                                size: size.value) else {
            return UIFont.systemFont(ofSize: size.value)
        }
        return font
    }

}
