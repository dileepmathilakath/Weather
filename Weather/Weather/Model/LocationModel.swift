//
//  LocationModel.swift
//  Weather
//
//  Created by Dileep M on 06/06/21.
//

import Foundation

struct Location {
    let distance: Int
    let woeid: Int
    let coordinates: String
    let title: String
    let type: String
}

extension Location: Decodable {
    
    enum LocationCodingKeys: String, CodingKey {
        case distance
        case woeid
        case type = "location_type"
        case title
        case coordinates = "latt_long"
    }
    
    init(from decoder: Decoder) throws {
        let locationContainer = try decoder.container(keyedBy: LocationCodingKeys.self)
        distance = try locationContainer.decode(Int.self, forKey: .distance)
        woeid = try locationContainer.decode(Int.self, forKey: .woeid)
        coordinates = try locationContainer.decode(String.self, forKey: .coordinates)
        title = try locationContainer.decode(String.self, forKey: .title)
        type = try locationContainer.decode(String.self, forKey: .type)
    }
}
