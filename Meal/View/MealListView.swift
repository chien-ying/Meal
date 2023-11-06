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
    var category: String
    
    var body: some View {
        VStack(alignment: .center) {
            switch mealsVM.phase {
            case .empty:
                ProgressView("Loading")
            case .success(let meals):
                Text(self.category)
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(meals) { Meal in
                            MealBlock(idMeal: Meal.idMeal, strMeal: Meal.strMeal, strMealThumb: Meal.strMealThumb)
                        }
                    }.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 28)
                    .padding(.top, 20)
                }
            case .failure(let error):
                Text(self.category)
                Text(error.localizedDescription)
            }
        }
        .onAppear {
            Task {
                await mealsVM.loadMeals(from:self.category)
//                await mealsVM.loadMealDetail(from: "53049")
            }
        }
        
    }
    
    
    
}

