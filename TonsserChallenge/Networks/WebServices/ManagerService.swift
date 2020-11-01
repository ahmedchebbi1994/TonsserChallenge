//
//  ManagerService.swift
//  TonsserChallenge
//
//  Created by Ahmed CHEBBI on 10/07/2020.
//  Copyright © 2020 Tonsser. All rights reserved.
//

import UIKit
import RxSwift

protocol FollowersServiceProtocol {
    func fetchFollowers(nextPage: String) -> Observable<ResponseFollowers>
}

class ManagerService: ApiService, FollowersServiceProtocol {
    
    override init() {
        super.init()
    }
    
    func fetchFollowers(nextPage: String = "") -> Observable<ResponseFollowers>{
        
        return Observable.create { (observer) -> Disposable in
            var urlStr: String = ""
            if nextPage.isEmpty {
                urlStr = "\(ApiService.Path.BaseUrl.path.rawValue)/\(ApiService.Path.BaseUrl.subPath.rawValue)"
            } else {
                urlStr = "\(ApiService.Path.BaseUrl.path.rawValue)/\(ApiService.Path.BaseUrl.subPath.rawValue)?\(ApiService.Path.params.currentFollowSlug.rawValue)=\(nextPage)"
            }
            let request = self.configureRequest(url: URL(string: urlStr)!, requestType: .get)
            
            let task = URLSession.shared.dataTask(with: request) { data, response , error in
                if let httpResponse = response as? HTTPURLResponse {
                    let decoder = JSONDecoder()
                    guard let data = data, httpResponse.statusCode == 200, let response = try? decoder.decode(ResponseFollowers.self, from: data) else {
                        observer.onError(NSError(domain: "", code: 500, userInfo: nil))
                        return
                    }
                    observer.onNext(response)
                }
            }
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
}
