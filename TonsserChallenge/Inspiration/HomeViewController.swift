//
//  HomeViewController.swift
//  TonsserChallenge
//
//  Created by Kristiyan Dobrev on 03/07/2020.
//  Copyright © 2020 Tonsser. All rights reserved.
//

import Foundation
import RxSwift
class HomeViewController: BindableViewController<HomeView, HomeViewModel> {
    
    // MARK: - Bind View Model
    
    func bindViewModel() { // Here we glue the view model and the view together
        // .....
        // View Model's properties are accessible like: viewModel.title
        // View's properties are also accessible like: layout.titleLabel
        // ....
        ManagerService().fetchFollowers().subscribe(onNext: { (response) in
            print("page1")
            print(response.response?.count ?? 0)
            ManagerService().fetchFollowers(nextPage: response.response?.last?.slug ?? "").subscribe(onNext: { (response) in
                print("page2")
                print(response.response?.count ?? 0)
            }).disposed(by: self.disposeBag)
        }).disposed(by: disposeBag)
    }
}
