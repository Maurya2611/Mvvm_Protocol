//
//  BaseURLWithRouterType.swift
//  MVVM-Example
//
//  Created by Chandresh on 30/9/19.
//  Copyright © 2019 Ivan Magda. All rights reserved.
//

import Foundation
enum NetworkEnvironment {
    case production
    case staging
}
public enum ApplyProductApi {
    case getApplyProducts
}
extension ApplyProductApi: NetworkRouterType {
    var environmentBaseURL: String {
        switch NetworkManager.environment {
        case .production: return "https://s3-ap-southeast-1.amazonaws.com/"
        case .staging: return "https://s3-ap-southeast-1.amazonaws.com/"
        }
    }
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    var path: String {
       return "mightieruob/applyProductsMightier.json"
    }
    var httpMethod: HTTPMethod {
        return .get
    }
    var task: HTTPTask {
        switch self {
        case .getApplyProducts:
            return .requestParameters(bodyParameters: nil,
                                      bodyEncoding: .urlEncoding,
                                      urlParameters: nil)
        }
    }
    var headers: HTTPHeaders? {
        return nil
    }
}
