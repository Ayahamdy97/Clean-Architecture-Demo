//
//  ProductsRepository.swift
//  CleanArchitectureProducts
//
//  Created by Aya  on 21/08/2022.
//

import Foundation
protocol CategoriesRepository {
    func getCategories() async throws -> [CategoryDomainModel]
}
