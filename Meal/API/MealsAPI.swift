//
//  MealsAPI.swift
//  Meal
//
//  Created by Catherine on 11/5/23.
//

import Foundation



struct MealsAPI {
    
    static let shared = MealsAPI()
    private init() {}
    
    func fetch<T: Codable>(fromURL: String) async throws -> T? {
        guard let url = URL(string: fromURL) else { throw NetworkError.badUrl }
            
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.badResponse
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.badStatus(httpResponse.statusCode)
        }
        
        do {
            let decodedResponse = try JSONDecoder().decode(T.self, from: data)
            return decodedResponse
        } catch {
            throw NetworkError.failedToDecodeResponse
        }
    }
    
    func fetchMeals(from category: String) async throws -> [Meal]? {
        do {
            let urlString: String = Constant.baseURL + "/filter.php?c=\(category)"
            guard let mealsData: MealsData = try await fetch(fromURL: urlString) else {return nil}
            return mealsData.meals
        } catch {
            throw error
        }
        
    }
    
    func fetchMealDetail(idMeal: String) async throws -> [MealDetail]? {
        do {
            let urlString: String = Constant.baseURL + "/lookup.php?i=\(idMeal)"
            guard let mealDetailData: MealDetailData = try await fetch(fromURL: urlString) else {return nil}
            return mealDetailData.meals
        } catch {
            throw error
        }
    }
    
    
}
