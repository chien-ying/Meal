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
        NavigationLink(destination: MealDetailView(idMeal: idMeal, mealName: strMeal, strMealThumb: strMealThumb)) {
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
}

struct MealListView: View {
    
    @StateObject var mealsVM = MealsViewModel()
    
    let category: String
    
    @State var loading: Bool = true
    @State var error: Bool = false
    @State var errMsg: String? = nil
    
    @State var meals: [Meal]? = nil
    
    var body: some View {
        ZStack(alignment: .center) {
            if (loading) {
                ProgressView("Loading")
            } else if (error) {
                Text(errMsg ?? "Error!")
            }
            else {
                ScrollView {
                    VStack(spacing: 16) {
                        if let meals = meals {
                            ForEach(meals) { Meal in
                                MealBlock(idMeal: Meal.idMeal, strMeal: Meal.strMeal, strMealThumb: Meal.strMealThumb)
                            }
                        }
                    }.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 28)
                }
            }
        }
        .navigationTitle(self.category)
        .task{
            await mealsVM.loadMeals(from:self.category)
            switch mealsVM.phase {
            case .success(let meals):
                self.meals = mealsVM.sortMealsAlphabetically(meals)
                self.loading = false
            case .failure(let error):
                self.error = true
                self.errMsg = error.localizedDescription
            case .empty:
                self.loading = true
            }
        }
        
    }
    
    
}

