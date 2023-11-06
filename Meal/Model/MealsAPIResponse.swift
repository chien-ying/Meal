//
//  MealsAPIResponse.swift
//  Meal
//
//  Created by Catherine on 11/5/23.
//

import Foundation

struct MealsData: Codable {
    let meals: [Meal]
}

struct MealDetailData: Codable {
    let meals: [MealDetail]
}

