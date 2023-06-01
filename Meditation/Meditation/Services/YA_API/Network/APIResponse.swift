//
//  APIResponse.swift
//  Meditation
//
//  Created by Лада on 31.05.2023.
//

import Foundation
import Alamofire

struct APIResponse<ContentModel: Decodable>: Decodable {
    let headers: APIInfo
    let content: ContentModel
    
    enum CodingKeys: String, CodingKey {
        case headers
        case content = "results"
    }
}

struct APIInfo: Decodable {
    let status: String
    let code: Int
    let errorMessage: String?
    let warnings: String?
    let resultsCount: Int
    
    enum CodingKeys: String, CodingKey {
        case status
        case code
        case errorMessage = "error_message"
        case warnings
        case resultsCount = "results_count"
    }
}
