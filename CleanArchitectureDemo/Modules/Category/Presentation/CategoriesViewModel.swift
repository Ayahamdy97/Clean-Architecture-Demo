//
//  CategoriesViewModel.swift
//  CleanArchitectureProducts
//
//  Created by Aya  on 21/08/2022.
//

import Foundation
@MainActor

class CategoriesViewModel: ObservableObject {
    var getCategorieUseCase = GetCategoriesUseCase(repo: CategoriesRepositoryImpl(dataSource: CategoriesAPIDataSourceImpl()))
    @Published var categories: [CategoryDomainModel] = []
    @Published var errorMessage = ""
    @Published var hasError = false

    func getCategories() async {
        errorMessage = ""
        let result = await getCategorieUseCase.execute()
        switch result{
        case .success(let categories):
            self.categories = categories
        case .failure(let error):
            self.categories = []
            errorMessage = error.localizedDescription
            print(error.localizedDescription)
            hasError = true
        }
    }
}
