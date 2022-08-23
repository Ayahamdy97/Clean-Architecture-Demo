//
//  CategoriesDataModel.swift
//  CleanArchitectureProducts
//
//  Created by Aya  on 23/08/2022.
//

import Foundation

struct CategoriesResponse: Codable {
    private enum CodingKeys: String, CodingKey {
        case success = "success"
        case productCategories = "product_categories"
    }
    let success: Bool
    let productCategories: [CategoriesDataModel]
}

