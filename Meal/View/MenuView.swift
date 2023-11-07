//
//  MenuView.swift
//  Meal
//
//  Created by Catherine on 11/7/23.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        List{
            ForEach(Category().items, id: \.self) { category in
                NavigationLink(destination: MealListView(category: category)){
                    Text(category)
                }
            }
        }.navigationTitle("Category")
    }
}

#Preview {
    MenuView()
}
