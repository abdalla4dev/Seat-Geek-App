//
//  ApiSetting.swift
//  Seat-Geek-App
//
//  Created by abdallah ragab on 19/02/2022.
//


import Alamofire
import Foundation
import Moya


enum EnvironmentVariables: String {
    case baseUrl = "BASE_URL"
}

enum APISetting {
    static var baseURL: String {
        getStringValueFromDict(key: .baseUrl)
    }
    
}


private func getStringValueFromDict(key: EnvironmentVariables) -> String{
    return Bundle.main.infoDictionary?[key.rawValue] as? String ?? ""
}


func JSONResponseDataFormatter(_ data: Data) -> String {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData = try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return String(data: prettyData, encoding: .utf8) ?? String(data: data, encoding: .utf8) ?? ""
    } catch {
        return String(data: data, encoding: .utf8) ?? ""
    }
}
