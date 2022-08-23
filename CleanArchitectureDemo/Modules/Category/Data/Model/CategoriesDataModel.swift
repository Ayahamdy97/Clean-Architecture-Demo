//
//  CategoriesDataModel.swift
//  CleanArchitectureProducts
//
//  Created by Aya  on 23/08/2022.
//

import Foundation

struct CategoriesDataModel: Codable {
    
    private enum CodingKeys: String, CodingKey {
        case categoryID = "id"
        case name = "name"
    }

    let categoryID: Int
    let name: String

}
