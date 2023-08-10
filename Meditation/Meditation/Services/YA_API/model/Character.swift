//
//  Character.swift
//  Meditation
//
//  Created by Лада on 31.05.2023.
//

import Foundation

struct Character: Decodable {
    let id: String
    let name: String
    let creationdate: String
    let userId: String
    let userName: String
    let zip: String
    let tracks: [Tracks]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case creationdate
        case userId = "user_id"
        case userName = "user_name"
        case zip
        case tracks
    }
    
    struct Tracks: Decodable {
        let id: String
        let name: String
        let albumId: String
        let artistId: String
        let duration: String
        let artistName: String
        let playlistadddate: String
        let position: String
        let licenseCcurl: String
        let albumImage: String
        let image: String
        let audio: String
        let audiodownload: String
        let audiodownloadAllowed: Bool
        
        enum CodingKeys: String, CodingKey {
            case id
            case name
            case albumId = "album_id"
            case artistId = "artist_id"
            case duration
            case artistName = "artist_name"
            case playlistadddate
            case position
            case licenseCcurl = "license_ccurl"
            case albumImage = "album_image"
            case image
            case audio
            case audiodownload
            case audiodownloadAllowed = "audiodownload_allowed"
        }
    }
}
