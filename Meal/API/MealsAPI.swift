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
//    private let session = URLSession.shared
    
    
//    func fetch(from category: String) async throws -> [Meal] {
//        try await fetchMeals(from: generateMealsURL(from: category))
//    }
    
    func fetch<T: Codable>(fromURL: String) async -> T? {
        do {
            guard let url = URL(string: fromURL) else { throw NetworkError.badUrl }
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let response = response as? HTTPURLResponse else { throw NetworkError.badResponse }
            guard response.statusCode >= 200 && response.statusCode < 300 else { throw NetworkError.badStatus }
            guard let decodedResponse = try? JSONDecoder().decode(T.self, from: data) else { throw NetworkError.failedToDecodeResponse }
//            print(decodedResponse)
            return decodedResponse
        } 
        
        catch NetworkError.badUrl {
            print("There was an error creating the URL")
        } catch NetworkError.badResponse {
            print("Did not get a valid response")
        } catch NetworkError.badStatus {
            print("Did not get a 2xx status code from the response")
        } catch NetworkError.failedToDecodeResponse {
            print("Failed to decode response into the given type")
        } catch {
            print("An error occured downloading the data")
        }
        return nil
    }
    
    func fetchMeals(from category: String) async -> [Meal]? {
        let urlString: String = Constant.baseURL + "/filter.php?c=\(category)"
        guard let mealsData: MealsData = await fetch(fromURL: urlString) else {return nil}
        return mealsData.meals
    }
    
    func fetchMealDetail(idMeal: String) async -> [MealDetail]? {
        let urlString: String = Constant.baseURL + "/lookup.php?i=\(idMeal)"
        guard let mealDetailData: MealDetailData = await fetch(fromURL: urlString) else {return nil}
        return mealDetailData.meals
    }
    
    
//    private func fetchMeals(from url: URL) async throws -> [Meal] {
//        let (data, response) = try await session.data(from: url)
//        
//        guard let response = response as? HTTPURLResponse else {
//            throw generateError(description: "Bad Response")
//        }
//        
//        switch response.statusCode {
//            
//        case (200...299), (400...499):
//            let apiResponse = try JSONDecoder().decode(MealsData.self, from: data)
//            if apiResponse.meals.count > 0 {
//                return apiResponse.meals
//            } else {
//                throw generateError(description: "Server error")
//            }
//        default:
//            throw generateError(description: "Server error")
//            
//        }
//    }
//    
//    private func generateError(code: Int = 1, description: String) -> Error {
//        NSError(domain: "MealsAPI", code: code, userInfo: [NSLocalizedDescriptionKey: description])
//    }
//    
//    private func generateMealsURL(from category: String) -> URL {
//        var url = "https://themealdb.com/api/json/v1/1/filter.php"
//        url += "?c=\(category)"
//        return URL(string: url)!
//    }
    
    
}
