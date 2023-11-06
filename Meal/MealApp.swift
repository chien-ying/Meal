//
//  MealApp.swift
//  Meal
//
//  Created by Catherine on 11/4/23.
//

import SwiftUI

@main
struct MealApp: App {
    var category = "Dessert"
    var body: some Scene {
        WindowGroup {
            MealListView(category: self.category)
        }
    }
}
