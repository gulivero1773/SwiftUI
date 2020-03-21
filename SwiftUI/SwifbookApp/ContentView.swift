//
//  ContentView.swift
//  SwifbookApp
//
//  Created by Алексей Пархоменко on 08.06.2019.
//  Copyright © 2019 Алексей Пархоменко. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    var categories: [String: [ProductsResponse]]{
        .init( grouping: materialResponse, by: { $0.category.rawValue})
    }
    
    
    var body: some View {
        NavigationView {
            List {
                Cell(user: swiftbook).listRowInsets(EdgeInsets())
               ForEach(categories.keys.sorted(), id: \.self) { key in
                ProductRow(categoryName: key, items: self.categories[key]!)
                } .listRowInsets(EdgeInsets())
                
                NavigationLink(destination: FriendsList()) {
                                              Text("Наши преподаватели")
                }
       
                
            }
            .navigationBarTitle(Text("Homepage"))
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
