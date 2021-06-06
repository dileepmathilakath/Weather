//
//  LocationEndPoint.swift
//  Weather
//
//  Created by Dileep M on 06/06/21.
//

import Foundation

public enum LocationAPI {
    case coordinatesSearch(_ lat:String,_ long: String)
    case keywordSearch(_ keyword: String)
}

extension LocationAPI: EndPointType {

    var path: String {
//        switch self {
//        case .coordinatesSearch(let lat, let long):
//            return "location/search/?lattlong=\(lat),\(long)"
//        case .keywordSearch(let keyword):
//            return "location/search/?query=\(keyword))"
//        }
        "location/search"
    }
    
    var httpMethod: HTTPMethod {
        .get
    }
    
    var task: HTTPTask {
        var urlParameters: Parameters?
        switch self {
        case .coordinatesSearch(let lat, let long):
            urlParameters = ["lattlong" : "\(lat),\(long)"]
        case .keywordSearch(let keyword):
            urlParameters = ["query" : "\(keyword)"]
        }
        return .requestParameters(bodyParameters: nil,
                                  bodyEncoding: .urlEncoding,
                                  urlParameters: urlParameters)
    }
    
    var headers: HTTPHeaders? {
        nil
    }
}
