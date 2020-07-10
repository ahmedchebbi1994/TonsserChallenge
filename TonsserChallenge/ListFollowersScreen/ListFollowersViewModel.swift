//
//  ListFollowersViewModel.swift
//  TonsserChallenge
//
//  Created by Ahmed CHEBBI on 10/07/2020.
//  Copyright © 2020 Tonsser. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay
struct ListFollowersViewModel {

    private let followersService : FollowersServiceProtocol
    private let resultsSubject = BehaviorRelay<[Follower]>(value: [])
    let followers : PublishSubject<[Follower]> = PublishSubject()

    
    init(followersService: FollowersServiceProtocol = ManagerService()) {
        self.followersService = followersService
    }
    
    public func fetchFollowersViewModels(nextPage: String = "") -> Observable<[Follower]> {
        return self.followersService.fetchFollowers(nextPage: nextPage).map { ($0.response ?? []) }
    }
}
