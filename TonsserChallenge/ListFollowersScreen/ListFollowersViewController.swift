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
    
    private let followersBehaviorRelay = BehaviorRelay<[FollowerViewModel]>(value: [])
    private var refresh: Bool = true
    
    // MARK: - Bind View Model
    
    func bindViewModel() { // Here we glue the view model and the view together
        self.title = "Followers"
        //Observer Display data
        followersBehaviorRelay.observeOn(MainScheduler.instance).bind(to: layout.tableView.rx.items(cellIdentifier: ListFollowersTableViewCell.identifier, cellType: ListFollowersTableViewCell.self)) { index, data, myCell in
            myCell.bind(viewModel: self.followersBehaviorRelay.value[index])
        }.disposed(by: disposeBag)
        
        //Observer in the bottom list
        
        layout.tableView.rx.contentOffset.observeOn(MainScheduler.instance).subscribe {
            if let element = $0.element {
                
                let startLoadingOffset: CGFloat = 20.0
                let isNearTheBottomEdge = element.y + self.layout.tableView.frame.size.height + startLoadingOffset > self.layout.tableView.contentSize.height
                
                if isNearTheBottomEdge && self.refresh {
                    //StartLoading animation
                    self.startIndicatingActivity()
                    
                    var data = self.followersBehaviorRelay.value
                    self.refresh = false
                    self.viewModel.fetchFollowersViewModels(nextPage: data.last?.follower.slug ?? "").subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background)).subscribe(onNext: { (followers) in
                        self.refresh = true
                        data.append(contentsOf: followers)
                        self.followersBehaviorRelay.accept(data)
                        self.stopIndicatingActivity()
                        
                    }).disposed(by: self.disposeBag)
                }
            }
        }.disposed(by: disposeBag)
        
        
        layout.tableView.rx.itemSelected.observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] indexPath in
                
                let vm = self?.followersBehaviorRelay.value[indexPath.row]
                var vc = DetailFollowerViewController()
                if let vm = vm {
                    vc.bind(toViewModel: vm)
                    self?.navigationController?.pushViewController(vc, animated: true)
                }
                
            }).disposed(by: self.disposeBag)
        
    }
}
