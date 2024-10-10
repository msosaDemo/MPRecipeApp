//
//  ViewController.swift
//  MPRecipe
//
//  Created by Mauricio Pimienta on 10/7/24.
//

import UIKit

class RecipesViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet var tableView: UITableView!
    
    // MARK: Variables
    var viewModel: RecipesViewModel = RecipesViewModel()
    var indicatorViewModel: LoadingIndicatorViewModel?
    var cellData: [RecipeTableViewCellViewModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
    }

    private func setupUI() {
        title = "MPRecipe App"
        view.backgroundColor = .white
        
        indicatorViewModel = LoadingIndicatorViewModel(parent: self)
        viewModel.getData()
        setupTableView()
    }
    
    // MARK: Internal
    private func bindViewModel() {
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self, let isLoading = isLoading else { return }
            
            DispatchQueue.main.async {
                if isLoading {
                    self.indicatorViewModel?.startLoadingAnimation()
                } else {
                    self.indicatorViewModel?.stopLoadingAnimation()
                }
            }
        }
        
        viewModel.recipeCellData.bind { [weak self] recipes in
            guard let self = self, let recipes = recipes else { return }
            cellData = recipes.sorted { $0.model?.cuisine ?? "" < $1.model?.cuisine ?? "" }
            reloadTableView()
        }
    }
    
}
