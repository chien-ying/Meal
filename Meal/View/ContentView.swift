//
//  ContentView.swift
//  Meal
//
//  Created by Catherine on 11/6/23.
//

import SwiftUI

struct ContentView: View {
    let category: String = "Dessert"
    var body: some View {
        NavigationView{
            MealListView(category: self.category)
        }
    }
}
