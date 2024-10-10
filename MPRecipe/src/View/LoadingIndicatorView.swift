//
//  LoadingView.swift
//  MPRecipe
//
//  Created by Mauricio Pimienta on 10/7/24.
//

import Foundation
import UIKit

class LoadingIndicatorView: UIView {
    
    // MARK: Variables
    var viewModel: LoadingIndicatorViewModel?
    
    // MARK: Init
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setupUI()
    }
    
    // MARK: Internal
    private func setupUI() {
        frame = bounds
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
        backgroundColor = .clear
    }
    
    private func startAnimating() {
        guard let viewModel = self.viewModel else { return }
        viewModel.startLoadingAnimation()
    }
    
    private func stopAnimating() {
        guard let viewmodel = self.viewModel else { return }
        viewmodel.stopLoadingAnimation()
    }
    
}
