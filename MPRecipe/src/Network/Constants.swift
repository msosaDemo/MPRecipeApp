//
//  Endpoints.swift
//  MPRecipe
//
//  Created by Mauricio Pimienta on 10/7/24.
//

import Foundation

enum Endpoints {
    
    enum NetworkUrl: String {
        case Recipes = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"
        case Malformed = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json"
        case Empty = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json"
    }
    
}
