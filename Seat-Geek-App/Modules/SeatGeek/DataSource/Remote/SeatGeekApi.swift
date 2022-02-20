//
//  SeatGeekApi.swift
//  Seat-Geek-App
//
//  Created by abdallah ragab on 19/02/2022.
//

import Moya

enum SeatGeekApi {
    case getSeatGeek(searchTxt:String)
}

extension SeatGeekApi: TargetType {
    var baseURL: URL {
        return URL(string: APISetting.baseURL)!
    }
    
    var path: String {
        switch self {
        case .getSeatGeek:
            return EndPoints.SeatGeekAPI.GET_SEAT_GEEK
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getSeatGeek:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getSeatGeek(let searchTxt):
            let params: [String: Any] = ["client_id": "MjU3MDY2NDR8MTY0NDc0OTkyMy45MzIzMzY4" , "q": searchTxt]
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String: String]? {
        return [:]
    }
}
