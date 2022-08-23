//
//  CategoriesRepositoryImpl.swift
//  CleanArchitectureProducts
//
//  Created by Aya  on 21/08/2022.
//

import Foundation

struct CategoriesRepositoryImpl: CategoriesRepository {
    var dataSource: CategoriesDataSource
    
    func getCategories() async throws -> [CategoryDomainModel] {
        let _categories =  try await dataSource.getCategories().map{
            CategoryDomainModel(categoryID: $0.categoryID, name: $0.name)
          }
        return _categories
    }
    
    
}
