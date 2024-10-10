//
//  RecipesViewModel.swift
//  MPRecipe
//
//  Created by Mauricio Pimienta on 10/7/24.
//

import Foundation

class RecipesViewModel {
    
    // MARK: Constants
    private let recipesUrlString = Endpoints.NetworkUrl.Recipes.rawValue
    let cellHeight: CGFloat = 120
    
    // MARK: Variables
    var model: RecipesModel?
    var recipeCellData: Observable<[RecipeTableViewCellViewModel]> = Observable(nil)
    var isLoading: Observable<Bool> = Observable(false)
    
    // MARK: External
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfRows() -> Int {
        recipeCellData.value?.count ?? 0
    }
    
    func getData() {
        if isLoading.value ?? true {
            return
        }
        
        isLoading.value = true
        
        /// Using Closure
        NetworkCaller.shared.loadFrom(urlString: recipesUrlString, type: .json) { [weak self] (result: Result<RecipesModel, NetworkError>) in
            self?.isLoading.value = false
            switch result {
            case .success(let data):
                self?.model = data
                self?.setCellData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: Internal
    private func setCellData() {
        if let recipes = model?.recipes {
            recipeCellData.value = recipes.compactMap({ RecipeTableViewCellViewModel(model: $0) })
        }
    }
    
}
