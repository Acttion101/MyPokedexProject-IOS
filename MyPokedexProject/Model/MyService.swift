//
//  MyService.swift
//  MyPokedexProject
//
//  Created by pongpon on 9/2/2564 BE.
//

import Foundation
import Moya

enum MyService {
    case getCard
    case postCard(user: [String: Any])
}

extension MyService:TargetType{
    var baseURL : URL {return URL(string:"https://run.mocky.io/v3/f9916417-f92e-478e-bfbc-c39e43f7c75b")!}
    
    
    var path: String {
        switch  self {
        case .getCard:
            return "/Card"
        case .postCard:
            return "/posts"
        }
        
    }
    
    var method: Moya.Method {
        switch self {
        case .getCard:
            return .get
        case .postCard:
            return .post
            
        }
    }
    
    var sampleData: Data {
        
        switch self {
        case .getCard:
            return "".data(using: .utf8)!
        case .postCard(let user):
            let response = "{\"id\": 1, \"name\": \"\(user["name"] ?? "")\", \"attacks\": \"\(user["attacks"] ?? "")\", , \"weaknesses\": \"\(user["weaknesses"] ?? 0)\"}"
            return Data(response.utf8)
        }
    }
    
    var task: Task {
        switch self {
        case .getCard: // Send no parameters
            return .requestPlain
        case let .postCard(user: user): // Always send parameters as JSON in request body
            let params = ["id": user["id"] ?? "",
                          "name": user["name"] ?? "",
                          "isSelected": user["isSelected"] ?? "",
                          "imageUrl": user["imageUrl"] ?? "",
                          "hp": user["hp"] ?? "",
                          "rarity": user["rarity"] ?? "",
                          "attacks": user["attacks"] ?? "",
                          "weaknesses": user["weaknesses"] ?? 0]
            return .requestParameters(parameters: params, encoding: JSONEncoding.default)
        }
    }
    var headers: [String: String]? {
        return ["Content-type": "run.mocky.io"]
    }
}





