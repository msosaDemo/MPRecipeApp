//
//  RecipeTableViewCellModel.swift
//  MPRecipe
//
//  Created by Mauricio Pimienta on 10/8/24.
//

import Foundation
import UIKit

struct RecipePhotoData: Decodable {
    var photoData: Data
}

struct RecipeTableViewCellModel {
    
    var photo: UIImage?
    var name: String?
    var cuisine: String?
    var photoUrlLarge: String?
    
    init(photo: UIImage?, name: String?, cuisine: String?, photoUrlLarge: String?) {
        self.photo = photo
        self.name = name
        self.cuisine = cuisine
        self.photoUrlLarge = photoUrlLarge
    }
        
}
