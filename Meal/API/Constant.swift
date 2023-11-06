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


enum NetworkError: Error {
    case badUrl
    case invalidRequest
    case badResponse
    case badStatus
    case failedToDecodeResponse
}

struct NetworkErrorMsg {
    let badUrl:String = "There was an error creating the URL"
    let invalidRequest: String = "Did not get a valid request"
    let invalidResponse: String = "Did not get a valid response"
    let badStatus: String = "Did not get a 2xx status code from the response"
    let failedToDecodeResponse: String = "Failed to decode response into the given type"
}
