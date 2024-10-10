//
//  LoadingViewViewModel.swift
//  MPRecipe
//
//  Created by Mauricio Pimienta on 10/7/24.
//

import Foundation
import UIKit

class LoadingIndicatorViewModel {
    
    // MARK: Variables
    var indicatorView: LoadingIndicatorView = LoadingIndicatorView()
    var model: LoadingIndicatorModel?
    
    // MARK: Init
    init(parent: UIViewController) {
        model = LoadingIndicatorModel(parent: parent, activityView: UIActivityIndicatorView(style: .large))
        indicatorView.viewModel = self
        addView()
    }
    
    // MARK: Internal
    func addView() {
        let container: UIView = UIView()
        container.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        container.backgroundColor = .clear
        
        let activityView = UIActivityIndicatorView(style: .large)
        if let center = model?.parent?.view.center {
            activityView.center = center
        }

        container.addSubview(activityView)
        indicatorView.addSubview(container)
    }
    
    // MARK: External
    func startLoadingAnimation() {
        model?.activityView?.startAnimating()
    }
    
    func stopLoadingAnimation() {
        model?.activityView?.stopAnimating()
    }
    
}
