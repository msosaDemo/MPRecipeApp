//
//  Observable.swift
//  MPRecipe
//
//  Created by Mauricio Pimienta on 10/7/24.
//

import Foundation

class Observable<T> {
    
    // MARK: Variables
    private var listener: ((T?) -> Void)?
    var value: T? {
        didSet {
            DispatchQueue.main.async {
                self.listener?(self.value)
            }
        }
    }
    
    // MARK: Init
    init (_ value: T?) {
        self.value = value
    }
    
    // MARK: External
    func bind(_ listener: @escaping ((T?) -> Void)) {
        listener(value)
        self.listener = listener
    }
    
}
