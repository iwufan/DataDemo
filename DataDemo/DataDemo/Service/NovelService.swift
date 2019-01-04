//
//  NovelService.swift
//  DataDemo
//
//  Created by 贾大伟 on 2019/1/4.
//  Copyright © 2019 david. All rights reserved.
//

import Foundation
import Moya
import SwiftyJSON

private let novelProvider = MoyaProvider<NovelService>()

enum NovelService {
    
    case novelList
}

extension NovelService: TargetType {
    var baseURL: URL {
        return URL(string: "https://www.apiopen.top")!
    }
    
    var path: String {
        switch self {
        case .novelList:
            return "novelApi"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .novelList:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .novelList:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}

extension NovelService {
    
    static func request(_ target: NovelService, success: @escaping ([String: Any]) -> Void, failure: ((MoyaError) -> Void)? = nil) {
        
        novelProvider.request(target) { (result) in
            switch result {
            case let .success(response):
                do {
                    let data = try response.mapJSON()
                    let json = JSON(data)
                    let jsonData:Data = json.rawString()!.data(using: .utf8)!
                    
                    let dict = try JSONSerialization.jsonObject(with: jsonData,
                                                                options: .mutableContainers) as! Dictionary<String, Any>
                    if dict["code"] as! Int == 200  {
                        
                        success(dict)
                    } else {
                        HUD.showFailure(dict["msg"] as! String)
                    }
                } catch {
                    HUD.showFailure("请求失败")
                }
            case let .failure(error):
                
                if let failure = failure {
                    failure(error)
                }
                print(error.localizedDescription)
            }
        }
    }
}
