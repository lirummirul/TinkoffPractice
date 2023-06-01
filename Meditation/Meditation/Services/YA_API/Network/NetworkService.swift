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
//https://api.jamendo.com/v3.0/playlists/tracks/?client_id=your_client_id&format=jsonpretty&limit=2&name=Instrumental&track_type=albumtrack

    func getCharacters(page: Int, completion: @escaping ([Character]) -> Void) {
//        let params: [String: Any] = ["page": page] // здесь можно задавать любые query string параметры
        let request = AF.request(apiBase)
//                                 + "character", parameters: params)
        

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
