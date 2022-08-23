//
//  GetCategoriesUseCase.swift
//  CleanArchitectureProducts
//
//  Created by Aya  on 21/08/2022.
//

import Foundation
enum UseCaseError: Error{
    case networkError, decodingError
}

struct GetCategoriesUseCase {
    var repo: CategoriesRepository
    
    func execute() async -> Result<[CategoryDomainModel], UseCaseError>{
        do{
            let categories = try await repo.getCategories()
            return .success(categories)
        } catch(let error) {
            
            switch(error) {
            case UseCaseError.decodingError:
                return .failure(.decodingError)
            default:
                return .failure(.networkError)
            }
        }
    }
}
