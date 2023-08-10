//
//  NetworkService.swift
//  Meditation
//
//  Created by Лада on 30.05.2023.
//
//

import Foundation
import Alamofire

protocol INetworkService: AnyObject {
    func getCharacters(page: Int, completion: @escaping ([Character]) -> Void)
}

final class NetworkService: INetworkService {
    private let apiBase = "https://api.jamendo.com/v3.0/playlists/tracks/?id=500605176&client_id=f8343fff&format=jsonpretty&limit=all"

    func getCharacters(page: Int, completion: @escaping ([Character]) -> Void) {
        let request = AF.request(apiBase)

        request.responseDecodable(of: APIResponse<[Character]>.self) { dataResponse in
            let response: APIResponse<[Character]>? = dataResponse.value
            
            if let characters = response?.content {
                for character in characters {
                    print("Character ID: \(character.id)")
                    print("Name: \(character.name)")
                }
            }
            request.responseDecodable(of: APIResponse<[Character]>.self) { dataResponse in
                switch dataResponse.result {
                case .success(let response):
                    completion(response.content)
                case .failure(let error):
                    print("Error: \(error)")
                    completion([])
                }
            }

            completion(response?.content ?? [])
        }
    }
}
