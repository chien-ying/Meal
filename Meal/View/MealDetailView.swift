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
    
    @State var loading: Bool = true
    @State var error: Bool = false
    @State var errMsg: String? = nil
    
    @State var mealDetail: MealDetail? = nil
    @State var ingredientsMap: [[String]]? = nil
    
    var body: some View {
        ZStack(alignment: .center) {
            if loading{
                ProgressView("Loading")
            } else if error {
                Text(errMsg ?? "Error!")
            } else {
                ScrollView {
                    VStack(alignment: .center, spacing: 12) {
                        RemoteImage(url: self.strMealThumb, width: 400, height: 300, cornerRadius: 10).padding()
                        if let ingredientsMap = ingredientsMap {
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
                        Text(self.mealDetail?.strInstructions ?? "")
                    }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                    .padding(.horizontal, 28)
                }
            }
        }
        .navigationTitle(self.mealName)
        .task{
            await mealDetailVM.loadMealDetail(from: idMeal)
            switch mealDetailVM.phase {
            case .success(let mealDetail):
                self.mealDetail = mealDetail
                self.ingredientsMap = mealDetailVM.createIngredientsMap(mealDetail)
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

