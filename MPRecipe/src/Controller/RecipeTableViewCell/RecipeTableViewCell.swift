//
//  RecipeTableViewCell.swift
//  MPRecipe
//
//  Created by Mauricio Pimienta on 10/8/24.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {

    // MARK: IBOutlets
    @IBOutlet var photo: UIImageView!
    @IBOutlet var name: MPLabel!
    @IBOutlet var cuisine: MPLabel!
    @IBOutlet var containerView: UIView!
    
    // MARK: Constants
    static let cellIdentifier = "RecipeTableViewCell"
    
    // MARK: Variables
    weak var parent: RecipesViewController?
    var viewModel: RecipeTableViewCellViewModel?
    
    // MARK: Init
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        bindViewModel()
    }
    
    // MARK: Internal
    private func setupUI() {
        backgroundColor = .clear
        selectionStyle = .none
        contentView.backgroundColor = .clear
        
        containerView.backgroundColor = .MPOrangeColor
        
        name.font = UIFont.MPTextFont(ofSize: .h1, type: .titleStyle)
        cuisine.font = UIFont.MPTextFont(ofSize: .h3, type: .subtitleStyle)
        photo.addBorders()
    }
    
    /// Updates viewModel and resets UI elements
    func updateViewModel(viewModel: RecipeTableViewCellViewModel) {
        self.viewModel = viewModel
        updateCellView()
    }
    
    /// Sets the UI elements with current viewModel
    func updateCellView() {
        DispatchQueue.main.async {
            if let viewModel = self.viewModel {
                self.photo.image = viewModel.model?.photo
                self.name.text = viewModel.model?.name
                self.cuisine.text = viewModel.model?.cuisine
            }
        }
    }
    
    // MARK: External
    static func register() -> UINib {
        UINib(nibName: "RecipeTableViewCell", bundle: nil)
    }
    
    // MARK: Internal
    private func bindViewModel() {
        viewModel?.updatedModel.bind { [weak self] updatedModel in
            guard let self = self, let updatedModel = updatedModel else { return }
            self.viewModel?.model = updatedModel
            self.parent?.reloadTableView()
        }
    }
    
}
