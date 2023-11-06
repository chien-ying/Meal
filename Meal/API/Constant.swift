//
//  Constant.swift
//  Meal
//
//  Created by Catherine on 11/5/23.
//

import Foundation

struct Constant {
    static let baseURL: String = "https://themealdb.com/api/json/v1/1"
}

enum DataFetchPhase<T> {
    case empty
    case success(T)
    case failure(Error)
}


enum NetworkError: Error {
    case badUrl
    case badResponse
    case badStatus(Int)
    case failedToDecodeResponse
    case other(Error)
}
