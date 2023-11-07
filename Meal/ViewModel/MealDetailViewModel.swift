//
//  MealDetailViewModel.swift
//  Meal
//
//  Created by Catherine on 11/6/23.
//

import Foundation


class MealDetailViewModel: ObservableObject {
    
    @Published var phase = DataFetchPhase<MealDetail>.empty
    
    private let mealsAPI = MealsAPI.shared
    
    func loadMealDetail(from idMeal: String) async {
        if Task.isCancelled { return }
        do {
            let mealDetail = try await mealsAPI.fetchMealDetail(idMeal: idMeal)
            if Task.isCancelled { return }
            if let mealDetail = mealDetail {
                DispatchQueue.main.async {
                    self.phase = .success(mealDetail[0])
                }
            }
        } catch {
            if Task.isCancelled {return}
            DispatchQueue.main.async {
                self.phase = .failure(error)
            }
        }
    }
    
    func createIngredientsMap(_ mealDetail: MealDetail) -> [[String]] {
        let ingredients = [
            mealDetail.strIngredient1, mealDetail.strIngredient2, mealDetail.strIngredient3, mealDetail.strIngredient4,
            mealDetail.strIngredient5, mealDetail.strIngredient6, mealDetail.strIngredient7, mealDetail.strIngredient8,
            mealDetail.strIngredient9, mealDetail.strIngredient10, mealDetail.strIngredient11, mealDetail.strIngredient12,
            mealDetail.strIngredient13, mealDetail.strIngredient14, mealDetail.strIngredient15, mealDetail.strIngredient16,
            mealDetail.strIngredient17, mealDetail.strIngredient18, mealDetail.strIngredient19, mealDetail.strIngredient20
        ]
        let measures =  [
            mealDetail.strMeasure1, mealDetail.strMeasure2, mealDetail.strMeasure3, mealDetail.strMeasure4,
            mealDetail.strMeasure5, mealDetail.strMeasure6, mealDetail.strMeasure7, mealDetail.strMeasure8,
            mealDetail.strMeasure9, mealDetail.strMeasure10, mealDetail.strMeasure11, mealDetail.strMeasure12,
            mealDetail.strMeasure13, mealDetail.strMeasure14, mealDetail.strMeasure15, mealDetail.strMeasure16,
            mealDetail.strMeasure17, mealDetail.strMeasure18, mealDetail.strMeasure19, mealDetail.strMeasure20
        ]
        
        var ingredientsMap = [[String]]()
        for (ingredient, measure) in zip(ingredients, measures) {
            if let ingredient = ingredient, let measure = measure, !ingredient.isEmpty, !measure.isEmpty {
                ingredientsMap.append([ingredient, measure])
            }
        }
        return ingredientsMap
    }

}
