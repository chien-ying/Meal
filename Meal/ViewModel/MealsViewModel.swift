//
//  MealsViewModel.swift
//  Meal
//
//  Created by Catherine on 11/5/23.
//

import Foundation



class MealsViewModel: ObservableObject {
    
    @Published var phase = DataFetchPhase<[Meal]>.empty
    
    private let mealsAPI = MealsAPI.shared
    
    func loadMeals(from category: String) async {
        if Task.isCancelled { return }
        do {
            let meals = try await mealsAPI.fetchMeals(from: category)
            if Task.isCancelled { return }
            if let meals = meals {
                DispatchQueue.main.async {
                    self.phase = .success(meals)
                }
            }
        } catch {
            if Task.isCancelled { return }
            DispatchQueue.main.async {
                self.phase = .failure(error)
            }
        }
    }
    
    func sortMealsAlphabetically(_ meals: [Meal]) -> [Meal] {
        return meals.sorted { $0.strMeal < $1.strMeal }
    }
    
}
