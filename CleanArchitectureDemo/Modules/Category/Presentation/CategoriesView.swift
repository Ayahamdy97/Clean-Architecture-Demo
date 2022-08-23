//
//  CategoriesView.swift
//  CleanArchitectureProducts
//
//  Created by Aya  on 21/08/2022.
//

import SwiftUI

struct CategoriesView: View {
    @StateObject var vm = CategoriesViewModel()
    var body: some View {
        List {
            ForEach(vm.categories, id: \.categoryID){ item in
                Text(item.name)
            }
        }
        .task {
            await vm.getCategories()
        }
    }
    
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}

