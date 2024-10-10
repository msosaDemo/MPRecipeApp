//
//  RecipesViewController+TableView.swift
//  MPRecipe
//
//  Created by Mauricio Pimienta on 10/7/24.
//

import Foundation
import UIKit

extension RecipesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        registerCells()
    }
    
    func registerCells() {
        tableView.register(RecipeTableViewCell.register(), forCellReuseIdentifier: RecipeTableViewCell.cellIdentifier)
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RecipeTableViewCell.cellIdentifier) as? RecipeTableViewCell else {
            return UITableViewCell()
        }
        
        if viewModel.numberOfRows() == 0 {
            return UITableViewCell()
        }
        
        if cell.viewModel == nil {
            cell.parent = self
            cell.updateViewModel(viewModel: cellData[indexPath.row])
            cell.viewModel?.getImage()
        } else {
            cell.updateCellView()
        }
        
        return cell
    }
    
}
