//
//  GetCategoriesUseCase.swift
//  CleanArchitectureProducts
//
//  Created by Aya  on 21/08/2022.
//

import Foundation


struct GetCategoriesUseCase {
    var repo: CategoriesRepository
    
    func execute() async -> Result<[CategoryDomainModel], BaseError>{
        do{
            let categories = try await repo.getCategories()
            return .success(categories)
        } catch(let error) {
            
            switch(error) {
            case BaseError.decodingError:
                return .failure(.decodingError)
            default:
                return .failure(.networkError)
            }
        }
    }
}
