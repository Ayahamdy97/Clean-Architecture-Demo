//
//  CategoriesDataSource.swift
//  CleanArchitectureProducts
//
//  Created by Aya  on 21/08/2022.
//

import Foundation

protocol CategoriesDataSource{
    func getCategories() async throws -> [CategoriesDataModel]
}
