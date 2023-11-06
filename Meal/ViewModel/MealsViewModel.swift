//
//  MealsViewModel.swift
//  Meal
//
//  Created by Catherine on 11/5/23.
//

import Foundation


//enum DataFetchPhase<T> {
//    case empty
//    case success(T)
//    case failure(Error)
//}

class MealsViewModel: ObservableObject {
    
//    @Published var phase = DataFetchPhase<[Meal]>.empty
    @Published var meals: [Meal] = []

    private let mealsAPI = MealsAPI.shared
    
//    init(meals: [Meal]? = nil) {
//        if let meals = meals {
//            self.phase = .success(meals)
//        } else {
//            self.phase = .empty
//        }
//    }
    
//    func loadMeals(from category: String) async {
//        if Task.isCancelled { return }
//        do {
//            let meals = try await mealsAPI.fetch(from: category)
//            if Task.isCancelled { return }
//            DispatchQueue.main.async {
//                self.phase = .success(meals)
//            }
//            
//        } catch {
//            if Task.isCancelled { return }
//            print(error.localizedDescription)
//            DispatchQueue.main.async {
//                self.phase = .failure(error)
//            }
//        }
//    }
    

    func fetchMeals(from category: String) async {
//        guard let mealsData: MealsData = await mealsAPI.fetch(fromURL: "https://themealdb.com/api/json/v1/1/filter.php?c=\(category)") else {return}
//        DispatchQueue.main.async {
//            self.meals = mealsData.meals
//        }
        
        let meals = await mealsAPI.fetchMeals(from: category)
        if let meals = meals {
            DispatchQueue.main.async {
                self.meals = meals
            }
        }
    }
    
    func fetchMealDetail(from idMeal: String) async {
//        guard let mealDetailData: MealDetailData = await mealsAPI.fetch(fromURL: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(idMeal)") else {return}
        
        let mealDetail = await mealsAPI.fetchMealDetail(idMeal: idMeal)
        if let mealDetail = mealDetail {
            print(mealDetail[0].strInstructions)
        }
    }
}
