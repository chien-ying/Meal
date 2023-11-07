//
//  MealDetailView.swift
//  Meal
//
//  Created by Catherine on 11/6/23.
//

import SwiftUI

struct MealDetailView: View {
    
    @StateObject var mealDetailVM = MealDetailViewModel()

    let idMeal: String
    let mealName: String
    let strMealThumb: String
    
    var body: some View {
        ZStack(alignment: .center) {
            switch mealDetailVM.phase {
            case .success(let mealDetail):
                ScrollView {
                    VStack(alignment: .center, spacing: 12) {
                        RemoteImage(url: self.strMealThumb, width: 400, height: 300, cornerRadius: 10).padding()
                        if let ingredientsMap = mealDetailVM.ingredientsMap {
                            Text("Ingredients & Measurements").bold()
                            ForEach(ingredientsMap, id: \.self) { im in
                                HStack {
                                    Text(im[0])
                                    Spacer()
                                    Text(im[1])
                                }
                            }
                        }
                        Text("Instructions").bold()
                        Text(mealDetail.strInstructions)
                    }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        .padding(.horizontal, 28)
                }
            case .failure(let error):
                Text(error.localizedDescription)
            case .empty:
                ProgressView("Loading")
            }
        }
        .navigationTitle(self.mealName)
        .task{
            await mealDetailVM.loadMealDetail(from: idMeal)
        }
    }
}

