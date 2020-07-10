//
//  ManagerService.swift
//  TonsserChallenge
//
//  Created by Ahmed CHEBBI on 10/07/2020.
//  Copyright © 2020 Tonsser. All rights reserved.
//

import UIKit
import RxSwift

public protocol FollowersServiceProtocol {
    func fetchFellowers() -> Observable<ResponseFollowers>
}

public class ManagerService: ApiService, FollowersServiceProtocol {
    
    public override init() {
        super.init()
    }
    
    public func fetchFellowers() -> Observable<ResponseFollowers>{
        
        return Observable.create { (observer) -> Disposable in
            let request = self.configureRequest(url: URL(string: "\(ApiService.Path.BaseUrl.path.rawValue)/\(ApiService.Path.BaseUrl.subPath.rawValue)")!, requestType: .get)
            
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
