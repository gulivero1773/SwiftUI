//
//  ProductRow.swift
//  SwifbookApp
//
//  Created by Mykola Buhaiov on 21.03.2020.
//

import SwiftUI

struct ProductRow: View {
    
    var categoryName: String
    var items: [ProductsResponse]
    
    var body: some View {
        VStack (alignment: .leading, spacing: 10.0) {
            Text(self.categoryName).font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView (.horizontal, showsIndicators: false){
                
                HStack (alignment: .center, spacing: 0) {
                    ForEach(self.items) { items in
                        ProductItem(object: items )
                    }
                }
                
                
                
            } .frame(height: 190)
        }
    }
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow(categoryName: materialResponse[0].category.rawValue, items: Array(materialResponse.prefix(3)))
    }
}
















