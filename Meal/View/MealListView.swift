//
//  MealListView.swift
//  Meal
//
//  Created by Catherine on 11/5/23.
//

import SwiftUI

struct MealBlock: View {
    let idMeal: Int
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
    @State var meals: [Meal] = []
    var category: String
    
    var body: some View {
        VStack(alignment: .center) {
            
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
        }.onAppear {
            meals = [
                Meal(id: 0, idMeal: 53049, strMeal: "Apam balik", strCategory: self.category, strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg"),
                Meal(id: 1, idMeal: 53049, strMeal: "balik", strCategory: self.category, strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg"),
                Meal(id: 2, idMeal: 53049, strMeal: "Apam balik", strCategory: self.category, strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg"),
            ]
        }
    }
    
}

#Preview {
    MealListView(meals: [
        Meal(id: 0, idMeal: 53049, strMeal: "Apam balik", strCategory: "Dessert", strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg"),
        Meal(id: 0, idMeal: 53049, strMeal: "Apam balik", strCategory: "Dessert", strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg"),
        Meal(id: 0, idMeal: 53049, strMeal: "Apam balik", strCategory: "Dessert", strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg"),
        Meal(id: 0, idMeal: 53049, strMeal: "Apam balik", strCategory: "Dessert", strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg"),
        Meal(id: 0, idMeal: 53049, strMeal: "Apam balik", strCategory: "Dessert", strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg"),
        Meal(id: 0, idMeal: 53049, strMeal: "Apam balik", strCategory: "Dessert", strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg"),
        Meal(id: 0, idMeal: 53049, strMeal: "Apam balik", strCategory: "Dessert", strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg"),
        Meal(id: 0, idMeal: 53049, strMeal: "Apam balik", strCategory: "Dessert", strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg"),
        Meal(id: 0, idMeal: 53049, strMeal: "Apam balik", strCategory: "Dessert", strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg"),
        Meal(id: 0, idMeal: 53049, strMeal: "Apam balik", strCategory: "Dessert", strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg")
    ], category: "Dessert")
}
