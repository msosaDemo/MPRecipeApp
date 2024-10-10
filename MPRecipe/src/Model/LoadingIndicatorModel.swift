//
//  LoadingModel.swift
//  MPRecipe
//
//  Created by Mauricio Pimienta on 10/7/24.
//

import Foundation
import UIKit

protocol LoadingViewProtocol {
    var parent: UIViewController? { get set }
    var activityView: UIActivityIndicatorView? { get set }
}

struct LoadingIndicatorModel: LoadingViewProtocol {
    
    var parent: UIViewController?
    var activityView: UIActivityIndicatorView?
    
    init(parent: UIViewController, activityView: UIActivityIndicatorView) {
        self.parent = parent
        self.activityView = activityView
    }
    
}
