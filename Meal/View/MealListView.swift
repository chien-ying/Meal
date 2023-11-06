//
//  MealListView.swift
//  Meal
//
//  Created by Catherine on 11/5/23.
//

import SwiftUI

struct MealBlock: View {
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
    
    var body: some View {
        HStack(spacing: 20) {
            RemoteImage(url: self.strMealThumb, width: 60, height: 60, cornerRadius: 10).padding()
            Text("\(self.strMeal)")
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .frame(height: 80)
        .border(Color.black)
    }
    
}

struct MealListView: View {
    @StateObject var mealsVM = MealsViewModel()
    
//    var meals: [Meal] {
//        if case let .success(meals) = mealsVM.phase {
//            return meals
//        } else {
//            return []
//        }
//    }
    
//    @State var meals: [Meal] = []
    var category: String
    
    var body: some View {
        VStack(alignment: .center) {
            Text(self.category)
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(mealsVM.meals) { Meal in
                        MealBlock(idMeal: Meal.idMeal, strMeal: Meal.strMeal, strMealThumb: Meal.strMealThumb)
                    }
                }.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 28)
                .padding(.top, 20)
            }
        }.onAppear {
            Task {
//                await mealsVM.loadMeals(from:self.category)
                await mealsVM.fetchMeals(from: self.category)
//                await mealsVM.fetchMealDetail(from: "53049")
            }
        }
        
    }
    
}

