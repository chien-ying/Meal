//
//  MealsViewModel.swift
//  Meal
//
//  Created by Catherine on 11/5/23.
//

import Foundation



class MealsViewModel: ObservableObject {
    
    @Published var phase = DataFetchPhase<[Meal]>.empty
    
    @Published var phase2 = DataFetchPhase<MealDetail>.empty


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
    
    func loadMealDetail(from idMeal: String) async {
        if Task.isCancelled { return }
        do {
            let mealDetail = try await mealsAPI.fetchMealDetail(idMeal: idMeal)
            if Task.isCancelled { return }
            if let mealDetail = mealDetail {
                DispatchQueue.main.async {
                    self.phase2 = .success(mealDetail[0])
                    print(self.phase2)
                }
                
            }
        } catch {
            if Task.isCancelled {return}
            DispatchQueue.main.async {
                self.phase2 = .failure(error)
            }
        }
    }
    
}
