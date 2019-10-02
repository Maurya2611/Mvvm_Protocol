//
//  NetworkManager.swift
//  NetworkLayer
//
//  Created by Chandresh on 30/9/19.
//  Copyright © 2019 Chandresh Maurya. All rights reserved.
//

import Foundation
import UIKit
enum NetworkResponse: String {
    case success
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Bad request"
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
}
enum Result<String> {
    case success
    case failure(String)
}
struct NetworkManager {
    static let environment: NetworkEnvironment = .production
    static let MovieAPIKey = ""
    let router = BaseNetworkRouter<ApplyProductApi>()
    func getApplyProductsWithData(completion: @escaping (_ dataModel: BaseDataModel?, _ error: String?) -> Void) {
        router.request(.getApplyProducts) { data, response, error in
            if error != nil {
                completion(nil, error?.localizedDescription)
            }
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        print(responseData)
                        let apiResponse = try BaseDataModel.init(data: responseData)
                        completion(apiResponse, nil)
                    } catch {
                        print(error)
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
    }
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
        switch response.statusCode {
        case 200...299: return .success
        case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
}
let imageCache = NSCache<NSString, AnyObject>()
extension UIImageView {
    func loadImageUsingCache(withUrl urlString: String) {
        if let url = URL(string: urlString) {
            DispatchQueue.main.async {
                self.image = nil
            }
            // check cached image
            if let cachedImage = imageCache.object(forKey: urlString as NSString) as? UIImage {
                DispatchQueue.main.async {
                    self.image = cachedImage
                }
                return
            }
            // if not, download image from url
            URLSession.shared.dataTask(with: url,
                                       completionHandler: { (data, _, error) in
                                        if error != nil {
                                            print(error!)
                                            return
                                        }
                                        DispatchQueue.main.async {
                                            if let image = UIImage(data: data!) {
                                                imageCache.setObject(image, forKey: urlString as NSString)
                                                self.image = image
                                            }
                                        }
            }).resume()
        }
    }
}
