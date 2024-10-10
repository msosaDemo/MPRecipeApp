//
//  RecipeTableViewCellViewModel.swift
//  MPRecipe
//
//  Created by Mauricio Pimienta on 10/8/24.
//

import Foundation
import UIKit

enum RecipePhotoSize {
    case large, small
}

class RecipeTableViewCellViewModel {
    
    // MARK: Variables
    var updatedModel: Observable<RecipeTableViewCellModel> = Observable(nil)
    var model: RecipeTableViewCellModel?
    
    // MARK: Init
    convenience init(model: RecipeModel) {
        self.init()
        self.model = RecipeTableViewCellModel(photo: UIImage(named: "DefaultImage"),
                                              name: model.name,
                                              cuisine: model.cuisine,
                                              photoUrlLarge: model.photoUrlLarge)
    }
    
    // MARK: External
    func getImage() {
        NetworkCaller.shared.loadFrom(urlString: model?.photoUrlLarge ?? "", type: .photo) { [weak self] (result: Result<RecipePhotoData, NetworkError>) in
            switch result {
            case .success(let data):
                self?.model?.photo = UIImage(data: data.photoData)
                self?.updateModel()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: Internal
    private func updateModel() {
        if let model = model {
            updatedModel.value = model // photo updated
        }
    }
                                      
}
