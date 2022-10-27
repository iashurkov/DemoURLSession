//
//  TrackModels.swift
//  DemoURLSession
//
//  Created by iashurkov on 27.10.2022.
//

import Foundation

struct TrackModels: Codable {
    var result: [TrackModel]
    
    enum CodingKeys: String, CodingKey {
        case result
    }
}

struct TrackModel: Codable, Equatable {
    let id: String?
    let name: String?
    let url: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, url
    }
}
