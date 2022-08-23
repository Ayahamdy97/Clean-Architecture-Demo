//
//  CategoriesAPIDataSourceImpl.swift
//  CleanArchitectureProducts
//
//  Created by Aya  on 21/08/2022.
//

import Foundation

enum APIServiceError: Error{
    case badUrl, requestError, decodingError, statusNotOK
}


struct CategoriesAPIDataSourceImpl: CategoriesDataSource {
    func getCategories() async throws -> [CategoriesDataModel] {
        
        guard let url = URL(string: "https://staging-api.kuzlo.net/retailer_app/v1/product_categories?page=-1") else {
            throw APIServiceError.badUrl
        }
        
        guard let (data, response) = try? await URLSession.shared.data(from: url) else{
            throw APIServiceError.requestError
        }
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIServiceError.statusNotOK
        }
        // retrieving to data model
        guard let result = try? JSONDecoder().decode(CategoriesResponse.self, from: data) else {
            throw APIServiceError.decodingError
        }
        //  map to domain model
        return result.productCategories
    }
    
    
}
