//
//  RemoteImage.swift
//  Meal
//
//  Created by Catherine on 11/5/23.
//

import SwiftUI
import UIKit

struct RemoteImage: View {
    private enum LoadState {
        case loading, success, failure
    }

    private class Loader: ObservableObject {
        var data = Data()
        var state = LoadState.loading

        init(url: String) {
            
            guard let parsedURL = URL(string: url) else {
                fatalError("Invalid URL: \(url)")
            }

            URLSession.shared.dataTask(with: parsedURL) { data, response, error in
                
                if let data = data, data.count > 0 {
                    self.data = data
                    self.state = .success
                } else {
                    self.state = .failure
                }

                DispatchQueue.main.async {
                    self.objectWillChange.send()
                }
            
            }.resume()
        }
    }

    @StateObject private var loader: Loader
    var loading: Image
    var failure: Image
    var width: Float
    var height: Float
    var cornerRadius: Int

    var body: some View {
        selectImage()
            .resizable()
            .cornerRadius(CGFloat(self.cornerRadius))
            .frame(width: CGFloat(self.width), height: CGFloat(self.height))
    }

    init(url: String, loading: Image = Image(systemName: "photo"), failure: Image = Image(systemName: "photo"), width: Float, height: Float, cornerRadius: Int) {
        _loader = StateObject(wrappedValue: Loader(url: url))
        self.loading = loading
        self.failure = failure
        self.width = width
        self.height = height
        self.cornerRadius = cornerRadius
    }

    private func selectImage() -> Image {
        switch loader.state {
        case .loading:
            return loading
        case .failure:
            return failure
        default:
            if let image = UIImage(data: loader.data) {
                return Image(uiImage: image)
            } else {
                return failure
            }
        }
    }
}

#Preview {
    RemoteImage(url: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg", width: 100, height: 100, cornerRadius: 10)
}
