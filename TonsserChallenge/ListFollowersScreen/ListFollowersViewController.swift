//
//  ListFollowersViewController.swift
//  TonsserChallenge
//
//  Created by Ahmed CHEBBI on 10/07/2020.
//  Copyright © 2020 Tonsser. All rights reserved.
//

import UIKit
import RxSwift
import RxRelay
import RxCocoa
class ListFollowersViewController: BindableViewController<ListFollowerView, ListFollowersViewModel> {
    
    private let followersBehaviorRelay = BehaviorRelay<[Follower]>(value: [])
    // MARK: - Bind View Model
    
    func bindViewModel() { // Here we glue the view model and the view together
        // .....
        // View Model's properties are accessible like: viewModel.title
        // View's properties are also accessible like: layout.titleLabel
        // ....
        
        //Get Data From WS
        viewModel.fetchFollowersViewModels().subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background)).subscribe(onNext: { (followers) in
            self.followersBehaviorRelay.accept(followers)
        }).disposed(by: disposeBag)
        
        
        //Observer Display data
        followersBehaviorRelay.observeOn(MainScheduler.instance).bind(to: layout.tableView.rx.items(cellIdentifier: "MyCell", cellType: UITableViewCell.self)) { index, data, myCell in
            myCell.textLabel?.text = self.followersBehaviorRelay.value[index].name
        }.disposed(by: disposeBag)
        
        //Observer in the bottom list
        layout.tableView.rx.contentOffset.observeOn(MainScheduler.instance).subscribe {
            if let element = $0.element {
                
                let startLoadingOffset: CGFloat = 20.0
                let isNearTheBottomEdge = element.y + self.layout.tableView.frame.size.height + startLoadingOffset > self.layout.tableView.contentSize.height
                
                if isNearTheBottomEdge {
                    var data = self.followersBehaviorRelay.value
                    self.viewModel.fetchFollowersViewModels(nextPage: data.last?.slug ?? "").subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background)).subscribe(onNext: { (followers) in
                        data.append(contentsOf: followers)
                        self.followersBehaviorRelay.accept(data)
                    }).disposed(by: self.disposeBag)
                }
            }
        }.disposed(by: disposeBag)
        
        
    }
}
