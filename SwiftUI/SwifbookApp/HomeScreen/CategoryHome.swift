//
//  CategoryHome.swift
//  SwiftUIFirstDemo
//
//  Created by Алексей Пархоменко on 05.06.2019.
//  Copyright © 2019 Алексей Пархоменко. All rights reserved.
//

import SwiftUI

struct CategoryHome: View {
    
    var categories: [String: [ProductsResponse]] {
        .init(
            grouping: materialResponse,
            by: { $0.category.rawValue }
        )
    }
    
    var body: some View {
        NavigationView {
            
            List {
                Cell(user: swiftbook)
                    .listRowInsets(EdgeInsets())
                ForEach(self.categories.keys.sorted(), id: \.self) { key in
                    
                     CategoryRow(categoryName: key, items: self.categories[key]!)
                    }
                    .listRowInsets(EdgeInsets())
                NavigationLink(destination: FriendsList()) {
                    Text("Наши преподаватели")
                    }
                }
                .navigationBarTitle(Text("Homepage"))
                
        }
    }
}


struct CategoryHome_Previews : PreviewProvider {
    static var previews: some View {
        CategoryHome()
    }
}

